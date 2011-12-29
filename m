From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 18:40:49 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_7/7=5D_sam-ba=3A_new_package_with_?=
	=?utf-8?q?host_variant_only?=
In-Reply-To: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6bc9d7f888570bd1692acf6b32c8de92f3829640.1325178529.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sam-ba is a tool needed to reprogram AT91-based systems using an USB
connection or a serial port connection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in.host        |    1 +
 package/sam-ba/Config.in.host |    6 ++++++
 package/sam-ba/sam-ba.mk      |   23 +++++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/sam-ba/Config.in.host
 create mode 100644 package/sam-ba/sam-ba.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 6499eb5..21e2a11 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,5 +2,6 @@ menu "Host utilities"
 
 source "package/uboot-tools/Config.in.host"
 source "package/openocd/Config.in.host"
+source "package/sam-ba/Config.in.host"
 
 endmenu
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
new file mode 100644
index 0000000..1e46c30
--- /dev/null
+++ b/package/sam-ba/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_SAM_BA
+	bool "host sam-ba"
+	help
+	  Atmel SAM-BA? software provides an open set of tools for
+	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
+	  microcontrollers.
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
new file mode 100644
index 0000000..bdad695
--- /dev/null
+++ b/package/sam-ba/sam-ba.mk
@@ -0,0 +1,23 @@
+SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+SAM_BA_VERSION = 2.10
+SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+
+define HOST_SAM_BA_EXTRACT_CMDS
+        unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+        mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
+        rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
+endef
+
+# Since it's a prebuilt application and it does not conform to the
+# usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
+# then create a symbolic link from $(HOST_DIR)/usr/bin to the
+# application binary, for easier usage.
+
+define HOST_SAM_BA_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/opt/sam-ba/
+	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
+	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
+endef
+
+$(eval $(call GENTARGETS,host))
+
-- 
1.7.4.1
