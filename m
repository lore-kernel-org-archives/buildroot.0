From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:31:33 +0200
Subject: [Buildroot] [PATCH 1/4 v2] core/pkg-kernel-module: ensure linux
 supports modules
In-Reply-To: <02a8be3c5e04219765d90c0b665f32eb6f4db352.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
 <02a8be3c5e04219765d90c0b665f32eb6f4db352.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <55DB7F25.6030302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 06:50 PM, Yann E. MORIN wrote:
> When a package wants to build a kernel module, we should ensure that the
> kernel does support modules.
> 
> This patch does it automatically for packages using the kernel-module
> infrastructure.
> 
> Packages that do not use it will have to set it manually (to be done in
> a followup patch).
> 
> Suggested-by: Peter Korsgaard <jacmet@uclibc.org>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: No? Rubinstein <noe.rubinstein@gmail.com>
> Cc: Jan Viktorin <viktorin@rehivetech.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  linux/linux.mk               | 2 ++
>  package/pkg-kernel-module.mk | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 48f9c74..bbcc54b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -175,6 +175,8 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
>  
>  define LINUX_KCONFIG_FIXUP_CMDS
> +	$(if $(LINUX_NEEDS_MODULES),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
>  	$(if $(BR2_arm)$(BR2_armeb),
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>  	$(if $(BR2_TARGET_ROOTFS_CPIO),
> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index 6fb7704..f6730b8 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -44,6 +44,11 @@
>  
>  define inner-kernel-module
>  
> +# If the package is enabled, ensure the kernel will support modules
> +ifeq ($$(BR2_PACKAGE_$(2)),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  # The kernel must be built first.
>  $(2)_DEPENDENCIES += linux
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
