From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:54 -0700
Subject: [Buildroot] [PATCH 09/17] DSPLink Inter-Processor Communications
	(IPC) for TI's processors
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-10-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                               |    1 +
 package/ti/ti-dsplink/Config.in                    |   12 ++
 .../ti/ti-dsplink/ti-dsplink-1.65.00.03-fpic.patch |   12 ++
 package/ti/ti-dsplink/ti-dsplink.mk                |  137 ++++++++++++++++++++
 4 files changed, 162 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-dsplink/Config.in
 create mode 100644 package/ti/ti-dsplink/ti-dsplink-1.65.00.03-fpic.patch
 create mode 100644 package/ti/ti-dsplink/ti-dsplink.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index f127c92..9827b44 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -39,6 +39,7 @@ endchoice
 
 comment "Target components"
 source "package/ti/ti-codecs-omap3/Config.in"
+source "package/ti/ti-dsplink/Config.in"
 
 comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
diff --git a/package/ti/ti-dsplink/Config.in b/package/ti/ti-dsplink/Config.in
new file mode 100644
index 0000000..8c4d353
--- /dev/null
+++ b/package/ti/ti-dsplink/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TI_DSPLINK
+	bool "DSPLink Inter-Processor Communications (IPC)"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	# Could also be used for: BR2_PACKAGE_TI_PLATFORM_dm6467 ||  BR2_PACKAGE_TI_PLATFORM_omapl137 || BR2_PACKAGE_TI_PLATFORM_omapl138 || 
+	select BR2_PACKAGE_TI_DSPBIOS
+	select BR2_PACKAGE_TI_XDCTOOLS
+	help
+	  DSPLINK Inter-Processor Communications (IPC) for TI ARM/DSP processors
+	  http://software-dl.ti.com/dsps/dsps_public_sw/DSPLink/index.html
+		
+	  You will need to add a startup script to load the kernel module manually.
+	
\ No newline at end of file
diff --git a/package/ti/ti-dsplink/ti-dsplink-1.65.00.03-fpic.patch b/package/ti/ti-dsplink/ti-dsplink-1.65.00.03-fpic.patch
new file mode 100644
index 0000000..a3e7ca5
--- /dev/null
+++ b/package/ti/ti-dsplink/ti-dsplink-1.65.00.03-fpic.patch
@@ -0,0 +1,12 @@
+diff -rup a/dsplink/make/Linux/omap3530_2.6.mk b/dsplink/make/Linux/omap3530_2.6.mk
+--- a/dsplink/make/Linux/omap3530_2.6.mk	2010-07-16 02:03:04.000000000 -0700
++++ b/dsplink/make/Linux/omap3530_2.6.mk	2010-08-23 11:18:35.000000000 -0700
+@@ -129,7 +129,7 @@ CC_SW_DEB       := -g
+ #   ----------------------------------------------------------------------------
+ #   Standard flags for the compiler
+ #   ----------------------------------------------------------------------------
+-STD_USER_FLAGS  := -Wall -c
++STD_USER_FLAGS  := -Wall -fPIC -c
+ 
+ #   ----------------------------------------------------------------------------
+ #   Standard flags for the compiler when building an executable
diff --git a/package/ti/ti-dsplink/ti-dsplink.mk b/package/ti/ti-dsplink/ti-dsplink.mk
new file mode 100644
index 0000000..4323c4f
--- /dev/null
+++ b/package/ti/ti-dsplink/ti-dsplink.mk
@@ -0,0 +1,137 @@
+################################################################################
+#
+# ti-dsplink
+#
+################################################################################
+TI_DSPLINK_VERSION:=1.65.00.03
+TI_DSPLINK_FILE_VERSION_MAJOR:=1_65
+TI_DSPLINK_FILE_VERSION:=$(TI_DSPLINK_FILE_VERSION_MAJOR)_00_03
+TI_DSPLINK_SOURCE = dsplink_linux_$(TI_DSPLINK_FILE_VERSION).tar.gz
+TI_DSPLINK_SITE = http://software-dl.ti.com/dsps/dsps_public_sw/DSPLink/$(TI_DSPLINK_FILE_VERSION_MAJOR)/$(TI_DSPLINK_FILE_VERSION)/$(TI_DSPLINK_VERSION)
+TI_DSPLINK_DIR:=$(BUILD_DIR)/ti-dsplink-$(TI_DSPLINK_VERSION)
+TI_DSPLINK_PATH:=$(TI_DSPLINK_DIR)/dsplink
+
+TI_DSPLINK_INSTALL_STAGING = YES
+
+TI_DSPLINK_DEPENDENCIES = ti-xdctools ti-dspbios linux26
+
+TI_DSPLINK_INSTALL_STAGING_DIR=$(STAGING_DIR)/ti/dsplink-$(TI_DSPLINK_VERSION)/packages
+
+TI_DSPLINK_DSPNUM=1
+TI_DSPLINK_DSP_COMP=ponslrmc
+TI_DSPLINK_DSPPOS=DSPBIOS5XX
+TI_DSPLINK_PLATFORM=UNDEFINED
+TI_DSPLINK_DSPCFG=UNDEFINED
+TI_DSPLINK_DSP=UNDEFINED
+TI_DSPLINK_GPPOS=UNDEFINED
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omap3),y)
+	TI_DSPLINK_PLATFORM=OMAP3530
+	TI_DSPLINK_DSPCFG=OMAP3530SHMEM
+	TI_DSPLINK_DSP=OMAP3530_0
+	TI_DSPLINK_GPPOS=OMAPLSP
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm6446),y)
+	TI_DSPLINK_PLATFORM=DAVINCI
+	TI_DSPLINK_DSPCFG=DM6446GEMSHMEM
+	TI_DSPLINK_DSP=DM6446GEM_0
+	TI_DSPLINK_GPPOS=DM6446LSP
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm6467),y)
+	TI_DSPLINK_PLATFORM=DAVINCIHD
+	TI_DSPLINK_DSPCFG=DM6467GEMSHMEM
+	TI_DSPLINK_DSP=DM6467GEM_0
+	TI_DSPLINK_GPPOS=DM6467LSP
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omapl137),y)
+	TI_DSPLINK_PLATFORM=OMAPL1XX
+	TI_DSPLINK_DSPCFG=OMAPL1XXGEMSHMEM
+	TI_DSPLINK_DSP=OMAPL1XXGEM_0
+	TI_DSPLINK_GPPOS=ARM
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omapl138),y)
+	TI_DSPLINK_PLATFORM=OMAPL138
+	TI_DSPLINK_DSPCFG=OMAPL138GEMSHMEM
+	TI_DSPLINK_DSP=OMAPL138GEM_0
+	TI_DSPLINK_GPPOS=ARM
+endif
+
+
+define TI_DSPLINK_CONFIGURE_CMDS
+	(export DSPLINK=$(TI_DSPLINK_PATH); \
+	 export C_FLAGS="$(TARGET_CFLAGS) -fPIC"; \
+	 export LD_FLAGS ="$(TARGET_LDFLAGS)";  \
+		/usr/bin/perl $(TI_DSPLINK_PATH)/config/bin/dsplinkcfg.pl \
+			--platform=$(TI_DSPLINK_PLATFORM) \
+			--nodsp=$(TI_DSPLINK_DSPNUM) \
+			--dspcfg_0=$(TI_DSPLINK_DSPCFG) \
+			--dspos_0=$(TI_DSPLINK_DSPPOS) \
+			--comps=$(TI_DSPLINK_DSP_COMP) \
+			--gppos=$(TI_DSPLINK_GPPOS) \
+	)
+	(cd $(TI_DSPLINK_PATH); XDCPATH=$(TI_XDCTOOLS_INSTALL_DIR) $(TI_XDCTOOLS_INSTALL_DIR)/xdc .make -PR .)
+	(cd $(TI_DSPLINK_PATH); XDCPATH=$(TI_XDCTOOLS_INSTALL_DIR) $(TI_XDCTOOLS_INSTALL_DIR)/xdc clean -PR .)
+	(cd $(TI_DSPLINK_PATH); XDCPATH=$(TI_XDCTOOLS_INSTALL_DIR) $(TI_XDCTOOLS_INSTALL_DIR)/xdc .interfaces -PR .)
+endef
+
+define TI_DSPLINK_BUILD_CMDS
+ 	$(MAKE) -C $(TI_DSPLINK_PATH)/gpp/src/api \
+		DSPLINK=$(TI_DSPLINK_PATH) \
+		CROSS_COMPILE="$(TOOLCHAIN_EXTERNAL_PREFIX)" \
+		AR="$(TARGET_CROSS)ar" \
+		LD="$(TARGET_LD)" \
+		COMPILER="$(TARGET_CC)" \
+		ARCHIVER="$(TARGET_CROSS)ar" \
+ 		KERNEL_DIR="$(BUILD_DIR)/linux-$(LINUX26_VERSION)" \
+ 			all
+	# Build the gpp kernel space (debug and release)
+	$(MAKE) -C $(TI_DSPLINK_PATH)/gpp/src \
+		DSPLINK=$(TI_DSPLINK_PATH) \
+		OBJDUMP="$(TARGET_CROSS)objdump" \
+		CROSS_COMPILE="$(TARGET_CROSS)" \
+		CC="$(TARGET_CC)" \
+		AR="$(TARGET_CROSS)ar" \
+		LD="$(TARGET_LD)" \
+		COMPILER="$(TARGET_CC)" \
+		ARCHIVER="$(TARGET_CROSS)ar" \
+		KERNEL_DIR="$(BUILD_DIR)/linux-$(LINUX26_VERSION)" \
+		BASE_BUILDOS="$(BUILD_DIR)/linux-$(LINUX26_VERSION)" \
+			all
+	# Build the dsp library (debug and release)
+ 	$(MAKE) -C $(TI_DSPLINK_PATH)/dsp/src \
+		DSPLINK=$(TI_DSPLINK_PATH) \
+ 		BASE_CGTOOLS="$(TI_CGT6X_INSTALL_DIR)" \
+		BASE_SABIOS="$(TI_DSPBIOS_INSTALL_DIR)" \
+			all
+endef
+
+define TI_DSPLINK_INSTALL_STAGING_CMDS
+	# Install/Stage the Source Tree
+	$(INSTALL) -d $(TI_DSPLINK_INSTALL_STAGING_DIR)
+	cp -pPrf $(TI_DSPLINK_DIR)/* $(TI_DSPLINK_INSTALL_STAGING_DIR)
+	chmod -R +w $(TI_DSPLINK_INSTALL_STAGING_DIR)
+
+	# Changes path of include txt file to use LINK_INSTALL_DIR variable for GPP
+	i_find=`find $(TI_DSPLINK_INSTALL_STAGING_DIR)/dsplink/gpp/export/BIN/Linux/$(TI_DSPLINK_PLATFORM)/*/ -name "*.txt"` ; \
+	for i in $$i_find; do \
+		sed -i $$i -e s=$(TI_DSPLINK_PATH)=$(TI_DSPLINK_INSTALL_STAGING_DIR)=g ; \
+  done; 
+
+	#Changes path of include txt file to use LINK_INSTALL_DIR variable for DSP 
+	i_find=`find $(TI_DSPLINK_INSTALL_STAGING_DIR)/dsplink/dsp/export/BIN/DspBios/$(TI_DSPLINK_PLATFORM)/$(TI_DSPLINK_DSP)/*/ -name "*.txt"` ; \
+	for i in $$i_find; do \
+		sed -i $$i -e s=$(TI_DSPLINK_PATH)=$(TI_DSPLINK_INSTALL_STAGING_DIR)=g ; \
+  done ;
+endef
+
+define TI_DSPLINK_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp
+	$(INSTALL) -m 0644 $(TI_DSPLINK_PATH)/gpp/export/BIN/Linux/$(TI_DSPLINK_PLATFORM)/RELEASE/dsplinkk.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/dsplinkk.ko
+endef
+
+define TI_DSPLINK_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/dsplinkk.ko
+endef
+
+
+$(eval $(call GENTARGETS,package/ti,ti-dsplink))
+
-- 
1.7.0.4
