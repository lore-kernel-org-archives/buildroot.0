From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 12:37:55 +0200
Subject: [Buildroot] [git commit] cairo: bump to version 1.15.12
Message-ID: <20180602103746.9F4F982B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16d29ab852a9507d5aa87cc04c8ea25bafa03d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove second patch (LTO support removed since 1.14.0 in August 2014:
  https://cgit.freedesktop.org/cairo/commit/?id=c7ff9bb32e20679d6da4e8a2856be716e5bd9e12
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/0002-fix-gcc-49-build.patch | 38 -------------------------------
 package/cairo/cairo.hash                  | 11 ++++++---
 package/cairo/cairo.mk                    |  5 ++--
 3 files changed, 10 insertions(+), 44 deletions(-)

diff --git a/package/cairo/0002-fix-gcc-49-build.patch b/package/cairo/0002-fix-gcc-49-build.patch
deleted file mode 100644
index 112c9ea053..0000000000
--- a/package/cairo/0002-fix-gcc-49-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Fix build with gcc 4.9
-
-cairo fails to build with gcc 4.9 due to a bad interaction of cairo
-modules with the LTO mechanism. The suggested workaround is to pass
--ffat-lto-objects. See
-https://bugs.freedesktop.org/show_bug.cgi?id=77060 for the upstream
-bug report, and
-https://bugs.archlinux.org/task/40313?project=1&openedfrom=-1+week for
-the ArchLinux bug report.
-
-This patch passes -ffat-lto-objects when gcc understands this option,
-in order to provide compatibility with gcc versions older than 4.8,
-which did not provide this option, but are anyway unaffected by the
-issue.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -37,6 +37,16 @@
- m4_include(build/configure.ac.pthread)  dnl checks for pthreads
- AC_CACHE_SAVE
- 
-+old_cflags=$CFLAGS
-+CFLAGS=-ffat-lto-objects
-+AC_MSG_CHECKING([whether CC supports -ffat-lto-objects])
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
-+    [AC_MSG_RESULT([yes])]
-+    [LTO_CFLAGS=-ffat-lto-objects],
-+    [AC_MSG_RESULT([no])]
-+)
-+CFLAGS="${old_CFLAGS} ${LTO_CFLAGS}"
-+
- dnl ===========================================================================
- 
- AC_CHECK_LIB(z, compress,
diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index f3aa01f2cd..795a2eeea5 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,4 +1,9 @@
-# From http://cairographics.org/releases/cairo-1.14.10.tar.xz.sha1
-sha1	28c59d85d6b790c21b8b59ece73a6a1dda28d69a	cairo-1.14.10.tar.xz
+# From https://www.cairographics.org/snapshots/cairo-1.15.12.tar.xz.sha1
+sha1	4e64c6a48789edb4c60bc3fa95bd3992cc388b88	cairo-1.15.12.tar.xz
 # Calculated based on the hash above
-sha256	7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09	cairo-1.14.10.tar.xz
+sha256	7623081b94548a47ee6839a7312af34e9322997806948b6eec421a8c6d0594c9	cairo-1.15.12.tar.xz
+
+# Hash for license files:
+sha256	67228a9f7c5f9b67c58f556f1be178f62da4d9e2e6285318d8c74d567255abdf	COPYING
+sha256	9e9e8608c4cdda51a78cc3a385f4ec9a2e4c96d5ecad74ac8bca5fca3e563b7d	COPYING-LGPL-2.1
+sha256	53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f	COPYING-MPL-1.1
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 9749056776..6dffff4b81 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.14.10
+CAIRO_VERSION = 1.15.12
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-CAIRO_SITE = http://cairographics.org/releases
+CAIRO_SITE = http://cairographics.org/snapshots
 CAIRO_INSTALL_STAGING = YES
-CAIRO_AUTORECONF = YES
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
