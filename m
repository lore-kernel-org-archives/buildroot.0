From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:33:30 -0500
Subject: [Buildroot] [PATCH 13/15] package/sysklogd: adapt to preset-all
In-Reply-To: <20191103165640.21819-14-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-14-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4rvb69BK_OfJqETe8-6bESt=032GUdt---EQs=JZJcazQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> sysklogd installs two services: syslogd and klogd
> only syslogd is enabled, leave it that way
klogd not being enabled looks to be a bug so we should not disable it
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/sysklogd/50-sysklogd.preset | 1 +
>  package/sysklogd/sysklogd.mk        | 7 ++-----
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  create mode 100644 package/sysklogd/50-sysklogd.preset
>
> diff --git a/package/sysklogd/50-sysklogd.preset b/package/sysklogd/50-sysklogd.preset
> new file mode 100644
> index 0000000000..2f9b19acb5
> --- /dev/null
> +++ b/package/sysklogd/50-sysklogd.preset
> @@ -0,0 +1 @@
> +disable klogd.service
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index 266c171170..c7846d4f50 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -30,11 +30,8 @@ define SYSKLOGD_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/usr/lib/systemd/system/syslogd.service
>         $(INSTALL) -D -m 644 $(SYSKLOGD_PKGDIR)/klogd.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/klogd.service
> -       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -sf ../../../../usr/lib/systemd/system/syslogd.service \
> -               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/syslogd.service
> -       ln -sf ../../../usr/lib/systemd/system/syslogd.service \
> -               $(TARGET_DIR)/etc/systemd/system/syslog.service
> +       $(INSTALL) -D -m 644 package/sysklogd/50-sysklogd.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-sysklogd.preset
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
