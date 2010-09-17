From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:51 -0700
Subject: [Buildroot] [PATCH 06/17] TI's Davinci Multimedia Application
	Interface (DMAI) for TI ARM/DSP processors
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-7-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                  |    1 +
 package/ti/ti-dmai/Config.in          |   14 ++++
 package/ti/ti-dmai/ti-dmai-Wall.patch |  129 +++++++++++++++++++++++++++++++++
 package/ti/ti-dmai/ti-dmai.mk         |  108 +++++++++++++++++++++++++++
 4 files changed, 252 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-dmai/Config.in
 create mode 100644 package/ti/ti-dmai/ti-dmai-Wall.patch
 create mode 100644 package/ti/ti-dmai/ti-dmai.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index b6179cb..e8b6197 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -44,5 +44,6 @@ comment "Staging tools"
 source "package/ti/ti-biosutils/Config.in"
 source "package/ti/ti-cgt6x/Config.in"
 source "package/ti/ti-codec-engine/Config.in"
+source "package/ti/ti-dmai/Config.in"
 
 endif
diff --git a/package/ti/ti-dmai/Config.in b/package/ti/ti-dmai/Config.in
new file mode 100644
index 0000000..3986ce6
--- /dev/null
+++ b/package/ti/ti-dmai/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_TI_DMAI
+	bool "Davinci Multimedia Application Interface (DMAI)"
+	depends on BR2_PACKAGE_TI_PLATFORM_omap3
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_TI_FRAMEWORK_COMPONENTS
+	select BR2_PACKAGE_TI_CODEC_ENGINE
+	select BR2_PACKAGE_TI_XDCTOOLS
+	select BR2_PACKAGE_TI_DSPBIOS
+	select BR2_PACKAGE_TI_CGT6X
+	select BR2_PACKAGE_TI_CODECS_OMAP3
+	select BR2_PACKAGE_TI_LINUXUTILS
+	help
+      Davinci Multimedia Application Interface (DMAI) for TI ARM/DSP processors
+      https://gforge.ti.com/gf/project/dmai/
diff --git a/package/ti/ti-dmai/ti-dmai-Wall.patch b/package/ti/ti-dmai/ti-dmai-Wall.patch
new file mode 100644
index 0000000..90a2d46
--- /dev/null
+++ b/package/ti/ti-dmai/ti-dmai-Wall.patch
@@ -0,0 +1,129 @@
+diff -rupN a/dmai/packages/ti/sdo/dmai/ce/I2p.c b/dmai/packages/ti/sdo/dmai/ce/I2p.c
+--- a/dmai/packages/ti/sdo/dmai/ce/I2p.c	2010-08-23 06:26:15.000000000 -0700
++++ b/dmai/packages/ti/sdo/dmai/ce/I2p.c	2010-08-23 13:26:06.000000000 -0700
+@@ -82,6 +82,8 @@ Int I2p_process(I2p_Handle hI2p, Buffer_
+     assert(Buffer_getSize(hInBuf));
+     assert(Buffer_getSize(hOutBuf));
+ 
++    universalOutArgs.extendedError        = NULL;
++
+     inputArgs.universalInArgs             = universalInArgs;
+     outputArgs.universalOutArgs           = universalOutArgs;
+     inputArgs.universalInArgs.size        = sizeof(inputArgs);
+diff -rupN a/dmai/packages/ti/sdo/dmai/linux/Display.c b/dmai/packages/ti/sdo/dmai/linux/Display.c
+--- a/dmai/packages/ti/sdo/dmai/linux/Display.c	2010-08-23 06:26:17.000000000 -0700
++++ b/dmai/packages/ti/sdo/dmai/linux/Display.c	2010-08-23 13:29:41.000000000 -0700
+@@ -288,6 +288,7 @@ static Int sysfsSetup_device (FsOptions 
+                                                                 const Char *fileName)
+ {
+     int     index=0;
++    int     _sys =0;
+ 
+     while ((command != displayCommand[index].command) && 
+             (displayCommand[index].command != FsOptions_COMMANDS_END)){
+@@ -300,45 +301,45 @@ static Int sysfsSetup_device (FsOptions 
+     }
+ 
+     if (displayCommand[index].command == FsOptions_FBSET_DVI) {
+-        system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
+-        system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
++        _sys = system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480");
+     }
+     else if (displayCommand[index].command == FsOptions_FBSET_LCD){
+-        system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
+-        system("fbset -fb /dev/fb0 -xres 480 -yres 640 -vxres 480 -vyres 640");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
++        _sys = system("fbset -fb /dev/fb0 -xres 480 -yres 640 -vxres 480 -vyres 640");
+     }
+     else if (displayCommand[index].command == FsOptions_FBSET_TV){
+-        system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
+-        system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
+-        system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480 -depth 16");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
++        _sys = system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480 -depth 16");
+     }
+     else if (displayCommand[index].command == FsOptions_FBSET_TV_LCD){
+-        system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
+-        system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
+-        system("fbset -fb /dev/fb0 -xres 480 -yres 640 -vxres 480 -vyres 640 ");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
++        _sys = system("fbset -fb /dev/fb0 -xres 480 -yres 640 -vxres 480 -vyres 640 ");
+     }
+     else if (displayCommand[index].command == FsOptions_FBSET_TV_DVI){
+-        system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
+-        system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
+-        system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
+-        system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
+-        system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/overlay0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display0/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display1/enabled");
++        _sys = system("echo 0 > /sys/devices/platform/omapdss/display2/enabled");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/manager0/display");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay0/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay1/manager");
++        _sys = system("echo \"\" > /sys/devices/platform/omapdss/overlay2/manager");
++        _sys = system("fbset -fb /dev/fb0 -xres 720 -yres 480 -vxres 720 -vyres 480");
+     }
+     /* Write command in sysfs file */
+     else if ( _Dmai_writeSysFs(fileName, displayCommand[index].value) < 0) {
+@@ -448,6 +449,7 @@ Int _Display_sysfsChange(Display_Output 
+ {
+ #ifdef Dmai_Device_omap3530
+     FsOptionsSequence *sequence = NULL;
++    int _sys                    = 0;
+     Display_Output  currentDisplayOutput;
+ 
+     /* List of Sequences using the FileSystem entries to switch displays */        
+@@ -581,7 +583,7 @@ Int _Display_sysfsChange(Display_Output 
+             *rotation = 0;
+         }
+         if (currentDisplayOutput == Display_Output_SVIDEO){
+-            system("fbset -fb /dev/fb0 -depth 16");
++            _sys = system("fbset -fb /dev/fb0 -depth 16");
+         }
+         *displayOutput = currentDisplayOutput; 
+     }
+diff -rupN a/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c b/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c
+--- a/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c	2010-08-23 06:26:17.000000000 -0700
++++ b/dmai/packages/ti/sdo/dmai/linux/Display_fbdev.c	2010-08-23 13:27:28.000000000 -0700
+@@ -134,7 +134,7 @@ Display_Handle Display_fbdev_create(BufT
+     Int                      displaySize;
+     Int                      bufIdx;
+     Int8                    *virtPtr;
+-    Int32                    physPtr;
++    Int32                    physPtr       = 0;
+     Int                      height, width;
+     Display_Handle           hDisplay;
+     Buffer_Handle            hBuf;
diff --git a/package/ti/ti-dmai/ti-dmai.mk b/package/ti/ti-dmai/ti-dmai.mk
new file mode 100644
index 0000000..409ca2b
--- /dev/null
+++ b/package/ti/ti-dmai/ti-dmai.mk
@@ -0,0 +1,108 @@
+################################################################################
+#
+# ti-dmai
+#
+################################################################################
+TI_DMAI_VERSION:=2.05.00.14
+TI_DMAI_FILE_VERSION:=2_05_00_14
+TI_DMAI_SOURCE:=ti-dmai-$(TI_DMAI_VERSION).tar.gz
+TI_DMAI_SOURCE_DIR:=davinci_multimedia_application_interface
+TI_DMAI_SITE:=https://gforge.ti.com/svn/dmai/tags
+TI_DMAI_SITE_TAG:=TAG_$(TI_DMAI_FILE_VERSION)
+
+TI_DMAI_DEPENDENCIES=alsa-lib ti-framework-components ti-codec-engine ti-xdctools 
+
+TI_DMAI_DIR:=$(BUILD_DIR)/ti-dmai-$(TI_DMAI_VERSION)
+
+TI_DMAI_INSTALL_STAGING = YES
+
+TI_DMAI_INSTALL_TARGET_DIR:=$(STAGING_DIR)/usr/lib/ti-dmai
+TI_DMAI_INSTALL_STAGING_DIR:=$(STAGING_DIR)/ti/dmai-$(TI_DMAI_VERSION)
+
+TI_DMAI_PLATFORM=UNDEFINED
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omap3),y)
+	TI_DMAI_PLATFORM=o3530_al
+	TI_DMAI_DEPENDENCIES+=ti-codecs-omap3
+	TI_DMAI_CODEC_INSTALL_DIR=$(TI_CODECS_OMAP3_INSTALL_STAGING_DIR)
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm6446),y)
+	TI_DMAI_PLATFORM=dm6446_al
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm6467),y)
+	TI_DMAI_PLATFORM=dm6467_al
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm355),y)
+	TI_DMAI_PLATFORM=dm355_al
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_dm365),y)
+	TI_DMAI_PLATFORM=dm365_al
+	TI_DMAI_DEPENDENCIES+=ti-dvsdk-dm365
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omapl137),y)
+	TI_DMAI_PLATFORM=omapl137_al
+endif
+ifeq ($(BR2_PACKAGE_TI_PLATFORM_omapl138),y)
+	TI_DMAI_PLATFORM=omapl138_al
+endif
+
+
+TI_DMAI_MAKE_ENV = \
+	PARALLEL_MAKE="" \
+	USER_XDC_PATH=$(TI_CODEC_ENGINE_INSTALL_STAGING_DIR)/examples \
+	XDC_INSTALL_DIR=$(TI_XDCTOOLS_INSTALL_DIR) \
+	CE_INSTALL_DIR=$(TI_CODEC_ENGINE_INSTALL_STAGING_DIR) \
+	CODEC_INSTALL_DIR=$(TI_DMAI_CODEC_INSTALL_DIR) \
+	FC_INSTALL_DIR=$(TI_FRAMEWORK_COMPONENTS_INSTALL_DIR) \
+	LINUXKERNEL_INSTALL_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION) \
+	CODEGEN_INSTALL_DIR=$(TI_CGT6X_INSTALL_DIR) \
+	BIOS_INSTALL_DIR=$(TI_DSPBIOS_INSTALL_DIR) \
+	LINUXLIBS_INSTALL_DIR=$(STAGING_DIR)/usr \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	VERBOSE="true" \
+	XDAIS_INSTALL_DIR=$(TI_XDAIS_INSTALL_DIR) \
+	LINK_INSTALL_DIR=$(TI_DSPLINK_INSTALL_STAGING_DIR) \
+	CMEM_INSTALL_DIR=$(TI_LINUXUTILS_INSTALL_STAGING_DIR) \
+	LPM_INSTALL_DIR=$(TI_LOCAL_POWER_MANAGER_INSTALL_STAGING_DIR) \
+	MVTOOL_PREFIX=$(TARGET_CROSS) \
+	PLATFORM=$(TI_DMAI_PLATFORM) \
+	LD_FLAGS="$(TARGET_LDFLAGS)" \
+	C_FLAGS="$(TARGET_CFLAGS) -fPIC"
+
+$(DL_DIR)/$(TI_DMAI_SOURCE):
+	(cd $(DL_DIR);\
+		svn --non-interactive --username anonymous --password "" checkout $(TI_DMAI_SITE)/$(TI_DMAI_SITE_TAG) \
+	)
+	find $(DL_DIR)/$(TI_DMAI_SITE_TAG) -type d -name ".svn" | xargs rm -rf
+	(cd $(DL_DIR)/$(TI_DMAI_SITE_TAG);\
+		sleep 10; \
+		tar -czf $(DL_DIR)/$(TI_DMAI_SOURCE) $(TI_DMAI_SOURCE_DIR)\
+	)
+	rm -rf $(DL_DIR)/$(TI_DMAI_SITE_TAG)
+
+define TI_DMAI_CONFIGURE_CMDS
+	$(MAKE) -C $(TI_DMAI_DIR) $(TI_DMAI_MAKE_ENV) clean
+endef
+
+define TI_DMAI_BUILD_CMDS
+	$(MAKE) -C $(TI_DMAI_DIR)/dmai $(TI_DMAI_MAKE_ENV) all
+endef
+
+define TI_DMAI_INSTALL_STAGING_CMDS
+	mkdir -p $(TI_DMAI_INSTALL_STAGING_DIR)
+	cp -r $(TI_DMAI_DIR)/* $(TI_DMAI_INSTALL_STAGING_DIR)
+	chmod -R +w $(TI_DMAI_INSTALL_STAGING_DIR)	
+endef
+
+define TI_DMAI_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TI_DMAI_INSTALL_TARGET_DIR)/apps 
+	$(MAKE) -C $(TI_DMAI_DIR)/dmai $(TI_DMAI_MAKE_ENV) EXEC_DIR=$(TI_DMAI_INSTALL_TARGET_DIR) install 
+endef
+
+define TI_DMAI_UNINSTALL_STAGING_CMDS
+	rm -rf $(TI_DMAI_INSTALL_DIR)
+endef
+
+ti-dmai-source: $(DL_DIR)/$(TI_DMAI_SOURCE)
+
+
+$(eval $(call GENTARGETS,package/ti,ti-dmai))
\ No newline@end of file
-- 
1.7.0.4
