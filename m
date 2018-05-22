From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 21:56:51 +0300
Subject: [Buildroot] [PATCH next] opkg: bump to version 0.3.6
Message-ID: <f4198d4ca1b1cf8b94466e37b220e0e311912f41.1527015411.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use upstream provided tarball and hash.

The tarball conf/ subdirectory contains symlinks to host automake and
libtool scripts. We can't rely on these being present or usable. Remove
the symlinks, and keep autoreconf to populate the conf/ subdirectory
using Buildroot provided autotools.

Cc: Derek Baker <Derek-Baker@idexx.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/opkg/opkg.hash |  4 ++--
 package/opkg/opkg.mk   | 15 +++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index 80f3f0d1d2ca..321c41dbd051 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 2ec7157ccf866e49ca139e3632ba1ca9d61dc24382606b55062e423161a530b0  opkg-v0.3.1.tar.gz
+# From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
+sha256 f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf84d30b  opkg-0.3.6.tar.gz
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 0c7e15ea7523..4d34c6d4d3a2 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.3.1
-OPKG_SITE = http://git.yoctoproject.org/git/opkg
-OPKG_SITE_METHOD = git
-# Uses PKG_CHECK_MODULES() in configure.ac
+OPKG_VERSION = 0.3.6
+OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPTS = --disable-curl
+# Populate the conf/ directory
 OPKG_AUTORECONF = YES
 
 # Ensure directory for lockfile exists
@@ -20,6 +19,14 @@ define OPKG_CREATE_LOCKDIR
 	mkdir -p $(TARGET_DIR)/usr/lib/opkg
 endef
 
+# The conf/ directory contains symlinks to host automake and libtool provided
+# scripts. Don't rely on them being present.
+define OPKG_REMOVE_AUTOTOOLS_SYMLINKS
+	rm $(@D)/conf/*
+endef
+
+OPKG_POST_EXTRACT_HOOKS += OPKG_REMOVE_AUTOTOOLS_SYMLINKS
+
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
 OPKG_CONF_ENV += \
-- 
2.17.0
