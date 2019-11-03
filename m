From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:48:18 -0500
Subject: [Buildroot] [PATCH 03/15] fix tty handling
In-Reply-To: <20191103165640.21819-4-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-4-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4rFQ0a_k=sYS_ugNMOXQpTV3AA-3AOrZCSwNHaSg2XXkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> Handling of tty is a bit tricky, we need to aggressively disable what
> systemd does with tty1 then update for what buildroot wants to do
>
> Rework the whole tty generation to work with presets
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  ...e-default-instance-of-getty-.service.patch | 27 +++++++++++++++++++
>  package/systemd/80-buildroot.preset           |  5 ++--
>  package/systemd/systemd.mk                    | 25 ++++++++++++-----
>  3 files changed, 48 insertions(+), 9 deletions(-)
>  create mode 100644 package/systemd/0002-remove-default-instance-of-getty-.service.patch
>
> diff --git a/package/systemd/0002-remove-default-instance-of-getty-.service.patch b/package/systemd/0002-remove-default-instance-of-getty-.service.patch
> new file mode 100644
> index 0000000000..b412620cbd
> --- /dev/null
> +++ b/package/systemd/0002-remove-default-instance-of-getty-.service.patch
> @@ -0,0 +1,27 @@
> +From 77384f2f107ca99fef6a9c0b9d54a3f2147a0d18 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
> +Date: Thu, 31 Oct 2019 16:24:02 +0100
> +Subject: [PATCH] remove default instance of getty at .service
> +
> +upstream assumes that tty1 is always a valid tty, this generally makes
> +sense but might not be the case for embedded devices. Having it as a
> +DefaultInstance makes it enabled by "systemctl preset-all"
> +
> +it is simpler for us to remove the DefaultInstance entirely and manually
> +link as needed
Can we make this suitable for inclusion in upstream systemd by making
the DefaultInstance
tty a meson config option instead?
> +---
> + units/getty at .service.m4 | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
> +index 80e793bb73..7060457cb1 100644
> +--- a/units/getty at .service.m4
> ++++ b/units/getty at .service.m4
> +@@ -57,4 +57,3 @@ UnsetEnvironment=LANG LANGUAGE LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETAR
> +
> + [Install]
> + WantedBy=getty.target
> +-DefaultInstance=tty1
> +--
> +2.24.0.rc1
> +
> diff --git a/package/systemd/80-buildroot.preset b/package/systemd/80-buildroot.preset
> index 4074901cbd..5dbae39173 100644
> --- a/package/systemd/80-buildroot.preset
> +++ b/package/systemd/80-buildroot.preset
> @@ -1,5 +1,4 @@
>  # Higher priority than systemd presets
>
> -# by default systemd enables a getty on tty1
> -# we don't want that because tty1 may not exist
> -disable getty at .service
> +# This file is currently empty, but is available for demonstration and future use
> +
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index d4680cd225..ed039de82b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -428,22 +428,35 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
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
> +# * remove the default instance of getty at .service via a patch on systemd source
> +#   drop-ins cannot override DefaultInstance with an empty string
> +# * set a new DefaultInstance for getty at .service, if needed
> +# * set a new DefaultInstance for serial-getty at .service, if needed
> +# * override the systemd-provided preset for console-getty.service if needed
>  define SYSTEMD_INSTALL_SERVICE_TTY
>         if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
>         then \
>                 TARGET="console-getty.service"; \
> -               LINK_NAME="console-getty.service"; \
> +               echo enable console-getty.service > $(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset;\
>         elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'tty[0-9]*$$'; \
>         then \
>                 TARGET="getty at .service"; \
> -               LINK_NAME="getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +               mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d;\
> +               echo [Install] > $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
> +               echo DefaultInstance=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >> $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d/buildroot-console.conf;\
>         else \
>                 TARGET="serial-getty at .service"; \
> -               LINK_NAME="serial-getty@$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
> +               mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d;\
> +               echo [Install] > $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
> +               echo DefaultInstance=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >> $(TARGET_DIR)/usr/lib/systemd/system/serial-getty at .service.d/buildroot-console.conf;\
>         fi; \
> -       mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
> -       ln -fs ../../../../lib/systemd/system/$${TARGET} \
> -               $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
>         if [ $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE)) -gt 0 ] ; \
>         then \
>                 $(SED) 's,115200,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE),' $(TARGET_DIR)/lib/systemd/system/$${TARGET}; \
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
