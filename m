From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Jan 2009 14:15:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel
	device/Atmel/at91rm9200df d etc...
In-Reply-To: <20090102111810.44103769FA@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 2 Jan 2009 11\:18\:10 +0000 \(UTC\)")
References: <20090102111810.44103769FA@busybox.osuosl.org>
Message-ID: <873ag13l2t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-02 11:18:09 +0000 (Fri, 02 Jan 2009)
 ulf> New Revision: 24646

 ulf> Log:
 ulf> Support AT91 in vanilla U-Boot

Please be more descriptive. What about the fact that you have added
2008.10 + 2009.01-rc1 support?

 ulf> Added:
 ulf>    trunk/buildroot/target/u-boot/1.3.4/
 ulf>    trunk/buildroot/target/u-boot/2008.10/
 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/
 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-001-at91rm9200.patch

Do we really need to support 3 versions? What's the upstream status of
those patches?


 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-003-at91rm9200dk.patch
 ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
 ulf>    trunk/buildroot/target/u-boot/2009.01/

 ulf> Modified:
 ulf>    trunk/buildroot/target/device/Atmel/AT91_Config.in
 ulf>    trunk/buildroot/target/device/Atmel/Makefile.in

+       @echo ALLAN=$(ALLAN)
+
 
Who's Allan?

 ulf>    trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
 ulf>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/Makefile.in
 ulf>    trunk/buildroot/target/device/Atmel/u-boot/Config.in

Why isn't this going away now?

 ulf>    trunk/buildroot/target/u-boot/Config.in

What is this BOOTSOURCE stuff about? If it's U-boot specific it should
be prefixed with BR2_UBOOT_

+config BR2_TARGET_CUSTOM_UBOOT
+       bool
+       help
+         A target can "select" this to disable
+         the build of vanilla u-boot.
+

Why not just don't enable u-boot it the .config of those targets?

+if BR2_TARGET_UBOOT
+choice
+       prompt "U-Boot Version"
+       default BR2_TARGET_UBOOT_2009_01_RC1
+       help
+         Select the specific Linux version you want to use
+               

s/Linux/U-Boot/ and trailing spaces.

+config BR2_TARGET_UBOOT_2009_01_RC1
+       bool "u-boot-2009.01-rc1"
+       depends on BR2_TARGET_UBOOT
+       help
+         Use u-boot from December 2008 (RC1)
+

Help text of choice entries cannot be displayed, so no point in this.

 ulf>    trunk/buildroot/target/u-boot/Makefile.in

+U_BOOT_TARGET:=$(BOARD_NAME)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin

Why this change? This breaks existing users relying on u-boot.bin (I
know you add a symlink, but why?)

+ifeq ($(UBOOT_BOARD_NAME),"")
+UBOOT_BOARD_NAME:=$(strip $(subst ",,$(BR2_TARGET_UBOOT_BOARDNAME)))
+#"))
+endif

Where should UBOOT_BOARD_NAME get set, and why don't you just set
BR2_TARGET_UBOOT_BOARDNAME instead?

 u-boot-status:
        @echo
        @echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
-       @echo
+       @echo BR2_UBOOT_VERSION = $(BR2_UBOOT_VERSION)
        @echo BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE = $(BR2_TARGET_U_BOOT_CONFIG_
        @echo BR2_TARGET_U_BOOT_CONFIG_BOARD = $(BR2_TARGET_U_BOOT_CONFIG_BOARD)
        @echo BR2_TARGET_UBOOT_SERVERIP = $(BR2_TARGET_UBOOT_SERVERIP)
@@ -173,5 +186,14 @@ u-boot-status:
        @echo BR2_TARGET_UBOOT_BOOTARGS = $(BR2_TARGET_UBOOT_BOOTARGS)
        @echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
        @echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
-       @echo
+       @echo BR2_BOOTSOURCE=$(BR2_BOOTSOURCE)
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD=$(BR2_TARGET_UBOOT_BOOTS
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH=$(BR2_TARGET_UBOOT_BOOTSOURC
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH=$(BR2_TARGET_UBOOT_BOOTSOURC
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_FLASH=$(BR2_TARGET_UBOOT_BOOTSOURCE_FL
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD=$(BR2_TARGET_UBOOT_BOOTSOURCE_S
+       @echo BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM=$(BR2_TARGET_UBOOT_BOOTSOURCE_E
+       @echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
+       @echo TEST=$(TEST)

Again, please don't add all this debug stuff to the tree.

Please clean it up.

-- 
Bye, Peter Korsgaard
