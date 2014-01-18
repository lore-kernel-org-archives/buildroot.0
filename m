From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 13:54:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] libenca: Add iconv support
Message-ID: <BLU0-SMTP1113C483EF40E9065296CF2D9BB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch depends on http://patchwork.ozlabs.org/patch/311506/
---
Changes v1 -> v2: Add patch to fix AM_ICONV macro usage

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/libenca/Config.in               |    1 +
 package/libenca/libenca-003-iconv.patch |   15 +++++++++++++++
 package/libenca/libenca.mk              |    5 +----
 3 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 package/libenca/libenca-003-iconv.patch

diff --git a/package/libenca/Config.in b/package/libenca/Config.in
index 5e951ed..58217dc 100644
--- a/package/libenca/Config.in
+++ b/package/libenca/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_LIBENCA
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	bool "libenca"
 	help
 	  Extremely Naive Charset Analyser
diff --git a/package/libenca/libenca-003-iconv.patch b/package/libenca/libenca-003-iconv.patch
new file mode 100644
index 0000000..12d57b0
--- /dev/null
+++ b/package/libenca/libenca-003-iconv.patch
@@ -0,0 +1,15 @@
+libiconv.m4: Fix AM_ICONV macro usage
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+--- a/m4/libiconv.m4	2013-09-30 09:48:22.000000000 +0200
++++ b/m4/libiconv.m4	2014-01-18 12:56:32.634514555 +0100
+@@ -17,7 +17,7 @@
+ dnl
+ 
+ dnl Use standard iconv test
+-AM_ICONV
++m4_pattern_allow([AM_ICONV])
+ CONVERTER_LIBS="$CONVERTER_LIBS $LIBICONV"
+ 
+ dnl Compile iconvcap.c and run it to determine what encodings iconv actually
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index e69c124..1c5c162 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -10,6 +10,7 @@ LIBENCA_INSTALL_STAGING = YES
 LIBENCA_AUTORECONF = YES
 LIBENCA_LICENSE = GPLv2
 LIBENCA_LICENSE_FILES = COPYING
+LIBENCA_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
 			ac_cv_file__dev_urandom=yes \
@@ -30,7 +31,3 @@ endef
 LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
 
 $(eval $(autotools-package))
-
-XERCES_CONF_OPT = --disable-threads \
-		  --with-gnu-ld
-
-- 
1.7.9.5
