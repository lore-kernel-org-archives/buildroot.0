From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 21 Jun 2010 18:59:00 -0500
Subject: [Buildroot] sdl demo app install problem
In-Reply-To: <201006220147.29583.PeterHuewe@gmx.de>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<201006220132.46363.PeterHuewe@gmx.de>
	<0D753D10438DA54287A00B027084269763715D5D47@AUSP01VMBX24.collaborationhost.net>
	<201006220147.29583.PeterHuewe@gmx.de>
Message-ID: <0D753D10438DA54287A00B027084269763715D5D55@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, June 21, 2010 4:47 PM, Peter H?we wrote:
>> Am Dienstag 22 Juni 2010 01:25:24 schrieb H Hartley Sweeten:
>>>  /home/bigguiness/extratech/buildroot/output/target/usr/bin/fire strip:
>>>  Unable to recognise the format of the input file
>>>  `/home/bigguiness/extratech/buildroot/output/target/usr/bin/fire'
>>>  /usr/bin/install: strip process terminated abnormally
>
> I've checked it here and got this result:
>
> $ strip /avr/buildroot-2010.02/output/target/usr/bin/fire                   
> strip: Unable to recognise the format of the input file `/avr/buildroot-2010.02/output/target/usr/bin/fire'    
>
> $ ./output/staging/usr/avr32-linux-uclibc/bin/strip /avr/buildroot-2010.02/output/target/usr/bin/fire
> $
>
> It seems to use the wrong strip command - not the one from the buildroot
> toolchain, but rather the host one -- so maybe you have to patch one of
> the files (configure/install) from fire - nevertheless I'll have a look at it too

I'm actually using an external toolchain but I get the same results as you.  Using the
host 'strip' gives me an error but my toolchain 'strip' works.

The install stage for sdl_image is very different.

>>> sdl_image 1.2.6 Installing to target
/usr/bin/make -j2 DESTDIR=/home/bigguiness/extratech/buildroot/output/target  install-strip -C /home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6/
make[1]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'
/usr/bin/make  INSTALL_PROGRAM="/bin/sh /home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6/install-sh -c -s" \
	  install_sh_PROGRAM="/bin/sh /home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6/install-sh -c -s" INSTALL_STRIP_FLAG=-s \
	  `test -z '/home/bigguiness/extratech/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-strip' || \
	    echo "INSTALL_PROGRAM_ENV=STRIPPROG='/home/bigguiness/extratech/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-strip'"` install
make[2]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'
make[3]: Entering directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'
test -z "/usr/lib" || mkdir -p -- "/home/bigguiness/extratech/buildroot/output/target/usr/lib"
test -z "/usr/include/SDL" || mkdir -p -- "/home/bigguiness/extratech/buildroot/output/target/usr/include/SDL"
 /bin/sh ./libtool --mode=install /usr/bin/install -c -s 'libSDL_image.la' '/home/bigguiness/extratech/buildroot/output/target/usr/lib/libSDL_image.la'
 /usr/bin/install -c -m 644 'SDL_image.h' '/home/bigguiness/extratech/buildroot/output/target/usr/include/SDL/SDL_image.h'
/usr/bin/install -c .libs/libSDL_image-1.2.so.0.1.5 /home/bigguiness/extratech/buildroot/output/target/usr/lib/libSDL_image-1.2.so.0.1.5
/home/bigguiness/extratech/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-strip --strip-unneeded /home/bigguiness/extratech/buildroot/output/target/usr/lib/libSDL_image-1.2.so.0.1.5
(cd /home/bigguiness/extratech/buildroot/output/target/usr/lib && { ln -s -f libSDL_image-1.2.so.0.1.5 libSDL_image-1.2.so.0 || { rm -f libSDL_image-1.2.so.0 && ln -s libSDL_image-1.2.so.0.1.5 libSDL_image-1.2.so.0; }; })
(cd /home/bigguiness/extratech/buildroot/output/target/usr/lib && { ln -s -f libSDL_image-1.2.so.0.1.5 libSDL_image.so || { rm -f libSDL_image.so && ln -s libSDL_image-1.2.so.0.1.5 libSDL_image.so; }; })
/usr/bin/install -c .libs/libSDL_image.lai /home/bigguiness/extratech/buildroot/output/target/usr/lib/libSDL_image.la
libtool: install: warning: remember to run `libtool --finish /usr/lib'
make[3]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'
make[2]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'
make[1]: Leaving directory `/home/bigguiness/extratech/buildroot/output/build/sdl_image-1.2.6'

But the *.mk file is basically the same.

Regards,
Hartley
