From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:47 -0700
Subject: [Buildroot] [PATCH 02/17] TI's DSP/BIOS Utilities
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-3-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                    |    2 +-
 package/ti/ti-biosutils/Config.in       |    6 ++++++
 package/ti/ti-biosutils/ti-biosutils.mk |   28 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 package/ti/ti-biosutils/Config.in
 create mode 100644 package/ti/ti-biosutils/ti-biosutils.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 14b0225..9b65bce 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -40,6 +40,6 @@ endchoice
 comment "Target components"
 
 comment "Staging tools"
-
+source "package/ti/ti-biosutils/Config.in"
 
 endif
diff --git a/package/ti/ti-biosutils/Config.in b/package/ti/ti-biosutils/Config.in
new file mode 100644
index 0000000..8b24bfc
--- /dev/null
+++ b/package/ti/ti-biosutils/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_BIOSUTILS
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	bool "DSP/BIOS Utilities"
+	help
+      TI DSP/BIOS Utilities"
+      http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/Bios_Utils
diff --git a/package/ti/ti-biosutils/ti-biosutils.mk b/package/ti/ti-biosutils/ti-biosutils.mk
new file mode 100644
index 0000000..19dfeda
--- /dev/null
+++ b/package/ti/ti-biosutils/ti-biosutils.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# ti-biosutils
+#
+################################################################################
+TI_BIOSUTILS_VERSION:=1.02.02.02
+TI_BIOSUTILS_FILE_VERSION_MAJOR:=1_02_02
+TI_BIOSUTILS_FILE_VERSION:=$(TI_BIOSUTILS_FILE_VERSION_MAJOR)_02
+TI_BIOSUTILS_SOURCE:=biosutils_$(TI_BIOSUTILS_FILE_VERSION_MAJOR).tar.gz
+TI_BIOSUTILS_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/Bios_Utils/$(TI_BIOSUTILS_FILE_VERSION)/exports
+TI_BIOSUTILS_DIR:=$(BUILD_DIR)/ti-biosutils-$(TI_BIOSUTILS_VERSION)
+
+TI_BIOSUTILS_INSTALL_TARGET = NO
+TI_BIOSUTILS_INSTALL_STAGING = YES
+
+TI_BIOSUTILS_INSTALL_DIR:=$(STAGING_DIR)/ti/biosutils-$(TI_BIOSUTILS_VERSION)
+
+define TI_BIOSUTILS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_BIOSUTILS_INSTALL_DIR)
+	cp -r $(TI_BIOSUTILS_DIR)/* $(TI_BIOSUTILS_INSTALL_DIR)
+	chmod -R +w $(TI_BIOSUTILS_INSTALL_DIR)
+endef
+
+define TI_BIOSUTILS_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_BIOSUTILS_INSTALL_DIR)
+endef
+
+$(eval $(call GENTARGETS,package/ti,ti-biosutils))
\ No newline at end of file
-- 
1.7.0.4
