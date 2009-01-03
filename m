From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 00:02:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090103000208.59551769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 00:02:07 +0000 (Sat, 03 Jan 2009)
New Revision: 24653

Log:
Add Memory configration to u-boot (Config.in) and remove comments from 'choice's', Rearrange options for clarity

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-03 00:00:46 UTC (rev 24652)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-03 00:02:07 UTC (rev 24653)
@@ -11,6 +11,14 @@
 	  Build "Das U-Boot" Boot Monitor
 
 if BR2_TARGET_UBOOT
+config BR2_TARGET_UBOOT_BOARDNAME
+	string "board name"
+	depends on BR2_TARGET_UBOOT
+	default "$(BOARD_NAME)"
+	help
+	  One of U-Boot supported boards to be built.
+	  This will be suffixed with _config to meet U-Boot standard naming.
+
 choice
 	prompt "U-Boot Version"
 	default BR2_TARGET_UBOOT_2009_01_RC1
@@ -20,27 +28,18 @@
 config BR2_TARGET_UBOOT_2009_01_RC1
 	bool "u-boot-2009.01-rc1"
 	depends on BR2_TARGET_UBOOT
-	help
-	  Use u-boot from December 2008 (RC1)
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
 	depends on BR2_TARGET_UBOOT
-	help
-	  Use u-boot from October 2008
 	
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
 	depends on BR2_TARGET_UBOOT
-	help
-	  Use u-boot from mid 2008
 	
 config BR2_TARGET_UBOOT_2009_01
 	bool "u-boot-2009.01"
 	depends on BR2_TARGET_UBOOT
-	help
-	  Use u-boot from January 2009
-	  Release date 2009-01-17
 
 endchoice
 
@@ -51,14 +50,6 @@
 	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 
-config BR2_TARGET_UBOOT_BOARDNAME
-	string "board name"
-	depends on BR2_TARGET_UBOOT
-	default "$(BOARD_NAME)"
-	help
-	  One of U-Boot supported boards to be built.
-	  This will be suffixed with _config to meet U-Boot standard naming.
-
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
 	depends on BR2_TARGET_UBOOT
@@ -74,42 +65,27 @@
 	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD
 	bool "Boot from dataflashcard"
 	depends on BR2_BOOTSOURCE_DATAFLASHCARD
-	help
-	  
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	bool "Boot from dataflash
 	depends on BR2_BOOTSOURCE_DATAFLASH
-	help
-	  
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH
 	bool "Boot from a NAND flash"
 	depends on BR2_BOOTSOURCE_NANDFLASH
-	help
-	  Build u-boot with environment in the NAND flash
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_FLASH
 	bool "Boot from a parallell flash"
 	depends on BR2_BOOTSOURCE_FLASH
-	help
-	  Build u-boot with environment in a flash RAM
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD
-	bool "Boot from a NAND flash"
+	bool "Boot from an SD-Card"
 	depends on BR2_BOOTSOURCE_SDCARD
-	help
-	  Build u-boot with environment on an SD-Card
-	  Not yet supported
 
 	config BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM
-	bool "Boot from a serial EEPROM"
+	bool "Boot from a serial EEPROM (Not yet supported)"
 	depends on BR2_BOOTSOURCE_EEPROM
-	help
-	  Build u-boot with environment in a serial EEPROM
-	  Not yet supported
 
-
 endchoice
 
 config BR2_TARGET_UBOOT_BOOTSOURCE
@@ -122,6 +98,181 @@
 	default "sdcard"	if BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD
 	default "eeprom"	if BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM
 
+config BR2_TARGET_UBOOT_SILENT
+	bool "silent console"
+	depends on BR2_TARGET_UBOOT
+	help
+	  If the option has been enabled, the output can be
+	  silenced by setting the environment variable "silent".
+
+config BR2_TARGET_UBOOT_TOOL_MKIMAGE
+	bool "mkimage tool in target"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Install mkimage tool in target.
+
+config BR2_TARGET_UBOOT_TOOL_ENV
+	bool "fw_printenv tool in target"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Install fw_printenv / fw_setenv tools in target.
+
+
+choice
+	prompt "SDRAM Memory size"
+	default BR2_TARGET_UBOOT_SDRAM_SIZE_64M
+	help
+	  Size of the onboard SDRAM
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_256MB
+	bool "256 MB"
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_128MB
+	bool "128 MB"
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_64MB
+	bool "64 MB"
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_32MB
+	bool "32 MB"
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_16MB
+	bool "16 MB"
+
+config BR2_TARGET_UBOOT_SDRAM_SIZE_8MB
+	bool "8 MB"
+
+endchoice
+
+config BR2_TARGET_UBOOT_MEMORY_SIZE
+	string
+	default "256M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_256MB
+	default "128M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_128MB
+	default "64M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_64MB
+	default "32M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_32MB
+	default "16M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_16MB
+	default "8M"	if BR2_TARGET_UBOOT_SDRAM_SIZE_8MB
+
+choice
+	prompt "Kernel Size"
+	default BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
+	bool "Kernel size is less than 1.25 MB"
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
+	bool "Kernel size is less than 1.50 MB"
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
+	bool "Kernel size is less than 1.75 MB"
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
+	bool "Kernel size is less than 2.00 MB"
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
+	bool "Kernel size is less than 2.25 MB"
+
+config BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
+	bool "Kernel size is less than 2.50 MB"
+
+endchoice
+
+choice
+	prompt "Dataflash Size"
+	default BR2_TARGET_UBOOT_DATAFLASH_SIZE_2_00MB
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
+	bool "Dataflash size is 8 MB"
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB
+	bool "Dataflash size is 4 MB"
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB
+	bool "Dataflash size is 2 MB"
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_1MB
+	bool "Dataflash size is 1 MB"
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB
+	bool "Dataflash size is 0.5 MB"
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB
+	bool "Dataflash size is 0.25 MB"
+
+endchoice
+
+config BR2_TARGET_UBOOT_DATAFLASH_SIZE
+	string
+	default "8M"	if BR2_TARGET_DATAFLASH_SIZE_8MB
+	default "4M"	if BR2_TARGET_DATAFLASH_SIZE_4MB
+	default "2M"	if BR2_TARGET_DATAFLASH_SIZE_2MB
+	default "1M"	if BR2_TARGET_DATAFLASH_SIZE_1MB
+	default "0.5M"	if BR2_TARGET_DATAFLASH_SIZE_0_50MB
+	default "0.25M"	if BR2_TARGET_DATAFLASH_SIZE_0_25MB
+
+config BR2_TARGET_UBOOT_END_OF_FLASH
+	string
+	default "C083FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
+	default "C041FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB
+	default "C020FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB
+	default "C0107FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_1MB
+	default "C0083FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB
+	default "C0041FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB
+	help
+	  
+
+config BR2_TARGET_UBOOT_KERNEL_START
+	string "Kernel SDRAM address"
+	default "21000000"
+	help
+	  Kernel is loaded to this address in SDRAM 
+
+config BR2_TARGET_UBOOT_KERNEL_LOCATION
+	string "Kernel flash address"
+	default "C0042000"
+	help
+	  Kernel location in dataflash
+
+config BR2_TARGET_UBOOT_FILESYSTEM_START
+	string
+	default "2114A000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
+	default "2118C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
+  	default "211CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
+  	default "21210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
+  	default "21252000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
+  	default "21294000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
+	help
+	  Kernel is loaded to this SDRAM address
+	  Assumes SDRAM starts at 20000000
+	  Will need to be updated if the SDRAM is located elsewhere
+
+config BR2_TARGET_UBOOT_FILESYSTEM_LOCATION
+	string
+	default "C018C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
+  	default "C01CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
+  	default "C0210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
+  	default "C0252000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB
+  	default "C0294000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB
+  	default "C02D6000" if BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB
+	help
+	  Determine location for File System in Dataflash
+	  This needs to be updated for other memory technologies
+
+config BR2_TARGET_UBOOT_FILESYSTEM_SIZE
+	string "File System Size"
+	default "6000000"
+	help
+	  
+
+menuconfig BR2_TARGET_UBOOT_NETWORK
+	bool "Network Settings"
+	default y
+	depends on BR2_TARGET_UBOOT
+	help
+	  Network settings for U-boot
+
+if BR2_TARGET_UBOOT_NETWORK
+
 config BR2_TARGET_UBOOT_SERVERIP
 	string "server ip"
 	depends on BR2_TARGET_UBOOT
@@ -164,25 +315,8 @@
 	depends on BR2_TARGET_AVR32
 	help
 	  Target MAC address for the second ethernet interface.
+endif
 
-config BR2_TARGET_UBOOT_SILENT
-	bool "silent console"
-	depends on BR2_TARGET_UBOOT
-	help
-	  If the option has been enabled, the output can be
-	  silenced by setting the environment variable "silent".
-
-config BR2_TARGET_UBOOT_TOOL_MKIMAGE
-	bool "mkimage tool in target"
-	depends on BR2_TARGET_UBOOT
-	help
-	  Install mkimage tool in target.
-
-config BR2_TARGET_UBOOT_TOOL_ENV
-	bool "fw_printenv tool in target"
-	depends on BR2_TARGET_UBOOT
-	help
-	  Install fw_printenv / fw_setenv tools in target.
 endif
 
 config BR2_BOOTSOURCE_DATAFLASHCARD
