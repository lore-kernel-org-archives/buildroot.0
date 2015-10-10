From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 12:03:08 +0200
Subject: [Buildroot] [PATCH v3 03/37] package/libelementary: move to package
	directory
In-Reply-To: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1444471422-15118-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add efl reverse dependencies.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/Config.in                          |  1 +
 package/efl/Config.in                      |  1 -
 package/efl/libelementary/Config.in        | 17 ----------------
 package/efl/libelementary/libelementary.mk | 32 ------------------------------
 package/libelementary/Config.in            | 19 ++++++++++++++++++
 package/libelementary/libelementary.mk     | 32 ++++++++++++++++++++++++++++++
 6 files changed, 52 insertions(+), 50 deletions(-)
 delete mode 100644 package/efl/libelementary/Config.in
 delete mode 100644 package/efl/libelementary/libelementary.mk
 create mode 100644 package/libelementary/Config.in
 create mode 100644 package/libelementary/libelementary.mk

diff --git a/package/Config.in b/package/Config.in
index fbe3d62..49ce01a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -240,6 +240,7 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/libelementary/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/efl/Config.in b/package/efl/Config.in
index cb91660..cf82f8b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -20,7 +20,6 @@ source "package/efl/libevas-generic-loaders/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
 source "package/efl/libethumb/Config.in"
-source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
deleted file mode 100644
index 4f62592..0000000
--- a/package/efl/libelementary/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-comment "libelementary needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LIBELEMENTARY
-	bool "libelementary"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	depends on !BR2_STATIC_LIBS
-	help
-	  Elementary is a widget toolkit and EFL wrapper and convenience
-	  library to make it easy to build applications and tools with UIs
-	  with less code.
-
-	  http://trac.enlightenment.org/e/wiki/Elementary
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
deleted file mode 100644
index 8bd69fe..0000000
--- a/package/efl/libelementary/libelementary.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# libelementary
-#
-################################################################################
-
-LIBELEMENTARY_VERSION = 1.7.10
-LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
-LIBELEMENTARY_LICENSE = LGPLv2.1
-LIBELEMENTARY_LICENSE_FILES = COPYING
-
-LIBELEMENTARY_INSTALL_STAGING = YES
-
-LIBELEMENTARY_DEPENDENCIES = \
-	libeina libevas libecore libedje host-libedje \
-	host-libeet
-
-LIBELEMENTARY_CONF_OPTS = \
-	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
-	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
-
-# libethumb_client is only built when ethumbd is built.
-# ethumbd is only built if edbus is built.
-ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
-LIBELEMENTARY_DEPENDENCIES += libethumb
-LIBELEMENTARY_CONF_OPTS += --enable-ethumb
-else
-LIBELEMENTARY_CONF_OPTS += --disable-ethumb
-endif
-
-$(eval $(autotools-package))
diff --git a/package/libelementary/Config.in b/package/libelementary/Config.in
new file mode 100644
index 0000000..320d160
--- /dev/null
+++ b/package/libelementary/Config.in
@@ -0,0 +1,19 @@
+comment "libelementary needs a toolchain w/ threads, dynamic library, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_LIBELEMENTARY
+	bool "libelementary"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEVAS
+	select BR2_PACKAGE_LIBECORE
+	select BR2_PACKAGE_LIBEDJE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	depends on BR2_USE_MMU # efl
+	depends on BR2_USE_WCHAR # efl
+	depends on !BR2_STATIC_LIBS
+	help
+	  Elementary is a widget toolkit and EFL wrapper and convenience
+	  library to make it easy to build applications and tools with UIs
+	  with less code.
+
+	  http://trac.enlightenment.org/e/wiki/Elementary
diff --git a/package/libelementary/libelementary.mk b/package/libelementary/libelementary.mk
new file mode 100644
index 0000000..8bd69fe
--- /dev/null
+++ b/package/libelementary/libelementary.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libelementary
+#
+################################################################################
+
+LIBELEMENTARY_VERSION = 1.7.10
+LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
+LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
+LIBELEMENTARY_LICENSE = LGPLv2.1
+LIBELEMENTARY_LICENSE_FILES = COPYING
+
+LIBELEMENTARY_INSTALL_STAGING = YES
+
+LIBELEMENTARY_DEPENDENCIES = \
+	libeina libevas libecore libedje host-libedje \
+	host-libeet
+
+LIBELEMENTARY_CONF_OPTS = \
+	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
+
+# libethumb_client is only built when ethumbd is built.
+# ethumbd is only built if edbus is built.
+ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
+LIBELEMENTARY_DEPENDENCIES += libethumb
+LIBELEMENTARY_CONF_OPTS += --enable-ethumb
+else
+LIBELEMENTARY_CONF_OPTS += --disable-ethumb
+endif
+
+$(eval $(autotools-package))
-- 
2.4.3
