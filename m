From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 17:59:12 +0100
Subject: [Buildroot] [PATCH v2] Linux kernel: add support for config
 fragment files
In-Reply-To: <1423921601-20473-1-git-send-email-bos@je-eigen-domein.nl>
References: <1423921601-20473-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150214165911.GE3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-14 14:46 +0100, Floris Bos spake thusly:
> Adds configuration option to merge additional kernel configuration files
> to the main kernel configuration using support/kconfig/merge_config.sh
> 
> For use-cases in which it is desired to build a custom Linux kernel based on
> the defconfig of the target device, but with a couple extra options/modules
> enabled.
> 
> Changes v1 -> v2:
> 
> Use the merge_config.sh bundled with buildroot, instead of the one
> bundled with the kernel, as older kernel versions do not have it.

This "Changes" blrub should after the '---' line, below.

> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  linux/Config.in | 6 ++++++
>  linux/linux.mk  | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index c981493..afa68b0 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -161,6 +161,12 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>  	help
>  	  Path to the kernel configuration file
>  
> +config BR2_LINUX_KERNEL_CONFIG_FRAGMENTS
> +	string "Additional configuration fragment files"
> +	help
> +	  A space-seperated list of kernel configuration fragment files,
> +	  that will be merged to the main kernel configuration file.
> +
>  #
>  # Binary format
>  #
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 29f59e8..665bc0b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -39,6 +39,7 @@ endif # -rc
>  endif
>  
>  LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> +LINUX_KERNEL_CONFIG_FRAGMENTS = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENTS))
>  
>  LINUX_INSTALL_IMAGES = YES
>  LINUX_DEPENDENCIES += host-kmod host-lzop
> @@ -178,6 +179,8 @@ define LINUX_CONFIGURE_CMDS
>  	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>  	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> +	$(if $(LINUX_KERNEL_CONFIG_FRAGMENTS),
> +		$(TOPDIR)/support/kconfig/merge_config.sh -m -O $(@D) $(@D)/.config $(LINUX_KERNEL_CONFIG_FRAGMENTS))

As Baruch suggested earlier, this could be usefull to have such a
feature available to all our kconfig-packages: linux, busybox, uclibc
and barebox.

Granted, when you did your patch, the kernel was not yet using the
kconfig-package infra. But it now does (since Thomas P. applied the
series a few minutes ago! ;-) )

Could you rework your patch to integrate this feature in the
kconfig-package infra, please?

Something like (shortlog-like):

    kconfig-package: add support for config fragments
    linux: add option to specify config fragments
    busybox: add option to specify config fragments
    uclibc: add option to specify config fragments
    barebox: add option to specify config fragments

As for how to pass the the config fragments: just pas them all in the
_KCONFIG_FILE variable, and in package/pkg-kconfig.mk, replace line 54
with something like (untested):

    support/kconfig/merge_config.sh -m -O $(@D) $$($(2)_KCONFIG_FILE)

Callers will have to pass the base config file first and any fragment
asfter that, like so:

    LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG) $(call qstrip,$(LINUX_KERNEL_CONFIG_FRAGMENTS))

(Of course, we are again hitting the singular option that accepts
multiple entries, and in retrospect, we should have called it just
FOO_KCONFIG_FILES. We can change that, but later (after we apply the
support for fragments).

Regards,
Yann E. MORIN.

>  	$(if $(BR2_arm)$(BR2_armeb),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>  	$(if $(BR2_TARGET_ROOTFS_CPIO),
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
