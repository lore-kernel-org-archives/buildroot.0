From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:48 -0700
Subject: [Buildroot] [PATCH 03/17] TI's DSP Code Generation Tools
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-4-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in            |    1 +
 package/ti/ti-cgt6x/Config.in   |    6 +++++
 package/ti/ti-cgt6x/ti-cgt6x.mk |   42 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-cgt6x/Config.in
 create mode 100644 package/ti/ti-cgt6x/ti-cgt6x.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 9b65bce..8abb6d7 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -41,5 +41,6 @@ comment "Target components"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
+source "package/ti/ti-cgt6x/Config.in"
 
 endif
diff --git a/package/ti/ti-cgt6x/Config.in b/package/ti/ti-cgt6x/Config.in
new file mode 100644
index 0000000..5b13c9f
--- /dev/null
+++ b/package/ti/ti-cgt6x/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_CGT6X
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	bool "DSP Code Generation Tools"
+	help
+	  TI DSP Code Generation Tools
+	  https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm
\ No newline at end of file
diff --git a/package/ti/ti-cgt6x/ti-cgt6x.mk b/package/ti/ti-cgt6x/ti-cgt6x.mk
new file mode 100644
index 0000000..29367a7
--- /dev/null
+++ b/package/ti/ti-cgt6x/ti-cgt6x.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# ti-cgt6x
+#
+################################################################################
+TI_CGT6X_VERSION:=6.1.12
+
+TI_CGT6X_SOURCE:=ti-cgt6x-$(TI_CGT6X_VERSION).tar.gz
+TI_CGT6X_SOURCE_BIN:=ti_cgt_c6000_$(TI_CGT6X_VERSION)_setup_linux_x86.bin
+TI_CGT6X_SOURCE_BIN_FOLDER:=c6000cgt$(TI_CGT6X_VERSION)
+TI_CGT6X_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_3_00/latest//exports
+TI_CGT6X_DIR:=$(BUILD_DIR)/ti-cgt6x-$(TI_CGT6X_VERSION)
+
+TI_CGT6X_INSTALL_TARGET = NO
+TI_CGT6X_INSTALL_STAGING = YES
+
+TI_CGT6X_INSTALL_DIR:=$(STAGING_DIR)/ti/cgt6x-$(TI_CGT6X_VERSION)
+
+$(DL_DIR)/$(TI_CGT6X_SOURCE):
+	$(call DOWNLOAD,$(TI_CGT6X_SITE),$(TI_CGT6X_SOURCE_BIN))
+	chmod +x $(DL_DIR)/$(TI_CGT6X_SOURCE_BIN)
+	$(DL_DIR)/$(TI_CGT6X_SOURCE_BIN) --mode silent --nodoc --prefix $(DL_DIR)/$(TI_CGT6X_SOURCE_BIN_FOLDER)
+	find $(DL_DIR)/$(TI_CGT6X_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_CGT6X_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_CGT6X_SOURCE) $(TI_CGT6X_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_CGT6X_SOURCE_BIN_FOLDER)
+
+define TI_CGT6X_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_CGT6X_INSTALL_DIR)
+	cp -r $(@D)/* $(TI_CGT6X_INSTALL_DIR)
+ 	chmod -R +w $(TI_CGT6X_INSTALL_DIR)
+endef
+
+define TI_CGT6X_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_CGT6X_INSTALL_DIR)
+endef
+
+ti-cgt6x-source: $(DL_DIR)/$(TI_CGT6X_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-cgt6x))
\ No newline at end of file
-- 
1.7.0.4
