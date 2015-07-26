From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:33 +0200
Subject: [Buildroot] [RFC 23/37] package/libelementary: bump to version
	1.14.2
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-24-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update url and add a hash file.

Since eet, eolian_gen and eldbus_codegen are installed in
HOST_DIR by host-efl package, help configure script to find
them.

Explicitly disable doxygen and elementary-test.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libelementary/Config.in          | 20 +++++++++-----------
 package/libelementary/libelementary.hash |  2 ++
 package/libelementary/libelementary.mk   | 25 +++++++++----------------
 3 files changed, 20 insertions(+), 27 deletions(-)
 create mode 100644 package/libelementary/libelementary.hash

diff --git a/package/libelementary/Config.in b/package/libelementary/Config.in
index 320d160..5d5cf9c 100644
--- a/package/libelementary/Config.in
+++ b/package/libelementary/Config.in
@@ -1,19 +1,17 @@
-comment "libelementary needs a toolchain w/ threads, dynamic library, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_USE_WCHAR
-
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
+	select BR2_PACKAGE_EFL
+	depends on BR2_INSTALL_LIBSTDCPP # efl
+	depends on BR2_PACKAGE_HAS_UDEV # efl -> libudev
+	depends on BR2_TOOLCHAIN_USES_GLIBC # efl
 	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	depends on !BR2_STATIC_LIBS
 	help
 	  Elementary is a widget toolkit and EFL wrapper and convenience
 	  library to make it easy to build applications and tools with UIs
 	  with less code.
 
-	  http://trac.enlightenment.org/e/wiki/Elementary
+	  https://enlightenment.org
+
+comment "libelementary needs udev /dev management and a (e)glibc toolchain w/ C++"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
diff --git a/package/libelementary/libelementary.hash b/package/libelementary/libelementary.hash
new file mode 100644
index 0000000..1003604
--- /dev/null
+++ b/package/libelementary/libelementary.hash
@@ -0,0 +1,2 @@
+# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.14.2.tar.xz.sha256
+sha256	cb1c9d1b5a69b6d0e8d4ca22b488006061d9b593b8593aad385474d7529561b2	elementary-1.14.2.tar.xz
diff --git a/package/libelementary/libelementary.mk b/package/libelementary/libelementary.mk
index 8bd69fe..0bec456 100644
--- a/package/libelementary/libelementary.mk
+++ b/package/libelementary/libelementary.mk
@@ -4,29 +4,22 @@
 #
 ################################################################################
 
-LIBELEMENTARY_VERSION = 1.7.10
-LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
-LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
+LIBELEMENTARY_VERSION = 1.14.2
+LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
+LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary/
 LIBELEMENTARY_LICENSE = LGPLv2.1
 LIBELEMENTARY_LICENSE_FILES = COPYING
 
 LIBELEMENTARY_INSTALL_STAGING = YES
 
-LIBELEMENTARY_DEPENDENCIES = \
-	libeina libevas libecore libedje host-libedje \
-	host-libeet
+LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-efl efl
 
 LIBELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
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
+	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
+	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-doxygen=no \
+	--disable-elementary-test
 
 $(eval $(autotools-package))
-- 
2.4.3
