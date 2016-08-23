From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Aug 2016 16:27:14 +0200
Subject: [Buildroot] [PATCH v5 6/7] package/amd-catalyst: Add support
	AMD CCCLE
In-Reply-To: <20160823121950.16826-7-romain.perier@free-electrons.com>
References: <20160823121950.16826-1-romain.perier@free-electrons.com>
 <20160823121950.16826-7-romain.perier@free-electrons.com>
Message-ID: <20160823142714.GC5749@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-23 14:19 +0200, Romain Perier spake thusly:
> The AMD Catalyst Linux driver includes a graphical controler center for AMD
> graphics accelerators, called Catalyst Controler Center. This commits
> adds support to install this tool by adding a separated prompt.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
> 
> Changes in v5:
>  - Remove BR2_USE_MMU dependency which is already required by glibc
>    (all amd-catalyst blobs require glibc)
>  - Cosmetic changes
> 
>  package/amd-catalyst/Config.in       | 14 ++++++++++++++
>  package/amd-catalyst/amd-catalyst.mk | 10 ++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
> index 1d889f6..e325bc0 100644
> --- a/package/amd-catalyst/Config.in
> +++ b/package/amd-catalyst/Config.in
> @@ -45,6 +45,20 @@ config BR2_PACKAGE_AMD_CATALYST_CMDLINE_TOOLS
>  	help
>  	  Build the amd command line tools
>  
> +comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
> +	depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 \
> +		|| !BR2_PACKAGE_QT_NOPNG

If I understand the comment correctly, these need PNG support in Qt. So
you'd want the dependency of the comment to be on BR2_PACKAGE_QT_NOPNG:

    comment "Catalyst Control Center needs Qt4 with X11 and PNG support"
        depends on !BR2_PACKAGE_QT || !BR2_PACKAGE_QT_X11 \
                || BR2_PACKAGE_QT_NOPNG

I.e. show the comment when there is no PNG support in Qt.

> +config BR2_PACKAGE_AMD_CATALYST_CCCLE
> +	bool "Catalyst Control Center"
> +	depends on BR2_PACKAGE_QT && BR2_PACKAGE_QT_X11

And here you forgot to depend on !NOPNG.

Besides, I'd have put each dependency on its own line:

    config BR2_PACKAGE_AMD_CATALYST_CCCLE
        bool "Catalyst Control Center"
        depends on BR2_PACKAGE_QT
        depends on BR2_PACKAGE_QT_X11
        depends on !BR2_PACKAGE_QT_NOPNG
        [...]

> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
> +	select BR2_PACKAGE_PROCPS_NG # runtime
> +	select BR2_PACKAGE_QT_GUI_MODULE
> +	select BR2_PACKAGE_QT_ACCESSIBILITY
> +	help
> +	  Installs the Catalyst Control Center, a Qt graphical tool to
> +	  control AMD graphics accelerators.
>  endif

Empty line before the endif, please.

Regards,
Yann E. MORIN.

>  
>  comment "amd-catalyst kernel module needs a kernel to be built"
> diff --git a/package/amd-catalyst/amd-catalyst.mk b/package/amd-catalyst/amd-catalyst.mk
> index 7fbe6b3..2226b70 100644
> --- a/package/amd-catalyst/amd-catalyst.mk
> +++ b/package/amd-catalyst/amd-catalyst.mk
> @@ -126,6 +126,15 @@ define  AMD_CATALYST_INSTALL_CMDLINE_TOOLS
>  endef
>  endif
>  
> +ifeq ($(BR2_PACKAGE_AMD_CATALYST_CCCLE), y)
> +define AMD_CATALYST_INSTALL_CCCLE
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/X11R6/bin/amdcccle \
> +		$(TARGET_DIR)/usr/bin/amdcccle
> +	$(INSTALL) -m 0755 $(AMD_CATALYST_ARCH_DIR)/usr/sbin/amdnotifyui \
> +		$(TARGET_DIR)/usr/sbin/amdnotifyui
> +endef
> +endif
> +
>  define AMD_CATALYST_CONFIGURE_CMDS
>  	$(call AMD_CATALYST_PREPARE_MODULE)
>  endef
> @@ -137,6 +146,7 @@ endef
>  define AMD_CATALYST_INSTALL_TARGET_CMDS
>  	$(call AMD_CATALYST_INSTALL_XORG)
>  	$(call AMD_CATALYST_INSTALL_CMDLINE_TOOLS)
> +	$(call AMD_CATALYST_INSTALL_CCCLE)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.9.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
