From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2016 22:57:03 +0200
Subject: [Buildroot] Installing package libclthreads
In-Reply-To: <00b301d21d70$9e934540$dbb9cfc0$@synexint.com>
References: <00b301d21d70$9e934540$dbb9cfc0$@synexint.com>
Message-ID: <1006b3f0-301d-b8c3-99da-ef2c50c5ec00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Herschel,

 Please avoid using HTML mail on this list.


On 03-10-16 14:21, Herschel Karunaratne wrote:
> Hi,
> 
>  
> 
> I am trying to install ?jconvolver? and have to install  ?libclthreads? needed
> by jconvolver. ?My ?libclthreads.mk? is as follows,
> 
>  
> 
> #####################################################################
> 
> #
> 
> # libclthreads
> 
> #
> 
> ####################################################################
> 
>  
> 
> LIBCLTHREADS_VERSION = 2.4.0
> 
> LIBCLTHREADS_SOURCE = clthreads-$(LIBCLTHREADS_VERSION).tar.bz2

 Small nit: since upstream calls it "clthreads", we prefer that the buildroot
package has the same name.

> 
> LIBCLTHREADS_SITE = http://kokkinizta.linuxaudio.org/linuxaudio/downloads
> 
> LIBCLTHREADS_LICENSE = LGPLv2.1+
> 
> LIBCLTHREADS_LICENSE_FILES = COPYING
> 
> LIBCLTHREADS_INSTALL_STAGING = YES
> 
> LIBCLTHREADS_INSTALL_TARGET = YES

 This one is not needed because the default.

> 
>  
> 
> $(eval $(autotools-package))
> 
>  
> 
>  
> 
>  
> 
> When I build it seems to be OK but nothing in the installed folders. This is
> message I get when I build,
> 
[snip]
>>>> libclthreads 2.4.0 Installing to target

 Weird, the install to staging is missing... I can't explain that...


> 
> PATH="/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/bin:/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/sbin:/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/bin:/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/host/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/arm-2014.05/bin:/root/bin:/opt/arm-2014.05/bin" 
> /usr/bin/make -j5
> DESTDIR=/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/target
> install -C
> /root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthreads-2.4.0/
> 
> make[1]: Entering directory
> `/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthreads-2.4.0'
> 
> /usr/bin/install -d /usr/local/lib64

 It looks like this package ignores both the configure --prefix option and the
DESTDIR argument to 'make install'. This basically makes the install commands
unusable. Either patch the Makefile.in to correct this, or define
LIBCLTHREADS_INSTALL_STAGING_CMDS and LIBCLTHREADS_INSTALL_TARGET_CMDS.


 Regards,
 Arnout


> 
> /usr/bin/install -m 644 clthreads.h /usr/local/include
> 
> /usr/bin/install -m 755 libclthreads.so.2.4.0 /usr/local/lib64
> 
> /sbin/ldconfig -n /usr/local/lib64
> 
> ln -sf libclthreads.so.2.4.0 /usr/local/lib64/libclthreads.so
> 
> make[1]: Leaving directory
> `/root/work/sinlinx/a33-organ/lichee/buildroot-2016.05/output/build/libclthreads-2.4.0'
> 
>  
> 
>  
> 
>  
> 
> What could have gone wrong?
> 
>  
> 
> Thanks in advance.
> 
>  
> 
>  
> 
> *Regards*
> 
> *Herschel*
> 
> 
> 
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
