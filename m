From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jan 2012 21:08:41 +0100
Subject: [Buildroot] [PATCH 1/2] lpc32xx: Add CDL to the available
 bootloaders
In-Reply-To: <1325616568-17471-2-git-send-email-abelloni@adeneo-embedded.com>
References: <1325616568-17471-1-git-send-email-abelloni@adeneo-embedded.com>
 <1325616568-17471-2-git-send-email-abelloni@adeneo-embedded.com>
Message-ID: <20120103210841.7a5ff77a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this work! It's really nice to see Buildroot gaining support
for new boards, and the platform-specific bootloaders needed for those
platforms.

Le Tue,  3 Jan 2012 19:49:27 +0100,
Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :

> +config BR2_TARGET_LPC32XXCDL
> +    depends on BR2_arm
> +    bool "LPC32XX CDL (kickstart and S1L)"

Indentation must be one tab.

> +if BR2_TARGET_LPC32XXCDL
> +
> +config BR2_TARGET_LPC32XXCDL_BOARDNAME
> +    string "LPC32xx board name"

Ditto.

> +++ b/boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch

Is it really needed to carry this patch in Buildroot? It's probably a
nice cleanup to be submitted upstream, but from a buildability point of
view, it has no impact I guess.

> diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch b/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
> new file mode 100644
> index 0000000..fc8af0a
> --- /dev/null
> +++ b/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
> @@ -0,0 +1,183 @@
> +Fix compilation and eabi issues

> +
> +Signed-off-by: Alexandre Belloni <abelloni@adeneo-embedded.com>
> +---
> + csps/lpc32xx/bsps/ea3250/source/libnosys_gnu.c  |   41 +++++++++++++++++++++++
> + csps/lpc32xx/bsps/fdi3250/source/libnosys_gnu.c |   41 +++++++++++++++++++++++
> + csps/lpc32xx/bsps/phy3250/source/libnosys_gnu.c |   41 +++++++++++++++++++++++

Is there a way to somehow share those instead of duplicating them
per board?

> diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
> new file mode 100644
> index 0000000..cd8e76d
> --- /dev/null
> +++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
> @@ -0,0 +1,54 @@
> +#############################################################
> +#
> +# DataFlashBoot

Please fix this.

> +#
> +#############################################################
> +
> +#LPC32XXCDL_VERSION = 2.01
> +#LPC32XXCDL_SOURCE = lpc32xx_cdl.zip
> +#LPC32XXCDL_SITE = http://ics.nxp.com/support/software/lpc32xx.cdl.drivers/zip/

Please remove those comments.

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
> +define LPC32XXCDL_BUILD_CMDS
> +	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) NXPMCU_WINBASE=$(@D) NXPMCU_SOFTWARE=$(@D) BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) CSP=lpc32xx TOOL=gnu GEN=lpc
> +    make -C $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/Burners/$(LPC32XXCDL_KICKSTART_BURNER) CROSS_COMPILE=$(TARGET_CROSS) NXPMCU_WINBASE=$(@D) NXPMCU_SOFTWARE=$(@D) BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) CSP=lpc32xx TOOL=gnu GEN=lpc
> +    make -C $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/$(LPC32XXCDL_KICKSTART) CROSS_COMPILE=$(TARGET_CROSS) NXPMCU_WINBASE=$(@D) NXPMCU_SOFTWARE=$(@D) BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) CSP=lpc32xx TOOL=gnu GEN=lpc
> +    make -C $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/Burners/$(LPC32XXCDL_S1L_BURNER) CROSS_COMPILE=$(TARGET_CROSS) NXPMCU_WINBASE=$(@D) NXPMCU_SOFTWARE=$(@D) BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) CSP=lpc32xx TOOL=gnu GEN=lpc
> +    make -C $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/$(LPC32XXCDL_S1L) CROSS_COMPILE=$(TARGET_CROSS) NXPMCU_WINBASE=$(@D) NXPMCU_SOFTWARE=$(@D) BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME) CSP=lpc32xx TOOL=gnu GEN=lpc
> +endef

Hum, that's ugly.

What about something like:

LPC32XXCDL_BUILD_FLAGS = \
	CROSS_COMPILE=$(TARGET_CROSS) 		\
	NXPMCU_WINBASE=$(@D) 			\
	NXPMCU_SOFTWARE=$(@D)			\
	BSP=$(BR2_TARGET_LPC32XXCDL_BOARDNAME)	\
	CSP=lpc32xx TOOL=gnu GEN=lpc

LPC32XXCDL_BOARD_STARTUP_DIR = \
	csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/

And then:

define LPC32XXCDL_BUILD_CMDS
	$(MAKE) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D) 
	$(MAKE) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_KICKSTART)
	$(MAKE) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/Burners/$(LPC32XXCDL_S1L_BURNER)
	$(MAKE) $(LPC32XXCDL_BUILD_FLAGS) -C $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)
endef

would probably be a bit more readable (still not perfectly nice, though).

> +define LPC32XXCDL_INSTALL_IMAGES_CMDS
> +	cp $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/Burners/$(LPC32XXCDL_KICKSTART_BURNER)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/$(LPC32XXCDL_KICKSTART)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/Burners/$(LPC32XXCDL_S1L_BURNER)/*gnu.bin $(BINARIES_DIR)
> +	cp $(@D)/csps/lpc32xx/bsps/$(BR2_TARGET_LPC32XXCDL_BOARDNAME)/startup/examples/$(LPC32XXCDL_S1L)/*gnu.bin $(BINARIES_DIR)
> +endef

Ditto here, some simplification would be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
