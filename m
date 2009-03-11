From: correa at uclibc.org <correa@uclibc.org>
Date: Wed, 11 Mar 2009 21:35:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [25617] trunk/buildroot: package/qtopia4
	target/device/Atmel/arch etc...
Message-ID: <20090311213508.40B567645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-11 21:35:07 +0000 (Wed, 11 Mar 2009)
New Revision: 25617

Log:
Let user skip installation of the GUI module for Qtopia

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-11 21:15:51 UTC (rev 25616)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-11 21:35:07 UTC (rev 25617)
@@ -88,6 +88,13 @@
 	  library with proxy code and increase the space required on target.
 	  If unsure say n.
 
+config BR2_PACKAGE_QTOPIA4_GUI_MODULE
+	bool "Gui Module"
+	help
+	  Turns on support to Gui applications. If your board don't have
+	  video output, or you don't require Qt GUI, say n.
+
+if BR2_PACKAGE_QTOPIA4_GUI_MODULE
 menu "Pixel depths"
 comment "Deselecting each option leads to Qt's default (8,16,32)"
 
@@ -128,6 +135,7 @@
 
 endif
 endmenu
+endif
 
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-11 21:15:51 UTC (rev 25616)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-03-11 21:35:07 UTC (rev 25617)
@@ -420,6 +420,10 @@
 	cp -dpfr $(STAGING_DIR)/usr/plugins/phonon_backend $(TARGET_DIR)/usr/plugins/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/phonon_backend/*
 endif
+ifneq ($(BR2_PACKAGE_QTOPIA4_GUI_MODULE),y)
+	# Remove Gui library, not needed
+	-rm $(TARGET_DIR)/usr/lib/libQtGui*
+endif
 ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*

Modified: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch	2009-03-11 21:15:51 UTC (rev 25616)
+++ trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch	2009-03-11 21:35:07 UTC (rev 25617)
@@ -109,8 +109,8 @@
 +	setenv("fs-date",	MK_STR(DATE));
 +	setenv("rd",		"rootfs.arm-"MK_STR(DATE)".ext2");
 +#endif
-+#if	defined(KERNEL_VERSION)
-+	setenv("linux",		MK_STR(BOARD_NAME)"-linux-"MK_STR(KERNEL_VERSION)"-"MK_STR(DATE)".gz");
++#if	defined(KERNEL_NAME)
++	setenv("linux",		MK_STR(KERNEL_NAME));
 +#endif
 +	setenv("get-ramdisk",	"tftp	${ramdisk}	${rd};		setenv rd-size	${filesize}");
 +	setenv("store-ramdisk",	"cp.b	${ramdisk}	${FS}		${rd-size}");
@@ -243,32 +243,17 @@
 +
 +int do_os (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
 +{
-+	char *kchip;
-+	char *kdate;
-+	char *kver;
-+	char cmd[512];
-+	kchip = getenv("hostname");
-+	kdate = getenv("kernel-date");
-+	kver = getenv("kernel-version");
-+	if((strlen(kdate) + strlen(kver) + 32) >  500) {
-+		printf("Error: Environment too large during 'os': ");
-+		printf("len=%d\n", strlen(kdate) + strlen(kver) + 32);
-+	} else if(kver != NULL) {
-+		if(kdate != NULL) {
-+			sprintf(cmd,"%s-linux-%s-%s.gz",kchip,kver,kdate);
-+		} else {
-+			sprintf(cmd,"%s-linux-%s.gz",kchip,kver);
-+		}
-+		printf("Setting kernel to %s\n",cmd);
-+		setenv("linux",cmd);
-+		return 0;
-+	}
-+	return 1;
++#if defined(KERNEL_NAME)
++	setenv("linux", MK_STR(KERNEL_NAME));
++#else
++	setenv("linux", "uImage");
++#endif
++	return 0;
 +}
 +
 +U_BOOT_CMD(
 +	os,	1,	1,	do_os,
-+	"os\t- Select linux version  ${hostname}-linux-${kernel-name}-${kernel-date}\n"
++	"os\t- Select linux version\n"
 +	,	"\n"
 +);
 +

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-03-11 21:15:51 UTC (rev 25616)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-03-11 21:35:07 UTC (rev 25617)
@@ -111,6 +111,7 @@
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	$(call insert_define, DATE, $(DATE))
+	$(call insert_define, KERNEL_NAME, $(LINUX26_KERNEL_NAME))
 	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
 ifneq ($(strip $(BR2_PROJECT)),"")
 	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
