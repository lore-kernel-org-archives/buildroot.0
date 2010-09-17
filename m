From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 11:00:01 -0700
Subject: [Buildroot] [PATCH 16/17] TI's eXpress DSP Algorithm Interface
	Standard (XDAIS)
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-17-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in            |    1 +
 package/ti/ti-xdais/Config.in   |    6 ++++++
 package/ti/ti-xdais/ti-xdais.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-xdais/Config.in
 create mode 100644 package/ti/ti-xdais/ti-xdais.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 474e0a9..fc18534 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -53,5 +53,6 @@ source "package/ti/ti-dspbios/Config.in"
 source "package/ti/ti-dvsdk-dm365/Config.in"
 source "package/ti/ti-edma3lld/Config.in"
 source "package/ti/ti-framework-components/Config.in"
+source "package/ti/ti-xdais/Config.in"
 
 endif
diff --git a/package/ti/ti-xdais/Config.in b/package/ti/ti-xdais/Config.in
new file mode 100644
index 0000000..744a90c
--- /dev/null
+++ b/package/ti/ti-xdais/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_XDAIS
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	bool "eXpress DSP Algorithm Interface Standard (XDAIS)"
+	help
+      TI eXpress DSP Algorithm Interface Standard (XDAIS) specification
+      http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais
diff --git a/package/ti/ti-xdais/ti-xdais.mk b/package/ti/ti-xdais/ti-xdais.mk
new file mode 100644
index 0000000..8135ad5
--- /dev/null
+++ b/package/ti/ti-xdais/ti-xdais.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# ti-xdais
+#
+################################################################################
+TI_XDAIS_VERSION:=6.25.02.11
+TI_XDAIS_FILE_VERSION:=6_25_02_11
+TI_XDAIS_SOURCE:=xdais_$(TI_XDAIS_FILE_VERSION).tar.gz
+TI_XDAIS_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/$(TI_XDAIS_FILE_VERSION)/exports
+TI_XDAIS_DIR:=$(BUILD_DIR)/ti-xdais-$(TI_XDAIS_VERSION)
+
+TI_XDAIS_INSTALL_TARGET = NO
+TI_XDAIS_INSTALL_STAGING = YES
+
+TI_XDAIS_INSTALL_DIR:=$(STAGING_DIR)/ti/xdai-$(TI_XDAIS_VERSION)
+
+
+$(DL_DIR)/$(TI_XDAIS_SOURCE):
+	$(call DOWNLOAD,$(TI_XDAIS_SITE),$(TI_XDAIS_SOURCE_BIN))
+
+define TI_XDAIS_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_XDAIS_INSTALL_DIR)
+	cp -r $(@D)/* $(TI_XDAIS_INSTALL_DIR)
+	chmod -R +w $(TI_XDAIS_INSTALL_DIR)
+endef
+
+define TI_XDAIS_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_XDAIS_INSTALL_DIR)
+endef
+
+
+ti-xdais-source: $(DL_DIR)/$(TI_XDAIS_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-xdais))
\ No newline at end of file
-- 
1.7.0.4
