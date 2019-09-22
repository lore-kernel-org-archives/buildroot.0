From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:23 +0200
Subject: [Buildroot] [PATCH 07/30] package/ustr: remove package
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package was only used by libsemanage, but it is no longer used
since SELinux 2.7, so drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  8 ++++++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/ustr/Config.in | 13 -------------
 package/ustr/ustr.hash |  9 ---------
 package/ustr/ustr.mk   | 39 ---------------------------------------
 6 files changed, 8 insertions(+), 63 deletions(-)
 delete mode 100644 package/ustr/Config.in
 delete mode 100644 package/ustr/ustr.hash
 delete mode 100644 package/ustr/ustr.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 67d696a259..b8b550e5ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_USTR
+	bool "ustr package removed"
+	select BR2_LEGACY
+	help
+	  The 'ustr' package was only used by SELinux libsemanage, but
+	  since SELinux 2.7, ustr is no longer used. Therefore, we
+	  removed this package from Buildroot.
+
 config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
 	bool "kodi-screensaver-planestate package was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 92e5058e9d..b427fd92ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -577,7 +577,6 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/policycoreutils/
-F:	package/ustr/
 
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
 F:	package/libloki/
diff --git a/package/Config.in b/package/Config.in
index f71e155faf..2fc11065f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1815,7 +1815,6 @@ menu "Text and terminal handling"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
 	source "package/tclap/Config.in"
-	source "package/ustr/Config.in"
 endmenu
 
 endmenu
diff --git a/package/ustr/Config.in b/package/ustr/Config.in
deleted file mode 100644
index 9d6561c343..0000000000
--- a/package/ustr/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_USTR
-	bool "ustr"
-	# unconditionally builds a shared library
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL # broken vsnprintf detection
-	help
-	  A small, safe string library.
-
-	  http://www.and.org/ustr/
-
-comment "ustr needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/ustr/ustr.hash b/package/ustr/ustr.hash
deleted file mode 100644
index a917b0f18f..0000000000
--- a/package/ustr/ustr.hash
+++ /dev/null
@@ -1,9 +0,0 @@
-# Locally computed
-sha256 3daf6eae9f78de1e872c0b2b83cce35515b94d4bb8a074e48f331fd99e1fc2c4 ustr-1.0.4.tar.bz2
-sha256 d90681590c012d4bdb2ee98752a6638bbccb4be7a1f1753e9fce86bbb291dc24 LICENSE
-sha256 2a52acaf526a89bb2da713d38328d5fb2e19b1227a14181d4a37c7c188bb05f9 LICENSE_BSD
-sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509 LICENSE_LGPL
-sha256 d7b9a61065e7c63e4854644779d69098b988a3e3d6ef804d41da5f18b69b2fb9 LICENSE_MIT
-
-# From http://debian.gtisc.gatech.edu/debian/pool/main/u/ustr/ustr_1.0.4-6.dsc
-sha256 75aa6be2c70eba632ac63078e55ecb4b5a45e6624501a8ed6d81b9a2014d149e ustr_1.0.4-6.debian.tar.xz
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
deleted file mode 100644
index c99ada5276..0000000000
--- a/package/ustr/ustr.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# ustr
-#
-################################################################################
-
-# When bumping the version to a new upstream release, be sure to remove
-# the ldconfig hack, below.
-USTR_VERSION = 1.0.4
-USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
-USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
-USTR_LICENSE = BSD-2-Clause, MIT, LGPL-2.0+
-USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
-USTR_AUTORECONF = YES
-USTR_PATCH = \
-	http://snapshot.debian.org/archive/debian/20180131T223129Z/pool/main/u/ustr/ustr_$(USTR_VERSION)-6.debian.tar.xz
-
-USTR_INSTALL_STAGING = YES
-
-# ustr only builds the static library by default, but the default
-# install rule will install both the static and the shared libraries,
-# which means the shared one is build during the install step. :-(
-#
-# We can however instruct ustr to build both at build time, by adding
-# 'all-shared' to the default 'all' rule.
-USTR_MAKE_OPTS = all all-shared
-
-USTR_CONF_OPTS += LDCONFIG=/bin/true
-HOST_USTR_CONF_OPTS += LDCONFIG=/bin/true
-
-# for some reason, ustr finds it useful to install its source code in
-# /usr/share, which is totally useless on the target
-define USTR_REMOVE_SOURCE_CODE
-	$(RM) -rf $(TARGET_DIR)/usr/share/ustr-$(USTR_VERSION)
-endef
-USTR_POST_INSTALL_TARGET_HOOKS += USTR_REMOVE_SOURCE_CODE
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.21.0
