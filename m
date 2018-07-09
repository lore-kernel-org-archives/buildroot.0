From: Joel Carlson <joelsoncarl@gmail.com>
Date: Mon, 9 Jul 2018 13:39:39 -0600
Subject: [Buildroot] [PATCH v4 2/3] uboot: zynqmp: generate SPL image
 with PMUFW binary
In-Reply-To: <mailman.4777.1529627642.16495.buildroot@busybox.net>
References: <mailman.4777.1529627642.16495.buildroot@busybox.net>
Message-ID: <d2e69c1d-5ee7-db72-e3ae-c2fafff41900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 06/21/2018 03:26 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:

<snip>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index e4571a6ccf9f..59b3fe07881d 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -276,6 +276,17 @@ endef
>  
>  ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>  
> +UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
> +
> +ifneq ($(UBOOT_ZYNQMP_PMUFW),)
> +UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> +BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
> +define UBOOT_ZYNQMP_KCONFIG_PMUFW
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))", \
> +	       $(@D)/.config)
> +endef
> +endif

What I thought would be ideal for me is to store my generated pmufw.bin 
file in our own local repo that is a BR2_EXTERNAL. I wanted to then just 
pass the path to this file using $(BR2_EXTERNAL_MY_REPO_PATH). But 
referencing a local file for something via *_EXTRA_DOWNLOADS doesn't 
seem to work when the supplied argument is a local path to the file. I 
don't know if I was doing something wrong or misunderstanding the 
dl-wrapper and other associated code.  But I ended up modifying the 
changes here to look like this:

> +ifneq ($(UBOOT_ZYNQMP_PMUFW),)
> +ifneq (file,$(firstword $(subst ://, ,$(UBOOT_ZYNQMP_PMUFW))))
> +UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
> +BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
> +define UBOOT_ZYNQMP_KCONFIG_PMUFW
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))", \
> +	       $(@D)/.config)
> +endef
> +else
> +define UBOOT_ZYNQMP_KCONFIG_PMUFW
> +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(lastword $(subst ://, ,$(UBOOT_ZNYQMP_PMUFW)))", \
> +	       $(@D)/.config)
> +endef
> +endif

Then I can set my BR2_TARGET_UBOOT_ZYNQMP_PMUFW value to 
"file://$(BR2_EXTERNAL_MY_REPO_PATH)/path/to/my/pmufw.bin" and it will 
work appropriately.

I'm not sure if that's best to put as part of this, so I guess I'm 
seeking input on that.

> +
>  ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE)),)
>  define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
>  	$(call KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(TOPDIR)/$(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))", \
> @@ -335,6 +346,7 @@ UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
>  endif
>  
>  define UBOOT_KCONFIG_FIXUP_CMDS
> +	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
>  	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
>  endef
