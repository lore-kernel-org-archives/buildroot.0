From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:39:54 -0500
Subject: [Buildroot] [PATCH 07/15] package/connman: adapt to preset-all
In-Reply-To: <20191103165640.21819-8-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-8-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4rf6C5o1nD2nbutOwSVtkCiSr-hHhYE9VFa1D3er7f1MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> connman has two services
> * connman.service which is the real daemon
> * connman-wait-online.service which is a sync point for network-online.target
>
> Only the first one was enabled. This adaptation enables both.
>
> Not enabling connman-wait-online.service is probably a bug
Yes, that seems correct, I had sent in a patch to enable it manually:
https://patchwork.ozlabs.org/patch/1187651/
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/connman/connman.mk | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 839bc7a0e2..d70eb1ac82 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
>  endef
>
> -define CONNMAN_INSTALL_INIT_SYSTEMD
> -       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -fs ../../../../usr/lib/systemd/system/connman.service \
> -               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> -endef
> -
>  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
>  CONNMAN_CONF_OPTS += --enable-client
>  CONNMAN_DEPENDENCIES += readline
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
