From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 22:01:13 +0100
Subject: [Buildroot] [PATCH] linux: Set MMU page size for ARC processors
In-Reply-To: <20191217131528.35779-1-abrodkin@synopsys.com>
References: <20191217131528.35779-1-abrodkin@synopsys.com>
Message-ID: <20191222210113.GK26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-12-17 16:15 +0300, Alexey Brodkin spake thusly:
> ARC processors have configurable size of MMU page. This configuration
> happens during ASIC design and couldn't be changed in final silicone
> not to mention runtime changes.
> 
> Given PAGE_SIZE macro is used a lot throughout the Linux kernel sources
> we just hardcode a required value during the kernel configuration.
> 
> We used to support different MMU page sizes for ARC in Buildroot for
> quite some time now but so far we only tweaked uClibc on the matter.
> That left us with the kernel configured with whatever was in used defconfig.
> 
> In most of real cases that's OK because typically we're building firmware
> for a particular ASIC which is supposed to have a unique kernel defconfig.
> But if we're dealing with FPGA-based boards or even simlators like
> Synopsys DesignWare nSIM or QEMU it's possible to have dfferent MMU page
> size configured in that target mostly for the sake of testing.
> 
> And so we're trying to solve 2 problems here:
>  1. Make sure both user-space (via libc settings) and the Linux kernel
>     are "on the same page", i.e. expect to use the same MMU page size.
>  2. Simplify process of testing different page sizes.
>     As now we first need to set page size in Buildroot and then in the
>     kernel via "make linux-configure" or via Kconfig fragment.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  linux/linux.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 762f8868b1..3b83900c74 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -319,6 +319,18 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>  	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR,$(@D)/.config))
> +	$(and $(BR2_arc),$(BR2_ARC_PAGE_SIZE_4K),

Although I like this trick of using $(and ...) to test multiple
conditions, this is here not needed after all.

Indeed, if BR2_ARC_PAGE_SIZE_4K is set, then BR2_arc is also set,
because BR2_ARC_PAGE_SIZE_4K depends on BR2_arc.

So, the conditions can be simplified as:

    $(if $(BR2_ARC_PAGE_SIZE_4K),
        [...])

Ditto for 8KiB and 16KiB, of course.

I've fixed that and applied to master. Thanks.

Regards,
Yann E. MORIN.

> +		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
> +	$(and $(BR2_arc),$(BR2_ARC_PAGE_SIZE_8K),
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
> +	$(and $(BR2_arc),$(BR2_ARC_PAGE_SIZE_16K),
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K,$(@D)/.config)
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K,$(@D)/.config))
>  	$(if $(BR2_TARGET_ROOTFS_CPIO),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
>  	# As the kernel gets compiled before root filesystems are
> -- 
> 2.16.2
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
