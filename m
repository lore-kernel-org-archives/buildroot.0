From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 12 May 2016 13:05:56 -0600
Subject: [Buildroot] SDL2_ttf requires libpng12 but Buildroot installs
	libpng16
Message-ID: <CAGrGpJB1XFuZWdXS7rWeaA9E7N2yzde8JuSp_A8KjU2vD6h_VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Gustavo,   You are absolutely correct - and you saved me a huge
amount of mis-spent effort doing "wrong" things.

Below are my personal notes on how I compiled the SDL2 suite  -   in the
hopes it is helpful to someone else.   pmtstaging is a copy of the
buildroot sysroot which I wanted to keep pristine during this process.

I will try to convert these  notes into a buildroot patch and submit it -
making life much easier in the future.

Again - thanks for the help.

PS - I hope I am submitting this update properly....

===================================================
original message

On 02/05/16 12:57, Peter Thompson wrote:

>* I am trying to install the SDL2 suite  (SDL2, SDL2_gfx, SDL2_image,
*>* SDL2_ttf) using Buildroot-2016-02.  SDL2 is incorporated into
*>* Buildroot-2016-02.   SDL2_gfx and SDL2_image are relatively straight
*>* forward to add,  but SDL2_ttf is being problematic.    SDL2_ttf
*>* can't/won't use libpng16.
*
Hi.
SDL2_ttf doesn't use libpng at all, combined with the fact that you're
building the additional SDL2* packages manually is a recipe for trouble.

>* My questions are:
*>>* 1. Can I change Buildroot-2016-02 to use libpng12 instead of libpng16?
*>* I looked at libpng dependencies in Buildroot and they are HUGE!   I see
*>* no easy way to change to libpng12.
*
Maybe, but expect other packages breaking because they require newer API
functionality or decided they didn't want to deal with old libpng.

>* 2. Does an earlier version of buildroot use libpng12?  Should I use
*>* that?  I would miss having SDL2 available in buildroot - I had problems
*>* compiling that earlier.
*
Not really, i think you're wrong in trying to manually build everything.

>* 3. Should I use buildroot to build a barebones rootfs without libpng and
*>* create what I need from there.  Looking briefly at the dependencies, I
*>* am not sure that is possible.
*
No, again, make the additional SDL2* packages (sic) proper packages,
that's the way, i'm pretty sure it will just work(tm) at least for
SDL2_ttf since there's no mention of anything png-related in the source.
Regards.

======================================================
Peter Thompson personal notes on building SDL2 suite.

Step 5 - Create pmtstaging
---------------------------
cp -a
/home/peter/igep2015/09Buildroot/buildroot-2016.02-TRY6/output/host/usr/armeb-buildroot-linux-gnueabi/sysroot
/home/peter/igep2015/
mv /home/peter/igep2015/sysroot   /home/peter/igep2015/pmtstaging



BUILD FROM SCRATCH BECAUSE BUILDROOT USES SDL1.2
#########   also see readme-raspberrypi.txt in SDL sources ##############

Step -1 Download SDL2 suite
--------------------------
SDL2_gfx-1.0.1.tar.gz
SDL2_image-2.0.0.tar.gz
SDL2_ttf-2.0.14.tar.gz
tar -xvzf  SDL2_gfx-1.0.1.tar.gz
tar -xvzf  SDL2_image-2.0.0.tar.gz
tar -xvzf  SDL2_ttf-2.0.14.tar.gz


Step 0 - Set Ubuntu environment variables
-----------------------------------------
echo $PATH
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
        # Buildroot requires glibc (Error IPV6 required)
            - will not work against uclibc

export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export CC=arm-linux-gcc
export CFLAGS="-v -Wl,--verbose"           ###optional for debugging

======================================================================
#########################    SDL2_gfx    ############################


Step 1 - Configure SDLgfx
--------------------------
cd ~/igep2015/92SDLgfx/SDL2_gfx-1.0.1
read README file

./configure --help         # look in config.log to debug SDL configuration

make clean                #
make distclean            # if redoing configuration

--environment variables
export LDFLAGS="-L/home/peter/igep2015/pmtstaging/lib
-L/home/peter/igep2015/pmtstaging/usr/lib"
export CPPFLAGS=-I/home/peter/igep2015/pmtstaging/usr/include
export CC="arm-linux-gcc --sysroot=/home/peter/igep2015/pmtstaging"

./configure  --prefix=/usr --host=arm-linux --disable-mmx
--with-sysroot=/home/peter/igep2015/pmtstaging


Step 2 make & install in pmtstaging
-----------------------------------
make
make DESTDIR=/home/peter/igep2015/pmtstaging/  install

 ## to see what's being installed also do ###
make DESTDIR=/home/peter/igep2015/93SDLgfx/staging  install



Step 3 - transfer libs to igpev2 sysroot (pmtroot)
---------------------------------------------------
....copy the library libSDL2_gfx to pmtroot
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_gfx-1.0.*
/home/peter/igep2015/pmtroot/usr/lib/
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_gfx.so
/home/peter/igep2015/pmtroot/usr/lib/

# if not still debugging, strip symbols
arm-linux-strip
/home/peter/igep2015/pmtroot/usr/lib/libSDL2_gfx-1.0.so.0.0.1


==============================================================================
########################    SDL2_image
####################################


Step 1 - Configure
------------------
cd ~/igep2015/93SDLimage/SDL2_image-2.0.0
read README.txt file

./configure --help         # look in config.log to debug SDL configuration

make clean
make distclean            # if redoing configuration



 -- environment variables (same as above)
export LDFLAGS="-L/home/peter/igep2015/pmtstaging/lib
-L/home/peter/igep2015/pmtstaging/usr/lib"
export CPPFLAGS=-I/home/peter/igep2015/pmtstaging/usr/include
export CC="arm-linux-gcc --sysroot=/home/peter/igep2015/pmtstaging"


./configure  --prefix=/usr --host=arm-linux --disable-gif --disable-jpg
--disable-jpg-shared --disable-lbm --disable-pcx --disable-pnm
--disable-tga --disable-xcf --disable-xpm --disable-xv --disable-webp
--disable-webp-shared
   (**NOTE --with-sysroot= not supported)


Step 2 make & install in pmtstaging
-----------------------------------
make
make DESTDIR=/home/peter/igep2015/pmtstaging/  install

 ## to see what's being installed also do ###
make DESTDIR=/home/peter/igep2015/94SDLimage/staging  install


Step 3 - transfer libs to igpev2 sysroot (pmtroot)
--------------------------------------------------
....copy the library libSDL2_image to pmtroot
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_image-2.0.*
/home/peter/igep2015/pmtroot/usr/lib/
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_image.so
/home/peter/igep2015/pmtroot/usr/lib/

# if not still debugging, strip symbols
arm-linux-strip
/home/peter/igep2015/pmtroot/usr/lib/libSDL2_image-2.0.so.0.0.0


Step 4 Cross-Compile into pmtroot & test
----------------------------------------
cd ~/igep2015/pmtroot/root/helloworld/hellosensor
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export PKG_CONFIG_PATH=/home/peter/igep2015/pmtstaging/usr/lib/pkgconfig/
rm test3
arm-linux-gcc -o test3 ~/Documents/helloworld/hellosensor/test3.c
--sysroot=/home/peter/igep2015/pmtstaging/ $(pkg-config --libs --cflags
sdl2) $(pkg-config --libs --cflags SDL2_image)
./test3
IT WORKS!!!

==============================================================================
########################    SDL2_ttf    ####################################

Information
------------
arm-linux-gcc -print-search-dirs ==>
arm-linux-gcc -print-sysroot
-Wl,--verbose   pass this flag to linker as in
        arm-linux-gcc -Wl,--verbose hello.c
see www.stackoverflow.com >> user >> Peter Thompson (3 questions)
http://stackoverflow.com/questions/36682302/cant-access-buildroot-staging-libraries-via-configure-when-cross-compiling-i
http://stackoverflow.com/questions/36682427/cannot-cross-compile-sdl2-ttf-onto-arm-linux
http://stackoverflow.com/questions/33343266/cross-compile-sdl2-with-directfb-and-add-to-a-buildroot-root-filesystem


Step 1 - Configure
------------------
cd ~/igep2015/94SDLttf/SDL2_ttf-2.0.14/

 -- environment variables (same as above)
export CPPFLAGS="-I/home/peter/igep2015/pmtstaging/usr/include"
export LDFLAGS="-L/home/peter/igep2015/pmtstaging/lib
-L/home/peter/igep2015/pmtstaging/usr/lib"
export CC="arm-linux-gcc --sysroot=/home/peter/igep2015/pmtstaging"

./configure --host=arm-linux --prefix=/usr
--with-freetype-prefix=/home/peter/igep2015/pmtstaging/usr



Step 2 - make & install in pmtstaging
----------------------------------------
make
make DESTDIR=/home/peter/igep2015/pmtstaging/  install

 ## to see what's being installed also do ###
make DESTDIR=/home/peter/igep2015/95SDLttf/staging  install


Step 3 - transfer libs to igpev2 sysroot (pmtroot)
---------------------------------------------------
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_ttf-2.0.so*
/home/peter/igep2015/pmtroot/usr/lib/
sudo cp -a ~/igep2015/pmtstaging/usr/lib/libSDL2_ttf.so
/home/peter/igep2015/pmtroot/usr/lib/

# if not still debugging, strip symbols
arm-linux-strip
/home/peter/igep2015/pmtroot/usr/lib/libSDL2_ttf-2.0.so.0.14.0


Step 4 Cross-Compile into pmtroot & test
----------------------------------------
cd ~/igep2015/pmtroot/root/viewsensor/
export PATH=$PATH:/usr/local/xtools/arm-unknown-linux-gnueabi/bin/
export PKG_CONFIG_PATH=/home/peter/igep2015/pmtstaging/usr/lib/pkgconfig/
rm viewtest
arm-linux-gcc -o viewtest ~/Documents/oz2/sdl2test/viewsensor/viewtest.c
SDL2init.c  --sysroot=/home/peter/igep2015/pmtstaging/ $(pkg-config --libs
--cflags sdl2) $(pkg-config --libs --cflags SDL2_image)  $(pkg-config
--libs --cflags SDL2_ttf)
./viewtest
IT WORKS (be sure to copy fonts into pmtroot)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160512/21339a76/attachment.html>
