From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 13:58:14 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/fontconfig: add pthread as a
 dependency of a static lib
Message-ID: <20200920115816.1567616-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d2d/d2d73f3c7075ca6e9782b9bb591dae40ab56b6a2/

ffmpeg configure prints: "ERROR: fontconfig not found using pkg-config"

Please note that the ffmpeg build error was reproducible but with a
different error message in ffbuild/config.log:

  sysroot/usr/lib/libfontconfig.a(fccache.o): in function `lock_cache':
  fccache.c:(.text+0xcd8): undefined reference to `pthread_mutex_init'

  arm-buildroot-linux-gnueabi/bin/ld: fccache.c:(.text+0xcf8):
  undefined reference to `pthread_mutex_destroy'

  arm-buildroot-linux-gnueabi/bin/ld: fccache.c:(.text+0xd00):
  undefined reference to `pthread_mutex_lock'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: removed " 1/1" from patch subject

 ...read-as-a-dependency-of-a-static-lib.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch

diff --git a/package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch b/package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch
new file mode 100644
index 0000000000..eed9dba005
--- /dev/null
+++ b/package/fontconfig/0002-add-pthread-as-a-dependency-of-a-static-lib.patch
@@ -0,0 +1,44 @@
+From 40ec04a8bf36dd8d0aa3da98b167792ce2dcd114 Mon Sep 17 00:00:00 2001
+From: Silvan Scherrer <silvan.scherrer@aroa.ch>
+Date: Sun, 20 Sep 2020 12:52:08 +0200
+Subject: [PATCH] add pthread as a dependency of a static lib
+
+Downloaded from https://trac.netlabs.org/ports/changeset/2220
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/fontconfig/fontconfig/-/merge_requests/121
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac     | 2 ++
+ fontconfig.pc.in | 4 ++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f3189a7..594d6fd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -690,6 +690,8 @@ fi
+ have_pthread=false
+ if test "$os_win32" = no; then
+ 	AX_PTHREAD([have_pthread=true])
++	AC_SUBST(PTHREAD_CFLAGS)
++	AC_SUBST(PTHREAD_LIBS)
+ fi
+ if $have_pthread; then
+ 	LIBS="$PTHREAD_LIBS $LIBS"
+diff --git a/fontconfig.pc.in b/fontconfig.pc.in
+index 61b35fb..f823bac 100644
+--- a/fontconfig.pc.in
++++ b/fontconfig.pc.in
+@@ -14,5 +14,5 @@ Version: @VERSION@
+ Requires: @PKGCONFIG_REQUIRES@
+ Requires.private: @PKGCONFIG_REQUIRES_PRIVATELY@
+ Libs: -L${libdir} -lfontconfig
+-Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@
+-Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@
++Libs.private: @ICONV_LIBS@ @PKG_EXPAT_LIBS@ @PTHREAD_LIBS@
++Cflags: -I${includedir} @ICONV_CFLAGS@ @PKG_EXPAT_CFLAGS@ @PTHREAD_CFLAGS@
+-- 
+2.27.0
+
-- 
2.27.0
