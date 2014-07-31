From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 23:53:36 +0200
Subject: [Buildroot] [PATCH 5 of 6 v2] busybox: convert to
 kconfig-package infrastructure
In-Reply-To: <f995a8adfa241295acee.1406750286@localhost>
References: <patchbomb.1406750281@localhost>
 <f995a8adfa241295acee.1406750286@localhost>
Message-ID: <20140731215336.GQ3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> This patch converts the busybox package to the new kconfig-package
> infrastructure, thus removing code duplication and ensuring a consistent
> behavior of kconfig packages.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: rebase after making kconfig-package a full infra
> 
>  package/busybox/busybox.mk |  25 +++++++++----------------
>  1 files changed, 9 insertions(+), 16 deletions(-)
> 
> diff -r 540167f28c2d -r f995a8adfa24 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Wed Jul 23 20:12:32 2014 +0200
> +++ b/package/busybox/busybox.mk	Tue Jul 22 20:43:10 2014 +0200
> @@ -45,6 +45,10 @@
>  	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
>  endif
>  
> +BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
> +BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
> +BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
> +
>  define BUSYBOX_PERMISSIONS
>  /bin/busybox			 f 4755	0 0 - - - - -
>  /usr/share/udhcpc/default.script f 755  0 0 - - - - -
> @@ -136,10 +140,6 @@
>  endef
>  endif
>  
> -define BUSYBOX_COPY_CONFIG
> -	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
> -endef
> -
>  # Disable shadow passwords support if unsupported by the C library
>  ifeq ($(BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS),)
>  define BUSYBOX_INTERNAL_SHADOW_PASSWORDS
> @@ -190,8 +190,7 @@
>  	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
>  endef
>  
> -define BUSYBOX_CONFIGURE_CMDS
> -	$(BUSYBOX_COPY_CONFIG)
> +define BUSYBOX_KCONFIG_FIXUP_CMDS
>  	$(BUSYBOX_SET_MMU)
>  	$(BUSYBOX_SET_LARGEFILE)
>  	$(BUSYBOX_SET_IPV6)
> @@ -203,6 +202,9 @@
>  	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
>  	$(BUSYBOX_SET_INIT)
>  	$(BUSYBOX_SET_WATCHDOG)
> +endef
> +
> +define BUSYBOX_CONFIGURE_CMDS
>  	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
>  		-C $(@D) oldconfig
>  	$(BUSYBOX_NOCLOBBER_INSTALL)
> @@ -224,13 +226,4 @@
>  	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
>  endef
>  
> -$(eval $(generic-package))
> -
> -busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
> -	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
> -		$(subst busybox-,,$@)
> -	rm -f $(BUSYBOX_DIR)/.stamp_built
> -	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
> -
> -busybox-update-config: busybox-configure
> -	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
> +$(eval $(kconfig-package))
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
