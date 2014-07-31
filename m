From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 23:07:17 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] uclibc: convert to
 kconfig-package infrastructure
In-Reply-To: <083076145a2b191e2b6a.1406750284@localhost>
References: <patchbomb.1406750281@localhost>
 <083076145a2b191e2b6a.1406750284@localhost>
Message-ID: <20140731210717.GL3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> This patch converts the uclibc package to the new kconfig-package
> infrastructure, thus removing code duplication and ensuring a consistent
> behavior of kconfig packages.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I'd suggest a small enhancement (for a future patch):
    UCLIBC_KCONFIG_EDITORS = menuconfig nconfig

Regards,
Yann E. MORIN.

> ---
> v2: kconfig-package is now a real package infrastructure, so remove call
>     to generic-package
> 
>  package/uclibc/uclibc.mk |  34 ++++++++++------------------------
>  1 files changed, 10 insertions(+), 24 deletions(-)
> 
> diff -r 7e76c27202ec -r 083076145a2b package/uclibc/uclibc.mk
> --- a/package/uclibc/uclibc.mk	Thu Jul 24 20:54:50 2014 +0200
> +++ b/package/uclibc/uclibc.mk	Tue Jul 22 20:35:36 2014 +0200
> @@ -37,6 +37,14 @@
>  UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
>  endif
>  
> +UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
> +
> +UCLIBC_KCONFIG_OPT = \
> +		$(UCLIBC_MAKE_FLAGS) \
> +		PREFIX=$(STAGING_DIR) \
> +		DEVEL_PREFIX=/usr/ \
> +		RUNTIME_PREFIX=$(STAGING_DIR)/ \
> +
>  UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
>  
>  ifeq ($(GENERATE_LOCALE),)
> @@ -393,7 +401,7 @@
>  	UCLIBC_EXTRA_CFLAGS="$(UCLIBC_EXTRA_CFLAGS) $(TARGET_ABI)" \
>  	HOSTCC="$(HOSTCC)"
>  
> -define UCLIBC_FIXUP_DOT_CONFIG
> +define UCLIBC_KCONFIG_FIXUP_CMDS
>  	$(call KCONFIG_SET_OPT,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D)/.config)
>  	$(call KCONFIG_ENABLE_OPT,TARGET_$(UCLIBC_TARGET_ARCH),$(@D)/.config)
>  	$(call KCONFIG_SET_OPT,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D)/.config)
> @@ -531,29 +539,7 @@
>  	$(UCLIBC_INSTALL_UTILS_STAGING)
>  endef
>  
> -$(eval $(generic-package))
> -
> -$(UCLIBC_DIR)/.config: $(UCLIBC_CONFIG_FILE) | uclibc-patch
> -	$(INSTALL) -m 0644 $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
> -
> -$(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
> -	$(UCLIBC_FIXUP_DOT_CONFIG)
> -	$(Q)touch $@
> -
> -$(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
> -
> -uclibc-menuconfig: $(UCLIBC_DIR)/.config
> -	$(MAKE) -C $(UCLIBC_DIR) \
> -		$(UCLIBC_MAKE_FLAGS) \
> -		PREFIX=$(STAGING_DIR) \
> -		DEVEL_PREFIX=/usr/ \
> -		RUNTIME_PREFIX=$(STAGING_DIR)/ \
> -		menuconfig
> -	rm -f $(UCLIBC_DIR)/.stamp_{config_fixup_done,configured,built}
> -	rm -f $(UCLIBC_DIR)/.stamp_{target,staging}_installed
> -
> -uclibc-update-config: $(UCLIBC_DIR)/.stamp_config_fixup_done
> -	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
> +$(eval $(kconfig-package))
>  
>  # Before uClibc is built, we must have the second stage cross-compiler
>  $(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
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
