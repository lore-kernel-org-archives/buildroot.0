From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Dec 2015 00:02:27 +0100
Subject: [Buildroot] [PATCH v8 24/33] package/efl/libedje: remove package
In-Reply-To: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449615756-19115-25-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libedje is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v6: Improve lecacy help text (Yann E.Morin)
v5: remove libedje directory
v4: update Config.in to use libefl
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy               |  7 +++++++
 package/efl/Config.in          |  1 -
 package/efl/libedje/Config.in  | 28 ----------------------------
 package/efl/libedje/libedje.mk | 28 ----------------------------
 4 files changed, 7 insertions(+), 57 deletions(-)
 delete mode 100644 package/efl/libedje/Config.in
 delete mode 100644 package/efl/libedje/libedje.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 92dc3ac..da7e690 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.15, libedje is now provided by the libefl package.
+
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index ff8ba83..417534c 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -23,7 +23,6 @@ source "package/efl/libefreet/Config.in"
 source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
-source "package/efl/libedje/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
deleted file mode 100644
index b163508..0000000
--- a/package/efl/libedje/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-comment "libedje needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_LIBEDJE
-	bool "libedje"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEMBRYO
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LUA
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	help
-	  A graphical layout and animation library for animated
-	  resizable, compressed and scalable themes.
-
-	  http://trac.enlightenment.org/e/wiki/Edje
-
-if BR2_PACKAGE_LIBEDJE
-
-config BR2_PACKAGE_LIBEDJE_CC
-	bool "build edje_cc"
-	help
-	  Build and install the Edje compiler for the target. Normally this
-	  is not required.
-
-endif
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
deleted file mode 100644
index 59189e4..0000000
--- a/package/efl/libedje/libedje.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# libedje
-#
-################################################################################
-
-LIBEDJE_VERSION = 1.7.10
-LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE = http://download.enlightenment.org/releases
-LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
-LIBEDJE_LICENSE_FILES = COPYING
-
-LIBEDJE_INSTALL_STAGING = YES
-
-LIBEDJE_DEPENDENCIES = \
-	host-pkgconf lua libeina libeet libecore libevas \
-	libembryo
-
-ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
-LIBEDJE_CONF_OPTS += --enable-edje-cc
-else
-LIBEDJE_CONF_OPTS += --disable-edje-cc
-endif
-
-HOST_LIBEDJE_CONF_OPTS = --enable-edje-cc
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
