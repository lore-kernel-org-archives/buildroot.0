From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:11:20 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libraw: add
 Libs.private to libraw.pc
Message-ID: <20210610194753.99D848D207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53318b98ac14f91bda0d9ebd6720fa34fcf1a35b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add Libs.private to libraw.pc to fix the following static build failure
with imagemagick which is raised since commit
2f47cfade4b298350d056f6d9a7525b837e2ba23:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o): in function `jpg_encode':
jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'

Fixes:
 - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cb3b89e4cdabb2046b2cb1b2cacdf3feac98b777)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Add-Libs.private-to-libraw.pc.patch       | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch b/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
new file mode 100644
index 0000000000..a90af23178
--- /dev/null
+++ b/package/libraw/0001-Add-Libs.private-to-libraw.pc.patch
@@ -0,0 +1,67 @@
+From ad911cbc3c16397cf9d326c30571a4d1edaaa03f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 2 Jun 2021 07:45:40 +0200
+Subject: [PATCH] Add Libs.private to libraw.pc
+
+Add Libs.private to libraw.pc to avoid the following static build
+failure when enabling libraw with jasper support in imagemagick:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libjasper.a(jpg_enc.c.o): in function `jpg_encode':
+jpg_enc.c:(.text+0x1f4): undefined reference to `jpeg_stdio_dest'
+
+-ljpeg must be added after -ljasper because jasper depends on jpeg
+
+Fixes:
+ - http://autobuild.buildroot.org/results/88e43a1ea2059a684e50b0f5f2af407e8c6df2e1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibRaw/LibRaw/pull/406]
+---
+ configure.ac   | 2 ++
+ libraw.pc.in   | 1 +
+ libraw_r.pc.in | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 4ab2f313..7bf5fdfd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,7 @@ if test x$jpeg = xtrue; then
+                         AC_CHECK_HEADERS([jpeglib.h], [
+                                 CPPFLAGS="$CPPFLAGS -DUSE_JPEG -DUSE_JPEG8"
+                                 LIBS="$LIBS -ljpeg"
++                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljpeg $PACKAGE_LIBS_PRIVATE")
+                         ], AC_MSG_WARN([no jpeg headers found]))
+                 ],
+                 AC_MSG_WARN([libjpeg not found])
+@@ -78,6 +79,7 @@ if test x$jasper = xtrue; then
+                         AC_CHECK_HEADERS([jasper/jasper.h], [
+                                 CPPFLAGS="$CPPFLAGS -DUSE_JASPER"
+                                 LIBS="$LIBS -ljasper"
++                                AC_SUBST([PACKAGE_LIBS_PRIVATE],"-ljasper $PACKAGE_LIBS_PRIVATE")
+                         ], AC_MSG_WARN([no jasper headers found]))
+                 ],
+                 AC_MSG_WARN([libjasper not found])
+diff --git a/libraw.pc.in b/libraw.pc.in
+index 1bab18b8..c95fbc48 100644
+--- a/libraw.pc.in
++++ b/libraw.pc.in
+@@ -8,4 +8,5 @@ Description: Raw image decoder library (non-thread-safe)
+ Requires: @PACKAGE_REQUIRES@
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lraw -lstdc++ at PC_OPENMP@
++Libs.private: @PACKAGE_LIBS_PRIVATE@
+ Cflags: -I${includedir}/libraw -I${includedir}
+diff --git a/libraw_r.pc.in b/libraw_r.pc.in
+index e8427271..92bbbffa 100644
+--- a/libraw_r.pc.in
++++ b/libraw_r.pc.in
+@@ -8,4 +8,5 @@ Description: Raw image decoder library (thread-safe)
+ Requires: @PACKAGE_REQUIRES@
+ Version: @PACKAGE_VERSION@
+ Libs: -L${libdir} -lraw_r -lstdc++ at PC_OPENMP@
++Libs.private: @PACKAGE_LIBS_PRIVATE@
+ Cflags: -I${includedir}/libraw -I${includedir}
+-- 
+2.30.2
+
