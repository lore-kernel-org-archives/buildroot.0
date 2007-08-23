From: Emil =?ISO-8859-1?Q?Kr=FCper?= <e.krueper@solcon-systemtechnik.de>
Date: Thu, 23 Aug 2007 11:53:04 +0200
Subject: [Buildroot] Error with libusb-0.1.12
In-Reply-To: <000201c7e54f$4cb8b920$6614a8c0@softalap>
References: <24472173.108651187730897827.JavaMail.servlet@kundenserver>
	<000201c7e54f$4cb8b920$6614a8c0@softalap>
Message-ID: <1187862784.3342.12.camel@PC-EK.Solcon>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot, that solved it. Yesterday I tried it in FC 7 and
encountered the same problems, so I was pretty sure it's a missing
dependency in my config. Maybe there should be done a permanent fix by
resolving the correct dependencies when activating libusb or patching
the makefile? Is there any reason why it hasn't been done yet?
I am just curious.

Best regards,

Emil Kr?per

On Wed, 2007-08-22 at 03:18 +0300, softa at ttechgroup.com wrote:
> This is very old problem ... libusb contains 2 libraries, one in pure C, and 
> other in CPP .... if you enable the CPP compiler in toolchain everyting will 
> be ok, but in the other case you must modify libusb makefiles ....
> 
> for example: at least add CXX=""
> 
> ...
> $(LIBUSB_DIR)/.configured: $(LIBUSB_DIR)/.unpacked
>         (cd $(LIBUSB_DIR); rm -rf config.cache; \
>                 $(AUTORECONF) && \
>                 $(TARGET_CONFIGURE_OPTS) \
>                 $(TARGET_CONFIGURE_ARGS) \
>                 ac_cv_header_regex_h=no \
>                 CXX="" \
>                 ./configure \
>                 --target=$(GNU_TARGET_NAME) \
>                 --host=$(GNU_TARGET_NAME) \
>                 --build=$(GNU_HOST_NAME) \
>                 --prefix=/usr \
>                 --disable-debug \
>                 --disable-build-docs \
>         );
>         touch $(LIBUSB_DIR)/.configured
> ...
> 
> BR,
> Assen Stoyanov
> 
> ----- Original Message ----- 
> From: <e.krueper@solcon-systemtechnik.de>
> To: <buildroot@uclibc.org>
> Sent: Wednesday, August 22, 2007 12:14 AM
> Subject: [Buildroot] Error with libusb-0.1.12
> 
> 
> >I am at home now and have tried the r19625 and r19630 revisions. Both 
> >compile and break again at libusb. But this time it's another error. At 
> >work I use debian etch x86 with default packages and here at home I am 
> >running a x86_64 gentoo system. So back at work I'll get the same revisions 
> >once again and test it running in debian.
> > Nevertheless, here's the error I got now:
> >
> >
> > config.status: executing default commands
> > touch 
> > /home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12/.configured
> > /usr/bin/make -j1 -C 
> > /home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12
> > make[1]: Entering directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > cd . && /bin/sh 
> > /home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12/missing --run 
> > autoheader
> > rm -f stamp-h1
> > touch config.h.in
> > cd . && /bin/sh ./config.status config.h
> > config.status: creating config.h
> > config.status: config.h is unchanged
> > /usr/bin/make  all-recursive
> > make[2]: Entering directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > Making all in .
> > make[3]: Entering directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > if /bin/sh ./libtool --mode=compile 
> > /home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12/compile 
> > /home/emil/buldroot/root/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc 
> >  -Os -pipe  -I/home/emil/buldroot/root/buildroot/build_i386/staging_dir/usr/include 
> >  -I/home/emil/buldroot/root/buildroot/build_i386/staging_dir/include --sysroot=/home/emil/buldroot/root/buildroot/build_i386/staging_dir/ 
> >  -isysroot 
> > /home/emil/buldroot/root/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 
> >  -DHAVE_CONFIG_H   -I.  -Werror  -g -O2 -Wall -MT usb.lo -MD -MP -MF 
> > ".deps/usb.Tpo" -c -o usb.lo usb.c; \
> >        then mv -f ".deps/usb.Tpo" ".deps/usb.Plo"; else rm -f 
> > ".deps/usb.Tpo"; exit 1; fi
> > libtool: compile: unable to infer tagged configuration
> > libtool: compile: specify a tag with `--tag'
> > make[3]: *** [usb.lo] Error 1
> > make[3]: Leaving directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > make[2]: *** [all-recursive] Error 1
> > make[2]: Leaving directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory 
> > `/home/emil/buldroot/root/buildroot/build_i386/libusb-0.1.12'
> > make: *** 
> > [/home/emil/buldroot/root/buildroot/build_i386/staging_dir/lib/libusb.so] 
> > Error 2
> >
> > emil buildroot #
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot 
