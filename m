From: correa at uclibc.org <correa@uclibc.org>
Date: Wed, 11 Mar 2009 21:40:01 +0000 (UTC)
Subject: [Buildroot] svn commit: [25618] trunk/buildroot/target:
	device/Atmel/arch-arm/u-boot/2009.01 u-b etc...
Message-ID: <20090311214001.6C62776266@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-11 21:40:00 +0000 (Wed, 11 Mar 2009)
New Revision: 25618

Log:
Revert wrongly commited files (u-boot changes) from -r25617

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch	2009-03-11 21:35:07 UTC (rev 25617)
+++ trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch	2009-03-11 21:40:00 UTC (rev 25618)
@@ -109,8 +109,8 @@
 +	setenv("fs-date",	MK_STR(DATE));
 +	setenv("rd",		"rootfs.arm-"MK_STR(DATE)".ext2");
 +#endif
-+#if	defined(KERNEL_NAME)
-+	setenv("linux",		MK_STR(KERNEL_NAME));
++#if	defined(KERNEL_VERSION)
++	setenv("linux",		MK_STR(BOARD_NAME)"-linux-"MK_STR(KERNEL_VERSION)"-"MK_STR(DATE)".gz");
 +#endif
 +	setenv("get-ramdisk",	"tftp	${ramdisk}	${rd};		setenv rd-size	${filesize}");
 +	setenv("store-ramdisk",	"cp.b	${ramdisk}	${FS}		${rd-size}");
@@ -243,17 +243,32 @@
 +
 +int do_os (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[])
 +{
-+#if defined(KERNEL_NAME)
-+	setenv("linux", MK_STR(KERNEL_NAME));
-+#else
-+	setenv("linux", "uImage");
-+#endif
-+	return 0;
++	char *kchip;
++	char *kdate;
++	char *kver;
++	char cmd[512];
++	kchip = getenv("hostname");
++	kdate = getenv("kernel-date");
++	kver = getenv("kernel-version");
++	if((strlen(kdate) + strlen(kver) + 32) >  500) {
++		printf("Error: Environment too large during 'os': ");
++		printf("len=%d\n", strlen(kdate) + strlen(kver) + 32);
++	} else if(kver != NULL) {
++		if(kdate != NULL) {
++			sprintf(cmd,"%s-linux-%s-%s.gz",kchip,kver,kdate);
++		} else {
++			sprintf(cmd,"%s-linux-%s.gz",kchip,kver);
++		}
++		printf("Setting kernel to %s\n",cmd);
++		setenv("linux",cmd);
++		return 0;
++	}
++	return 1;
 +}
 +
 +U_BOOT_CMD(
 +	os,	1,	1,	do_os,
-+	"os\t- Select linux version\n"
++	"os\t- Select linux version  ${hostname}-linux-${kernel-name}-${kernel-date}\n"
 +	,	"\n"
 +);
 +

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-03-11 21:35:07 UTC (rev 25617)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-03-11 21:40:00 UTC (rev 25618)
@@ -111,7 +111,6 @@
 	@echo "#ifndef __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	$(call insert_define, DATE, $(DATE))
-	$(call insert_define, KERNEL_NAME, $(LINUX26_KERNEL_NAME))
 	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
 ifneq ($(strip $(BR2_PROJECT)),"")
 	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
