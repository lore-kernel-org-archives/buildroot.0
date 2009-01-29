From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 21:28:58 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20090129212858.35D4A76D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 21:28:57 +0000 (Thu, 29 Jan 2009)
New Revision: 25141

Log:
Clean up at91bootstrap

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2009-01-29 21:27:51 UTC (rev 25140)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2009-01-29 21:28:57 UTC (rev 25141)
@@ -1,12 +1,13 @@
-config BR2_TARGET_AT91BOOTSTRAP
+menuconfig BR2_TARGET_AT91BOOTSTRAP
 	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9260PF || \
 	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9G20DFC
 	bool "Build AT91 Bootstrap for selected chip"
 
+if	BR2_TARGET_AT91BOOTSTRAP
+
 config BR2_TARGET_AT91BOOTSTRAP_BOARD
 	string "Bootstrap board"
 	default "$(BOARD_NAME)"
-	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  This is used to do a make <board>_config
 
@@ -16,43 +17,52 @@
 	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  Select Chip for which AT91 bootstrap should be built
-	  Currently supports AT91SAM9260EK, AT91SAM9261EK,
-	  AT91SAM9XEEK, AT981SAM9263EK
 
-
 config BR2_TARGET_AT91BOOT_DATAFLASH
-        depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || \
-		BR2_TARGET_AT91SAM9XEEK  || BR2_TARGET_AT91SAM9G20DFC
+	bool "AT45 Dataflash"
+	depends on BR2_BOOTSOURCE_DATAFLASH
 
-	bool "Dataflash"
-
 config BR2_TARGET_AT91BOOT_DATAFLASHCARD
-       depends on BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9G20DFC
-	bool "Dataflash Card"
+	bool "AT45 Dataflash Card"
+	depends on BR2_BOOTSOURCE_DATAFLASHCARD
 
 config BR2_TARGET_AT91BOOT_NANDFLASH
-        depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9G20DFC
 	bool "NAND Flash"
+	depends on BR2_BOOTSOURCE_NANDFLASH
 
 config BR2_TARGET_AT91BOOT_FLASH
-        depends on BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9260PF
 	bool "Internal Flash or external parallel flash"
+	depends on BR2_BOOTSOURCE_FLASH
 
+config BR2_TARGET_AT91BOOT_SDCARD
+	bool "SD-Card"
+	depends on BR2_BOOTSOURCE_SDCARD
+
+config BR2_TARGET_AT91BOOT_EEPROM
+	bool "EEPROM"
+	depends on BR2_BOOTSOURCE_EEPROM
+
 endchoice
 
 config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 	string
+	depends on BR2_TARGET_AT91BOOTSTRAP
 	default	"dataflash"	if	BR2_TARGET_AT91BOOT_DATAFLASH
 	default	"dataflashcard"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
 	default	"flash"		if	BR2_TARGET_AT91BOOT_FLASH
+	default	"sdcard"	if	BR2_TARGET_AT91BOOT_SDCARD
+	default	"eeprom"	if	BR2_TARGET_AT91BOOT_EEPROM
 
 config	BR2_AT91BOOTSTRAP_IMG_SIZE
 	string	"Image Size to copy to SDRAM"
-	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH || BR2_TARGET_AT91BOOT_DATAFLASHCARD
+	depends on BR2_TARGET_AT91BOOTSTRAP
+	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH
+	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"0x30000"	if	BR2_TARGET_AT91BOOT_NANDFLASH
 	default	"0x100000"	if	BR2_TARGET_AT91BOOT_FLASH
-	depends on BR2_TARGET_AT91BOOTSTRAP
+	default	"0x30000"	if	BR2_TARGET_AT91BOOT_SDCARD
+	default	"0x30000"	if	BR2_TARGET_AT91BOOT_EEPROM
 	help
 	  Select the size of your application
 	  AT91 Bootstrap will copy this amount from flash to SDRAM
@@ -93,3 +103,7 @@
 comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
 	depends on BR2_TARGET_AT91BOOTSTRAP
 
+endif
+
+
+

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-29 21:27:51 UTC (rev 25140)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-29 21:28:57 UTC (rev 25141)
@@ -3,8 +3,6 @@
 # at91bootstrap
 #
 #############################################################
-#AT91BOOTSTRAP_VERSION:=2.3
-#AT91BOOTSTRAP_PATCH_LEVEL:=.4
 AT91BOOTSTRAP_VERSION:=2.10
 AT91BOOTSTRAP_PATCH_LEVEL:=
 AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
