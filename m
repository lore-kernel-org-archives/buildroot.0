From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 16:28:49 +0200
Subject: [Buildroot] [PATCH v5 03/13] package/systemd: fix tty handling
In-Reply-To: <20191216103052.35220-4-jeremy.rosen@smile.fr>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
 <20191216103052.35220-4-jeremy.rosen@smile.fr>
Message-ID: <20200516162849.5df96b0d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my,

On Mon, 16 Dec 2019 11:30:42 +0100
J?r?my Rosen <jeremy.rosen@smile.fr> wrote:

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
> +	printf '[Install]\nDefaultInstance=\n' > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
>  	if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
>  	then \
>  		TARGET="console-getty.service"; \
> -		LINK_NAME="console-getty.service"; \
> +		printf 'enable console-getty.service\n' > $(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset;\
>  	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
>  	then \
>  		TARGET="getty at .service"; \
> -		LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +		printf '[Install]\nDefaultInstance=%s\n' $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
>  	else \
>  		TARGET="serial-getty at .service"; \
> -		LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +		mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
> +		printf '[Install]\nDefaultInstance=%s\n' $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) > $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
>  	fi; \
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
> -	ln -fs ../../../../lib/systemd/system/$${TARGET} \
> -		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \

I am not sure exactly if it is this change causing the issue, but there
is an issue in this code. See the bug report at:

  https://bugs.busybox.net/show_bug.cgi?id=12786

I must say now that I read the comment on top of this code, I don't
understand at all what is being explained. Could you give a bit more
details about what we are trying to do here, and hopefully help resolve
bug 12786 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
