From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:57:20 +0200
Subject: [Buildroot] [PATCH 14/22] package/linux-tools/perf: bear the
 kernel options munging
In-Reply-To: <c5f4df06972f6f572da06c732811865e7f8e39fb.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <c5f4df06972f6f572da06c732811865e7f8e39fb.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <20200501155720.1ffc024c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  4 Apr 2020 14:10:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  linux/linux.mk                            | 2 --
>  package/linux-tools/linux-tool-perf.mk.in | 4 ++++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index ec57f580ea..60fefd0eba 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -355,8 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
>  	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
> -	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
> -		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
>  	$(if $(BR2_PACKAGE_SYSTEMD),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 7106b622cb..53b7c5b9cd 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -158,3 +158,7 @@ define PERF_INSTALL_TARGET_CMDS
>  	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
>  	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
>  endef
> +
> +define PERF_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS)
> +endef

Unfortunately, "perf" is not a package, so this cannot work without
some work in package/linux-tools/linux-tools.mk. So I kept this patch
not applied, with the Linux kernel config tweak for Perf still in
linux/linux.mk.

Could you rework package/linux-tools/linux-tools.mk to properly support
this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
