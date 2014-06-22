From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 16:14:16 +0200
Subject: [Buildroot] [PATCH 5 of 5 RFC] busybox: update-config: preserve
 freshly configured settings
In-Reply-To: <7e80ee0110a2066c2afe.1403444744@localhost>
References: <patchbomb.1403444739@localhost>
 <7e80ee0110a2066c2afe.1403444744@localhost>
Message-ID: <20140622141416.GF3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> In the sequence:
> 
> make busybox-menuconfig
> make busybox-update-config
> 
> the freshly configured settings from the menuconfig are lost during the
> update-config step. This is because update-config depends on the configure
> step, which starts by copying the config file to the build directory.
> 
> Instead, stop depending on the configure step from update-config, and
> explicitly call the needed commands before actually copying the config file.
> 
> This has the added bonus that 'busybox-update-config' no longer needs the
> toolchain to be available, which makes:
>     make clean busybox-menuconfig busybox-update-config
> much faster and user-friendly.
> 
> This is a corrolary of bug #7154 https://bugs.busybox.net/show_bug.cgi?id=7154
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

There is a small typo below, which when fixed, would get my:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/busybox/busybox.mk |  27 ++++++++++++++++++---------
>  1 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff -r 5dc5438c0108 -r 7e80ee0110a2 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Sun Jun 22 15:33:49 2014 +0200
> +++ b/package/busybox/busybox.mk	Sun Jun 22 10:34:06 2014 +0200
> @@ -189,14 +189,7 @@
>  endef
>  endif
>  
> -# Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
> -# full-blown versions of apps installed by other packages with sym/hard links.
> -define BUSYBOX_NOCLOBBER_INSTALL
> -	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
> -endef
> -
> -define BUSYBOX_CONFIGURE_CMDS
> -	$(BUSYBOX_COPY_CONFIG)
> +define BUSYBOX_SETUP_CONFIG
>  	$(BUSYBOX_SET_MMU)
>  	$(BUSYBOX_SET_LARGEFILE)
>  	$(BUSYBOX_SET_IPV6)
> @@ -208,6 +201,17 @@
>  	$(BUSYBOX_INTERNAL_SHADOW_PASSWORDS)
>  	$(BUSYBOX_SET_INIT)
>  	$(BUSYBOX_SET_WATCHDOG)
> +endef
> +
> +# Enable "noclobber" in install.sh, to prevent BusyBox from overwritting any

Hehe. You're introducing the 'overwritting' typo back? ;-)

Regards,
Yann E. MORIN.

> +# full-blown versions of apps installed by other packages with sym/hard links.
> +define BUSYBOX_NOCLOBBER_INSTALL
> +	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
> +endef
> +
> +define BUSYBOX_CONFIGURE_CMDS
> +	$(BUSYBOX_COPY_CONFIG)
> +	$(BUSYBOX_SETUP_CONFIG)
>  	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
>  		-C $(@D) oldconfig
>  	$(BUSYBOX_NOCLOBBER_INSTALL)
> @@ -235,8 +239,13 @@
>  	$(BUSYBOX_COPY_CONFIG)
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
>  		$(subst busybox-,,$@)
> +	rm -f $(BUSYBOX_DIR)/.stamp_config_file_fixed
>  	rm -f $(BUSYBOX_DIR)/.stamp_built
>  	rm -f $(BUSYBOX_DIR)/.stamp_target_installed
>  
> -busybox-update-config: busybox-configure
> +$(BUSYBOX_DIR)/.stamp_config_file_fixed:
> +	$(BUSYBOX_SETUP_CONFIG)
> +	touch $@
> +
> +busybox-update-config: $(BUSYBOX_DIR)/.stamp_config_file_fixed
>  	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
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
