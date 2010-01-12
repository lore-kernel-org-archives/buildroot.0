From: Chris Robson <Chris.Robson@nrl.navy.mil>
Date: Tue, 12 Jan 2010 07:35:00 -0500
Subject: [Buildroot] Application package cross linked to package
 libraries problem
In-Reply-To: <e4b6ec781001120358g3202f322qa8ae8c9408d8de40@mail.gmail.com>
References: <4B4C603A.70104@nrl.navy.mil>
	<e4b6ec781001120358g3202f322qa8ae8c9408d8de40@mail.gmail.com>
Message-ID: <4B4C6C74.9040703@nrl.navy.mil>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan

OK, I've built Sofia-SIP libraires as a library package and even as 
dynamic libraries that install into the target system.  Now I'm trying 
to build a home-grown application that must link against the Sofia-SIP 
libraries, aka "-l sofia-sip" as well as header files that reside in the 
Sofia-SIP package build tree.  The following example error shows the 
issue with the header files.  By hard-coding I can over come both issues 
but obviously that is not the way to go.

make[3]: Entering directory `/develop/output/build/msdpi-11Jan10.1200/src'
/develop/output/staging/usr/bin/x86_64-linux-uclibc-gcc -Os -pipe -Os  
-I/develop/output/staging/usr/include -I/develop/output/staging/include 
--sysroot=/develop/output/staging/ -isysroot /develop/output/staging 
-mtune=generic -fPIC -DPIC -DHAVE_CONFIG_H -I. -I.. 
-I/usr/lib64/glib-2.0/include -I/usr/include/glib-2.0 
-I/usr/include/sofia-sip 
-I~/rpmbuild/BUILD/kernel-2.6.31/linux-2.6.31.x86_64/include    -Os 
-pipe -Os  -I/develop/output/staging/usr/include 
-I/develop/output/staging/include --sysroot=/develop/output/staging/ 
-isysroot /develop/output/staging -mtune=generic -fPIC -DPIC -MT 
build-juniper-commandline.o -MD -MP -MF 
.deps/build-juniper-commandline.Tpo -c -o build-juniper-commandline.o 
build-juniper-commandline.c
build-juniper-commandline.c:8:27: error: sofia-sip/nua.h: No such file 
or directory
make[3]: *** [build-juniper-commandline.o] Error 1
make[3]: Leaving directory `/develop/output/build/msdpi-11Jan10.1200/src'
make[2]: *** [all-recursive] Error 1

Extract of my apps ".mk" file:

SDPI_VERSION:=11Jan10.1200
MSDPI_SOURCE:=msdpi-$(MSDPI_VERSION).tar.bz2
MSDPI_SITE:=http://localhost/BUILDROOT
MSDPI_AUTORECONF = NO
MSDPI_INSTALL_STAGING = YES
MSDPI_INSTALL_TARGET = YES
MSDPI_INSTALL_STAGING_OPT = CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) install

$(eval $(call AUTOTARGETS,package,msdpi))

# msdpi for the host
MSDPI_HOST_DIR:=$(BUILD_DIR)/msdpi-$(MSDPI_VERSION)-host

$(DL_DIR)/$(MSDPI_SOURCE):
     $(call DOWNLOAD,$(MSDPI_SITE),$(MSDPI_SOURCE))

$(STAMP_DIR)/host_msdpi_unpacked: $(DL_DIR)/$(MSDPI_SOURCE)
     mkdir -p $(MSDPI_HOST_DIR)
     $(INFLATE$(suffix $(MSDPI_SOURCE))) $< | \
         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(MSDPI_HOST_DIR) 
$(TAR_OPTIONS) -
     toolchain/patch-kernel.sh $(MSDPI_HOST_DIR) package/msdpi/ \*.patch
     touch $@

$(STAMP_DIR)/host_msdpi_configured: $(STAMP_DIR)/host_msdpi_unpacked
     (cd $(MSDPI_HOST_DIR); rm -rf config.cache; \
         $(HOST_CONFIGURE_OPTS) \
         CFLAGS="$(HOST_CFLAGS)" \
         LDFLAGS="$(HOST_LDFLAGS)" \
         ./configure $(QUIET) \
         --prefix="$(HOST_DIR)/usr" \
         --sysconfdir="$(HOST_DIR)/etc"
     )
     touch $@

$(STAMP_DIR)/host_msdpi_compiled: $(STAMP_DIR)/host_msdpi_configured
     $(MAKE) -C $(MSDPI_HOST_DIR)
     touch $@

$(STAMP_DIR)/host_msdpi_installed: $(STAMP_DIR)/host_msdpi_compiled
     $(MAKE) -C $(MSDPI_HOST_DIR) install
     touch $@

host-msdpi: $(STAMP_DIR)/host_msdpi_installed

host-msdpi-clean:
     rm -f $(addprefix $(STAMP_DIR)/host_msdpi_,unpacked compiled installed)
     -$(MAKE) -C $(MSDPI_HOST_DIR) uninstall
     -$(MAKE) -C $(MSDPI_HOST_DIR) clean

host-msdpi-dirclean:
     rm -rf $(MSDPI_HOST_DIR)


Thanks......Chris

On 01/12/2010 06:58 AM, Stefan Schake wrote:
> Hey,
>
> I think it would actually be more helpful if you could tell us what
> exact package you're trying to build, since linking and the like can
> be done very different, all depending on the package. Most of the time
> though, it should not be necessary to explicitly tell an application
> where to find the libary its trying to link to.
>
> Greetings
>
> 2010/1/12 Chris Robson<Chris.Robson@nrl.navy.mil>:
>    
>> I'm looking for an example of how to package cross link to package
>> libraries.  That is a package which is a library and then another package
>> that links to that library.  I've built a package library with success (to
>> include runtime install) and compiled a package application but getting the
>> package application to link against the new package library is not working.
>>   Obviously its a path issue but an example might help me see what is wrong
>> with my setup.
>>
>> Thanks....Chris
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>      
>
>    
