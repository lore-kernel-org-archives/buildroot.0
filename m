From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun,  7 Jul 2013 18:31:06 -0500
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

installs cape dtbos from the kernel firmware into the target system.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in                    |  1 +
 package/beagle-capes/Config.in       | 12 ++++++++++++
 package/beagle-capes/beagle-capes.mk | 15 +++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/beagle-capes/Config.in
 create mode 100644 package/beagle-capes/beagle-capes.mk

diff --git a/package/Config.in b/package/Config.in
index 4df48ba..3b06f98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -226,6 +226,7 @@ source "package/rpi-firmware/Config.in"
 source "package/sunxi-boards/Config.in"
 source "package/ux500-firmware/Config.in"
 source "package/zd1211-firmware/Config.in"
+source "package/beagle-capes/Config.in"
 endmenu
 source "package/freescale-imx/Config.in"
 source "package/acpid/Config.in"
diff --git a/package/beagle-capes/Config.in b/package/beagle-capes/Config.in
new file mode 100644
index 0000000..568e84f
--- /dev/null
+++ b/package/beagle-capes/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BEAGLE_CAPES
+	bool "beagle-capes"
+	depends on BR2_LINUX_KERNEL && BR2_arm
+	select BR2_LINUX_KERNEL_INSTALL_FIRMWARE
+	help
+	  Installs beaglebone capes firmware from the kernel source.
+
+	  This package requires that a kernel with beaglebone capes firmware is
+	  selected.
+
+comment "requires the linux kernel"
+	depends on !(BR2_LINUX_KERNEL)
diff --git a/package/beagle-capes/beagle-capes.mk b/package/beagle-capes/beagle-capes.mk
new file mode 100644
index 0000000..5b6f121
--- /dev/null
+++ b/package/beagle-capes/beagle-capes.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# beagle-capes 
+#
+################################################################################
+
+BEAGLE_CAPES_SOURCE =
+
+BEAGLE_CAPES_DEPENDENCIES = linux
+
+define BEAGLE_CAPES_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(STAGING_DIR)/lib/firmware/*.dtbo $(TARGET_DIR)/lib/firmware/
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
