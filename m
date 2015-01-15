From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Thu, 15 Jan 2015 21:55:45 +0100
Subject: [Buildroot] [PATCH v2 4/8] boot/uboot: Add uboot-menuconfig and
 friends
In-Reply-To: <20150110164355.17d96522@free-electrons.com>
References: <1420897647-25001-1-git-send-email-jkrause@posteo.de>
 <1420897647-25001-5-git-send-email-jkrause@posteo.de>
 <20150110164355.17d96522@free-electrons.com>
Message-ID: <1421355345.2625.29.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sa, 2015-01-10 at 16:43 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Sat, 10 Jan 2015 14:47:23 +0100, J?rg Krause wrote:
> 
> >  ifeq ($(BR2_TARGET_UBOOT),y)
> > +ifeq ($(BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG),y)
> > +uboot-menuconfig uboot-xconfig uboot-gconfig uboot-nconfig: uboot-configure
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> > +	rm -f $(UBOOT_DIR)/.stamp_{built,target_installed,images_installed}
> > +uboot-savedefconfig: uboot-configure
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(UBOOT_MAKE_OPTS) -C $(UBOOT_DIR) $(subst uboot-,,$@)
> > +ifeq ($(BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG),y)
> > +uboot-update-defconfig: uboot-savedefconfig
> > +	cp -f $(UBOOT_DIR)/defconfig $(BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE)
> > +else
> > +uboot-update-defconfig: ;
> > +endif # BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG
> > +endif # BR2_TARGET_UBOOT_USE_KBUILD_KCONFIG
> 
> Please use the kconfig-package infrastructure.

Using the kconfig-package infrastructure requires a .config file to be
set with UBOOT_KCONFIG_FILE. This .config file is copied to UBOOT_DIR
after patching and before configuration starts.

This causes me some trouble since in the U-Boot build process
the .config file (and also spl/.config and tpl/.config) is written by
make <board>_defconfig. This command is called in UBOOT_CONFIGURE_CMDS
which runs after copying .config to UBOOT_DIR.

The patches are mainly based on the Linux and Barebox packages, which
also uses the make _defconfig build step to make the .config file.

Best regards
J?rg Krause
