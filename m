From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 07:59:52 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/ghostscript: bump
 to version 9.53.2
Message-ID: <20201003061919.D897D7FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05bd0ab4c1ebb814891981589b5a7b20458dc9db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

- Drop first patch (already in version)
- Drop second patch (not needed since
  https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=f0d19bf181a156d011dba422ae4d165b36b0af7e)
- Drop autoreconf

https://www.ghostscript.com/doc/9.53.2/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 56b6908bf68069e1ff42e86145d3658bc8a64d56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-cross-compilation-issue.patch         | 36 --------------------
 .../0002-configure.ac-fix-cross-compilation.patch  | 39 ----------------------
 package/ghostscript/ghostscript.hash               |  4 +--
 package/ghostscript/ghostscript.mk                 |  4 +--
 4 files changed, 3 insertions(+), 80 deletions(-)

diff --git a/package/ghostscript/0001-Fix-cross-compilation-issue.patch b/package/ghostscript/0001-Fix-cross-compilation-issue.patch
deleted file mode 100644
index a13c7f8381..0000000000
--- a/package/ghostscript/0001-Fix-cross-compilation-issue.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5fed765abb8ff07c381cc3ebb9367e9560f7a658 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 20 Mar 2017 23:43:03 +0100
-Subject: [PATCH] Fix cross compilation issue
-
-Without this patch unsafe paths are used:
-x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '/libtiff'
-
-Downloaded from
-http://bugs.ghostscript.com/show_bug.cgi?id=696508#c3
-
-Slightly updated to work with 9.23
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d0f62d7..0d49344 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1173,7 +1173,7 @@ XPSWRITEDEVICE=''
- 
- 
- LIBTIFFDIR='src'
--LIBTIFFCONFDIR=''
-+LIBTIFFCONFDIR='src'
- TIFFCFLAGS=''
- 
- TIFFDEVS_ALL='tiffs tiff12nc tiff24nc tiff48nc tiff32nc tiff64nc tiffcrle tifflzw tiffpack tiffgray tiffsep tiffsep1 tiffscaled tiffscaled4 tiffscaled8 tiffscaled24 tiffscaled32'
- FAX_DEVS_ALL='cfax dfaxlow dfaxhigh fax faxg3 faxg32d faxg4 tiffg3 tiffg32d tiffg4 tfax'
--- 
-2.7.4
-
diff --git a/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch b/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch
deleted file mode 100644
index 2bbff431ec..0000000000
--- a/package/ghostscript/0002-configure.ac-fix-cross-compilation.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 579f2e089b9502e48222ab85d342128857bf20c3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 12 Sep 2020 11:38:01 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation
-
-Cross-compilation fails since version 9.53.0 and
-https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=3ff82b33f24ed54c2d3bb88ec31da7d2f9fd2765
-
-Indeed, when x"$host" != x"$build", a recursive call to configure script
-(for auxiliary tools) is being made. In this call,
---enable-auxtools_only and --without-libtiff are passed which will
-result in the following build failure because SHARE_LIBTIFF is not set
-and SHARE_LIBJPEG is set to 0:
-
-checking for local lcms2mt library source... configure: error: Mixing local libtiff with shared libjpeg not supported
-configure: error: Recursive call to configure script failed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=702897]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4f56fdea..6ae3c2cc1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1618,7 +1618,7 @@ case "x$with_system_libtiff" in
- esac
- 
- 
--if test x"$SHARE_LIBTIFF" != x"$SHARE_LIBJPEG" ; then
-+if test x"$SHARE_LIBTIFF" != x"" && test x"$SHARE_LIBTIFF" != x"$SHARE_LIBJPEG" ; then
-     AC_MSG_ERROR([Mixing local libtiff with shared libjpeg not supported])
- fi
- 
--- 
-2.28.0
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 102e5355a5..143b28014d 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530/SHA512SUMS
-sha512  fe73842339bee7aa6d0f177be7733b97b9394dafe69b122645c9c80de763214ffb6735b961ff5bf97146b29c2d0e9b4b9cfaee60baf77a1c280bcf651d789982  ghostscript-9.53.0.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9532/SHA512SUMS
+sha512  73aa6013aeecbd1345317a40349089a2f19a2205fc11b8ca0b619df1e91f2ca8b03efc09be9e079cb5ab8e1b838aa2236349cd1c177217c14308242f99138ae4  ghostscript-9.53.2.tar.gz
 
 # Hash for license file:
 sha256  6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index e8ebc366e4..e8d35a50bc 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.53.0
+GHOSTSCRIPT_VERSION = 9.53.2
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
-# 0001-Fix-cross-compilation-issue.patch
-GHOSTSCRIPT_AUTORECONF = YES
 GHOSTSCRIPT_DEPENDENCIES = \
 	host-lcms2 \
 	host-libjpeg \
