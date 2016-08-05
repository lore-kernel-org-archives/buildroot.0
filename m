From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Aug 2016 00:20:35 +0200
Subject: [Buildroot] [PATCH v4 5/7] package/amd-catalyst: Add AMD
	cmdline tools
In-Reply-To: <1470408840-1509-6-git-send-email-romain.perier@free-electrons.com>
References: <1470408840-1509-1-git-send-email-romain.perier@free-electrons.com>
 <1470408840-1509-6-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160805222035.GC6074@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-05 16:53 +0200, Romain Perier spake thusly:
> The AMD Catalyst driver includes some cmdline tools for displaying
> specific infos about the GL stack or to test 3D, like fglxinfo
> or fgl_gears. This commit adds support to install such tools.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(much easier to review in small patches, thanks! ;-) )

Regards,
Yann E. MORIN.

> ---
>  package/amd-catalyst/Config.in       |  5 +++++
>  package/amd-catalyst/amd-catalyst.mk | 20 ++++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
> index c3c531c..0099e91 100644
> --- a/package/amd-catalyst/Config.in
> +++ b/package/amd-catalyst/Config.in
> @@ -38,6 +38,11 @@ if BR2_PACKAGE_AMD_CATALYST_XORG
>  config BR2_PACKAGE_PROVIDES_LIBGL
>  	default "amd-catalyst"
>  
> +config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
> +	bool "command-line configuration tools and utilities"
> +	help
> +	  Build the amd command line tools
> +
>  endif
>  
>  config BR2_PACKAGE_AMD_CATALYST_MODULE
> diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
> index cda8e75..5e1b90b 100644
> --- a/package/amd-catalyst/amd-catalyst.mk
> +++ b/package/amd-catalyst/amd-catalyst.mk
> @@ -103,12 +103,32 @@ endef
>  
>  endif
>  
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS), y)
> +AMD_CATALYST_CMDLINE_TOOLS_FILES = \
> +	atiode \
> +	atiodcli \
> +	fgl_glxgears \
> +	aticonfig \
> +	amd-console-helper \
> +	fglrxinfo
> +
> +define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/sbin/atieventsd \
> +		$(TARGET_DIR)/usr/sbin
> +	$(foreach f,$(AMD_CATALYST_CMDLINE_TOOLS_FILES), \
> +		$(INSTALL) -D -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/bin/$(f) \
> +			$(TARGET_DIR)/usr/bin/$(f)
> +	)
> +endef
> +endif
> +
>  define AMD_CATALYST_INSTALL_STAGING_CMDS
>  	$(call AMD_CATALYST_INSTALL_STAGING_XORG)
>  endef
>  
>  define AMD_CATALYST_INSTALL_TARGET_CMDS
>  	$(call AMD_CATALYST_INSTALL_XORG)
> +	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.8.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
