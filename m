From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue,  9 Jul 2013 12:00:21 -0500
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <1373389221-28919-1-git-send-email-spenser@gillilanding.com>
References: <1373389221-28919-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373389221-28919-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

installs the beaglebone cape dtbos.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Yann E. Morin <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v1 -> v2:
  - alpha order in ../Config.in
  - clarify Config.in 
---
 package/Config.in                    |  1 +
 package/beagle-capes/Config.in       | 13 +++++++++++++
 package/beagle-capes/beagle-capes.mk | 15 +++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/beagle-capes/Config.in
 create mode 100644 package/beagle-capes/beagle-capes.mk

diff --git a/package/Config.in b/package/Config.in
index 4df48ba..d038c2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ endmenu
 menu "Hardware handling"
 menu "Misc devices firmwares"
 source "package/am33x-cm3/Config.in"
+source "package/beagle-capes/Config.in"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
diff --git a/package/beagle-capes/Config.in b/package/beagle-capes/Config.in
new file mode 100644
index 0000000..90482ec
--- /dev/null
+++ b/package/beagle-capes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BEAGLE_CAPES
+	bool "beagle-capes"
+	depends on BR2_LINUX_KERNEL && BR2_arm
+	select BR2_LINUX_KERNEL_INSTALL_FIRMWARE
+	help
+	  Installs beaglebone capes firmwares.
+
+	  These firmwares are bundled in the TI fork on the Linux kernel for the
+	  BeagleBone; therefore, a kernel with these firmwares must be configured in
+	  the Kernel Configuration section of Buildroot.
+
+comment "beagle-capes requires a Linux kernel"
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
