From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Dec 2020 13:03:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/assimp: don't install zlib
In-Reply-To: <20201227213050.GK1680670@scaer>
References: <20201227142003.2818138-1-fontaine.fabrice@gmail.com>
 <20201227213050.GK1680670@scaer>
Message-ID: <CAPi7W82ck9GM1_2hye714CAadVP10KOTiyGW4xmxDP=aAjDTzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le dim. 27 d?c. 2020 ? 22:30, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, Peter, All,
>
> On 2020-12-27 15:20 +0100, Fabrice Fontaine spake thusly:
> > assimp uses and installs its own embedded version of zlib since commit
> > b529a582ba4d7671597e95d7ab54ee652cbbc261.
>
> Looking back that that commit, and the build failure it was supposed to
> fix, I am not so sure forcing assimp to build its own bundled zlib was
> the correct solution.
>
> Indeed, the original build failure was about type mismatch, on a musl
> toolchain. Also, that commit nted that assimp "is picky about the
> provided [system zlib] versions". But there are very few "recent" zlib
> version in the field:
>
>     1.2.11 (15 Jan 2017)
>     1.2.10 (2 Jan 2017)
>     1.2.9 (31 Dec 2016)
>     1.2.8 (28 Apr 2013)
>     1.2.7.3 (13 Apr 2013)
>     1.2.7.2 (13 Apr 2013)
>     1.2.7.1 (24 Mar 2013
>     1.2.7 (2 May 2012)
>
> Besides, zlib had been extra stable and extra conservative since its
> inception, so much so that I think dubious the pickyness claim...
>
> Furthermore, the reported build failure was in the minizip bundled
> implementation, not about zlib...
>
> Finally, I think upstream has fixed that issue with their commit
> bb3db0ebaffc6b76de256e597ec1d1e4d2a6663f, which references their issue
> https://github.com/assimp/assimp/issues/2954, which suspiciously reds
> like the original build failure we had:
>
>     5.0.1 is broken on the i386 architecture: typedef redefinition with
>     different types ('long' vs '__ssize_t' (aka 'int'))
>
> So, we should instead either bump assimp to a version that has the fix,
> or backport that patch (and revert our fix b529a582ba4d7).
>
> Thoughts?
This seems a better approach, I sent a new patch serie.
>
> Regards,
> Yann E. MORIN.
>
> > Don't install it to avoid the following build failure when building
> > hiawatha:
> >
> > -- Found ZLIB: optimized;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so;debug;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzlibstaticd.a (found version "1.2.11")
> >
> > -- Looking for /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so in optimized
> > CMake Error at /home/buildroot/autobuild/instance-0/output-1/build/hiawatha-10.11/CMakeFiles/CMakeTmp/CMakeLists.txt:15 (target_link_libraries):
> >   The "optimized" argument must be followed by a library.
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...ib-CMakeLists.txt-don-t-install-zlib.patch | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch
> >
> > diff --git a/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch b/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch
> > new file mode 100644
> > index 0000000000..3d9a03c85f
> > --- /dev/null
> > +++ b/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch
> > @@ -0,0 +1,42 @@
> > +From 1bc628747391d7f7c7435bcd81578bf1c671ff9d Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sun, 27 Dec 2020 12:53:02 +0100
> > +Subject: [PATCH] contrib/zlib/CMakeLists.txt: don't install zlib
> > +
> > +assimp uses and installs its own embedded version of zlib since commit
> > +b529a582ba4d7671597e95d7ab54ee652cbbc261.
> > +
> > +Don't install this library to avoid the following build failure when
> > +building hiawatha:
> > +
> > +-- Found ZLIB: optimized;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so;debug;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzlibstaticd.a (found version "1.2.11")
> > +
> > +-- Looking for /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so in optimized
> > +CMake Error at /home/buildroot/autobuild/instance-0/output-1/build/hiawatha-10.11/CMakeFiles/CMakeTmp/CMakeLists.txt:15 (target_link_libraries):
> > +  The "optimized" argument must be followed by a library.
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + contrib/zlib/CMakeLists.txt | 7 -------
> > + 1 file changed, 7 deletions(-)
> > +
> > +diff --git a/contrib/zlib/CMakeLists.txt b/contrib/zlib/CMakeLists.txt
> > +index c284656e..e78fd25d 100644
> > +--- a/contrib/zlib/CMakeLists.txt
> > ++++ b/contrib/zlib/CMakeLists.txt
> > +@@ -197,9 +197,3 @@ if(MINGW)
> > + endif(MINGW)
> > +
> > + add_library(zlibstatic STATIC ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
> > +-
> > +-INSTALL( TARGETS zlibstatic
> > +-         LIBRARY DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
> > +-         ARCHIVE DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
> > +-         RUNTIME DESTINATION ${ASSIMP_BIN_INSTALL_DIR}
> > +-         COMPONENT ${LIBASSIMP_COMPONENT})
> > +--
> > +2.29.2
> > +
> > --
> > 2.29.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
