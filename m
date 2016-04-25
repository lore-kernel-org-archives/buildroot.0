From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 23:44:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openjpeg: bump to version 2.1
In-Reply-To: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1461620673-31313-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch:
* bumps openjpeg to version 2.1
* changes download location to github
* converts the package to use cmake

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/openjpeg/openjpeg.hash |  2 +-
 package/openjpeg/openjpeg.mk   | 34 +++++++---------------------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index a8695c1..35d4fbd 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	15df7b194a5d8dba0052cd21c17a4dc761149a770a907d73fffb972078c28a87  openjpeg-1.5.2.tar.gz
+sha256	4afc996cd5e0d16360d71c58216950bcb4ce29a3272360eb29cadb1c8bce4efc  openjpeg-2.1.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index c613ba8..bf12526 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,35 +4,15 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 1.5.2
-OPENJPEG_SITE = http://downloads.sourceforge.net/project/openjpeg.mirror/$(OPENJPEG_VERSION)
+OPENJPEG_VERSION = 2.1
+OPENJPEG_SITE = $(call github,uclouvain,openjpeg,version.$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2c
 OPENJPEG_LICENSE_FILES = LICENSE
-# tarball does not contain the generated files
-OPENJPEG_AUTORECONF = YES
 OPENJPEG_INSTALL_STAGING = YES
-OPENJPEG_DEPENDENCIES = host-pkgconf
-OPENJPEG_CONF_OPTS = --disable-lcms1
 
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-OPENJPEG_DEPENDENCIES += libpng
-OPENJPEG_CONF_OPTS += --enable-png
-else
-OPENJPEG_CONF_OPTS += --disable-png
-endif
+OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
+OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
+OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
+OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LCMS2),lcms2)
 
-ifeq ($(BR2_PACKAGE_TIFF),y)
-OPENJPEG_DEPENDENCIES += tiff
-OPENJPEG_CONF_OPTS += --enable-tiff
-else
-OPENJPEG_CONF_OPTS += --disable-tiff
-endif
-
-ifeq ($(BR2_PACKAGE_LCMS2),y)
-OPENJPEG_DEPENDENCIES += lcms2
-OPENJPEG_CONF_OPTS += --enable-lcms2
-else
-OPENJPEG_CONF_OPTS += --disable-lcms2
-endif
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
1.9.1
