From: Allan Nielsen <a@awn.dk>
Date: Sat, 26 Mar 2011 19:42:46 +0100
Subject: [Buildroot] Problems with pkg-config
Message-ID: <AANLkTinY9SZZs0uBFzCah0oJD5JjTvRR0K7z+B1u=AHd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey

I'am trying to upgrade the xserver in buildroot to version 1.9.4 and
i'am having some small problems. I have not been hacking on buildroot
before, and i'am therefor simply seeking some advices on the right way
to do things.

I have incremented the versions on libX11 and xtrans (among others),
xtrans compiles and installs without a problem, but there seems to
exists some problems with the xtrans.pc file. When I tries to compile
libX11 which depends on xtrans it complains:


configure: error: Package requirements (xproto >= 7.0.13 xextproto
xtrans xcb >= 1.1.92 kbproto inputproto) were not met:

No package 'xtrans' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.


Because of this message I started look after where the xtrans file is installed:
awn at awn-pc ~/git/buildroot $ find -name xtrans.pc
./output/target/usr/share/pkgconfig/xtrans.pc
./output/build/xlib_xtrans-1.2.6/xtrans.pc
./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/share/pkgconfig/xtrans.pc
awn at awn-pc ~/git/buildroot $


The path in sysroot seems to be outside the pkg-config search path:

awn at awn-pc ~/git/buildroot $
/home/awn/git/buildroot/output/host/usr/bin/pkg-config --cflags xtrans
Package xtrans was not found in the pkg-config search path.
Perhaps you should add the directory containing `xtrans.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xtrans' found

awn at awn-pc ~/git/buildroot $
PKG_CONFIG_PATH=./output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/share/pkgconfig
/home/awn/git/buildroot/output/host/usr/bin/pkg-config --cflags xtrans
-D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT

awn at awn-pc ~/git/buildroot $


So, now to my question: how should I correct this problem? Should
patch/configure xtrans to install the xtrans.pc in
..../sysroot/usr/lib/pkgconfig/ (this is where the other *.pc files
are located). Should I include sysroot/usr/share/pkgconfig in
pkg-configs search path, or something else???


Best regards
Allan W. Nielsen
