From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 22:53:54 +0200
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 <87a8fszmq7.fsf@dell.be.48ers.dk>
 <5637116E3E13BE46B0D936BF364783C1F6B168@MAIA.sede.videotec.com>
Message-ID: <296942d1-e247-7ad0-4a48-52e5bc3430bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 09:20, Ottavio Campana wrote:
>>> Particularly, I am not able to find if buildroot offers a feature
>>> similar to the devshell of yocto. The devshell is a shell with all the
>>> environment variables already set, so that it is possibile to invoke
>>> commands such as make in the same way that the build process does. By
>>> working in the devshell, a developer can work already in the correct
>>> environment for cross-compiling, which can save a lot of time.
>>
>>> Does something similar to the devshell exist in buildroot?
>>
>> I have never used this 'devshell', but I take it that it is something
>> that adds the cross compiler to the path and possibly sets up some
>> environment variables like CC/CXX/CROSS_COMPILE/ARCH to point to the
>> cross compiler?
>>
>> If so, we don't have anything quite like that, but writing a little
>> shell script for your project adding output/host/usr/bin to your path
>> and exporting those environment variables shouldn't take many minutes.
>>
>> Or does it do something more special than that?
> 
> Well, le'ts say that it configures the not only the cross compiler but it also sets all the variables for pointing to the staging environment for finding includes and linking to libraries. Compiling a self contained program is trivial, but when you need to include different libraries things start to be more difficult.

 The toolchain is wrapped to make sure it points to the correct sysroot. So just
calling output/usr/bin/<cross>-gcc is enough. Same for pkg-config:
output/usr/bin/pkg-config is a wrapper script that sets the correct environment
variables.

 There is still a pretty long list of variables that buildroot passes down to
the build system. You can find it in package/Makefile.in:

TARGET_CONFIGURE_OPTS = \
        PATH=$(BR_PATH) \
        AR="$(TARGET_AR)" \
        AS="$(TARGET_AS)" \
        LD="$(TARGET_LD)" \
        NM="$(TARGET_NM)" \
        CC="$(TARGET_CC)" \
        GCC="$(TARGET_CC)" \
        CPP="$(TARGET_CPP)" \
        CXX="$(TARGET_CXX)" \
        FC="$(TARGET_FC)" \
        F77="$(TARGET_FC)" \
        RANLIB="$(TARGET_RANLIB)" \
        READELF="$(TARGET_READELF)" \
        STRIP="$(TARGET_STRIP)" \
        OBJCOPY="$(TARGET_OBJCOPY)" \
        OBJDUMP="$(TARGET_OBJDUMP)" \
        AR_FOR_BUILD="$(HOSTAR)" \
        AS_FOR_BUILD="$(HOSTAS)" \
        CC_FOR_BUILD="$(HOSTCC)" \
        GCC_FOR_BUILD="$(HOSTCC)" \
        CXX_FOR_BUILD="$(HOSTCXX)" \
        LD_FOR_BUILD="$(HOSTLD)" \
        CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
        CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
        CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
        LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
        FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
        DEFAULT_ASSEMBLER="$(TARGET_AS)" \
        DEFAULT_LINKER="$(TARGET_LD)" \
        CPPFLAGS="$(TARGET_CPPFLAGS)" \
        CFLAGS="$(TARGET_CFLAGS)" \
        CXXFLAGS="$(TARGET_CXXFLAGS)" \
        LDFLAGS="$(TARGET_LDFLAGS)" \
        FCFLAGS="$(TARGET_FCFLAGS)" \
        FFLAGS="$(TARGET_FCFLAGS)" \
        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        STAGING_DIR="$(STAGING_DIR)" \
        INTLTOOL_PERL=$(PERL)

 Obviously, you won't need the majority of them for a particular build.

 Whenever you build a package based on autotools or make, you'll see that
environment appearing in the build output, so you can cut and paste from there.
Alternatively, you can run 'make printvars' and extract the
TARGET_CONFIGURE_OPTS environment variable.

 As Zoltan mentioned further down, qmake-based packages can directly use
output/host/usr/bin/qmake. For cmake-based packages, use
cmake -DCMAKE_TOOLCHAIN_FILE="output/host/usr/share/buildroot/toolchainfile.cmake"

 However, as Thomas explains further down, it's really a lot simpler to make a
package/foo/foo.mk file. If all you want to do is to build and not bother with
installation or dependencies or anything like that, it can be really simple:

define FOO_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef
$(eval $(generic-package))

That should be enough, and you can build with:

make foo FOO_OVERRIDE_SRCDIR=path/to/src

 You don't even have to create a different foo.mk for different packages - but
make sure you clean up the build directory between builds.


 Regards,
 Arnout


> 
> I can write the script, but can you tell my where I can find all the variables that are set by buildroot before compiling a package?
> 
> Thank you
> 
> Ottavio
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
