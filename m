From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jan 2021 10:06:47 +0100
Subject: [Buildroot] [PATCH] packages: prevent occurring the error when
 directory exists
In-Reply-To: <20201116123035.993106-1-b.bilas@grinn-global.com>
References: <20201116123035.993106-1-b.bilas@grinn-global.com>
Message-ID: <20210103090647.GK2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-11-16 13:30 +0100, Bartosz Bilas spake thusly:
> Add -p argument that ignore that specified directory already exists.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

I've split this into three patches, one for each affected package.
Additionally, I changed the luarocks package to use $(INSTALL) rather
than the combination of "mkdir -p + cp".

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/luarocks/luarocks.mk   | 2 +-
>  package/syslog-ng/syslog-ng.mk | 2 +-
>  package/systemd/systemd.mk     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 670e7487af..a8188685d3 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -17,7 +17,7 @@ LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua
>  HOST_LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/host-config.lua
>  
>  define LUAROCKS_ADDON_EXTRACT
> -	mkdir $(@D)/src/luarocks/cmd/external
> +	mkdir -p $(@D)/src/luarocks/cmd/external
>  	cp package/luarocks/buildroot.lua $(@D)/src/luarocks/cmd/external/buildroot.lua
>  endef
>  HOST_LUAROCKS_POST_EXTRACT_HOOKS += LUAROCKS_ADDON_EXTRACT
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> index 7c2368efba..f7182ba311 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -113,7 +113,7 @@ endef
>  # By default syslog-ng installs a .service that requires a config file at
>  # /etc/default, so provide one with the default values.
>  define SYSLOG_NG_INSTALL_INIT_SYSTEMD
> -	mkdir $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d
> +	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d
>  	printf '[Install]\nDefaultInstance=default\n' \
>  		>$(TARGET_DIR)/usr/lib/systemd/system/syslog-ng at .service.d/buildroot-default-instance.conf
>  endef
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index cb12f667d6..ddd3f4380e 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -576,7 +576,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # * enable serial-getty at xxx for other $BR2_TARGET_GENERIC_TTY_PATH
>  # * rewrite baudrates if a baudrate is provided
>  define SYSTEMD_INSTALL_SERVICE_TTY
> -	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
> +	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d; \
>  	printf '[Install]\nDefaultInstance=\n' \
>  		>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
>  	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
> @@ -588,7 +588,7 @@ define SYSTEMD_INSTALL_SERVICE_TTY
>  			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
>  			>$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \
>  	else \
> -		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
> +		mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
>  		printf '[Install]\nDefaultInstance=%s\n' \
>  			$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) \
>  			>$(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
