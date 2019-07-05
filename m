From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  5 Jul 2019 07:32:14 +0300
Subject: [Buildroot] [PATCH 3/3] package/opkg: bump to version 0.4.1
In-Reply-To: <42ce7221ac70a831016205e8111c2cb313403054.1562301134.git.baruch@tkos.co.il>
References: <42ce7221ac70a831016205e8111c2cb313403054.1562301134.git.baruch@tkos.co.il>
Message-ID: <6458f3e13c11bb029fbc5c45e1b62b13958f304e.1562301134.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tarball conf/ scripts no longer link to host files. Drop autoreconf.

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/opkg/opkg.hash |  4 +++-
 package/opkg/opkg.mk   | 12 +-----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
index 321c41dbd051..69eebde2d361 100644
--- a/package/opkg/opkg.hash
+++ b/package/opkg/opkg.hash
@@ -1,2 +1,4 @@
 # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
-sha256 f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf84d30b  opkg-0.3.6.tar.gz
+sha256 45ac1e037d3877f635d883f8a555e172883a25d3eeb7986c75890fdd31250a43  opkg-0.4.1.tar.gz
+# Locally calculated
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 4d34c6d4d3a2..8155ed381f35 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,29 +4,19 @@
 #
 ################################################################################
 
-OPKG_VERSION = 0.3.6
+OPKG_VERSION = 0.4.1
 OPKG_SITE = http://downloads.yoctoproject.org/releases/opkg
 OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
 OPKG_CONF_OPTS = --disable-curl
-# Populate the conf/ directory
-OPKG_AUTORECONF = YES
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
 	mkdir -p $(TARGET_DIR)/usr/lib/opkg
 endef
 
-# The conf/ directory contains symlinks to host automake and libtool provided
-# scripts. Don't rely on them being present.
-define OPKG_REMOVE_AUTOTOOLS_SYMLINKS
-	rm $(@D)/conf/*
-endef
-
-OPKG_POST_EXTRACT_HOOKS += OPKG_REMOVE_AUTOTOOLS_SYMLINKS
-
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
 OPKG_CONF_ENV += \
-- 
2.20.1
