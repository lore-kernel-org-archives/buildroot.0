From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 14:16:11 +0100
Subject: [Buildroot] [git commit] qt4: fix static building if libglib-2.0 is
	enabled
Message-ID: <20160114131637.CA72E7FD65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12009bb92931b153823110f811632540044d3b02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Here we're seeing another issue with static builds.
Problem is Qt's configuration system post-processes output of pkg-config
removing duplicate entries. That's fine for dynamic builds - all symbols
will be resolved in runtime but for static builds we need to specify
explicit and correct list of libs.

See more explanations in the patch itself.

This patch was sent in Qt's Gerrit for review and could be seen here:
https://codereview.qt-project.org/#/c/145967/

Fixes a couple of qt4 build failures:
http://autobuild.buildroot.net/results/174/174c6e47eb761f9897275b6fedff742ace2f3081
http://autobuild.buildroot.net/results/273/273676f1deee986a205b63e92cd6042c29ba1578
http://autobuild.buildroot.net/results/4f9/4f92d1316e786d8bb3c16b748f1ab731562540e3
and many others.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Lada Trimasova <ltrimas@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-inclusion-order-when-building-statically.patch | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/package/qt/0009-Fix-library-inclusion-order-when-building-statically.patch b/package/qt/0009-Fix-library-inclusion-order-when-building-statically.patch
new file mode 100644
index 0000000..f6163fa
--- /dev/null
+++ b/package/qt/0009-Fix-library-inclusion-order-when-building-statically.patch
@@ -0,0 +1,105 @@
+From 7a912823158a4113256c3113a34c38d6b241d275 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Wed, 13 Jan 2016 20:15:36 +0300
+Subject: [PATCH] Fix library inclusion order when building statically
+
+When building application statically it's important to keep
+libraries we're linking against in order. Otherwise if libA depends on
+libB but it is mentioned after libB in linker command line
+there will be unresolved symbols.
+
+Consider real example - configuration of Qt with glib for static build.
+Initially reported by Buildroot autobuilder here:
+http://autobuild.buildroot.net/results/174/174c6e47eb761f9897275b6fedff742ace2f3081
+
+What happens here:
+
+[1] Qt's configuration script tries to build glib test app
+    (in config.tests/unix/glib)
+
+[2] For that it first asks which libs to use during linkage this way:
+    QT_LIBS_GLIB=`$PKG_CONFIG --libs glib-2.0 gthread-2.0 2>/dev/null`
+
+    In our case we're getting something like this:
+    -L/.../sysroot/usr/lib -lintl -lgthread-2.0 -pthread -lglib-2.0 \
+    -lintl -pthread -lintl
+
+    Note "-lintl" is mentioned 3 times because libgthread depends on
+    libthread and both of them plus libglib all depend on libintl - so
+    we're getting "lintl" for each separate library mentioned above.
+
+[3] Now we execute "compileTest" for real heavy lifting this way:
+    compileTest unix/glib "Glib" $QT_CFLAGS_GLIB $QT_LIBS_GLIB ...
+
+[4] compileTest (the one for unix) parses command-line passed to it
+    groups all entries with "-l" prefix and puts them in LFLAGS
+    variable. And finally executes qmake passing it that kind of
+    construction:
+    $OUTDIR/bin/qmake ..."LIBS*=$LFLAGS"
+
+[5] When qmake sees construction "MYVAR*=MYVAL" it populates MYVAR with
+    unique values from MYVAL string.
+
+[6] As a result qmake generated Makefile with the following:
+    LIBS = $(SUBLIBS) -pthread -L/.../sysroot/usr/lib -lintl -lgthread-2.0 \
+    -lglib-2.0
+
+[7] And essentially on attempt to link glib test app a failure happens
+    because libglib needs libintl, i.e. "-lintl" must follow "-lglib-2.0":
+-------------------->8------------------
+linking glib
+
+g++ -static -Wl,-O1 -o glib glib.o -pthread -L/.../sysroot/usr/lib \
+-lintl -lgthread-2.0 -lglib-2.0
+
+/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function '_g_dgettext_should_translate':
+ggettext.c:(.text+0x28): undefined reference to `libintl_textdomain'
+ggettext.c:(.text+0x36): undefined reference to `libintl_gettext'
+/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `ensure_gettext_initialized':
+ggettext.c:(.text+0xe6): undefined reference to `libintl_bindtextdomain'
+ggettext.c:(.text+0xf6): undefined reference to `libintl_bind_textdomain_codeset'
+/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dgettext':
+ggettext.c:(.text+0x148): undefined reference to `libintl_dgettext'
+/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dcgettext':
+ggettext.c:(.text+0x2dc): undefined reference to `libintl_dcgettext'
+/.../sysroot/usr/lib/libglib-2.0.a(libglib_2_0_la-ggettext.o): In function `g_dngettext':
+ggettext.c:(.text+0x32a): undefined reference to `libintl_dngettext'
+collect2: error: ld returned 1 exit status
+Makefile:99: recipe for target 'glib' failed
+make: *** [glib] Error 1
+
+Glib disabled.
+Glib support cannot be enabled due to functionality tests!
+ Turn on verbose messaging (-v) to ./configure to see the final report.
+ If you believe this message is in error you may use the continue
+ switch (-continue) to ./configure to continue.
+-------------------->8------------------
+
+Solution to this problem is simple we have to pass all libraries exactly
+in order of their initial mention by upper layers.
+
+Change-Id: I7ff00901031a8eb85b4fbd7889b0e0c02be806bb
+
+This fix was sent to Qt Gerrit for review here:
+https://codereview.qt-project.org/#/c/145967/
+
+---
+ config.tests/unix/compile.test | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.tests/unix/compile.test b/config.tests/unix/compile.test
+index f484f03..dac0a4f 100755
+--- a/config.tests/unix/compile.test
++++ b/config.tests/unix/compile.test
+@@ -73,7 +73,7 @@ test -r Makefile && $MAKE distclean >/dev/null 2>&1
+ rm -f "$EXE" "${EXE}.exe"
+ 
+ echo "QT_BUILD_TREE = $OUTDIR" > "$OUTDIR/$TEST/.qmake.cache"
+-"$OUTDIR/bin/qmake" -spec "$QMKSPEC" "CONFIG+=$QMAKE_CONFIG" "CONFIG-=debug_and_release" "LIBS*=$LFLAGS" "LIBS+=$MAC_ARCH_LFLAGS" "INCLUDEPATH*=$INCLUDEPATH" "QMAKE_CXXFLAGS*=$CXXFLAGS" "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS" "$SRCDIR/$TEST/$EXE.pro" -o "$OUTDIR/$TEST/Makefile"
++"$OUTDIR/bin/qmake" -spec "$QMKSPEC" "CONFIG+=$QMAKE_CONFIG" "CONFIG-=debug_and_release" "LIBS=$LFLAGS" "LIBS+=$MAC_ARCH_LFLAGS" "INCLUDEPATH*=$INCLUDEPATH" "QMAKE_CXXFLAGS*=$CXXFLAGS" "QMAKE_CXXFLAGS+=$MAC_ARCH_CXXFLAGS" "$SRCDIR/$TEST/$EXE.pro" -o "$OUTDIR/$TEST/Makefile"
+ 
+ if [ "$VERBOSE" = "yes" ]; then
+     $MAKE
+-- 
+2.4.3
+
