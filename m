From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Sep 2020 18:59:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 9.53.0
Message-ID: <20200912165907.325097-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use tar.gz as SHA512SUMS does not contain the hash for tar.xz
- Fix CVE-2020-15900: A memory corruption issue was found in Artifex
  Ghostscript 9.50 and 9.52. Use of a non-standard PostScript operator
  can allow overriding of file access controls. The 'rsearch'
  calculation for the 'post' size resulted in a size that was too large,
  and could underflow to max uint32_t.

https://www.ghostscript.com/doc/9.53.0/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...2-configure.ac-fix-cross-compilation.patch | 39 +++++++++++++++++++
 package/ghostscript/ghostscript.hash          |  4 +-
 package/ghostscript/ghostscript.mk            |  3 +-
 3 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 package/ghostscript/0002-configure.ac-fix-cross-compilation.patch

diff --git a/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch b/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch
new file mode 100644
index 0000000000..2bbff431ec
--- /dev/null
+++ b/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch
@@ -0,0 +1,39 @@
+From 579f2e089b9502e48222ab85d342128857bf20c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 12 Sep 2020 11:38:01 +0200
+Subject: [PATCH] configure.ac: fix cross-compilation
+
+Cross-compilation fails since version 9.53.0 and
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=3ff82b33f24ed54c2d3bb88ec31da7d2f9fd2765
+
+Indeed, when x"$host" != x"$build", a recursive call to configure script
+(for auxiliary tools) is being made. In this call,
+--enable-auxtools_only and --without-libtiff are passed which will
+result in the following build failure because SHARE_LIBTIFF is not set
+and SHARE_LIBJPEG is set to 0:
+
+checking for local lcms2mt library source... configure: error: Mixing local libtiff with shared libjpeg not supported
+configure: error: Recursive call to configure script failed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=702897]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4f56fdea..6ae3c2cc1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1618,7 +1618,7 @@ case "x$with_system_libtiff" in
+ esac
+ 
+ 
+-if test x"$SHARE_LIBTIFF" != x"$SHARE_LIBJPEG" ; then
++if test x"$SHARE_LIBTIFF" != x"" && test x"$SHARE_LIBTIFF" != x"$SHARE_LIBJPEG" ; then
+     AC_MSG_ERROR([Mixing local libtiff with shared libjpeg not supported])
+ fi
+ 
+-- 
+2.28.0
+
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index d0b2e610df..102e5355a5 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs952/SHA512SUMS
-sha512  4c4a33884e1138bad553eee61fac1a72158297ad5c2ce46a4b36150848dea8158affaf2b902f4ff03e4f72ebc8154c198b618112624f409230a610b7648faa67  ghostscript-9.52.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530/SHA512SUMS
+sha512  fe73842339bee7aa6d0f177be7733b97b9394dafe69b122645c9c80de763214ffb6735b961ff5bf97146b29c2d0e9b4b9cfaee60baf77a1c280bcf651d789982  ghostscript-9.53.0.tar.gz
 
 # Hash for license file:
 sha256  6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 9a74563a8c..e8ebc366e4 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.52
+GHOSTSCRIPT_VERSION = 9.53.0
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
-GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
 # 0001-Fix-cross-compilation-issue.patch
-- 
2.28.0
