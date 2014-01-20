From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Mon, 20 Jan 2014 14:26:17 -0700
Subject: [Buildroot] Problems building SDL, SDL_image, SDL_ttf,
 SDL_gfx via buildroot-2013.11
In-Reply-To: <CAGrGpJDd-ZXPjcuCwtbqSikrRLX_sBzXqUevtSTh-9KtxxWK3Q@mail.gmail.com>
References: <CAGrGpJBkBcVq+N8X2z_mArrzM30Sbq0_m4T4B3hzDaoaZWtoWg@mail.gmail.com>
 <20140109153734.19dbd074@skate>
 <CAGrGpJDd-ZXPjcuCwtbqSikrRLX_sBzXqUevtSTh-9KtxxWK3Q@mail.gmail.com>
Message-ID: <CAGrGpJB-c0Gw+aFydWoMgfs9Axxkb3Gn=5ebMyt3xa-vgxLS_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

You comments are greatly appreciated.   They have helped me a lot.  It now
works!! - partly....

My remaining questions are below but summarized they are
     1. Static compile - suggestions on how to make it work - missing path?
     2. My buildroot process - general suggestions eg: WCHAR inclusion,
getty settings seem wrong, gcc and ulibc inclusion, and ctl-C inclusion?
     3. Anyone successful in from scratch compile of SDL_gfx?  I'm missing
something.

Thanks in advance for your help!   Bouncing ideas around and forcing me to
explain my problem more completely are a great help.

I am not sure I explained my test environment properly earlier so here it
is....   I am building a Hiking GPS with topographical maps called oz.  A
prototype has been built on Ubuntu linux and C using SDL, SDL_ttf,
SDL_image, and SDL_gfx libraries.  I am trying to port it to ARM
architecture.

 The status of my current environment is

Architecture
------------
     1. x86 Ubuntu (also my host machine for IGEPv2)
     2. ARM IGEPv2 Linux 2.6.37 with pmtroot created via buildroot-2013.11
     3. ARM IGEPv2 Linux 2.6.37 with pmtroot created from scratch
     4. ARM Beagleboard xm - for future testing....


Linking Approaches
------------------
     1. Dynamic using .so files (default and used in Ubuntu working
prototype)
     2. Static using .a files (wanted for portability, performance testing
on arm machines)


Test Cases
----------
     1. Lazyfoo - minimal c program to test SDL, SDL_ttf, SDL_image,
SDL_gfx libraries (just written this week as you suggested).
     2. oz - Hiking GPS program with 37 c source files.



What works
----------
You last email with suggestions was super.  Lazyfoo and oz now both work
for Dynamic linking on X86 and ARM via Buildroot.   You were right, there
was a bug in the c source code (shortage of IGEPv2 memory plus wrong data
files) which caused oz to seg-fault.   Building and getting Lazyfoo test
working helped resolve that problem.

===========>  Compile for ARM architecture that works for SDL <========
    export
PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH  ==> to
find arm-linux-gcc
    export
PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
==> to find pkgconfig -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx and .h include
files

arm-linux-gcc lazyfoo.c -o lazyfooARMso \
          $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)




What still doesn't work via buildroot
-------------------------------------
Lazyfoo will not link statically on ARM IGEPv2 via buildroot-2013-11.  I
removed --disable-static from package/sdl_image/sdl_image.mk as suggested
and the SDL_image.a file is now there... but I still get undefined
references....

PATH=  (same as what worked for dynamic link)
/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:
/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:

and command=
arm-linux-gcc lazyfoo.c -o lazyfooARMstatic -Wl,-Bstatic  $(pkg-config
--static --libs --cflags sdl SDL_image SDL_gfx SDL_ttf) -Wl,-Bdynamic

yields 100 lines of undefined references jpeg... png... TIFF... and FT
among others:

/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libSDL_image.a(IMG_jpg.o):
In function `IMG_InitJPG':
IMG_jpg.c:(.text+0x74): undefined reference to `jpeg_calc_output_dimensions'
IMG_jpg.c:(.text+0x78): undefined reference to `jpeg_std_error'
..... repeated....


x86 Ubuntu also fails to link lazyfoo.c statically.   SDL was downloaded
via synaptic package and Ubuntu is less important to me so I don't plan to
persue it.



My process used for creating pmtroot for IGEPv2 via buildroot-2013.11
----------------------------------------------------------------------
1.  Download from buildroot.uclibc.org -- buildroot-2013.11.tar.gz
2.  tar xvzf buildroot-2013.11.tar.gz
3.  make xconfig
    - Target = arm, little endian, arm926t
    - Toolchain = external, custom, pre-installed,
PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi,
prefix=$(ARCH)-linux, uclibc, Toolchain has:large file support:threads
support:threads debugging support:RPC support:C++ support:Enable MMU
support:BUT DOES NOT HAVE WCHAR SUPPORT WHICH IS OFTEN NEEDED???
    - System = md5, Busybox, Dynamic using mdev, default target skeleton,
run a getty:ttyS0:115200, remount root
    - Packages Graphics = directfb with eventx: keyboard: mouse: mouse:
touchscreen: gif: jpeg: png: andi: dok: input, SDL with framebuffer console
video driver: SDL_gfx: SDL_image: SDL_ttf
     - Packages Hardware = i2c-tools, picocom
     - Libraries Hardware = libusb, :):)nano needs toolchain w/char:):)
     - WOULD LIKE ABILITY TO ADD GCC AND UCLIBC INTO BUILDROOT for IGEPv2
direct compiles  versus always having to cross compile??????

3A. make clean keeps xconfig, make distclean  removes xconfig
4. make
5. cd .. && mkdir pmtroot && cp buildroot-2013.11/output/images/rootfs.tar
pmtroot && cd pmtroot && sudo tar xvf rootfs.tar
6.  sudo mknod .../pmtroot/dev/null c 3 1
7.  sudo mknod .../pmtroot/dev/tty0 c 4 0
8.  sudo mknod ...tty1 to tty45 as per above step
9.  sudo nano  .../pmtroot/etc/inittab
10. change inittab line
            from ttyS0::respawn:/sbin/getty -L  ttyS0 115200 vt100 #
GENERIC_SERIAL
            to   ttyO2::respawn:bin/sh
11. add        .../pmtroot/etc/init.d/S50peterinit with #!bin/sh echo
"Peter was here message"
12.  cd ../../../kernel/linux-omap-2.6.37-6/
13.  sudo make ARCH=arm CROSS_COMPILE=arm-linux-
INSTALL_MOD_PATH=/home/peter/Documents/felabs/sysdev/buildsdl/pmtroot
modules install
14.  start IGEPv2 and add serial port driver for gps...as per below
15.       modprobe -v option
16.       echo '0403 f448' > /sys/bus/usb-serial/drivers/option1/new_id
17.       ls /lib/modules/$(uname -r)/kernel/drivers
18.       picocom -b 9600 /dev/ttyUSB0
FIXME - control-c interrupt capability added via buildroot.



What doesn't work via From Scratch
----------------------------------
SDL_gfx will not compile.  The standard  ./configure && make && make
install does not seem to work here.   I need an example of a cross-compile
that worked for SDL_gfx.  The others, SDL, SDL_ttf, SDL_image all seem to
compile ok - after lots of fiddling with ./configure FLAGS.



Lazyfoo.c source code (in case someone is interested)
-----------------------------------------------------

/* Lazyfoo == program to test SDL, SDL_image, SDL_ttf, SDL_gfx */

/* ==> Compile for Ubuntu x86 via (shared object and static)::
1.  gcc lazyfoo.c -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx -o lazyfoo86so
2.  gcc lazyfoo.c -static -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx -o
lazyfoo86static
 FIXME  SDL_gfx and SDL_ttf don't link

   ==>  Compile for ARM architecture
    export
PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH  ==> to
find arm-linux-gcc
    export
PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
==> to find pkgconfig -lSDL -lSDL_image -lSDL_ttf -lSDL_gfx and .h include
files

3.  arm-linux-gcc lazyfoo.c -o lazyfooARMso \
          $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)
4.  arm-linux-gcc lazyfoo.c -static  -o lazyfooARMstatic   \
     $(pkg-config --libs --cflags sdl SDL_image SDL_gfx SDL_ttf)
 FIXME  SDL_gfx and SDL_ttf don't link here either
 FIXME try this
arm-linux-gcc lazyfoo.c -o lazyfooARMstatic -Wl,-Bstatic  $(pkg-config
--static --libs --cflags sdl SDL_image SDL_gfx SDL_ttf) -Wl,-Bdynamic
==>still doesn't work


*/


//Include SDL functions and datatypes
#include <stdio.h>
#include "SDL/SDL.h"
#include "SDL/SDL_image.h"
#include "SDL/SDL_ttf.h"
#include "SDL/SDL_gfxPrimitives.h"    /* part of SDL_gfx */

int main( int argc, char* args[] )
{
    //The images
    SDL_Surface* hello = NULL;
    SDL_Surface* screen = NULL;
    SDL_Surface* temp = NULL;
    SDL_Rect temp2 = { 0, 0, 240, 240 };

    //ttf stuff
    SDL_Surface     *title;
    TTF_Font         *bigfont = NULL;
    SDL_Color         textcolor = {0, 0, 0};
    SDL_Rect        position;
    char         *testtext = "Hello world from SDL_ttf";


/*******************************************   test SDL
************************/
    printf(" testing SDL only \n");
    //Start SDL
/*   Changed line below from SDL_INIT_EVERYTHING to SDL_INIT_VIDEO
    because my --disable audio causes error */
    if( SDL_Init( SDL_INIT_VIDEO ) == -1)
    printf("ERROR Init %s \n", SDL_GetError() );

    //Set up screen
    screen = SDL_SetVideoMode( 640, 480, 32, SDL_SWSURFACE );
    if( screen == NULL )
    printf("ERROR SetVideoMode %s \n", SDL_GetError() );

    //Load image
    hello = SDL_LoadBMP( "hello.bmp" );           /* test for SDL only */
    if( hello == NULL)
    printf("ERROR IMG_Load %s \n", SDL_GetError() );
    temp = SDL_DisplayFormat( hello );

   SDL_BlitSurface( temp, NULL, screen, NULL );

    //Update Screen
    SDL_Flip( screen );

    //Pause
    SDL_Delay( 2000 );

    //Free the loaded image
    SDL_FreeSurface( hello );
    SDL_FreeSurface( temp );

/**************************     testing SDL_image
*******************************/
    printf(" testing SDL image \n");
    //Load image
    hello = IMG_Load( "look.png" );         /* test for SDL_Image */
    if( hello == NULL)
    printf("ERROR IMG_Load %s \n", SDL_GetError() );
    temp = SDL_DisplayFormat( hello );

   SDL_BlitSurface( temp, NULL, screen, NULL );

    //Update Screen
    SDL_Flip( screen );

    //Pause
    SDL_Delay( 2000 );

    //Free the loaded image
    SDL_FreeSurface( hello );
    SDL_FreeSurface( temp );

/******************      testing  sdl_ttf   ********************/
    printf(" testing SDL ttf \n");
    if(TTF_Init() == -1)
    printf("ERROR-gotomenu::cannot initialize TTF\n");

    bigfont = TTF_OpenFont(
"/usr/share/fonts/truetype/freefont/FreeSans.ttf", 18 );
    if( bigfont == NULL)
    printf( "unable to open font
/usr/share/fonts/truetype/freefont/FreeSans.ttf \n");

    title = TTF_RenderText_Blended( bigfont, testtext, textcolor);
    position.x = 155;
    position.y = 155;
    SDL_BlitSurface(title, NULL, screen, &position);


    SDL_Flip(screen);
    SDL_Delay( 2000 );

    TTF_Quit();


On Tue, Jan 14, 2014 at 11:29 AM, Peter Thompson <
peter.macleod.thompson@gmail.com> wrote:

> Thomas,
>
> Sorry I am so very very slow in responding.   I was away at the CES show
> in Las Vegas and fell way behind in keeping up to my emails and work in
> general.
>
> Thanks so much for your suggestions.    I am going to spend a day or so
> digesting and trying your suggestions.
>
> Again, I am sorry I am so slow in responding.
>
>
> Peter
>
>
> On Thu, Jan 9, 2014 at 12:37 AM, Thomas Petazzoni <info@free-electrons.com
> > wrote:
>
>> Hello Peter,
>>
>> Le Wed, 8 Jan 2014 20:38:10 -0700,
>> Peter Thompson <peter.macleod.thompson@gmail.com> a ?crit :
>>
>> > I used the following before cross-compiling my application.   I do have
>> SDL
>> > on my host so for pkg-config to work, the felabs path has to appear
>> first
>> > in the path list
>> > export CROSS_COMPILE=arm-linux-
>>
>> Unneeded.
>>
>> > export ARCH=arm
>>
>> Unneeded.
>>
>> > export PATH=/usr/local/xtools/arm-unknown-linux-uclibcgnueabi/bin:$PATH
>>
>> Unneeded, and potentially harmful, as if the order of things in the
>> PATH is not correct, or the toolchain prefix you use is not correct,
>> you might end up using directly the external toolchain, instead of
>> using the toolchain wrappers that Buildroot creates in
>> output/host/usr/bin.
>>
>> > export
>> >
>> PATH=/home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/bin:$PATH
>>
>> This is the only thing that is needed.
>>
>> > the combo of SDL + SDL_image + SDL_ttf + SDL_gfx using
>> > arm-linux-g++  -o oz         \
>> >     /home/peter/Documents/oz3/display/main.cpp    \
>> >         ....(list of about 10 files)
>> >     /home/peter/Documents/oz4/keyboard/ttfopen.c        \
>> >     -lSDL -lSDL_image -lSDL_gfx -lSDL_ttf                   \
>> >     $(pkg-config --libs --cflags sdl SDL_image SDL_gfx      \
>> >            SDL_ttf)
>> >
>> > doesn't seem to work.
>> >
>> > The dynamic .so cross-compiles ok
>>
>> .so ? The command you show above certainly does *not* build a .so. It
>> builds an application, dynamically linked against the various SD
>> libraries.
>>
>> Also, your command is kind of wrong: there is no need to pass -l<foo>
>> if you're also using pkg-config to get the necessary compiler and
>> linker flags.
>>
>> > but has a seg fault part way through when
>> > running on IGEPv2.   The source is complex so I haven't figured out the
>> > point of error but I suspect a .so error.   I am preparing a simpler
>> > version for testing to track it down.
>>
>> Isn't that a bug in your application? Please do:
>>
>>         ulimit -c unlimited
>>
>> on the target, before running your application. It will generate a core
>> file. Then use it with gdb to get a backtrace of when the segfault
>> occurred.
>>
>> If you want us to help on this, then yes please provide a simple test
>> case that exhibits the problem.
>>
>> > The static won't cross-compile because for some reason SDL_image.a is
>> > missing from
>> >
>> /home/peter/Documents/felabs/sysdev/buildsdl/buildroot-2013.11/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib
>>
>> Humm, that's a bug. For some reason, our sdl_image package passes
>> --disable-static. It has had this option passed since the sdl_image
>> package was introduced in 2008, for an unknown reason. It would worth
>> removing this --disable-static option and see if it causes a problem or
>> not (it should not). This would get you SDL_image.a.
>>
>> > I tried copying SDL_image.a from a different library I had
>> cross-compiled
>> > from-scratch but that didn't seem to help.
>>
>> This is potentially dangerous: are you sure you've built this
>> SDL_image.a manually with the same toolchain? Same floating-point
>> strategy?
>>
>> Just removing --disable-static from package/sdl_image/sdl_image.mk
>> seems like a better idea.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140120/8ad9ecb3/attachment-0001.html>
