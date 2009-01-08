From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  8 Jan 2009 14:58:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090108145854.D53BF77106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-08 14:58:54 +0000 (Thu, 08 Jan 2009)
New Revision: 24724

Log:
target/u-boot: more cleanups

As discussed on the list.

- No sense in depending on BR2_TARGET_UBOOT when the configurations are
  within a if BR2_TARGET_UBOOT conditional.
- n is default, so remove 'default n'
- clarify nested conditionals

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-08 14:58:51 UTC (rev 24723)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-08 14:58:54 UTC (rev 24724)
@@ -6,7 +6,6 @@
 if BR2_TARGET_UBOOT
 config BR2_TARGET_UBOOT_BOARDNAME
 	string "board name"
-	depends on BR2_TARGET_UBOOT
 	default "$(BOARD_NAME)"
 	help
 	  One of U-Boot supported boards to be built.
@@ -20,26 +19,21 @@
 
 config BR2_TARGET_UBOOT_2009_01_RC1
 	bool "u-boot-2009.01-rc1"
-	depends on BR2_TARGET_UBOOT
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
-	depends on BR2_TARGET_UBOOT
 
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
-	depends on BR2_TARGET_UBOOT
 	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_1_2_0_ATMEL
 	bool "u-boot-1.2.0-atmel"
 	depends on BR2_TARGET_AT91
-	depends on BR2_TARGET_UBOOT
 	depends on BR2_DEPRECATED
 
 #config BR2_TARGET_UBOOT_2009_01
 #	bool "u-boot-2009.01"
-#	depends on BR2_TARGET_UBOOT
 
 endchoice
 
@@ -58,7 +52,6 @@
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
-	depends on BR2_TARGET_UBOOT
 	help
 	  If your board requires a custom patch, add the path to the file here.
 	  Most users may leave this empty
@@ -106,27 +99,22 @@
 
 config BR2_TARGET_UBOOT_SILENT
 	bool "silent console"
-	depends on BR2_TARGET_UBOOT
 	help
 	  If the option has been enabled, the output can be
 	  silenced by setting the environment variable "silent".
 
 config BR2_TARGET_UBOOT_TOOL_MKIMAGE
 	bool "mkimage tool in target"
-	depends on BR2_TARGET_UBOOT
 	help
 	  Install mkimage tool in target.
 
 config BR2_TARGET_UBOOT_TOOL_ENV
 	bool "fw_printenv tool in target"
-	depends on BR2_TARGET_UBOOT
 	help
 	  Install fw_printenv / fw_setenv tools in target.
 
 menuconfig BR2_TARGET_UBOOT_DEFAULT_ENV
 	bool "Generate a default environment"
-	default n
-	depends on BR2_TARGET_UBOOT
 	help
 	  Will generate variables for factory default command
 	  and autoscript.
@@ -236,18 +224,17 @@
 	default "C0083FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB
 	default "C0041FFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB
 	help
-	  
 
 config BR2_TARGET_UBOOT_KERNEL_START
 	string "Kernel SDRAM address"
 	default "21000000"
 	help
-	  Kernel is loaded to this address in SDRAM 
+	  Kernel is loaded to this address in SDRAM
 
 config BR2_TARGET_UBOOT_KERNEL_LOCATION
 	string "Kernel flash address"
 	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
-			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH 
+			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default "C0042000" if BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default ""
 	help
@@ -269,7 +256,7 @@
 config BR2_TARGET_UBOOT_FILESYSTEM_LOCATION
 	string
 	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
-			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH 
+			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default "C018C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
   	default "C01CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
   	default "C0210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
@@ -284,12 +271,10 @@
 	string "File System Size"
 	default "6000000"
 	help
-	  
 
 menuconfig BR2_TARGET_UBOOT_NETWORK
 	bool "Network Settings"
 	default y
-	depends on BR2_TARGET_UBOOT
 	help
 	  Network settings for U-boot
 
@@ -297,35 +282,30 @@
 
 config BR2_TARGET_UBOOT_SERVERIP
 	string "server ip"
-	depends on BR2_TARGET_UBOOT
 	default "10.175.196.221"
 	help
 	  TFTP server ip address
 
 config BR2_TARGET_UBOOT_IPADDR
 	string "ip address"
-	depends on BR2_TARGET_UBOOT
 	default "10.175.196.18"
 	help
 	  Target ip address
 
 config BR2_TARGET_UBOOT_GATEWAY
 	string "gateway ip"
-	depends on BR2_TARGET_UBOOT
 	default "10.175.196.1"
 	help
 	  Gateway ip address
 
 config BR2_TARGET_UBOOT_NETMASK
 	string "netmask"
-	depends on BR2_TARGET_UBOOT
 	default "255.255.255.0"
 	help
 	  Network Mask
 
 config BR2_TARGET_UBOOT_ETHADDR
 	string "ethernet address"
-	depends on BR2_TARGET_UBOOT
 	default "04:25:fe:ed:00:18"
 	help
 	  Target MAC address for the ethernet interface.
@@ -333,16 +313,16 @@
 
 config BR2_TARGET_UBOOT_ETH1ADDR
 	string "ethernet 2 address"
-	depends on BR2_TARGET_UBOOT
 	depends on BR2_TARGET_AVR32
 	help
 	  Target MAC address for the second ethernet interface.
-endif
 
-endif
+endif # BR2_TARGET_UBOOT_NETWORK
 
-endif
+endif # BR2_TARGET_UBOOT_DEFAULT_ENV
 
+endif # BR2_TARGET_UBOOT
+
 config BR2_BOOTSOURCE_DATAFLASHCARD
 	bool
 	help
