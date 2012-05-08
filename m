From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  8 May 2012 13:19:17 +0200
Subject: [Buildroot] [PATCH 2/3] gettext: Rename BR2_PACKAGE_LIBINTL to
	BR2_PACKAGE_GETTEXT_NEEDS_BINARIES
In-Reply-To: <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1336475958-5714-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libintl target does nothing but removing some binaries installed by
gettext.

This patch renames the BR2_PACKAGE_LIBINTL symbol to
BR2_PACKAGE_GETTEXT_NEEDS_BINARIES and fixes the logic for packages
that may need those gettext binaries.

It also adds a warning about libintl support depending on locale enabling
in the toolchain.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gettext/Config.in  |   16 ++++++++--------
 package/gettext/gettext.mk |    2 +-
 package/libidn/Config.in   |    1 +
 package/php/Config.ext     |    1 +
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0ee4065..461652f 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -12,12 +12,12 @@ config BR2_PACKAGE_GETTEXT
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
 
-config BR2_PACKAGE_LIBINTL
-	bool "libintl"
-	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
-	help
-	  Selecting this package installs all of gettext in the staging
-	  directory and the shared library for it's use in the target.
+comment "libintl requires a toolchain with locale/i18n support"
+	depends on BR2_PACKAGE_GETTEXT && !BR2_ENABLE_LOCALE
 
-	  http://www.gnu.org/software/gettext/
+config BR2_PACKAGE_GETTEXT_NEEDS_BINARIES
+	bool
+	depends on BR2_PACKAGE_GETTEXT
+	help
+	  Force to install gettext binaries (gettext, gettext.sh and gettextize)
+	  in the target.
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 7c7b26c..0902edd 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -17,7 +17,7 @@ define GETTEXT_REMOVE_BINARIES
 	rm -f $(TARGET_DIR)/usr/bin/gettextize
 endef
 
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
+ifneq ($(BR2_PACKAGE_GETTEXT_NEEDS_BINARIES),y)
 	GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
 endif
 
diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index dcf9724..3e98245 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_GETTEXT_NEEDS_BINARIES if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Libidn's purpose is to encode and decode internationalized
 	  domain names.
diff --git a/package/php/Config.ext b/package/php/Config.ext
index bd630ee..2ea686c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -68,6 +68,7 @@ config BR2_PACKAGE_PHP_EXT_FTP
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT_NEEDS_BINARIES if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
 	  gettext support
-- 
1.7.10.1
