From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:58 +0200
Subject: [Buildroot] [PATCH 08/10] flashrom: new package
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8bd26c1a4e7bab3695187a73e812f52739765565.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/flashrom/Config.in   |   11 +++++++++++
 package/flashrom/flashrom.mk |   20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/flashrom/Config.in
 create mode 100644 package/flashrom/flashrom.mk

diff --git a/package/Config.in b/package/Config.in
index 09ca9dd..36a2cd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -178,6 +178,7 @@ source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
+source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/fmtools/Config.in"
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
new file mode 100644
index 0000000..956500f
--- /dev/null
+++ b/package/flashrom/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FLASHROM
+	bool "flashrom"
+	select BR2_PACKAGE_PCIUTILS
+	# dmidecode is only a runtime dependency
+	select BR2_PACKAGE_DMIDECODE
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  BIOS-updating utility.
+	  Requires PCIUtils libraries.
+
+	  http://flashrom.org/
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
new file mode 100644
index 0000000..323469a
--- /dev/null
+++ b/package/flashrom/flashrom.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# flashrom
+#
+#############################################################
+FLASHROM_VERSION = 0.9.3
+FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
+FLASHROM_SITE    = http://download.flashrom.org/releases
+
+FLASHROM_DEPENDENCIES = pciutils
+
+define FLASHROM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FLASHROM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/bin/flashrom
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
