From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:30:20 -0500
Subject: [Buildroot] [PATCH 11/15] package/network-manager: adapt to
 preset-all
In-Reply-To: <20191103165640.21819-12-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-12-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4oNTQfJenea59ZgQXhgUE8H43z2Hat34kJNbNO6tU3T6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> NM has three services
> * NetworkManger.service : the main daemon
> * NetworkManger-dispatcher.service : a daemon handling network callbacks
> * NetworkManager-wait-online.service : sync of other services with network-online
>
> Only the first two were activated. We now also enable
> wait-online. Not enabling it was probably a bug.
>
> Note that buildroot adds an alias dbus-org.freedesktop.NetworkManager
> Adding an alias that is not known upstream is not clean,
> but I left it for backward compatibility
We should probably remove it unless there's something known to actually
depend on it.
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/network-manager/network-manager.mk | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 6412d3a241..67e6a76774 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -88,16 +88,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
>  endef
>
>  define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
> -       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -
>         ln -sf /usr/lib/systemd/system/NetworkManager.service \
>                 $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
>
> -       ln -sf /usr/lib/systemd/system/NetworkManager.service \
> -               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
> -
> -       ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
> -               $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
>  endef
>
>  $(eval $(autotools-package))
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
