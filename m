From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 26 Sep 2016 11:30:05 +0000
Subject: [Buildroot] [PATCH] qt5: Disable passing of -isystem flag in
 CXXFLAGS
In-Reply-To: <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
References: <1474642729-40702-1-git-send-email-abrodkin@synopsys.com>
 <81ddd556-d7fd-2378-d8da-2f2d73091fa3@mind.be>
Message-ID: <1474889395.4184.8.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, 2016-09-24 at 00:11 +0200, Arnout Vandecappelle wrote:
> ?Hi Alexey,
> 
> ?Excellent commit log!

That a pleasure to read this kind of comments really :)

> On 23-09-16 16:58, Alexey Brodkin wrote:
> > 
> > Some Qt5 sub-projects as well as 3rd-party apps written on Qt
> > are failing to compile with gcc 6.x like that:
> > ---------------------------->8-------------------------
> > In file included from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/bits/stl_algo.h:59:0,
> > ?????????????????from XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/algorithm:62,
> > ?????????????????from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qglobal.h:88,
> > ?????????????????from XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/include/qt5/QtCore/qpair.h:37,
> > ?????????????????from qmediametadata.h:37,
> > ?????????????????from qmediametadata.cpp:28:
> > XXX/output/host/usr/arc-buildroot-linux-uclibc/include/c++/6.2.1/cstdlib:75:25: fatal error: stdlib.h: No such file
> > or directory
> > ?#include_next <stdlib.h>
> > ?????????????????????????^
> > compilation terminated.
> > ---------------------------->8-------------------------
> > 
> > That happens because qmake trying to play smart passes some
> > include paths in Makefile with "-isystem" prefix.
> > Which in some cases lead to build failure well described in [1].
> > 
> > A little bit more details below on what really happens:
> > 
> > 1. In "configure" script Qt determines default include paths of the
> > ???toolchain and stores them in DEFAULT_INCDIRS variable, see [2].
> > 
> > 2. On qmake execution when it creates Makefile out of .pro-file
> > ???it parses headers in INCLUDEPATH variable and if a path matches
> > ???one in DEFAULT_INCDIRS then in CXXFLAGS that path is written
> > ???with $QMAKE_CFLAGS_ISYSTEM prefix, otherwise non-matching include
> > ???path ends up in CXXFLAGS with normal "-I" prefix.
> > 
> > 3. By default for gcc "QMAKE_CFLAGS_ISYSTEM = -isystem", see [3].
> > 
> > 4. gcc fails to find stdlib.h, again refer to J?rg's explanation in [1].
> 
> ?There is one difference here, however: In J?rg's explanation, it's about
> headers which really aren't system headers (protobuf). But in this case, the
> headers really are system headers.

Indeed.

> > 
> > 
> > What we do here we force set QMAKE_CFLAGS_ISYSTEM to "" and so qmake
> > won't use "-isystem" any longer instead expected "-I" will be used for
> > all headers, see [4].
> 
> ?Another option would be to set it to -idirafter, which puts the directory at
> the end of the default search path and I think it also still treats it as a
> system directory. But that would possibly lead to even worse side effects, so
> maybe not such a good idea.
> 
> ?I still don't understand how the -I$(STAGING_DIR)/usr/include gets added, by
> the way. Isn't pkg-config supposed to suppress those, because they already are
> in the default search path? For instance, on my system I have a xf86dgaproto.pc
> which contains Cflags: -I${includedir}, but pkg-config --cflags xf86dgaproto
> gives empty.

That's how:
--------------------->8--------------------
export PATH=/XXX/output/host/usr/bin/:$PATH
/XXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Tools/qmake/config.tests/icu/pkg-config_wrapper.sh
--libs icu-i18n
-licui18n -L/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib -licuuc -licudata ?
--------------------->8--------------------

Looks like .pc files from "XXX/output/host/usr/lib/pkgconfig" are used.

And just FYI contents of "pkg-config_wrapper.sh":
--------------------->8--------------------
ccat /XXX/output/build/qt5webkit-b889f460280ad98c89ede179bd3b9ce9cb02002b/Tools/qmake/config.tests/icu/pkg-
config_wrapper.sh?
#!/bin/sh
PKG_CONFIG_SYSROOT_DIR=/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot
export PKG_CONFIG_SYSROOT_DIR
PKG_CONFIG_LIBDIR=/XXX/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/pkgconfig
export PKG_CONFIG_LIBDIR
exec pkg-config "$@"
--------------------->8--------------------

-Alexey
