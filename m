From: Malte Starostik <m-starostik@versanet.de>
Date: Sun, 27 Feb 2011 16:19:46 +0100
Subject: [Buildroot] [PATCH] New package: gdisk
Message-ID: <1298819986-24787-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This includes two separately configurable parition manipulation
utilities: gdsik and sgdisk are to GPT disks what fdisk and sfdisk are
in MBR land.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 package/Config.in       |    1 +
 package/gdisk/Config.in |   34 ++++++++++++++++++++++++++++++++++
 package/gdisk/gdisk.mk  |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 package/gdisk/Config.in
 create mode 100644 package/gdisk/gdisk.mk

diff --git a/package/Config.in b/package/Config.in
index f459c1b..8a754e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -165,6 +165,7 @@ source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/gdisk/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/gpsd/Config.in"
diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
new file mode 100644
index 0000000..a49bac6
--- /dev/null
+++ b/package/gdisk/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_GDISK
+	bool "gdisk"
+	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	help
+	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
+	  text-mode partitioning tool that works on Globally Unique Identifier
+	  (GUID) Partition Table (GPT) disks, rather than on the more common
+	  (through 2010) Master Boot Record (MBR) partition tables.
+
+	  http://www.rodsbooks.com/gdisk/
+
+config BR2_PACKAGE_GDISK_GDISK
+	bool "interactive gdisk"
+	depends on BR2_PACKAGE_GDISK
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	help
+	  Install the interactive GUID partition table (GPT) manipulator
+	  /usr/sbin/gdsik which is modelled after and quite similar in use
+	  to the traditional MBR based fdisk tool.
+
+config BR2_PACKAGE_GDISK_SGDISK
+	bool "command line sgdisk"
+	depends on BR2_PACKAGE_GDISK
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_E2FSPROGS_LIBUUID
+	select BR2_PACKAGE_POPT
+	help
+	  Install the command-line GUID partition table (GPT) manipulator
+	  /usr/sbin/sgdisk which is named after the traditional MBR based
+	  sfdisk tool albeit with an entirely different option syntax.
+
+comment "gdisk requires a toolchain with LARGEFILE and C++ support enabled"
+	depends on !BR2_LARGEFILE || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
new file mode 100644
index 0000000..dc8b580
--- /dev/null
+++ b/package/gdisk/gdisk.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# gdisk
+#
+#############################################################
+
+GDISK_VERSION = 0.6.14
+GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
+GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
+
+GDISK_DEPENDENCIES += e2fsprogs
+ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
+    GDISK_DEPENDENCIES += popt
+endif
+
+GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
+GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
+
+define GDISK_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C $(@D)
+endef
+
+define GDISK_INSTALL_TARGET_CMDS
+	for i in $(GDISK_TARGETS_y); do \
+	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
+	done
+endef
+
+define GDISK_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/gdisk $(TARGET_DIR)/usr/sbin/sgdisk
+endef
+
+$(eval $(call GENTARGETS,package,gdisk))
-- 
1.7.3.4
