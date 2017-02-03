From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  3 Feb 2017 22:35:34 +0100
Subject: [Buildroot] [PATCH 1/1] libuio: remove gettext dependency
Message-ID: <20170203213534.16429-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The gettext dependency of libuio is only needed for internationalization of
messages in the lsuio program. Since the real purpose for libuio is the
library, the impact of gettext on build time is considered too large for the
benefit for those users that want to use lsuio.

Patch libuio to disable internationalization.
Previous statements related to gettext, makeinfo, ... are now no longer
needed.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 .../0001-configure-remove-po-Makefile.in.patch     | 26 -----------
 .../libuio/0001-remove-gettext-dependency.patch    | 51 ++++++++++++++++++++++
 package/libuio/Config.in                           |  1 -
 package/libuio/libuio.mk                           | 17 +++-----
 4 files changed, 58 insertions(+), 37 deletions(-)
 delete mode 100644 package/libuio/0001-configure-remove-po-Makefile.in.patch
 create mode 100644 package/libuio/0001-remove-gettext-dependency.patch

diff --git a/package/libuio/0001-configure-remove-po-Makefile.in.patch b/package/libuio/0001-configure-remove-po-Makefile.in.patch
deleted file mode 100644
index 067465c..0000000
--- a/package/libuio/0001-configure-remove-po-Makefile.in.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c5fa0b778e1c2a7d03ff6e661bdfa2faef878f68 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 1 Jul 2016 17:56:30 +0200
-Subject: [PATCH] configure: remove po/Makefile.in
-
-The file po/Makefile.in is automatically added to AC_OUTPUT while using gettexize
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- configure.ac | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f7fb40f..a25e463 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,5 +55,4 @@ dnl last but not least
- AC_OUTPUT([Makefile
- 	libuio.dox
- 	libuio-uninstalled.pc
--	libuio.pc
--	po/Makefile.in])
-+	libuio.pc])
--- 
-2.5.5
-
diff --git a/package/libuio/0001-remove-gettext-dependency.patch b/package/libuio/0001-remove-gettext-dependency.patch
new file mode 100644
index 0000000..058ceeb
--- /dev/null
+++ b/package/libuio/0001-remove-gettext-dependency.patch
@@ -0,0 +1,51 @@
+From d61bf3fa991d0d5c75f27668dc8b379643c7dbb0 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Tue, 29 Nov 2016 11:26:54 +0100
+Subject: [PATCH] Disable i18n to remove gettext dependency
+
+gettext is only used in lsuio, a small application to list UIO devices.
+The actual library libuio does not need internationalization.
+
+As gettext is quite a heavy dependency, disable internationalization
+completely.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ Makefile.am  | 2 --
+ configure.ac | 6 +-----
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 50d2fd2..667fd91 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,3 @@
+-SUBDIRS = po
+-
+ pkgconfigdir = $(datadir)/pkgconfig
+ pkgconfig_DATA = libuio.pc
+ 
+diff --git a/configure.ac b/configure.ac
+index f7fb40f..b01b2b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -38,10 +38,6 @@ AS_IF([test "x$with_glib" != "xno"], [
+    AC_DEFINE([USE_GLIB], [1], [use glib-2.0])
+ ])
+ 
+-dnl i18n makros.
+-AM_GNU_GETTEXT([external])
+-AM_GNU_GETTEXT_VERSION([0.17])
+-
+ dnl with or without -Werror
+ AC_ARG_WITH([werror],
+             [AS_HELP_STRING([--without-werror],
+@@ -56,4 +52,4 @@ AC_OUTPUT([Makefile
+ 	libuio.dox
+ 	libuio-uninstalled.pc
+ 	libuio.pc
+-	po/Makefile.in])
++	])
+-- 
+2.7.3
+
diff --git a/package/libuio/Config.in b/package/libuio/Config.in
index a96df54..97be1e3 100644
--- a/package/libuio/Config.in
+++ b/package/libuio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBUIO
 	bool "libuio"
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libuio is a light-weight C programming library to handle UIO
 	  (Userspace I/O) device discovery and binding task.
diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index 6d07f1f..aaea256 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -11,26 +11,23 @@ LIBUIO_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
 LIBUIO_LICENSE_FILES = COPYING
 LIBUIO_CONF_OPTS = --with-glib=no --without-werror
 LIBUIO_INSTALL_STAGING = YES
+LIBUIO_DEPENDENCIES = host-pkgconf
 
 # Fetched from github, no pre-generated configure script provided
-LIBUIO_GETTEXTIZE = YES
 LIBUIO_AUTORECONF = YES
 
-# Avoid build issue when makeinfo is missing
-LIBUIO_CONF_ENV += MAKEINFO=true
+# Requirements for autoreconf, see autogen.sh
+define LIBUIO_PREPARE_AUTORECONF
+       mkdir -p $(@D)/m4
+       touch $(@D)/ChangeLog
+endef
+LIBUIO_POST_EXTRACT_HOOKS += LIBUIO_PREPARE_AUTORECONF
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBUIO_DEPENDENCIES += argp-standalone
 LIBUIO_LIBS += -largp
 endif
 
-# libuio pulls in libintl if needed, so ensure we also
-# link against it, otherwise static linking fails
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-LIBUIO_DEPENDENCIES += gettext
-LIBUIO_LIBS += -lintl
-endif
-
 LIBUIO_CONF_ENV += LIBS="$(LIBUIO_LIBS)"
 
 $(eval $(autotools-package))
-- 
2.10.2
