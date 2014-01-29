From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 08:39:21 +0100
Subject: [Buildroot] Problems building SDL, SDL_image, SDL_ttf,
 SDL_gfx via buildroot-2013.11
In-Reply-To: <CAGrGpJB-c0Gw+aFydWoMgfs9Axxkb3Gn=5ebMyt3xa-vgxLS_A@mail.gmail.com>
References: <CAGrGpJBkBcVq+N8X2z_mArrzM30Sbq0_m4T4B3hzDaoaZWtoWg@mail.gmail.com>
 <20140109153734.19dbd074@skate>
 <CAGrGpJDd-ZXPjcuCwtbqSikrRLX_sBzXqUevtSTh-9KtxxWK3Q@mail.gmail.com>
 <CAGrGpJB-c0Gw+aFydWoMgfs9Axxkb3Gn=5ebMyt3xa-vgxLS_A@mail.gmail.com>
Message-ID: <20140129083921.7ed32ab1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

(Your e-mail is rather long, lots of questions. I'll try to answer them
as best as I can, but there are really many, many questions!)

Le Mon, 20 Jan 2014 14:26:17 -0700,
Peter Thompson <peter.macleod.thompson@gmail.com> a ?crit :

> My remaining questions are below but summarized they are
>      1. Static compile - suggestions on how to make it work - missing path?

Do you really need static compilation? Remember that SDL is a library
licensed under the LGPL, so if statically link your application against
SDL, and want to distribute the resulting binaries, you need to take
special precautions in order to comply with the LGPL license.

Unless you have a really strong reason to do static compilation, I
would recommend to stay "standard" and use dynamic linking.

>      2. My buildroot process - general suggestions eg: WCHAR inclusion,
> getty settings seem wrong, gcc and ulibc inclusion, and ctl-C inclusion?
>      3. Anyone successful in from scratch compile of SDL_gfx?  I'm missing
> something.

What do you mean by "from scratch" ? Do you mean building SDL_gfx
manually outside of Buildroot ? If that's the case, then I would
recommend you /not/ to try to build things outside of Buildroot:
cross-compiling stuff is not completely trivial if you don't have some
experience with the autotools and all the tricks involved in
cross-compilation. Buildroot is precisely here to help solve these
problems, and already implements the majority of the tricks that are
needed.

In addition to that, while we are definitely interested in helping you
getting SDL_gfx built with Buildroot, we are not really interested in
helping you building SDL_gfx manually outside of Buildroot: you would
raise many questions and problems that have already been solved since
years by Buildroot.

> I am not sure I explained my test environment properly earlier so here it
> is....   I am building a Hiking GPS with topographical maps called oz.  A
> prototype has been built on Ubuntu linux and C using SDL, SDL_ttf,
> SDL_image, and SDL_gfx libraries.  I am trying to port it to ARM
> architecture.

Ok, makes sense.

>  The status of my current environment is
> 
> Architecture
> ------------
>      1. x86 Ubuntu (also my host machine for IGEPv2)
>      2. ARM IGEPv2 Linux 2.6.37 with pmtroot created via buildroot-2013.11
>      3. ARM IGEPv2 Linux 2.6.37 with pmtroot created from scratch

What is "pmtroot" ?

> Test Cases
> ----------
>      1. Lazyfoo - minimal c program to test SDL, SDL_ttf, SDL_image,
> SDL_gfx libraries (just written this week as you suggested).
>      2. oz - Hiking GPS program with 37 c source files.

Ok.

> What works
> ----------
> You last email with suggestions was super.  Lazyfoo and oz now both work
> for Dynamic linking on X86 and ARM via Buildroot.   You were right, there
> was a bug in the c source code (shortage of IGEPv2 memory plus wrong data
> files) which caused oz to seg-fault.   Building and getting Lazyfoo test
> working helped resolve that problem.
> 
> ===========>  Compile for ARM architecture that works for SDL <========
>     export
> PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH  ==> to
> find arm-linux-gcc

No, no, no and NO!

You should *NOT* add the path of the external toolchain to the PATH.
There is no need to do that, and it might actually be harmful.
Buildroot generates symbolic links and special wrappers for the
toolchain, and puts them in output/host/usr/bin. Only this directory
should be added to your path, and *nothing* else.

>     export
> PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
> ==> to find pkgconfig -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx and .h include
> files

Right.

> arm-linux-gcc lazyfoo.c -o lazyfooARMso \
>           $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)

Looks good.

> What still doesn't work via buildroot
> -------------------------------------
> Lazyfoo will not link statically on ARM IGEPv2 via buildroot-2013-11.  I
> removed --disable-static from package/sdl_image/sdl_image.mk as suggested
> and the SDL_image.a file is now there... but I still get undefined
> references....
> 
> PATH=  (same as what worked for dynamic link)
> /home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:
> /usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:
> 
> and command=
> arm-linux-gcc lazyfoo.c -o lazyfooARMstatic -Wl,-Bstatic  $(pkg-config
> --static --libs --cflags sdl SDL_image SDL_gfx SDL_ttf) -Wl,-Bdynamic
> 
> yields 100 lines of undefined references jpeg... png... TIFF... and FT
> among others:
> 
> /home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libSDL_image.a(IMG_jpg.o):
> In function `IMG_InitJPG':
> IMG_jpg.c:(.text+0x74): undefined reference to `jpeg_calc_output_dimensions'
> IMG_jpg.c:(.text+0x78): undefined reference to `jpeg_std_error'
> ..... repeated....

Might be the pkg-config files of SDL that lack some references to the
jpeg, png, TIFF and freetype libraries. I would have to reproduce to be
sure here.

> My process used for creating pmtroot for IGEPv2 via buildroot-2013.11

I still don't know what "pmtroot" is, so I'm not sure my
comments/answers below will make sense.

> ----------------------------------------------------------------------
> 1.  Download from buildroot.uclibc.org -- buildroot-2013.11.tar.gz
> 2.  tar xvzf buildroot-2013.11.tar.gz
> 3.  make xconfig
>     - Target = arm, little endian, arm926t
>     - Toolchain = external, custom, pre-installed,
> PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi,
> prefix=$(ARCH)-linux, uclibc, Toolchain has:large file support:threads
> support:threads debugging support:RPC support:C++ support:Enable MMU
> support:BUT DOES NOT HAVE WCHAR SUPPORT WHICH IS OFTEN NEEDED???

Ok. I guess you should probably read
http://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain
to understand a little bit better the difference between the internal
toolchain backend and the external toolchain backend.

The external toolchain backend is the one you're using right now. It
allows you to use an existing toolchain: in your case this toolchain
was generated separately using Crosstool-NG, and Buildroot simply uses
it (instead of building the toolchain by itself).

However, in order for Buildroot to use this toolchain, we have to tell
Buildroot how this toolchain was configured: whether it has thread
support or not, C++ support or not, wide-char support or not.

In your case, the Crosstool-NG configuration used to build the
toolchain did *NOT* enable wide-char support, and therefore when
importing this toolchain as an external toolchain in Buildroot, you
have to tell Buildroot the truth: that the toolchain doesn't have
wide-char support.

So if you want wide-char support (which indeed is needed by a
significant number of packages), then you have to go back in
Crosstool-NG, and ensure wide-char support is enabled.

Actually, I would probably suggest a different solution: simply use a
external Linaro toolchain. Buildroot already knows about Linaro
toolchains, so it will automatically download it, and extract it
properly. This toolchain is optimized for ARMv7, which is much better
than the arm926 toolchain that you have currently when your targets are
IGEPv2 and BeagleBoard XM. And as an added bonus, it uses the eglibc C
library, which in my opinion provides much better compatibility than
uClibc.

So, in menuconfig, do:

 Target options
  -> Target architecture: ARM little endian
  -> Target architecture variant: Cortex-A8
  -> Target ABI: EABIhf

 Toolchain
  -> Toolchain type: external toolchain
  -> Toolchain: Linaro 2013.xx (it should be automatically selected
     anyway)

>     - System = md5, Busybox, Dynamic using mdev, default target skeleton,
> run a getty:ttyS0:115200, remount root
>     - Packages Graphics = directfb with eventx: keyboard: mouse: mouse:
> touchscreen: gif: jpeg: png: andi: dok: input, SDL with framebuffer console
> video driver: SDL_gfx: SDL_image: SDL_ttf
>      - Packages Hardware = i2c-tools, picocom
>      - Libraries Hardware = libusb, :):)nano needs toolchain w/char:):)

See above the explanation about wide-char support.

>      - WOULD LIKE ABILITY TO ADD GCC AND UCLIBC INTO BUILDROOT for IGEPv2
> direct compiles  versus always having to cross compile??????

We do not support building gcc for the target, and generally building
programs on the target. Buildroot is all about cross-compilation, and
supports it very well. If you want a large system with a complete
development environment on your target, then you should install a
full-featured distribution like Debian.

However, for embedded Linux devices, this is generally not needed, and
we can simply cross-compilation all the libraries and applications from
the development machine (benefiting from a much faster compilation
time, and a saner and smaller root filesystem for the target as it
doesn't contain millions of files only useful at development time).

See also
http://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target.

> 3A. make clean keeps xconfig, make distclean  removes xconfig

More precisely make clean keeps your .config file (which contains your
configuration), while make distclean removes it. This is expected
behavior.

> 4. make
> 5. cd .. && mkdir pmtroot && cp buildroot-2013.11/output/images/rootfs.tar
> pmtroot && cd pmtroot && sudo tar xvf rootfs.tar
> 6.  sudo mknod .../pmtroot/dev/null c 3 1
> 7.  sudo mknod .../pmtroot/dev/tty0 c 4 0
> 8.  sudo mknod ...tty1 to tty45 as per above step

There is absolutely no need to do this. Above, you've selected "dynamic
with mdev" as the /dev management method. Therefore, your kernel must
be configured with devtmpfs support, and there is absolutely no need to
manually create device files.

If you're building your kernel with Buildroot, devtmpfs is
automatically enabled.

If you're building your kernel outside of Buildroot, make sure your
kernel configuration has CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT
enabled.

See http://buildroot.org/downloads/manual/manual.html#_dev_management
for more details.

> 9.  sudo nano  .../pmtroot/etc/inittab
> 10. change inittab line
>             from ttyS0::respawn:/sbin/getty -L  ttyS0 115200 vt100 #
> GENERIC_SERIAL
>             to   ttyO2::respawn:bin/sh

There is no need to do this. Just configure Buildroot properly to fire
up the getty on ttyO2. This is done in:

 -> System configuration
   -> getty options
      -> TTY port

> 11. add        .../pmtroot/etc/init.d/S50peterinit with #!bin/sh echo
> "Peter was here message"
> 12.  cd ../../../kernel/linux-omap-2.6.37-6/
> 13.  sudo make ARCH=arm CROSS_COMPILE=arm-linux-
> INSTALL_MOD_PATH=/home/peter/Documents/felabs/sysdev/buildsdl/pmtroot
> modules install

So you're building your kernel outside of Buildroot. Make sure it has
CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT, as explained above.

> 14.  start IGEPv2 and add serial port driver for gps...as per below
> 15.       modprobe -v option
> 16.       echo '0403 f448' > /sys/bus/usb-serial/drivers/option1/new_id
> 17.       ls /lib/modules/$(uname -r)/kernel/drivers
> 18.       picocom -b 9600 /dev/ttyUSB0
> FIXME - control-c interrupt capability added via buildroot.

Not sure what you mean here with this FIXME.

> What doesn't work via From Scratch
> ----------------------------------
> SDL_gfx will not compile.  The standard  ./configure && make && make
> install does not seem to work here.   I need an example of a cross-compile
> that worked for SDL_gfx.  The others, SDL, SDL_ttf, SDL_image all seem to
> compile ok - after lots of fiddling with ./configure FLAGS.

Please build SDL_gfx with Buildroot, and do not attempt to build it
manually, unless you have a really good reason to do so.

> /* ==> Compile for Ubuntu x86 via (shared object and static)::
> 1.  gcc lazyfoo.c -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx -o lazyfoo86so
> 2.  gcc lazyfoo.c -static -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx -o
> lazyfoo86static
>  FIXME  SDL_gfx and SDL_ttf don't link

You should use pkg-config even on Ubuntu.

>    ==>  Compile for ARM architecture
>     export
> PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH  ==> to
> find arm-linux-gcc

As said above, don't add this directory to your PATH.

>     export
> PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
> ==> to find pkgconfig -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx and .h include
> files
> 
> 3.  arm-linux-gcc lazyfoo.c -o lazyfooARMso \
>           $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)
> 4.  arm-linux-gcc lazyfoo.c -static  -o lazyfooARMstatic   \
>      $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)
>  FIXME  SDL_gfx and SDL_ttf don't link here either
>  FIXME try this
> arm-linux-gcc lazyfoo.c -o lazyfooARMstatic -Wl,-Bstatic  $(pkg-config
> --static --libs --cflags sdl SDL_image SDL_gfx SDL_ttf) -Wl,-Bdynamic
> ==>still doesn't work

I would have to reproduce and investigate, I don't know why the static
linking doesn't work here. Again, why don't you simply do dynamic
linking?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
