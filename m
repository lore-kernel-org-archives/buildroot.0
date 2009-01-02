From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 2 Jan 2009 23:45:45 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmeldevice/Atmel/at91rm9200df d etc...
References: <20090102111810.44103769FA@busybox.osuosl.org>
	<873ag13l2t.fsf@macbook.be.48ers.dk>
Message-ID: <B55C666B2B564E08B6A883E6E3E92C7E@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
>
> ulf> Author: ulf
> ulf> Date: 2009-01-02 11:18:09 +0000 (Fri, 02 Jan 2009)
> ulf> New Revision: 24646
>
> ulf> Log:
> ulf> Support AT91 in vanilla U-Boot
>
> Please be more descriptive. What about the fact that you have added
> 2008.10 + 2009.01-rc1 support?
>
> ulf> Added:
> ulf>    trunk/buildroot/target/u-boot/1.3.4/
> ulf>    trunk/buildroot/target/u-boot/2008.10/
> ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/
> ulf>
> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-001-at91rm9200.patch
>
> Do we really need to support 3 versions? What's the upstream status of
> those patches?
>

1.3.4 for current users
2008.10 last stable
2009.01-rc1 is release candidate

I assume that 1.3.4 can go away once people are happy with 2008.10,
or 2009.01 (once available)

>
> ulf>
> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
> ulf>
> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-003-at91rm9200dk.patch
> ulf>
> trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
> ulf>    trunk/buildroot/target/u-boot/2009.01/
>
> ulf> Modified:
> ulf>    trunk/buildroot/target/device/Atmel/AT91_Config.in
> ulf>    trunk/buildroot/target/device/Atmel/Makefile.in
>
> +       @echo ALLAN=$(ALLAN)
> +

Thats a mistake, and I will remove
>
> Who's Allan?
>
> ulf>    trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
> ulf>    trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
> ulf>    trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
> ulf>    trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
> ulf>    trunk/buildroot/target/device/Atmel/at91sam9g20dfc/Makefile.in
> ulf>    trunk/buildroot/target/device/Atmel/u-boot/Config.in
>
> Why isn't this going away now?

There are patches in this one which is not in the vanilla yet.
Would like some more people to test out the new stuff
before the AT91 specific u-Boot is removed.

> ulf>    trunk/buildroot/target/u-boot/Config.in
>
> What is this BOOTSOURCE stuff about? If it's U-boot specific it should
> be prefixed with BR2_UBOOT_
>

Each specific AT91/AVR32 chip (and I assume other chips as well)
have a limited number of things it searches for when executing in the
bootsource. This varies from chip to chip.
By creating these hidden variables, with default n, you can
in the chip definition set a hidden variable by a select statement.
This way, you can configure the choice in a nice modular fashing.

The BootROM can boot from multiple sources and it can affect other tools as
well.


> +config BR2_TARGET_CUSTOM_UBOOT
> +       bool
> +       help
> +         A target can "select" this to disable
> +         the build of vanilla u-boot.
> +
>
> Why not just don't enable u-boot it the .config of those targets?
>

The vanilla U-boot will not be available if you select the AT91 specific
u-boot.

> +if BR2_TARGET_UBOOT
> +choice
> +       prompt "U-Boot Version"
> +       default BR2_TARGET_UBOOT_2009_01_RC1
> +       help
> +         Select the specific Linux version you want to use
> +
>
> s/Linux/U-Boot/ and trailing spaces.
>
> +config BR2_TARGET_UBOOT_2009_01_RC1
> +       bool "u-boot-2009.01-rc1"
> +       depends on BR2_TARGET_UBOOT
> +       help
> +         Use u-boot from December 2008 (RC1)
> +
>
> Help text of choice entries cannot be displayed, so no point in this.
>

OK

> ulf>    trunk/buildroot/target/u-boot/Makefile.in
>
> +U_BOOT_TARGET:=$(BOARD_NAME)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
>
> Why this change? This breaks existing users relying on u-boot.bin (I
> know you add a symlink, but why?)
>

Because if you copy the u-boot.bin to a common directory like /tftpboot,
you lose all but the last compiled u-boot.bin

The name u-boot.bin does not give any clue about the contents.
Which architecture?
What is the configuration?
etc.

I do not understand why it breaks things?

I can understand that if you drag and drop the link you fail,
but if you have a script which copies u-boot.bin, then it should work.

Pls give examples on why this will break existing users?

> +ifeq ($(UBOOT_BOARD_NAME),"")
> +UBOOT_BOARD_NAME:=$(strip $(subst ",,$(BR2_TARGET_UBOOT_BOARDNAME)))
> +#"))
> +endif
>
> Where should UBOOT_BOARD_NAME get set, and why don't you just set
> BR2_TARGET_UBOOT_BOARDNAME instead?
>

You can set UBOOT_BOARD_NAME in the BSP directory Makefile.in.
If the board is not supported as an official U-boot board,
you are screwed, and if you know that you should use a certain
existing board, then you might as well hardwire it.

As an example, when you build "at91sam9260dfc",
you want to do "make at91sam9260ek_dataflash_cs0_config" in u-boot.
and UBOOT_BOARD_NAME is set to "at91sam9260ek_dataflash_cs0" in
"target/device/Atmel/at91sam9260dfc/Makefile.in"


> u-boot-status:
>        @echo
>        @echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
> -       @echo
> +       @echo BR2_UBOOT_VERSION = $(BR2_UBOOT_VERSION)
>        @echo BR2_TARGET_U_BOOT_CONFIG_HEADER_FILE =
> $(BR2_TARGET_U_BOOT_CONFIG_
>        @echo BR2_TARGET_U_BOOT_CONFIG_BOARD =
> $(BR2_TARGET_U_BOOT_CONFIG_BOARD)
>        @echo BR2_TARGET_UBOOT_SERVERIP = $(BR2_TARGET_UBOOT_SERVERIP)
> @@ -173,5 +186,14 @@ u-boot-status:
>        @echo BR2_TARGET_UBOOT_BOOTARGS = $(BR2_TARGET_UBOOT_BOOTARGS)
>        @echo BR2_TARGET_UBOOT_BOOTCMD = $(BR2_TARGET_UBOOT_BOOTCMD)
>        @echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
> -       @echo
> +       @echo BR2_BOOTSOURCE=$(BR2_BOOTSOURCE)
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD=$(BR2_TARGET_UBOOT_BOOTS
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH=$(BR2_TARGET_UBOOT_BOOTSOURC
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH=$(BR2_TARGET_UBOOT_BOOTSOURC
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_FLASH=$(BR2_TARGET_UBOOT_BOOTSOURCE_FL
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_SDCARD=$(BR2_TARGET_UBOOT_BOOTSOURCE_S
> +       @echo
> BR2_TARGET_UBOOT_BOOTSOURCE_EEPROM=$(BR2_TARGET_UBOOT_BOOTSOURCE_E
> +       @echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
> +       @echo TEST=$(TEST)
>
> Again, please don't add all this debug stuff to the tree.
>

What is the harm?
It is very time consuming to add /delete debugging info when you need it.

> Please clean it up.
>
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Best Regards
Ulf Samuelsson
