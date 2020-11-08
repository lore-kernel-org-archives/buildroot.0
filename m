From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun,  8 Nov 2020 17:29:22 +0100
Subject: [Buildroot] [PATCH 2/2] package/cups-filters: bump to version 1.28.4
In-Reply-To: <20201108162922.1132151-1-angelo@amarulasolutions.com>
References: <20201108162922.1132151-1-angelo@amarulasolutions.com>
Message-ID: <20201108162922.1132151-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

While bumping, removing upstreamed patches.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 ...fix-cross-compilation-without-dejavu.patch | 41 -------------------
 package/cups-filters/cups-filters.hash        |  2 +-
 package/cups-filters/cups-filters.mk          |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch

diff --git a/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch b/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch
deleted file mode 100644
index 650b90a89b..0000000000
--- a/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6ad1ed8b7939bf75079b0a770e234bfee7d33dbb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 13 Jul 2020 23:02:50 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation without dejavu
-
-Cross-compilation is broken since commit 1d66106. Indeed, when
-cross-compiling, dejavu font won't be installed in /usr/share/fonts. The
-path (e.g. $(TARGET_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf) could be
-provided through --with-test-font-path which will fix the build failure
-but will result in broken test programs.
-
-So when cross-compiling don't try to check if the test-font-path is
-valid or not and just use the one provided by the user or the default
-one (e.g. /usr/share/fonts/dejavu/DejaVuSans.ttf)
-
-Fix #262
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/OpenPrinting/cups-filters/commit/6ad1ed8b7939bf75079b0a770e234bfee7d33dbb]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index aa905cf5d..4cc4fd6e5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -796,10 +796,10 @@ AC_ARG_WITH([test-font-path],
- 	[with_test_font_path=`find /usr/share/fonts -name DejaVuSans.ttf || echo /usr/share/fonts/dejavu/DejaVuSans.ttf`]
- )
- 
--AS_IF([test -f "$with_test_font_path"],
--	[AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])],
-+AS_IF([test "x$cross_compiling" != "xyes" && ! test -f "$with_test_font_path"],
- 	[AC_MSG_ERROR(DejaVuSans.ttf font file is missing. Please install a package providing it.)]
- )
-+AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])
- 
- # ================
- # Check for cflags
diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 61cb42a438..e36a00ab46 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 08e4081ce50ce2e620af6e950bdcf64cea2ab4c81ab3c5ea05da25d82ad62db6  cups-filters-1.27.5.tar.gz
+sha256 cf90b96b5c7a906a05070e757ee5566d9680db98a279e60567ea5421c38f11de  cups-filters-1.28.4.tar.gz
 sha256 527463af65312372111804589a9624f4c52813e253062ae351e75af5003f317f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 237d8afe62..cf5eefa67f 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.27.5
+CUPS_FILTERS_VERSION = 1.28.4
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.25.1
