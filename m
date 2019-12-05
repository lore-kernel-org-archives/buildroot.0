From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 12:25:05 +0100
Subject: [Buildroot] [PATCH v2 3/9] fix tty handling
In-Reply-To: <20191111172443.6874-4-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-4-jeremy.rosen@smile.fr>
Message-ID: <20191205112505.GC2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> Handling of tty is a bit tricky, we need to aggressively disable what
> systemd does with tty1 then update for what buildroot wants to do
> 
> Rework the whole tty generation to work with presets
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  .../0002-allow-an-empty-DefaultInstance.patch | 28 +++++++++++++++++++
>  package/systemd/80-buildroot.preset           |  5 ++--
>  package/systemd/systemd.mk                    | 26 +++++++++++++----
>  3 files changed, 50 insertions(+), 9 deletions(-)
>  create mode 100644 package/systemd/0002-allow-an-empty-DefaultInstance.patch
> 
> diff --git a/package/systemd/0002-allow-an-empty-DefaultInstance.patch b/package/systemd/0002-allow-an-empty-DefaultInstance.patch
> new file mode 100644
> index 0000000000..0cb4ffa985
> --- /dev/null
> +++ b/package/systemd/0002-allow-an-empty-DefaultInstance.patch
> @@ -0,0 +1,28 @@
> +From 087a91c29b9fd67bda9d4199789842263545cd12 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
> +Date: Sat, 2 Nov 2019 00:03:54 +0100
> +Subject: [PATCH] allow an empty DefaultInstance= in configuration files
> +
> +It is currently possible to override the DefaultInstance via drop-ins but
> +not remove it completely. Allow to do that by specifying an empty
> +DefaultInstance=

As discussed on IRC: add a pointer to the upstream commit.
Plus: add you own SoB line (upstream don't do SoBs, but we do, even on
back-ported patches.

> +
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index dc2ed80e7d..fc782d0af7 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -429,22 +429,36 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd needs getty.service for VTs and serial-getty.service for serial ttys
>  # note that console-getty.service should be used on /dev/console as it should not have dependencies
>  # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
> +#
> +# systemd defaults to only have getty at tty.service enabled 
> +# * DefaultInstance=tty1 in getty at service
> +# * no DefaultInstance in serial-getty at .service
> +# * WantedBy=getty.target in console-getty.service
> +# * console-getty is not enabled because of 90-systemd.preset
> +# We want "systemctl preset-all" to do the right thing, even when run on the target after boot
> +# * remove the default instance of getty at .service via a drop-in in /usr/lib
> +# * set a new DefaultInstance for getty at .service instead, if needed
> +# * set a new DefaultInstance for serial-getty at .service, if needed
> +# * override the systemd-provided preset for console-getty.service if needed
>  define SYSTEMD_INSTALL_SERVICE_TTY
> +	mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d;\
> +	echo [Install] > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
> +	echo DefaultInstance= >> $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
>  	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
>  	then \
>  		TARGET="console-getty.service"; \
> -		LINK_NAME="console-getty.service"; \
> +		echo enable console-getty.service > $(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset;\

Please use printf, not echo.

>  	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
>  	then \
>  		TARGET="getty at .service"; \
> -		LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +		echo [Install] > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
> +		echo DefaultInstance=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >> $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\

    printf '[Install]\nDefaultInstance=%s\n' \
        "$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))" \
        >$(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf; \

>  	else \
>  		TARGET="serial-getty at .service"; \
> -		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
> +		echo [Install] > $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
> +		echo DefaultInstance=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >> $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\

Ditto.

I'm pretty pleased with all the big comment, and the code
simplifications. :-)

Regards,
Yann E. MORIN.

>  	fi; \
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
> -	ln -fs ../../../../lib/systemd/system/$${TARGET} \
> -		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
>  	if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
>  	then \
>  		$(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
> -- 
> 2.24.0.rc1
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
