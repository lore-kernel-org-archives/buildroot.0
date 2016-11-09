From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:54:17 +0100
Subject: [Buildroot] [git commit branch/next] snowball-{hdmiservice,
	init}: remove packages
Message-ID: <20161109215431.6ADA781938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed364d1e54a7a31f6e2dc40af4b496c93148383e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The snowball_defconfig has been removed one year ago in commit
b3fa8e24defb20e1734e7e75f432090fe83c0dd8 ("configs: remove
calao_snowball_defconfig"), and it's no longer possible to buy
Snowball boards. Therefore, there is no reason to keep the
snowball-related packages in our tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   | 17 +++++++++++++++
 package/Config.in                                  |  2 --
 package/snowball-hdmiservice/Config.in             | 14 ------------
 .../snowball-hdmiservice/snowball-hdmiservice.hash |  2 --
 .../snowball-hdmiservice/snowball-hdmiservice.mk   | 25 ----------------------
 package/snowball-init/Config.in                    | 17 ---------------
 package/snowball-init/snowball-init.hash           |  2 --
 package/snowball-init/snowball-init.mk             | 16 --------------
 8 files changed, 17 insertions(+), 78 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..53fcf4e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,23 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2017.02"
+
+config BR2_PACKAGE_SNOWBALL_HDMISERVICE
+	bool "snowball-hdmiservice removed"
+	select BR2_LEGACY
+	help
+	  We no longer have support for the Snowball platform in
+	  Buildroot, so this package was no longer useful.
+
+config BR2_PACKAGE_SNOWBALL_INIT
+	bool "snowball-init removed"
+	select BR2_LEGACY
+	help
+	  We no longer have support for the Snowball platform in
+	  Buildroot, so this package was no longer useful.
+
+###############################################################################
 comment "Legacy options removed in 2016.11"
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
diff --git a/package/Config.in b/package/Config.in
index 0d449dc..7c91215 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -453,7 +453,6 @@ endmenu
 	source "package/sispmctl/Config.in"
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
-	source "package/snowball-hdmiservice/Config.in"
 	source "package/spi-tools/Config.in"
 	source "package/sredird/Config.in"
 	source "package/statserial/Config.in"
@@ -1419,7 +1418,6 @@ menu "Miscellaneous"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
-	source "package/snowball-init/Config.in"
 	source "package/taskd/Config.in"
 	source "package/wine/Config.in"
 	source "package/xutil_util-macros/Config.in"
diff --git a/package/snowball-hdmiservice/Config.in b/package/snowball-hdmiservice/Config.in
deleted file mode 100644
index 21a4f3c..0000000
--- a/package/snowball-hdmiservice/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_SNOWBALL_HDMISERVICE
-	bool "snowball-hdmiservice"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  HDMI userspace control daemon
-
-	  This package contains the HDMI userspace control daemon for the
-	  snowball board
-
-	  http://www.igloocommunity.org
-
-comment "snowball-hdmiservice needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.hash b/package/snowball-hdmiservice/snowball-hdmiservice.hash
deleted file mode 100644
index e9fffd7..0000000
--- a/package/snowball-hdmiservice/snowball-hdmiservice.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  dd2d8362a66178be082affa7cc238aebf3d671be184356bc23d13789db638b9d  snowball-hdmiservice-f75c99d1c52707240a78b4ba78e41d20d3aa3b08.tar.gz
diff --git a/package/snowball-hdmiservice/snowball-hdmiservice.mk b/package/snowball-hdmiservice/snowball-hdmiservice.mk
deleted file mode 100644
index 4aa1a27..0000000
--- a/package/snowball-hdmiservice/snowball-hdmiservice.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# snowball-hdmiservice
-#
-################################################################################
-
-SNOWBALL_HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
-SNOWBALL_HDMISERVICE_SITE = $(call github,igloocommunity,hdmiservice,$(SNOWBALL_HDMISERVICE_VERSION))
-SNOWBALL_HDMISERVICE_LICENSE = MIT
-SNOWBALL_HDMISERVICE_LICENSE_FILES = debian/copyright
-SNOWBALL_HDMISERVICE_INSTALL_STAGING = YES
-
-define SNOWBALL_HDMISERVICE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)"
-endef
-
-define SNOWBALL_HDMISERVICE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(STAGING_DIR) install
-endef
-
-define SNOWBALL_HDMISERVICE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
diff --git a/package/snowball-init/Config.in b/package/snowball-init/Config.in
deleted file mode 100644
index 6c94731..0000000
--- a/package/snowball-init/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_PACKAGE_SNOWBALL_INIT
-	bool "snowball-init"
-	# Runtime dependency, needed by snowball startup script
-	select BR2_PACKAGE_BLUEZ_UTILS
-	depends on !BR2_STATIC_LIBS # bluez_utils
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
-	depends on BR2_USE_MMU # dbus
-	select BR2_PACKAGE_UX500_FIRMWARE
-	help
-	  Snowball init scripts
-
-	  http://www.igloocommunity.org
-
-comment "snowball-init needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/snowball-init/snowball-init.hash b/package/snowball-init/snowball-init.hash
deleted file mode 100644
index f048ab7..0000000
--- a/package/snowball-init/snowball-init.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 7adafa3e91cae286e18c062acc1b1d0676ac7352e7dedef9dc6106f905433106  snowball-init-b064be21de25729039e5e54037bbdd2e25cfd5b7.tar.gz
diff --git a/package/snowball-init/snowball-init.mk b/package/snowball-init/snowball-init.mk
deleted file mode 100644
index f06b032..0000000
--- a/package/snowball-init/snowball-init.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# snowball-init
-#
-################################################################################
-
-SNOWBALL_INIT_VERSION = b064be21de25729039e5e54037bbdd2e25cfd5b7
-SNOWBALL_INIT_SITE = $(call github,igloocommunity,snowball-init,$(SNOWBALL_INIT_VERSION))
-SNOWBALL_INIT_LICENSE = BSD-4c
-SNOWBALL_INIT_LICENSE_FILES = debian/copyright
-
-define SNOWBALL_INIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(@D)/snowball $(TARGET_DIR)/etc/init.d/S50snowball
-endef
-
-$(eval $(generic-package))
