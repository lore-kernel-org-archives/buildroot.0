From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jan 2012 08:29:13 +0100
Subject: [Buildroot] [PATCH v3 1/2] lpc32xx: Add CDL to the available
 bootloaders
In-Reply-To: <1325697215-29906-2-git-send-email-abelloni@adeneo-embedded.com>
References: <1325697215-29906-1-git-send-email-abelloni@adeneo-embedded.com>
 <1325697215-29906-2-git-send-email-abelloni@adeneo-embedded.com>
Message-ID: <20120105082913.307b0c4a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  4 Jan 2012 18:13:34 +0100,
Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :

> @@ -7,6 +7,7 @@ source "boot/uboot/Config.in"
>  source "boot/at91bootstrap/Config.in"
>  source "boot/at91dataflashboot/Config.in"
>  source "boot/xloader/Config.in"
> +source "boot/lpc32xxcdl/Config.in"

Sorry, I didn't notice that in my previous review. Entries should be
ordered alphabetically.


> --- /dev/null
> +++ b/boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch

This patch requires a description + Signed-off-by.

> +++ b/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
> @@ -0,0 +1,183 @@
> +Fix compilation and eabi issues

A slightly extended description of what the patch does and why it is
needed would be good to have.

> +++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
> @@ -0,0 +1,60 @@
> +#############################################################
> +#
> +# LPC32XX CDL
> +#
> +#############################################################
> +
> +LPC32XXCDL_VERSION = lpc32xx_cdl_v2.11
> +LPC32XXCDL_SITE = http://git.lpcware.com/lpc3xxx_cdl.git
> +LPC32XXCDL_SITE_METHOD = git
> +
> +LPC32XXCDL_INSTALL_TARGET = NO
> +LPC32XXCDL_INSTALL_IMAGES = YES
> +
> +ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"ea3250")
> +LPC32XXCDL_KICKSTART = kickstart/nand
> +LPC32XXCDL_KICKSTART_BURNER = nand/kickstart
> +LPC32XXCDL_S1L = s1l
> +LPC32XXCDL_S1L_BURNER = nand/s1lapp
> +endif
> +
> +ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"phy3250")
> +LPC32XXCDL_KICKSTART = kickstart/kickstart_nand
> +LPC32XXCDL_KICKSTART_BURNER = nand/kickstart
> +LPC32XXCDL_S1L = s1l/s1l_nand_boot
> +LPC32XXCDL_S1L_BURNER = nand/s1lapp
> +endif
> +
> +ifeq ($(BR2_TARGET_LPC32XXCDL_BOARDNAME),"fdi3250")
> +LPC32XXCDL_KICKSTART = kickstart/nand
> +LPC32XXCDL_KICKSTART_BURNER = nand/kickstart_jtag
> +LPC32XXCDL_S1L = s1l
> +LPC32XXCDL_S1L_BURNER = nand/s1lapp_jtag
> +endif
> +
> +LPC32XXCDL_BUILD_FLAGS = \
> +	CROSS_COMPILE=$(TARGET_CROSS)           \
> +	NXPMCU_WINBASE=$(@D)                    \
> +	NXPMCU_SOFTWARE=$(@D)                   \
> +	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME)  \
> +	CSP=lpc32xx TOOL=gnu GEN=lpc
> +
> +LPC32XXCDL_BOARD_STARTUP_DIR = \
> +	csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/
> +
> +define LPC32XXCDL_BUILD_CMDS
> +	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)
> +	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)
> +	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_KICKSTART)
> +	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_S1L_BURNER)
> +	$(MAKE1) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)
> +endef
> +
> +define LPC32XXCDL_INSTALL_IMAGES_CMDS
> +	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_KICKSTART_BURNER)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_KICKSTART)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_S1L_BURNER)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)/*gnu.bin $(BINARIES_DIR)
> +endef
> +
> +$(eval $(call GENTARGETS))

Looks much better now, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
