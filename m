From: Chien-Yu Chen <torus0@gmail.com>
Date: Sat, 26 Jul 2008 13:58:00 -0500
Subject: [Buildroot] vlc stream server.
Message-ID: <dbc6d8cc0807261158o649d11e0v33ee9a96a29f1f22@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
  I am trying to build a video streaming server, and I saw vlc is in one of
the package.  However, the vlc.mk is not complete, and I am having a little
bit trouble linking the package to the toolchain...
here is what I added to the vlc.mk

VLC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
VLC_CONF_OPT =  --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
                --build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc \
                --disable-ffmpeg --disable-libmpeg2 --disable-wxwidgets

this is just a straight copy from blackbox

at the very last linking stage for vlc, it failed with something about
libc.so.6
and I saw the command for linking
-----------------------------------------------------------
/bin/sh ./libtool --tag=CC --mode=link
/home/torus/src/temp/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc
-Os -I/home/torus/src/temp/buildroot/build_i686/staging_dir/usr/include
-I/home/torus/src/temp/buildroot/build_i686/staging_dir/include
--sysroot=/home/torus/src/temp/buildroot/build_i686/staging_dir/ -isysroot
/home/torus/src/temp/buildroot/build_i686/staging_dir -mtune=pentium4
-march=pentium4 -Wsign-compare -Wall -pipe -o vlc vlc-vlc.o src/libvlc.a
./modules/misc/memcpy/libmemcpymmx.a
./modules/video_chroma/libi420_rgb_mmx.a
./modules/video_chroma/libi422_yuy2_mmx.a
./modules/video_chroma/libi420_ymga_mmx.a
./modules/video_chroma/libi420_yuy2_mmx.a
./modules/misc/memcpy/libmemcpymmxext.a ./modules/misc/memcpy/libmemcpy3dn.a
-L/usr/lib -lpthread -ldl -lm -liconv
-----------------------------------------------------------------
so I manually link vlc except at close to the end, change -L/usr/lib to
-L/home/torus/src/temp/buildroot/build_i686/staging_dir/lib

and it linked alright...but I have a few question, since vlc still has some
problem
if I do

----------------------------------------------------------------------
build_i686/staging_dir/usr/bin/i686-linux-ldd
project_build_i686/MySling8/root/usr/bin/i686-linux-vlc
---------------------------------------------------------------------

I get
----------------------------------
checking sub-depends for
'/lib/libpthread.so.0'                                 checking sub-depends
for 'not found'                                            checking
sub-depends for 'not found'
checking sub-depends for
'/home/torus/src/temp/buildroot/build_i686/staging_dir/usr/lib/libiconv.so.2'
checking sub-depends for 'not
found'                                            checking sub-depends for
'/lib/libc.so.6'
libpthread.so.0 => /lib/libpthread.so.0
(0x00000000)                            libdl.so.0 => not found (0x00000000)
        libm.so.0 => not found (0x00000000)
        libiconv.so.2 =>
/home/torus/src/temp/buildroot/build_i686/staging_dir/usr/lib/libiconv.so.2
(0x00000000)
        libc.so.0 => not found (0x00000000)
        libc.so.6 => /lib/libc.so.6 (0x00000000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x00000000)
------------------------------------------------------------------
why do I still have some libc.so.6 around....
and all the modules for vlc was linked with libc.so.6
and I think that's why when I start vlc, it started, then can't find some of
the modules, then exits.......

I think the linker is not detecting everything right...please let me know
where to look for. thanks

chen



-- 
Any MicroSoft extension file will directly go to trash without any warning
and regret.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080726/78702cdb/attachment-0001.htm 
