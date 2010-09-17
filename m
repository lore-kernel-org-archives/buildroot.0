From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 11:00:02 -0700
Subject: [Buildroot] [PATCH 17/17] XDCtools
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-18-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                  |    1 +
 package/ti/ti-xdctools/Config.in      |    6 ++++
 package/ti/ti-xdctools/ti-xdctools.mk |   48 +++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-xdctools/Config.in
 create mode 100644 package/ti/ti-xdctools/ti-xdctools.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index fc18534..0674bc1 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -54,5 +54,6 @@ source "package/ti/ti-dvsdk-dm365/Config.in"
 source "package/ti/ti-edma3lld/Config.in"
 source "package/ti/ti-framework-components/Config.in"
 source "package/ti/ti-xdais/Config.in"
+source "package/ti/ti-xdctools/Config.in"
 
 endif
diff --git a/package/ti/ti-xdctools/Config.in b/package/ti/ti-xdctools/Config.in
new file mode 100644
index 0000000..ffc9188
--- /dev/null
+++ b/package/ti/ti-xdctools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_XDCTOOLS
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	bool "XDCtools"
+	help
+      XDCtools (RTSC - Real Time Software Components - http://rtsc.eclipse.org)
+      http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc
diff --git a/package/ti/ti-xdctools/ti-xdctools.mk b/package/ti/ti-xdctools/ti-xdctools.mk
new file mode 100644
index 0000000..28972fe
--- /dev/null
+++ b/package/ti/ti-xdctools/ti-xdctools.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# ti-xdctools
+#
+################################################################################
+TI_XDCTOOLS_VERSION:=3.20.01.51
+TI_XDCTOOLS_FILE_VERSION:=3_20_01_51
+
+TI_XDCTOOLS_SOURCE:=ti-xdctools-$(TI_XDCTOOLS_VERSION).tar.gz
+TI_XDCTOOLS_SOURCE_BIN:=xdctools_setuplinux_$(TI_XDCTOOLS_FILE_VERSION).bin
+TI_XDCTOOLS_SOURCE_BIN_FOLDER:=xdctools_$(TI_XDCTOOLS_FILE_VERSION)
+TI_XDCTOOLS_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/$(TI_XDCTOOLS_FILE_VERSION)/exports
+TI_XDCTOOLS_DIR:=$(BUILD_DIR)/ti-xdctools-$(TI_XDCTOOLS_VERSION)
+
+TI_XDCTOOLS_INSTALL_TARGET = NO
+TI_XDCTOOLS_INSTALL_STAGING = YES
+
+TI_XDCTOOLS_INSTALL_DIR:=$(STAGING_DIR)/ti/xdctools-$(TI_XDCTOOLS_VERSION)
+
+
+
+$(DL_DIR)/$(TI_XDCTOOLS_SOURCE):
+	$(call DOWNLOAD,$(TI_XDCTOOLS_SITE),$(TI_XDCTOOLS_SOURCE_BIN))
+	chmod +x $(DL_DIR)/$(TI_XDCTOOLS_SOURCE_BIN)
+	$(DL_DIR)/$(TI_XDCTOOLS_SOURCE_BIN) --S --prefix $(DL_DIR)
+	find $(DL_DIR)/$(TI_XDCTOOLS_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_XDCTOOLS_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_XDCTOOLS_SOURCE) $(TI_XDCTOOLS_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_XDCTOOLS_SOURCE_BIN_FOLDER)
+
+# It's install to the staging dir simply for consistency.
+# Since it's a binary package it really does not need to be compiled or anything else.
+define TI_XDCTOOLS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_XDCTOOLS_INSTALL_DIR)
+	cp -r $(@D)/* $(TI_XDCTOOLS_INSTALL_DIR)
+	chmod -R +w $(TI_XDCTOOLS_INSTALL_DIR)
+endef
+
+define TI_XDCTOOLS_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_XDCTOOLS_INSTALL_DIR)
+endef
+
+ti-xdctools-source: $(DL_DIR)/$(TI_XDCTOOLS_SOURCE)
+
+
+$(eval $(call GENTARGETS,package/ti,ti-xdctools))
\ No newline at end of file
-- 
1.7.0.4
