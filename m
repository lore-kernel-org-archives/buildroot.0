From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:23:36 -0500
Subject: [Buildroot] [PATCH 09/15] package/linuxptp adapt to preset-all
In-Reply-To: <20191103165640.21819-10-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-10-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4on3D-Gd_=_KGsmcsAd3HvmW7U_ZPZfv1G4fTHZnF3beQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> linuxptp has two services
> * linuxptp.service : the actual daemon
> * linuxptp-system-clock.service : sync the linux clock to the phc clock
>
> The first was enabled, the second was not
> The second has an incorrect (though harmless) WantedBy : there is an
> explicit Wants= in linuxptp.service
>
> This keeps the compatibility, but I don't see the poit of not enabling the
> second service.
I agree, it not being enabled should be considered a bug.
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/linuxptp/50-linuxptp.preset            | 1 +
>  package/linuxptp/linuxptp-system-clock.service | 1 -
>  package/linuxptp/linuxptp.mk                   | 5 ++---
>  3 files changed, 3 insertions(+), 4 deletions(-)
>  create mode 100644 package/linuxptp/50-linuxptp.preset
>
> diff --git a/package/linuxptp/50-linuxptp.preset b/package/linuxptp/50-linuxptp.preset
> new file mode 100644
> index 0000000000..dd8dbb12d5
> --- /dev/null
> +++ b/package/linuxptp/50-linuxptp.preset
> @@ -0,0 +1 @@
> +disable linuxptp-system-clock.service
> diff --git a/package/linuxptp/linuxptp-system-clock.service b/package/linuxptp/linuxptp-system-clock.service
> index a4436a34a7..57beec4579 100644
> --- a/package/linuxptp/linuxptp-system-clock.service
> +++ b/package/linuxptp/linuxptp-system-clock.service
> @@ -8,4 +8,3 @@ Restart=always
>
>  [Install]
>  WantedBy=multi-user.target
> -WantedBy=linuxptp.service
> diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
> index c304ff6d6e..5b55322b0b 100644
> --- a/package/linuxptp/linuxptp.mk
> +++ b/package/linuxptp/linuxptp.mk
> @@ -42,9 +42,8 @@ define LINUXPTP_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/usr/lib/systemd/system/linuxptp.service
>         $(INSTALL) -D -m 644 $(LINUXPTP_PKGDIR)/linuxptp-system-clock.service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/linuxptp-system-clock.service
> -       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -       ln -sf ../../../../usr/lib/systemd/system/linuxptp.service \
> -               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/linuxptp.service
> +       $(INSTALL) -D -m 644 package/linuxptp/50-linuxptp.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-linuxptp.preset
>  endef
>
>  $(eval $(generic-package))
> --
> 2.24.0.rc1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
