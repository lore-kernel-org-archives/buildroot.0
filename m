From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:14 +0200
Subject: [Buildroot] [PATCH 094/100] qt: remove libintl static linking
	handling
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-95-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support building the full-blown libintl in static linking
scenarios, as it causes too many problems. Therefore, remove the patch
that was handling this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...form-socklen_t-on-other-C-libraries-than.patch} |   0
 ...-inclusion-order-when-building-statically.patch | 105 ---------------------
 ...ith-ldl-option-only-when-it-is-supported.patch} |   0
 ...12-OpenGL-EGL-Avoid-X11-header-collision.patch} |   0
 4 files changed, 105 deletions(-)
 rename package/qt/{0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch => 0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch} (100%)
 delete mode 100644 package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
 rename package/qt/{0012-Link-with-ldl-option-only-when-it-is-supported.patch => 0011-Link-with-ldl-option-only-when-it-is-supported.patch} (100%)
 rename package/qt/{0013-OpenGL-EGL-Avoid-X11-header-collision.patch => 0012-OpenGL-EGL-Avoid-X11-header-collision.patch} (100%)

diff --git a/package/qt/0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch b/package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
similarity index 100%
rename from package/qt/0011-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
rename to package/qt/0010-Fix-for-platform-socklen_t-on-other-C-libraries-than.patch
diff --git a/package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch b/package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
deleted file mode 100644
index f6163fa..0000000
--- a/package/qt/0010-Fix-library-inclusion-order-when-building-statically.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 7a912823158a4113256c3113a34c38d6b241d275 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Wed, 13 Jan 2016 20:15:36 +0300
-Subject: [PATCH] Fix library inclusion order when building statically
-
-When building application statically it's important to keep
-libraries we're linking against in order. Otherwise if libA depends on
-libB but it is mentioned after libB in linker command line
-there will be unresolved symbols.
-
-Consider real example - configuration of Qt with glib for static build.
-Initially reported by Buildroot autobuilder here:
-http://autobuild.buildroot.net/results/174/174c6e47eb761f9897275b6fedff742ace2f3081
-
-What happens here:
-
-[1] Qt's configuration script tries to build glib test app
-    (in config.tests/unix/glib)
-
-[2] For that it first asks which libs to use during linkage this way:
-    QT_LIBS_GLIB=`$PKG_CONFIG --libs glib-2.0 gthread-2.0 2>/dev/null`
-
-    In our case we're getting something like this:
-    -L/.../sysroot/usr/lib -lintl -lgthread-2.0 -pthread -lglib-2.0 \
-    -lintl -pthread -lintl
-
-    Note "-lintl" is mentioned 3 times because libgthread depends on
-    libthread and both of them plus libglib all depend on libintl - so
-    we're getting "lintl" for each separate library mentioned above.
-
-[3] Now we execute "compileTest" for real heavy lifting this way:
-    compileTest unix/glib "Glib" $QT_CFLAGS_GLIB $QT_LIBS_GLIB ...
-
-[4] compileTest (the one for unix) parses command-line passed to it
-    groups all entries with "-l" prefix and puts them in LFLAGS
-    variable. And finally executes qmake passing it that kind of
-    construction:
-    $OUTDIR/bin/qmake ..."LIBS*=$LFLAGS"
-
-[5] When qmake sees construction "MYVAR*=MYVAL" it populates MYVAR with
-    unique values from MYVAL string.
-
-[6] As a result qmake generated Makefile with the following:
-    LIBS = $(SUBLIBS) -pthread -L/.../sysroot/usr/lib -lintl -lgthread-2.0 \
-    -lglib-2.0
-
-[7] And essentially on attempt to link glib test app a failure happens
-    because libglib needs libintl, i.e. "-lintl" must follow "-lglib-2.0":
--------------------->8------------------
-linking glib
-
-g++ -static -Wl,-O1 -o glib glib.o -pthread -L/.../sysroot/usr/lib \
--lintl -lgthread-2.0 -lglib-2.0
-
-/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function '_g_dgettext_should_translate':
-ggettext.c:(.text+0x28): undefined reference to `libintl_textdomain'
-ggettext.c:(.text+0x36): undefined reference to `libintl_gettext'
-/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `ensure_gettext_initialized':
-ggettext.c:(.text+0xe6): undefined reference to `libintl_bindtextdomain'
-ggettext.c:(.text+0xf6): undefined reference to `libintl_bind_textdomain_codeset'
-/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dgettext':
-ggettext.c:(.text+0x148): undefined reference to `libintl_dgettext'
-/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dcgettext':
-ggettext.c:(.text+0x2dc): undefined reference to `libintl_dcgettext'
-/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dngettext':
-ggettext.c:(.text+0x32a): undefined reference to `libintl_dngettext'
-collect2: error: ld returned 1 exit status
-Makefile:99: recipe for target 'glib' failed
-make: *** [glib] Error 1
-
-Glib disabled.
-Glib support cannot be enabled due to functionality tests!
- Turn on verbose messaging (-v) to ./configure to see the final report.
- If you believe this message is in error you may use the continue
- switch (-continue) to ./configure to continue.
--------------------->8------------------
-
-Solution to this problem is simple we have to pass all libraries exactly
-in order of their initial mention by upper layers.
-
-Change-Id: I7ff00901031a8eb85b4fbd7889b0e0c02be806bb
-
-This fix was sent to Qt Gerrit for review here:
-https://codereview.qt-project.org/#/c/145967/
-
----
- config.tests/unix/compile.test | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.tests/unix/compile.test b/config.tests/unix/compile.test
-index f484f03..dac0a4f 100755
---- a/config.tests/unix/compile.test
-+++ b/config.tests/unix/compile.test
-@@ -73,7 +73,7 @@ test -r Makefile && $MAKE distclean >/dev/null 2>&1
- rm -f "$EXE" "${EXE}.exe"
- 
- echo "QT_BUILD_TREE = $OUTDIR" > "$OUTDIR/$TEST/.qmake.cache"
--"$OUTDIR/bin/qmake" -spec "$QMKSPEC" "CONFIG+=$QMAKE_CONFIG" "CONFIG-=debug_and_release" "LIBS*=$LFLAGS" "LIBS+=$MAC_ARCH_LFLAGS" "INCLUDEPATH*=$INCLUDEPATH" "QMAKE_CXXFLAGS*=$CXXFLAGS" "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS" "$SRCDIR/$TEST/$EXE.pro" -o "$OUTDIR/$TEST/Makefile"
-+"$OUTDIR/bin/qmake" -spec "$QMKSPEC" "CONFIG+=$QMAKE_CONFIG" "CONFIG-=debug_and_release" "LIBS=$LFLAGS" "LIBS+=$MAC_ARCH_LFLAGS" "INCLUDEPATH*=$INCLUDEPATH" "QMAKE_CXXFLAGS*=$CXXFLAGS" "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS" "$SRCDIR/$TEST/$EXE.pro" -o "$OUTDIR/$TEST/Makefile"
- 
- if [ "$VERBOSE" = "yes" ]; then
-     $MAKE
--- 
-2.4.3
-
diff --git a/package/qt/0012-Link-with-ldl-option-only-when-it-is-supported.patch b/package/qt/0011-Link-with-ldl-option-only-when-it-is-supported.patch
similarity index 100%
rename from package/qt/0012-Link-with-ldl-option-only-when-it-is-supported.patch
rename to package/qt/0011-Link-with-ldl-option-only-when-it-is-supported.patch
diff --git a/package/qt/0013-OpenGL-EGL-Avoid-X11-header-collision.patch b/package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch
similarity index 100%
rename from package/qt/0013-OpenGL-EGL-Avoid-X11-header-collision.patch
rename to package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch
-- 
2.9.4
