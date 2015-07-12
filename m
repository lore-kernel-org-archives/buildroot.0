From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 20:40:40 +0200
Subject: [Buildroot] [PATCH 1/3] linux: add linux-tools infra
In-Reply-To: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
References: <1436719444-9722-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150712184040.GD4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-07-12 18:44 +0200, Romain Naour spake thusly:
> This commit add an infrastructure to build linux kernel
> tools available in the kernel sources.
> 
> Currently, the only linux kernel tool packaged in Buildroot
> is perf and it's packaged as a separate generic package.
> This is a problem for licence information raised in this
> thread [1].
> 
> Since these tools require to build a Linux kernel, we can
> use some hooks in linux package like we did for linux
> extensions [2] and remove the perf package.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-May/128783.html
> [2] http://lists.busybox.net/pipermail/buildroot/2015-March/121835.html
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(Needless to say I like this! ;-] )

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index eca1450..d483c11 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -325,6 +325,8 @@ define LINUX_INSTALL_TARGET_CMDS
>  	$(LINUX_INSTALL_HOST_TOOLS)
>  endef
>  
> +# Include all our externsions and tools definitions.
> +#
>  # Note: our package infrastructure uses the full-path of the last-scanned
>  # Makefile to determine what package we're currently defining, using the
>  # last directory component in the path. As such, including other Makefile,
> @@ -334,6 +336,7 @@ endef
>  # the current Makefile, we are OK. But this is a hard requirement: files
>  # included here *must* be in the same directory!
>  include $(sort $(wildcard linux/linux-ext-*.mk))
> +include $(sort $(wildcard linux/linux-tool-*.mk))
>  
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>  	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> @@ -342,6 +345,27 @@ LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
>  	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
>  		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
>  
> +# Install Linux kernel tools in staging directory since some tools
> +# may install shared libraries and headers (e.g. cpupower). The
> +# kernel image is NOT installed in staging directory.
> +LINUX_INSTALL_STAGING = $(if $(strip $(LINUX_TOOLS)),YES,NO)
> +
> +LINUX_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
> +	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
> +		$(LINUX_TOOL_$(call UPPERCASE,$(tool))_DEPENDENCIES)))
> +
> +LINUX_POST_BUILD_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
> +	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
> +		LINUX_TOOL_$(call UPPERCASE,$(tool))_BUILD_CMDS))
> +
> +LINUX_POST_INSTALL_STAGING_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
> +	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
> +		LINUX_TOOL_$(call UPPERCASE,$(tool))_INSTALL_STAGING_CMDS))
> +
> +LINUX_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
> +	$(if $(BR2_LINUX_KERNEL_TOOL_$(call UPPERCASE,$(tool))),\
> +		LINUX_TOOL_$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
> +
>  $(eval $(kconfig-package))
>  
>  # Support for rebuilding the kernel after the cpio archive has
> -- 
> 2.4.3
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
