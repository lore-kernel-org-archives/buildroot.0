From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jun 2018 16:28:53 +0200
Subject: [Buildroot] [git commit] libxslt: security bump to version 1.3.2
Message-ID: <20180608143153.C7A51870F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eca8704dcf4d026f7aea6f1819772d0c19517346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2017-5029
- Remove first patch (already in version)
- Add a dependency to host-pkgconf and remove libxml2 options: see
  https://github.com/GNOME/libxslt/commit/abf537ebb2296cd3ae89989a17b0e1b5c79db107
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ap-overread-in-xsltFormatNumberConversion.patch | 35 ----------------------
 package/libxslt/libxslt.hash                       |  5 +++-
 package/libxslt/libxslt.mk                         | 10 +++----
 3 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch b/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch
deleted file mode 100644
index 1ad494a6c0..0000000000
--- a/package/libxslt/0001-Fix-heap-overread-in-xsltFormatNumberConversion.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eb1030de31165b68487f288308f9d1810fed6880 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 10 Jun 2016 14:23:58 +0200
-Subject: [PATCH] Fix heap overread in xsltFormatNumberConversion
-
-An empty decimal-separator could cause a heap overread. This can be
-exploited to leak a couple of bytes after the buffer that holds the
-pattern string.
-
-Found with afl-fuzz and ASan.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit eb1030de311
-
- libxslt/numbers.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libxslt/numbers.c b/libxslt/numbers.c
-index d1549b46ca26..e78c46b6357b 100644
---- a/libxslt/numbers.c
-+++ b/libxslt/numbers.c
-@@ -1090,7 +1090,8 @@ xsltFormatNumberConversion(xsltDecimalFormatPtr self,
-     }
- 
-     /* We have finished the integer part, now work on fraction */
--    if (xsltUTF8Charcmp(the_format, self->decimalPoint) == 0) {
-+    if ( (*the_format != 0) &&
-+         (xsltUTF8Charcmp(the_format, self->decimalPoint) == 0) ) {
-         format_info.add_decimal = TRUE;
- 	the_format += xsltUTF8Size(the_format);	/* Skip over the decimal */
-     }
--- 
-2.10.2
-
diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 8222bc590d..f28150b71e 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	b5976e3857837e7617b29f2249ebb5eeac34e249208d31f1fbf7a6ba7a4090ce	libxslt-1.1.29.tar.gz
+sha256	526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460	libxslt-1.1.32.tar.gz
+
+# Hash for license file:
+sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 868ba6a10f..972d5b80d5 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.29
+LIBXSLT_VERSION = 1.1.32
 LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
@@ -13,11 +13,9 @@ LIBXSLT_LICENSE_FILES = COPYING
 LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-debug \
-	--without-python \
-	--with-libxml-prefix=$(STAGING_DIR)/usr/ \
-	--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib
+	--without-python
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
-LIBXSLT_DEPENDENCIES = libxml2
+LIBXSLT_DEPENDENCIES = host-pkgconf libxml2
 
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
@@ -29,7 +27,7 @@ endif
 
 HOST_LIBXSLT_CONF_OPTS = --without-debug --without-python --without-crypto
 
-HOST_LIBXSLT_DEPENDENCIES = host-libxml2
+HOST_LIBXSLT_DEPENDENCIES = host-pkgconf host-libxml2
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
