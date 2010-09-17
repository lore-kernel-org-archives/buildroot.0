From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:52 -0700
Subject: [Buildroot] [PATCH 07/17] TI's DSP/BIOS v5 Kernel
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-8-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                |    1 +
 package/ti/ti-dspbios/Config.in     |    6 ++++
 package/ti/ti-dspbios/ti-dspbios.mk |   46 +++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-dspbios/Config.in
 create mode 100644 package/ti/ti-dspbios/ti-dspbios.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index e8b6197..834d467 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -39,6 +39,7 @@ endchoice
 
 comment "Target components"
 source "package/ti/ti-codecs-omap3/Config.in"
+source "package/ti/ti-dspbios/Config.in"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
diff --git a/package/ti/ti-dspbios/Config.in b/package/ti/ti-dspbios/Config.in
new file mode 100644
index 0000000..38ebf23
--- /dev/null
+++ b/package/ti/ti-dspbios/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_DSPBIOS
+	bool "DSP/BIOS v5 Kernel"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	help
+	  TI DSP/BIOS v5 Kernel
+	  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios
\ No newline at end of file
diff --git a/package/ti/ti-dspbios/ti-dspbios.mk b/package/ti/ti-dspbios/ti-dspbios.mk
new file mode 100644
index 0000000..7461f10
--- /dev/null
+++ b/package/ti/ti-dspbios/ti-dspbios.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# ti-dspbios
+#
+################################################################################
+TI_DSPBIOS_VERSION:=5.41.04.18
+TI_DSPBIOS_FILE_VERSION:=5_41_04_18
+
+TI_DSPBIOS_SOURCE:=ti-bios-$(TI_DSPBIOS_VERSION).tar.gz
+TI_DSPBIOS_SOURCE_BIN:=bios_setuplinux_$(TI_DSPBIOS_FILE_VERSION).bin
+TI_DSPBIOS_SOURCE_BIN_FOLDER:=bios_$(TI_DSPBIOS_FILE_VERSION)
+TI_DSPBIOS_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/$(TI_DSPBIOS_FILE_VERSION)/exports
+
+TI_DSPBIOS_DIR:=$(BUILD_DIR)/ti-dspbios-$(TI_DSPBIOS_VERSION)
+
+TI_DSPBIOS_INSTALL_TARGET = NO
+TI_DSPBIOS_INSTALL_STAGING = YES
+
+TI_DSPBIOS_INSTALL_DIR:=$(STAGING_DIR)/ti/dspbios-$(TI_DSPBIOS_VERSION)
+
+
+$(DL_DIR)/$(TI_DSPBIOS_SOURCE):
+	$(call DOWNLOAD,$(TI_DSPBIOS_SITE),$(TI_DSPBIOS_SOURCE_BIN))
+	chmod +x $(DL_DIR)/$(TI_DSPBIOS_SOURCE_BIN)
+	$(DL_DIR)/$(TI_DSPBIOS_SOURCE_BIN) --S --prefix $(DL_DIR)
+	find $(DL_DIR)/$(TI_DSPBIOS_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_DSPBIOS_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_DSPBIOS_SOURCE) $(TI_DSPBIOS_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_DSPBIOS_SOURCE_BIN_FOLDER)
+
+define TI_DSPBIOS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_DSPBIOS_INSTALL_DIR)
+	cp -r $(TI_DSPBIOS_DIR)/* $(TI_DSPBIOS_INSTALL_DIR)
+	chmod -R +w $(TI_DSPBIOS_INSTALL_DIR)	
+endef
+
+define TI_DSPBIOS_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_DSPBIOS_INSTALL_DIR)
+endef
+
+
+ti-dspbios-source: $(DL_DIR)/$(TI_DSPBIOS_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-dspbios))
\ No newline at end of file
-- 
1.7.0.4
