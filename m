From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 12:36:58 +0200
Subject: [Buildroot] [v4 03/13] packages: use new $($PKG)_DL_DIR)
 variable
In-Reply-To: <20180402081434.4411-3-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-3-maxime.hadjinlian@gmail.com>
Message-ID: <20180402103658.GC3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

title: the variable is not 'new', it had always existed...

On 2018-04-02 10:14 +0200, Maxime Hadjinlian spake thusly:
> Instead of DL_DIR, the package should now use $(PKG)_DL_DIR to ease the
> transition into a new directory structure for DL_DIR.
> 
> This commit has been generated with the following scripts:
> 
> for i in $(find . -iname "*.mk"); do
> 	if ! grep -q "\$(DL_DIR)" ${i}; then
> 		continue
> 	fi
> 	pkg_name="$(basename $(dirname ${i}))"
> 	[ "${pkg_name}" = "package" ] && continue
> 	raw_pkg_name=$(echo ${pkg_name} | tr [a-z] [A-Z] | tr '-' '_')
> 	pkg_dl_dir="${raw_pkg_name}_DL_DIR"
> 	sed -i "s/\$(DL_DIR)/\$($pkg_dl_dir)/" ${i}
> done
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
> index 61d6c826fc..50cdc322e4 100644
> --- a/package/bootstrap/bootstrap.mk
> +++ b/package/bootstrap/bootstrap.mk
> @@ -11,7 +11,9 @@ BOOTSTRAP_LICENSE = MIT
>  BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
>  
>  define BOOTSTRAP_EXTRACT_CMDS
> -	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
> +	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
> +	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)/
> +	rmdir $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist

You incorrectly re-add lines that were removed in 39c181d5a99
(bootstrap: bump version to 4.0.0)...

[--SNIP--]
> diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
> index ea41f65a80..c19780110c 100644
> --- a/package/openobex/openobex.mk
> +++ b/package/openobex/openobex.mk
> @@ -19,6 +19,12 @@ ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
>  OPENOBEX_DEPENDENCIES += bluez_utils
>  endif
>  
> +define OPENOBEX_EXTRACT_CMDS
> +	$(UNZIP) -d $(@D) $(OPENOBEX_DL_DIR)/$(OPENOBEX_SOURCE)
> +	mv $(@D)/openobex-$(OPENOBEX_VERSION)-Source/* $(@D)
> +	$(RM) -r $(@D)/openobex-$(OPENOBEX_VERSION)-Source
> +endef

openobex no longer uses a ziop file, since commit 49a9fb0f13
(package/openobex: bump version to 1.7.2)

[--SNIP--]
> diff --git a/package/urg/urg.mk b/package/urg/urg.mk
> index 966627fe36..1346079893 100644
> --- a/package/urg/urg.mk
> +++ b/package/urg/urg.mk
> @@ -25,7 +25,9 @@ endif
>  URG_CONFIG_SCRIPTS = c_urg-config urg-config
>  
>  define URG_EXTRACT_CMDS
> -	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(URG_SOURCE)
> +	$(UNZIP) -d $(BUILD_DIR) $(URG_DL_DIR)/$(URG_SOURCE)
> +	test -d $(URG_DIR) || \
> +		mv $(BUILD_DIR)/$(subst .zip,,$(URG_SOURCE)) $(URG_DIR)

You are re-adding lines that got removed in 9e943e85228 (package/urg:
fix extraction commands).

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(autotools-package))
> diff --git a/package/waf/waf.mk b/package/waf/waf.mk
> index e7ac891b39..639c26a3b0 100644
> --- a/package/waf/waf.mk
> +++ b/package/waf/waf.mk
> @@ -9,7 +9,7 @@ WAF_SOURCE = waf-$(WAF_VERSION)
>  WAF_SITE = https://waf.io/
>  
>  define HOST_WAF_EXTRACT_CMDS
> -	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
> +	$(INSTALL) -D -m 0755 $(WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
>  endef
>  
>  define HOST_WAF_INSTALL_CMDS
> diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
> index d9b45638c5..3b6ec3419b 100644
> --- a/package/whetstone/whetstone.mk
> +++ b/package/whetstone/whetstone.mk
> @@ -9,7 +9,7 @@ WHETSTONE_SOURCE = whetstone.c
>  WHETSTONE_SITE = http://www.netlib.org/benchmark
>  
>  define WHETSTONE_EXTRACT_CMDS
> -	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
> +	cp $(WHETSTONE_DL_DIR)/$($(PKG)_SOURCE) $(@D)/
>  endef
>  
>  define WHETSTONE_BUILD_CMDS
> diff --git a/package/wilc1000-firmware/wilc1000-firmware.mk b/package/wilc1000-firmware/wilc1000-firmware.mk
> index 5dcf19045b..6f504d67a0 100644
> --- a/package/wilc1000-firmware/wilc1000-firmware.mk
> +++ b/package/wilc1000-firmware/wilc1000-firmware.mk
> @@ -11,7 +11,7 @@ WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip
>  WILC1000_FIRMWARE_LICENSE = PROPRIETARY
>  
>  define WILC1000_FIRMWARE_EXTRACT_CMDS
> -	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
> +	$(UNZIP) -d $(BUILD_DIR) $(WILC1000_FIRMWARE_DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
>  	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
>  	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
>  endef
> diff --git a/package/zynq-boot-bin/zynq-boot-bin.mk b/package/zynq-boot-bin/zynq-boot-bin.mk
> index 3648c63654..c523e04f45 100644
> --- a/package/zynq-boot-bin/zynq-boot-bin.mk
> +++ b/package/zynq-boot-bin/zynq-boot-bin.mk
> @@ -12,7 +12,7 @@ ZYNQ_BOOT_BIN_LICENSE = GPL-3.0+
>  HOST_ZYNQ_BOOT_BIN_DEPENDENCIES = host-python
>  
>  define HOST_ZYNQ_BOOT_BIN_EXTRACT_CMDS
> -	cp $(DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
> +	cp $(ZYNQ_BOOT_BIN_DL_DIR)/$(ZYNQ_BOOT_BIN_SOURCE) $(@D)
>  endef
>  
>  define HOST_ZYNQ_BOOT_BIN_INSTALL_CMDS
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
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
