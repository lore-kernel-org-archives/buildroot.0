From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 2 May 2016 09:57:44 -0600
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
	libpng16
Message-ID: <CAGrGpJCvESbiBVRkYkyxX_oMgkhnxqNjq5BKGs50LCa1Na_JSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to install the SDL2 suite  (SDL2, SDL2_gfx, SDL2_image,
SDL2_ttf) using Buildroot-2016-02.  SDL2 is incorporated into
Buildroot-2016-02.   SDL2_gfx and SDL2_image are relatively straight
forward to add,  but SDL2_ttf is being problematic.    SDL2_ttf can't/won't
use libpng16.

I manually compiled libpng-1.2.56 and freetype-2.6.3 and used those (and
buildroot staging) to compile SDL2_ttf.

It compiled ok, as did my application  but now I get runtime error messages
when running my test application on my igepv2 board.


libpng warning: Application built with libpng-1.2.56 but running with 1.6.21
SDL message::  unable to load viewsensor.png:: Couldn't allocate memory for
PNG file or incompatible PNG dll


My questions are:

1. Can I change Buildroot-2016-02 to use libpng12 instead of libpng16?   I
looked at libpng dependencies in Buildroot and they are HUGE!   I see no
easy way to change to libpng12.

2. Does an earlier version of buildroot use libpng12?  Should I use that?
I would miss having SDL2 available in buildroot - I had problems compiling
that earlier.

3. Should I use buildroot to build a barebones rootfs without libpng and
create what I need from there.  Looking briefly at the dependencies, I am
not sure that is possible.


I checked Ubuntu on which my application works fine.  It runs with libpng12
only.


===========================================================================
Below are my personal notes which I used to create SDL2_ttf...
    [Free Electons] refers to course notes from Free Electrons that I still
use.
===============================================================================


Step 1 Download SDL2_ttf & png-1.2.56.tar.gz
-----------------------------------------------

SDL2_ttf-2.0.12.tar.gz
libpng-1.2.56.tar.gz    ##NOTE libpng12 needed by SDL2_ttf.
                        ## Buildroot provides libpng16
cd 94SDLttf
tar -xvzf SDL2_ttf-2.0.12.tar.gz
tar -xvzf libpng-1.2.56.tar.gz

echo $PATH
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
        # Buildroot requires glibc (Error IPV6 required)
            - will not work against uclibc

arm-linux-gcc -print-search-dirs ==>



Step 2 - compile libpng  (see Free Electrons)
------------------------------------------------
cd libpng-1.2.56/
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export CC=arm-linux-gcc
export
CPPFLAGS=-I/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/staging/usr/include
export  LDFLAGS=-L/home/peter/igep2015/94SDLttf/pmtstaging/usr/lib/
export CFLAGS=-Wl,--verbose
./configure --host=arm-linux --prefix=/usr
make
make DESTDIR=/home/peter/igep2015/pmtstaging/  install


sudo cp -a ~/igep2015/pmtstaging/usr/lib/libpng12.so*
/home/peter/igep2015/pmtroot/usr/lib/
arm-linux-strip /home/peter/igep2015/pmtroot/usr/lib/libpng12.so.0.56.0

NOTE::: Don't forget to add the fonts to pmtroot (copy from Ubuntu)
cp /usr/share/fonts/truetype/freefont/*.*
~/igep2015/pmtroot/usr/share/fonts/truetype/freefont/


Step 2 - compile freetype-2.6.3  (see Free Electrons)
------------------------------------------------------

cd freetype-2.6.3
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export CC=arm-linux-gcc
export
CPPFLAGS=-I/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/staging/usr/include
export  LDFLAGS=-L/home/peter/igep2015/94SDLttf/pmtstaging/usr/lib/
./configure --host=arm-linux  --prefix=/usr
make
make DESTDIR=/home/peter/igep2015/94SDLttf/pmtstaging/  install
make DESTDIR=/home/peter/igep2015/pmtstaging/  install

sudo cp -a ~/igep2015/pmtstaging/usr/lib/libfreetype.so*
/home/peter/igep2015/pmtroot/usr/lib/
arm-linux-strip /home/peter/igep2015/pmtroot/usr/lib/libfreetype.so.6.12.3



*******************************************************************
****************** Finally what I want - SDL2_ttf ******************
*********************************************************************

Step 3 - compile SDL2_ttf (see Free Electrons DirectFB for ideas)
-------------------------------------------------------------

cd ~/igep2015/94SDLttf/SDL2_ttf-2.0.14/

######################################################################
##### change 2 linker scripts in Buildroot #### see stackoverflow by peter
####
Change
/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/usr/lib/libc.so
FROM:
/* GNU ld script
    Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED (
/lib/ld-linux.so.3 ) )
TO:
/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( ../../lib/libc.so.6 libc_nonshared.a  AS_NEEDED (
../../lib/ld-linux.so.3 ) )

Change
/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/usr/lib/libpthread.so
FROM:
/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( /lib/libpthread.so.0 /usr/lib/libpthread_nonshared.a )
TO:
/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( ../../lib/libpthread.so.0 libpthread_nonshared.a )

################################################################
   ### create pmtstaging - if not done before ###
cp -a
/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot
/home/peter/igep2015/
mv /home/peter/igep2015/sysroot   /home/peter/igep2015/pmtstaging

#################################################################


export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export CC=arm-linux-gcc
export CFLAGS="-v -Wl,--verbose"           ###optional for debugging
export CPPFLAGS="-I/home/peter/igep2015/94SDLttf/pmtstaging/usr/include
-I/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/usr/include
-I/home/peter/igep2015/94SDLttf/pmtstaging/usr/include/freetype2"

export
LDFLAGS="-L/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/lib
-L/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY5/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot/usr/lib
-L/home/peter/igep2015/94SDLttf/pmtstaging/usr/lib"




./configure --host=arm-linux --prefix=/usr
--with-freetype-prefix=/home/peter/igep2015/94SDLttf/pmtstaging/usr


make
make DESTDIR=/home/peter/igep2015/pmtstaging/  install
YIPPEEEE   YIPPPEEEEE ---- IT WORKS!!!  AFTER 3+ WEEKS OF WORK *****




Step 6  - transfer libs to igpev2
--------------------------------
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_ttf-2.0.so*
/home/peter/igep2015/pmtroot/usr/lib/
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_ttf.so
/home/peter/igep2015/pmtroot/usr/lib/
arm-linux-strip
/home/peter/igep2015/pmtroot/usr/lib/libSDL2_ttf-2.0.so.0.14.0



=================================================================================
Compile the application
=================================================================================
export PKG_CONFIG_PATH=/home/peter/igep2015/pmtstaging/usr/lib/pkgconfig/


arm-linux-gcc viewtestARM.c SDL2init.c -o viewtestARM -Wl,--verbose
--sysroot=/home/peter/igep2015/pmtstaging/ $(pkg-config --libs --cflags
sdl2)  $(pkg-config --libs --cflags SDL2_gfx)  $(pkg-config --libs --cflags
SDL2_image)  $(pkg-config --libs --cflags SDL2_ttf)

==============================================================================
Buildroot configuration used
=========================================================================
Target Options
        Target Architecture:      ARM (little endian)
        Target ARchitecture Variant: arm926t
        Target ABI:            EABI
        Floating point strategy    Soft float
        ARM instruction set        ARM
Build options --ignore
    please enable BR2_TOOLCHAIN_HAS_SSP [peter ? why needed - not sure??]
        after toolchain built below
Toolchain
    Toolchain type:     External toolchain
    Toolchain:        Custom toolchain
    Toolchain origin:    Pre-installed toolchain
    Toolchain path:        /usr/local/xtools/arm-unknown-linux-gnueabi
    Toolchain prefix:    arm-linux       OR    #normally is $(ARCH)-linux
==> arm-linux
    External toolchain gcc version: (see arm-linux-gcc --version OR
        OR arm-linux-gcc -xc -v  ==> 5.1.x
    External toolchain kernel headers series: (.../sysroot/usr/include/ )
==> 4.0.x
    External toolchain C library: uClibc OR glibc --> see 00README for
which machine
        NOTE with glibc several options below are already included eg
WCHAR, locale
    enable[Free Electrons]    large file support, RPC support, C++ support
    enable[peter]        WCHAR,locale,

    enable copy gdb server to Target, enable MMU support,
    Target linker options:    NONE

System Configuration
    System hostname:    PMTigepv2
    System banner        PMTigepv2 - Jan 23, 2016 {ie build date}
    enable Dynamic using devtmpfs + mdev
            ( instead of Dynamic using devtmpfs only) for fxos8700
    enable install timezone info
    leave everything else buildroot default ( be sure busybox is init
program)
Kernel --ignore
Target Packages
    Filesystem and flash utilities
        mtd,jffs2 and ukbi/ubifs tools  ## needed for mtdinfo: use defaults
        squashfs                        ## not really needed?? add anyway
    Graphics libraries and applications (graphic/text)
        DirectFB (remove DirectFB touchscreen)   #NO - use defaults
        DirectFB (all examples -- df_andi for sure)
        fbterm        #next 6 fb items are NEW
        fbv
        fbdump
        fbgrab
        fb-test-app
        SDL2
        SDL2 directFB video driver   # Don't forget this SILLY!!!

    Hardware Handling:
        evtest  NEW-ADD-ON-NEXT-COMPILE-PLEASE PETER
        i2c-tools  ::NOTE: lm-sensors.org disappeared.
              may have to build from scratch using
              https://web.archive.org/web/20150905145034/
            http://www.lm-sensors.org/
        lshw
        picocom
        minicom

    Libraries - Graphics (NEW)
        tiff (NEW)
        tiff utilities (NEW)
    Text Editors
        nano



Filesystem images
    ext 2/3/4 root filesystem:    ext3
    compression method = no compression
    enable tar the root filesystem + gzip compression
        OR leave tar the root filesystem at no compression
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160502/8a1ce324/attachment.html>
