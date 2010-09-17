From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:56 -0700
Subject: [Buildroot] [PATCH 11/17] TI EDMA3 Low Level Driver (LLD)
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-12-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                  |    1 +
 package/ti/ti-edma3lld/Config.in      |    6 ++++
 package/ti/ti-edma3lld/ti-edma3lld.mk |   44 +++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-edma3lld/Config.in
 create mode 100644 package/ti/ti-edma3lld/ti-edma3lld.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index d64500e..1cd1cf3 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -48,5 +48,6 @@ source "package/ti/ti-codec-engine/Config.in"
 source "package/ti/ti-dmai/Config.in"
 source "package/ti/ti-dspbios/Config.in"
 source "package/ti/ti-dvsdk-dm365/Config.in"
+source "package/ti/ti-edma3lld/Config.in"
 
 endif
diff --git a/package/ti/ti-edma3lld/Config.in b/package/ti/ti-edma3lld/Config.in
new file mode 100644
index 0000000..23a7974
--- /dev/null
+++ b/package/ti/ti-edma3lld/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_EDMA3LLD
+	bool "EDMA3 Low Level Driver (LLD)"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	help
+      TI EDMA3 Low Level Driver (LLD)"
+      http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc
diff --git a/package/ti/ti-edma3lld/ti-edma3lld.mk b/package/ti/ti-edma3lld/ti-edma3lld.mk
new file mode 100644
index 0000000..13f3ed3
--- /dev/null
+++ b/package/ti/ti-edma3lld/ti-edma3lld.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# ti-edma3lld
+#
+################################################################################
+TI_EDMA3LLD_VERSION:=01.11.00.03
+TI_EDMA3LLD_FILE_VERSION:=01_11_00_03
+
+TI_EDMA3LLD_SOURCE:=ti-edma3lld-$(TI_EDMA3LLD_VERSION).tar.gz
+TI_EDMA3LLD_SOURCE_BIN:=EDMA3_LLD_setuplinux_$(TI_EDMA3LLD_FILE_VERSION).bin
+TI_EDMA3LLD_SOURCE_BIN_FOLDER:=edma3_lld_$(TI_EDMA3LLD_FILE_VERSION)
+TI_EDMA3LLD_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/edma3_lld/edma3-lld-bios5/$(TI_EDMA3LLD_FILE_VERSION)/exports
+TI_EDMA3LLD_DIR:=$(BUILD_DIR)/ti-edma3lld-$(TI_EDMA3LLD_VERSION)
+
+TI_EDMA3LLD_INSTALL_TARGET = NO
+TI_EDMA3LLD_INSTALL_STAGING = YES
+
+TI_EDMA3LLD_INSTALL_DIR:=$(STAGING_DIR)/ti/edma3lld-$(TI_EDMA3LLD_VERSION)
+
+$(DL_DIR)/$(TI_EDMA3LLD_SOURCE):
+	$(call DOWNLOAD,$(TI_EDMA3LLD_SITE),$(TI_EDMA3LLD_SOURCE_BIN))
+	chmod +x $(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN)
+	$(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN) --mode silent --prefix $(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN_FOLDER)
+	find $(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_EDMA3LLD_SOURCE) $(TI_EDMA3LLD_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_EDMA3LLD_SOURCE_BIN_FOLDER)
+
+define TI_EDMA3LLD_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_EDMA3LLD_INSTALL_DIR)
+	cp -r $(TI_EDMA3LLD_DIR)/* $(TI_EDMA3LLD_INSTALL_DIR)
+	chmod -R +w $(TI_EDMA3LLD_INSTALL_DIR)
+endef
+
+define TI_EDMA3LLD_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_EDMA3LLD_INSTALL_DIR)
+endef
+
+ti-edma3lld-source: $(DL_DIR)/$(TI_EDMA3LLD_SOURCE)
+
+
+$(eval $(call GENTARGETS,package/ti,ti-edma3lld))
\ No newline at end of file
-- 
1.7.0.4
