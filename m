From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 May 2019 19:00:21 +0200
Subject: [Buildroot] [PATCH 1/1] boot/grub2: memdisk option
In-Reply-To: <20190519113526.25633-1-skif@skif-web.ru>
References: <20190519113526.25633-1-skif@skif-web.ru>
Message-ID: <20190519170021.GA5097@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-05-19 14:35 +0300, Alexey Lukyanchuk spake thusly:
> Allows to create grub2 memdisk from specified directory

Can you expand a bit on what you're trying to achieve with this?

> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  boot/grub2/Config.in |  5 +++++
>  boot/grub2/grub2.mk  | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index e45133999e..15c2db1a06 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -116,6 +116,11 @@ config BR2_TARGET_GRUB2_INSTALL_TOOLS
>  	  This will also install the Grub 2 loadable modules to the
>  	  target.
>  
> +config BR2_ROOTFS_ISO9660_ADDITIONAL_FILES
> +	string "Add additional files to iso"
> +	help
> +	  Use this option to add any additional files to iso

This patch is about grub2, so the option is incorrectly mnamed, its
prompt is incorrect, and the help text is incorrect too, as they refer
to iso, not grub2.

>  endif # BR2_TARGET_GRUB2
>  
>  comment "grub2 needs a toolchain w/ wchar"
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 65371f0170..04166ddec9 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -114,6 +114,19 @@ define GRUB2_IMAGE_INSTALL_ELTORITO
>  endef
>  endif
>  
> +ifneq ($(BR2_TARGET_GRUB2_MEMDISK_DIR),)
> +GRUB2_POST_BUILD_HOOKS += GRUB2_MAKE_MEMDISK
> +define GRUB2_MAKE_MEMDISK
> +	# clean artefacs from previos build

s/previos/previous/

> +	rm -rf $(HOST_DIR)/grub2_memdisk

Why did you put that in $(HOST_DIR) ? Why can't you put that in $(@D)
instead?

Note: you may even use $(GRUB2_BUILD_DIR) instead of $(@D), this is more
future-proof.

> +	# clean artefacs from previos build

No need to repeat.

> +	rm -rf $(HOST_DIR)/memdisk.tar

You can use a single command to remove both the dir and file. Although
there should be no need to remove the file, as tar will overwrite it
anyway.

> +	mkdir -p $(HOST_DIR)/grub2_memdisk
> +	cp -r $(BR2_TARGET_GRUB2_MEMDISK_DIR)/* $(HOST_DIR)/grub2_memdisk/

cp -r does not preserve all attributes of files, so you should use cp -a
instead.

But before you fix and respin, please explain what you are trying to
achieve eith this patch (and the next one too).

Regards,
Yann E. MORIN.

> +	tar -cvf $(HOST_DIR)/memdisk.tar -C $(HOST_DIR)/grub2_memdisk/ .
> +endef
> +endif
> +
>  define GRUB2_INSTALL_IMAGES_CMDS
>  	mkdir -p $(dir $(GRUB2_IMAGE))
>  	$(HOST_DIR)/usr/bin/grub-mkimage \
> @@ -121,6 +134,7 @@ define GRUB2_INSTALL_IMAGES_CMDS
>  		-O $(GRUB2_TUPLE) \
>  		-o $(GRUB2_IMAGE) \
>  		-p "$(GRUB2_PREFIX)" \
> +		$(if $(BR2_TARGET_GRUB2_MEMDISK_DIR),-m $(HOST_DIR)/memdisk.tar) \
>  		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
>  		$(GRUB2_BUILTIN_MODULES)
>  	mkdir -p $(dir $(GRUB2_CFG))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
