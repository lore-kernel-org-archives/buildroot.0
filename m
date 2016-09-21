From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 21 Sep 2016 15:28:21 +0000
Subject: [Buildroot] Qt5WebKit anf gcc 6.x
Message-ID: <1474471693.4311.28.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to get some suggestions on how to cope with another gcc 6.x related issue.
I'm trying to build Qt5Webkit with gcc 6.x either for ARM (with gcc 6 selected) or
for ARC (where as of now we use gcc 6.2-based tools only).

The first sign of this problem I see on WebKit configuration:
--------------------->8-------------------
Info: creating cache file XXX/.qmake.cache

Running configure tests...

Checking for fontconfig... no
Checking for gccdepends... yes
Checking for glx... no
Checking for gnuld... yes
Checking for icu... no

...

The WebKit build was disabled for the following reasons:?
????* ICU is required.
--------------------->8-------------------

But I knew ICU was a dependency and it was really built so I started to look deeper.
Real breakage happens on ICU check:
--------------------->8-------------------
cd output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Tools/qmake/config.tests/icu
../../../../../../host/usr/bin/qmake?
make
XXX/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -Wall -Wextra -Wreturn-type -Wchar-subscripts -Wformat-
security -Wreturn-type -Wno-unused-parameter -Wno-sign-compare -Wno-switch -Wno-switch-enum -Wundef -Wmissing-noreturn
-Winit-self -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --
sysroot=XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -fno-strict-aliasing -O2 -O3 -std=gnu++0x -fno-
exceptions -fPIC -I. -IXXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Source
-IXXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Source/include -isystem XXX/output/host/usr/arm-
buildroot-linux-uclibcgnueabi/sysroot/usr/include -IXXX/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o
.obj/icu.o icu.cpp
In file included from XXX/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/include/c++/6.2.0/ext/string_conversions.h:41:0,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include/c++/6.2.0/bits/basic_string.h:5402,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include/c++/6.2.0/string:52,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/std_string.h:33,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/unistr.h:31,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/strenum.h:14,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/uenum.h:24,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/uloc.h:25,
?????????????????from XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unicode/ucol.h:18,
?????????????????from icu.cpp:35:
XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/include/c++/6.2.0/cstdlib:75:25: fatal error: stdlib.h: No such
file or directory
?#include_next <stdlib.h>
?????????????????????????^
compilation terminated.
make: *** [.obj/icu.o] Error 1
--------------------->8-------------------

So there's a known "feature" of gcc 6.x, see
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129

In its turn "-isystem XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include"
appears in ICU's check Makefile because
--------------------->8-------------------
./pkg-config_wrapper.sh --cflags icu-i18n
-IXXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
--------------------->8-------------------
and that include path matches with one entry from?QMAKE_DEFAULT_INCDIRS.
In that case qmake makes an assumption that it's a system path and adds "-isystem".

At this point I'm not sure how to fix that puzzle so any ideas are much appreciated.

Indeed there's such options like disabling usage of pkg-config in Qt.
And that's quite easy one we just need to add "no-pkg-config" to?QT_CONFIG for
problematic packages but probably there're better approaches here.

Note Qt uses its own pkg-config_wrapper.sh which looks like:
--------------------->8-------------------
#!/bin/sh
PKG_CONFIG_SYSROOT_DIR=XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
export PKG_CONFIG_SYSROOT_DIR
PKG_CONFIG_LIBDIR=XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig
export PKG_CONFIG_LIBDIR
exec pkg-config "$@"
--------------------->8-------------------

But it then executes Buildroot's pkg-config wrapper which overrides PKG_CONFIG_XXX entries:
--------------------->8-------------------
cat XXX/output/host/usr/bin/pkg-config

#!/bin/sh
PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-XXX/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/sysroot/usr/lib/pkgconfig:XXX/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/sysroot/usr/share/pkgconfig} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-XXX/output/host/usr/arm-
buildroot-linux-uclibcgnueabi/sysroot} $(dirname $0)/pkgconf??$@
--------------------->8-------------------

Regards,
Alexey
