From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:57 -0700
Subject: [Buildroot] [PATCH 12/17] TI Framework Components
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-13-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                               |    1 +
 package/ti/ti-framework-components/Config.in       |    6 +++
 .../ti-framework-components.mk                     |   34 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-framework-components/Config.in
 create mode 100644 package/ti/ti-framework-components/ti-framework-components.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 1cd1cf3..d766e20 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -49,5 +49,6 @@ source "package/ti/ti-dmai/Config.in"
 source "package/ti/ti-dspbios/Config.in"
 source "package/ti/ti-dvsdk-dm365/Config.in"
 source "package/ti/ti-edma3lld/Config.in"
+source "package/ti/ti-framework-components/Config.in"
 
 endif
diff --git a/package/ti/ti-framework-components/Config.in b/package/ti/ti-framework-components/Config.in
new file mode 100644
index 0000000..9a6df1a
--- /dev/null
+++ b/package/ti/ti-framework-components/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_FRAMEWORK_COMPONENTS
+	bool "TI Framework Components"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3	
+	help
+      TI Framework Components
+      http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc
diff --git a/package/ti/ti-framework-components/ti-framework-components.mk b/package/ti/ti-framework-components/ti-framework-components.mk
new file mode 100644
index 0000000..dbfaa0d
--- /dev/null
+++ b/package/ti/ti-framework-components/ti-framework-components.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# ti-framework-components
+#
+################################################################################
+TI_FRAMEWORK_COMPONENTS_VERSION:=2.25.02.06
+TI_FRAMEWORK_COMPONENTS_FILE_VERSION:=2_25_02_06
+TI_FRAMEWORK_COMPONENTS_SOURCE:=framework_components_$(TI_FRAMEWORK_COMPONENTS_FILE_VERSION),lite.tar.gz
+TI_FRAMEWORK_COMPONENTS_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/fc/$(TI_FRAMEWORK_COMPONENTS_FILE_VERSION)/exports
+TI_FRAMEWORK_COMPONENTS_DIR:=$(BUILD_DIR)/ti-framework-components-$(TI_FRAMEWORK_COMPONENTS_VERSION)
+
+TI_FRAMEWORK_COMPONENTS_INSTALL_TARGET = NO
+TI_FRAMEWORK_COMPONENTS_INSTALL_STAGING = YES
+
+TI_FRAMEWORK_COMPONENTS_INSTALL_DIR:=$(STAGING_DIR)/ti/framework-components-$(TI_FRAMEWORK_COMPONENTS_VERSION)
+
+
+$(DL_DIR)/$(TI_FRAMEWORK_COMPONENTS_SOURCE):
+	$(call DOWNLOAD,$(TI_FRAMEWORK_COMPONENTS_SITE),$(TI_FRAMEWORK_COMPONENTS_SOURCE))
+
+define TI_FRAMEWORK_COMPONENTS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR)
+	cp -pPrf $(TI_FRAMEWORK_COMPONENTS_DIR)/* $(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR)
+	chmod -R +w $(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR)
+endef
+
+define TI_FRAMEWORK_COMPONENTS_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR)
+endef
+
+
+ti-framework-components-source: $(DL_DIR)/$(TI_FRAMEWORK_COMPONENTS_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-framework-components))
\ No newline at end of file
-- 
1.7.0.4
