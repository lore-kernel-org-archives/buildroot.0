From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:11:06 +0200
Subject: [Buildroot] [git commit] package/cups-filters: fix build without
 dejavu font
Message-ID: <20200714200720.20F13869C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43a56fa2cac905224147a57b1f552d149552f567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.27.3, cups-filters needs dejavu (even if it is only used
for test programs):
https://github.com/OpenPrinting/cups-filters/commit/1d66106e5ae45407b01459cb112ee09752166dba

Add a patch to avoid this build failure when cross-compiling and set
test font path to /dev/null to avoid setting TESTFONT to an incorrect
host path

Fixes:
 - http://autobuild.buildroot.org/results/0e141abc57e4185c74adce75cac4215dd8a3108b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e.ac-fix-cross-compilation-without-dejavu.patch | 41 ++++++++++++++++++++++
 package/cups-filters/cups-filters.mk               |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch b/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch
new file mode 100644
index 0000000000..650b90a89b
--- /dev/null
+++ b/package/cups-filters/0001-configure.ac-fix-cross-compilation-without-dejavu.patch
@@ -0,0 +1,41 @@
+From 6ad1ed8b7939bf75079b0a770e234bfee7d33dbb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 13 Jul 2020 23:02:50 +0200
+Subject: [PATCH] configure.ac: fix cross-compilation without dejavu
+
+Cross-compilation is broken since commit 1d66106. Indeed, when
+cross-compiling, dejavu font won't be installed in /usr/share/fonts. The
+path (e.g. $(TARGET_DIR)/usr/share/fonts/dejavu/DejaVuSans.ttf) could be
+provided through --with-test-font-path which will fix the build failure
+but will result in broken test programs.
+
+So when cross-compiling don't try to check if the test-font-path is
+valid or not and just use the one provided by the user or the default
+one (e.g. /usr/share/fonts/dejavu/DejaVuSans.ttf)
+
+Fix #262
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OpenPrinting/cups-filters/commit/6ad1ed8b7939bf75079b0a770e234bfee7d33dbb]
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa905cf5d..4cc4fd6e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -796,10 +796,10 @@ AC_ARG_WITH([test-font-path],
+ 	[with_test_font_path=`find /usr/share/fonts -name DejaVuSans.ttf || echo /usr/share/fonts/dejavu/DejaVuSans.ttf`]
+ )
+ 
+-AS_IF([test -f "$with_test_font_path"],
+-	[AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])],
++AS_IF([test "x$cross_compiling" != "xyes" && ! test -f "$with_test_font_path"],
+ 	[AC_MSG_ERROR(DejaVuSans.ttf font file is missing. Please install a package providing it.)]
+ )
++AC_DEFINE_UNQUOTED([TESTFONT], ["$with_test_font_path"], [Path to font used in tests])
+ 
+ # ================
+ # Check for cflags
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index dc4e89b52e..237d8afe62 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,6 +8,8 @@ CUPS_FILTERS_VERSION = 1.27.5
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
+# We're patching configure.ac
+CUPS_FILTERS_AUTORECONF = YES
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
@@ -20,6 +22,7 @@ CUPS_FILTERS_CONF_OPTS = \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
 	--with-jpeg \
+	--with-test-font-path=/dev/null \
 	--without-rcdir
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
