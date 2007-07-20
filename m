From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 04:13:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070720111322.BB26FA65A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 04:13:22 -0700 (Fri, 20 Jul 2007)
New Revision: 19177

Log:
Avoid repeated rebuild of u-boot

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 11:04:58 UTC (rev 19176)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 11:13:22 UTC (rev 19177)
@@ -82,7 +82,7 @@
 		-C $(UBOOT_DIR)	tools
 	touch $(MKIMAGE_BINLOC)
 
-$(UBOOT_BUILD_DIR)/u-boot.bin:	$(UBOOT_BUILD_DIR)/.configured $(UBOOT_BUILD_DIR)/.customized
+$(UBOOT_BUILD_DIR)/u-boot.bin:	$(UBOOT_BUILD_DIR)/.configured $(UBOOT_CUSTOM)
 	echo TARGET_CROSS=$(TARGET_CROSS)
 	$(MAKE) O=$(UBOOT_BUILD_DIR)		\
 		CROSS_COMPILE=$(TARGET_CROSS)	\
@@ -102,30 +102,30 @@
 
 uboot-bin:	$(BINARIES_DIR)/$(UBOOT_BIN)	/tftpboot/$(UBOOT_BIN)
 
-$(UBOOT_BUILD_DIR)/.customized:	.config	$(UBOOT_BUILD_DIR)/.configured
-	echo	"/* Automatically generated file, do not edit */"		>  $(UBOOT_CUSTOM)
+$(UBOOT_CUSTOM).test:	.config	$(UBOOT_BUILD_DIR)/.configured
+	echo	"/* Automatically generated file, do not edit */"		>  $(UBOOT_CUSTOM).test
 ifneq	($(TARGET_HOSTNAME),)
-	echo	"#if defined(CONFIG_HOSTNAME)"					>> $(UBOOT_CUSTOM)
-	echo	"#undef	 CONFIG_HOSTNAME"					>> $(UBOOT_CUSTOM)
-	echo	"#define CONFIG_HOSTNAME		$(TARGET_HOSTNAME)"	>> $(UBOOT_CUSTOM)
-	echo	"#endif"							>> $(UBOOT_CUSTOM)
+	echo	"#if defined(CONFIG_HOSTNAME)"					>> $(UBOOT_CUSTOM).test
+	echo	"#undef	 CONFIG_HOSTNAME"					>> $(UBOOT_CUSTOM).test
+	echo	"#define CONFIG_HOSTNAME		$(TARGET_HOSTNAME)"	>> $(UBOOT_CUSTOM).test
+	echo	"#endif"							>> $(UBOOT_CUSTOM).test
 endif
 ifneq	($(TARGET_UBOOT_IPADDR),)
-	echo	"#define CONFIG_IPADDR		$(TARGET_UBOOT_IPADDR)"		>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_IPADDR		$(TARGET_UBOOT_IPADDR)"		>> $(UBOOT_CUSTOM).test
 endif
 ifneq	($(TARGET_UBOOT_SERVERIP),)
-	echo	"#define CONFIG_SERVERIP		$(TARGET_UBOOT_SERVERIP)"	>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_SERVERIP	$(TARGET_UBOOT_SERVERIP)"	>> $(UBOOT_CUSTOM).test
 endif
 ifneq	($(TARGET_UBOOT_GATEWAY),)
-	echo	"#define CONFIG_GATEWAYIP	$(TARGET_UBOOT_GATEWAY)"	>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_GATEWAYIP	$(TARGET_UBOOT_GATEWAY)"	>> $(UBOOT_CUSTOM).test
 endif
 ifneq	($(TARGET_UBOOT_NETMASK),)
-	echo	"#define CONFIG_NETMASK		$(TARGET_UBOOT_NETMASK)"	>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_NETMASK		$(TARGET_UBOOT_NETMASK)"	>> $(UBOOT_CUSTOM).test
 endif
 ifneq	($(TARGET_UBOOT_ETHADDR),)
-	echo	"#define CONFIG_ETHADDR		$(TARGET_UBOOT_ETHADDR)"	>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_ETHADDR		$(TARGET_UBOOT_ETHADDR)"	>> $(UBOOT_CUSTOM).test
 endif
-	touch	$(UBOOT_BUILD_DIR)/.customized
+	diff -q $(UBOOT_CUSTOM).test $(UBOOT_CUSTOM) || cp -af $(UBOOT_CUSTOM).test $(UBOOT_CUSTOM)
 
 $(UBOOT_SCR):	.config
 ifneq	($(TARGET_UBOOT_IPADDR),)
