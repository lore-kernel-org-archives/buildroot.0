From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:50 -0700
Subject: [Buildroot] [PATCH 05/17] TI Codecs for the OMAP3 processor
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-6-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                          |    1 +
 package/ti/ti-codecs-omap3/Config.in          |   10 +++
 package/ti/ti-codecs-omap3/ti-codecs-omap3.mk |   79 +++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-codecs-omap3/Config.in
 create mode 100644 package/ti/ti-codecs-omap3/ti-codecs-omap3.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index e371782..b6179cb 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -38,6 +38,7 @@ choice
 endchoice
 
 comment "Target components"
+source "package/ti/ti-codecs-omap3/Config.in"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
diff --git a/package/ti/ti-codecs-omap3/Config.in b/package/ti/ti-codecs-omap3/Config.in
new file mode 100644
index 0000000..84181f6
--- /dev/null
+++ b/package/ti/ti-codecs-omap3/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TI_CODECS_OMAP3
+	bool "TI DSP Codecs"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	depends on BR2_PACKAGE_TI_CODEC_ENGINE
+	select BR2_PACKAGE_TI_XDCTOOLS
+	select BR2_PACKAGE_TI_LINUXUTILS
+	select BR2_PACKAGE_TI_LOCAL_POWER_MANAGER
+	help
+	  TI Codecs for the OMAP3
+	  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent
diff --git a/package/ti/ti-codecs-omap3/ti-codecs-omap3.mk b/package/ti/ti-codecs-omap3/ti-codecs-omap3.mk
new file mode 100644
index 0000000..db28b2e
--- /dev/null
+++ b/package/ti/ti-codecs-omap3/ti-codecs-omap3.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# ti-codecs-omap3
+#
+################################################################################
+TI_CODECS_OMAP3_VERSION:=1.01.00
+TI_CODECS_OMAP3_FILE_VERSION:=1_01_00
+TI_CODECS_OMAP3_SOURCE:=ti-codecs-omap3-$(TI_CODEC_VERSION).tar.gz
+TI_CODECS_OMAP3_SOURCE_BIN:=cs1omap3530_setupLinux_$(TI_CODECS_OMAP3_FILE_VERSION)-prebuilt-dvsdk3.01.00.10.bin
+TI_CODECS_OMAP3_SOURCE_BIN_FOLDER:=cs1omap3530_$(TI_CODECS_OMAP3_FILE_VERSION)
+TI_CODECS_OMAP3_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/dvsdk/dvsdk_3_01/3_01_00_10/exports
+TI_CODECS_OMAP3_DIR:=$(BUILD_DIR)/ti-codecs-omap3-$(TI_CODECS_OMAP3_VERSION)
+
+TI_CODECS_OMAP3_INSTALL_STAGING_DIR:=$(STAGING_DIR)/ti/codecs-$(TI_CODECS_OMAP3_VERSION)
+TI_CODECS_OMAP3_INSTALL_TARGET_DIR:=/usr/lib/ti-codecs-omap3-server
+
+TI_CODECS_OMAP3_DEPENDENCIES = \
+	ti-cgt6x \
+	ti-xdctools \
+	ti-dspbios \
+	ti-codec-engine \
+	ti-linuxutils \
+	ti-local-power-manager
+
+TI_CODECS_OMAP3_DSPSUFFIX=x64P
+
+TI_CODECS_OMAP3_MAKE_ARGS = \
+	CE_INSTALL_DIR="$(TI_CODEC_ENGINE_INSTALL_STAGING_DIR)" \
+	FC_INSTALL_DIR="$(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR)" \
+	XDAIS_INSTALL_DIR="$(TI_XDAIS_INSTALL_DIR)" \
+	BIOSUTILS_INSTALL_DIR="$(TI_BIOSUTILS_INSTALL_DIR)" \
+	LINK_INSTALL_DIR="$(TI_DSPLINK_INSTALL_STAGING_DIR)" \
+	CMEM_INSTALL_DIR="$(TI_LINUXUTILS_INSTALL_STAGING_DIR)" \
+	LPM_INSTALL_DIR="$(TI_LOCAL_POWER_MANAGER_INSTALL_STAGING_DIR)" \
+	BIOS_INSTALL_DIR="$(TI_DSPBIOS_INSTALL_DIR)" \
+	CODEGEN_INSTALL_DIR="$(TI_CGT6X_INSTALL_DIR)" \
+	XDC_INSTALL_DIR="$(TI_XDCTOOLS_INSTALL_DIR)" \
+	CODEC_INSTALL_DIR="$(TI_CODECS_OMAP3_DIR)" \
+	XDCARGS="prod"
+
+$(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE):
+	$(call DOWNLOAD,$(TI_CODECS_OMAP3_SITE),$(TI_CODECS_OMAP3_SOURCE_BIN))
+	chmod +x $(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE_BIN)
+	$(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE_BIN) -Y --prefix $(DL_DIR)
+	find $(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_CODECS_OMAP3_SOURCE) $(TI_CODECS_OMAP3_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE_BIN_FOLDER)
+
+
+define TI_CODECS_OMAP3_CONFIGURE_CMDS
+	$(MAKE) -C $(@D) $(TI_CODECS_OMAP3_MAKE_ARGS) clean
+endef
+
+define TI_CODECS_OMAP3_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TI_CODECS_OMAP3_MAKE_ARGS) all
+endef
+
+define TI_CODECS_OMAP3_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_CODECS_OMAP3_INSTALL_STAGING_DIR)
+	cp -a $(@D)/* $(TI_CODECS_OMAP3_INSTALL_STAGING_DIR)
+	chmod -R +w $(TI_CODECS_OMAP3_INSTALL_STAGING_DIR)
+endef
+
+define TI_CODECS_OMAP3_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)$(TI_CODECS_OMAP3_INSTALL_TARGET_DIR);
+	find $(@D) -name "*.$(TI_CODECS_OMAP3_DSPSUFFIX)" -exec $(INSTALL) {} $(TARGET_DIR)$(TI_CODECS_OMAP3_INSTALL_TARGET_DIR) \; -print ;
+endef
+
+define TI_CODECS_OMAP3_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_CODECS_OMAP3_INSTALL_STAGING_DIR)
+endef
+
+ti-codecs-omap3-source: $(DL_DIR)/$(TI_CODECS_OMAP3_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-codecs-omap3))
+
-- 
1.7.0.4
