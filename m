From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Feb 2013 21:46:00 +0100
Subject: [Buildroot] [PATCH 2/8] gdisk: rename to gptfdisk
In-Reply-To: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360183566-27556-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360183566-27556-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to match the new upstream name, rename the gdisk package to
gptfdisk. We add the relevant legacy configuration options to ensure a
smooth transition for users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   22 +++++++++++
 package/Config.in                                  |    2 +-
 package/gdisk/gdisk.mk                             |   39 --------------------
 package/{gdisk => gptfdisk}/Config.in              |   14 +++----
 .../gptfdisk-001-no-utf16.patch}                   |    0
 package/gptfdisk/gptfdisk.mk                       |   38 +++++++++++++++++++
 6 files changed, 68 insertions(+), 47 deletions(-)
 delete mode 100644 package/gdisk/gdisk.mk
 rename package/{gdisk => gptfdisk}/Config.in (80%)
 rename package/{gdisk/gdisk-001-no-utf16.patch => gptfdisk/gptfdisk-001-no-utf16.patch} (100%)
 create mode 100644 package/gptfdisk/gptfdisk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 90a7b67..d5f4cc6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -44,6 +44,28 @@ endif
 #
 # Legacy options since 2012.11
 #
+config BR2_PACKAGE_GDISK
+        bool "gdisk has been replaced by gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK.
+
+config BR2_PACKAGE_GDISK_GDISK
+        bool "gdisk tool from gdisk has been replaced by gdisk in gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_GPTFDISK_GDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK_GDISK.
+
+config BR2_PACKAGE_GDISK_SGDISK
+        bool "sgdisk tool from gdisk has been replaced by sgdisk in gptfdisk"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GPTFDISK
+	select BR2_PACKAGE_GPTFDISK_SGDISK
+	help
+	  The option has been renamed BR2_PACKAGE_GPTFDISK_SGDISK.
 
 config BR2_PACKAGE_XSERVER_xorg
 	bool "X.org modular server"
diff --git a/package/Config.in b/package/Config.in
index 8588951..bb9b0f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -233,8 +233,8 @@ source "package/fis/Config.in"
 source "package/fmtools/Config.in"
 source "package/fxload/Config.in"
 source "package/gadgetfs-test/Config.in"
-source "package/gdisk/Config.in"
 source "package/gpsd/Config.in"
+source "package/gptfdisk/Config.in"
 source "package/gvfs/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
deleted file mode 100644
index cda369e..0000000
--- a/package/gdisk/gdisk.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-#############################################################
-#
-# gdisk
-#
-#############################################################
-
-GDISK_VERSION = 0.8.6
-GDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
-GDISK_SOURCE = gptfdisk-$(GDISK_VERSION).tar.gz
-
-GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
-GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
-
-ifneq ($(GDISK_TARGETS_y),)
-
-GDISK_DEPENDENCIES += util-linux
-ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
-    GDISK_DEPENDENCIES += popt
-endif
-
-
-define GDISK_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
-		-C $(@D) $(GDISK_TARGETS_y)
-endef
-
-define GDISK_INSTALL_TARGET_CMDS
-	for i in $(GDISK_TARGETS_y); do \
-	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
-	done
-endef
-
-define GDISK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GDISK_TARGETS_y))
-endef
-
-endif
-
-$(eval $(generic-package))
diff --git a/package/gdisk/Config.in b/package/gptfdisk/Config.in
similarity index 80%
rename from package/gdisk/Config.in
rename to package/gptfdisk/Config.in
index 24d305d..7851dc3 100644
--- a/package/gdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_GDISK
-	bool "gdisk"
+config BR2_PACKAGE_GPTFDISK
+	bool "gptfdisk"
 	depends on BR2_LARGEFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # util-linux
@@ -11,9 +11,9 @@ config BR2_PACKAGE_GDISK
 
 	  http://www.rodsbooks.com/gdisk/
 
-config BR2_PACKAGE_GDISK_GDISK
+config BR2_PACKAGE_GPTFDISK_GDISK
 	bool "interactive gdisk"
-	depends on BR2_PACKAGE_GDISK
+	depends on BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
@@ -21,9 +21,9 @@ config BR2_PACKAGE_GDISK_GDISK
 	  /usr/sbin/gdisk which is modelled after and quite similar in use
 	  to the traditional MBR based fdisk tool.
 
-config BR2_PACKAGE_GDISK_SGDISK
+config BR2_PACKAGE_GPTFDISK_SGDISK
 	bool "command line sgdisk"
-	depends on BR2_PACKAGE_GDISK
+	depends on BR2_PACKAGE_GPTFDISK
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_POPT
@@ -32,5 +32,5 @@ config BR2_PACKAGE_GDISK_SGDISK
 	  /usr/sbin/sgdisk which is named after the traditional MBR based
 	  sfdisk tool albeit with an entirely different option syntax.
 
-comment "gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
+comment "gptfdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled"
 	depends on !(BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
diff --git a/package/gdisk/gdisk-001-no-utf16.patch b/package/gptfdisk/gptfdisk-001-no-utf16.patch
similarity index 100%
rename from package/gdisk/gdisk-001-no-utf16.patch
rename to package/gptfdisk/gptfdisk-001-no-utf16.patch
diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
new file mode 100644
index 0000000..7755a30
--- /dev/null
+++ b/package/gptfdisk/gptfdisk.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# gptfdisk
+#
+#############################################################
+
+GPTFDISK_VERSION = 0.8.6
+GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
+
+GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
+GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
+
+ifneq ($(GPTFDISK_TARGETS_y),)
+
+GPTFDISK_DEPENDENCIES += util-linux
+ifeq ($(BR2_PACKAGE_GPTFDISK_SGDISK),y)
+    GPTFDISK_DEPENDENCIES += popt
+endif
+
+
+define GPTFDISK_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
+		-C $(@D) $(GPTFDISK_TARGETS_y)
+endef
+
+define GPTFDISK_INSTALL_TARGET_CMDS
+	for i in $(GPTFDISK_TARGETS_y); do \
+	    $(INSTALL) -D $(@D)/$$i $(TARGET_DIR)/usr/sbin/; \
+	done
+endef
+
+define GPTFDISK_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(GPTFDISK_TARGETS_y))
+endef
+
+endif
+
+$(eval $(generic-package))
-- 
1.7.9.5
