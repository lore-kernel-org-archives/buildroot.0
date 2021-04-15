From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 15 Apr 2021 14:58:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: add
 introspection option
In-Reply-To: <20210415111957.27459-1-tolvupostur@gmail.com>
References: <20210415111957.27459-1-tolvupostur@gmail.com>
Message-ID: <CAAP7uc+D1guDjxWzThzL1PMGB8eDgnu=L=fBr=-OLkanfVXWGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 15, 2021 at 1:20 PM Einar Jon Gunnarsson
<tolvupostur@gmail.com> wrote:
>
> Add a flag to enable gobject-introspection
>
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>

Nice!
Acked-by: Aleksander Morgado <aleksander@aleksander.es>

> ---
>  package/modem-manager/Config.in        | 7 +++++++
>  package/modem-manager/modem-manager.mk | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
> index c4c723776d..67c4bf167c 100644
> --- a/package/modem-manager/Config.in
> +++ b/package/modem-manager/Config.in
> @@ -25,6 +25,13 @@ config BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>         select BR2_PACKAGE_LIBQMI
>         help
>           This option enables support for QMI protocol
> +
> +config BR2_PACKAGE_MODEM_MANAGER_INTROSPECTION
> +       bool "introspection support"
> +       depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +       select BR2_PACKAGE_GOBJECT_INTROSPECTION
> +       help
> +         This option enables support for GObject introspection
>  endif
>
>  comment "modemmanager needs a toolchain w/ wchar, threads"
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 2cc45d266b..cc8c49625f 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -34,6 +34,13 @@ else
>  MODEM_MANAGER_CONF_OPTS += --without-mbim
>  endif
>
> +ifeq ($(BR2_PACKAGE_MODEM_MANAGER_INTROSPECTION),y)
> +MODEM_MANAGER_DEPENDENCIES += gobject-introspection
> +MODEM_MANAGER_CONF_OPTS += --enable-introspection
> +else
> +MODEM_MANAGER_CONF_OPTS += --disable-introspection
> +endif
> +
>  define MODEM_MANAGER_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 -D package/modem-manager/S44modem-manager \
>                 $(TARGET_DIR)/etc/init.d/S44modem-manager
> --
> 2.17.1
>


-- 
Aleksander
https://aleksander.es
