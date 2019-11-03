From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 Nov 2019 12:32:17 -0500
Subject: [Buildroot] [PATCH 12/15] package/wpa_supplicant: adapt for
 preset-all
In-Reply-To: <20191103165640.21819-13-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-13-jeremy.rosen@smile.fr>
Message-ID: <CADvTj4ph9KOPnxauR1j-hmkpAFUZF0vSx3Y_pg2HP7zqCTuK2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>
> all services were installed but not enabled.
> This change keeps them that way.
These not being enabled looks to be a bug so we should not disable them.
>
> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/wpa_supplicant/50-wpa_supplicant.preset | 5 +++++
>  package/wpa_supplicant/wpa_supplicant.mk        | 2 ++
>  2 files changed, 7 insertions(+)
>  create mode 100644 package/wpa_supplicant/50-wpa_supplicant.preset
>
> diff --git a/package/wpa_supplicant/50-wpa_supplicant.preset b/package/wpa_supplicant/50-wpa_supplicant.preset
> new file mode 100644
> index 0000000000..ddd339d82f
> --- /dev/null
> +++ b/package/wpa_supplicant/50-wpa_supplicant.preset
> @@ -0,0 +1,5 @@
> +disable wpa_supplicant.service
> +disable wpa_supplicant at .service
> +disable wpa_supplicant-nl80211 at .service
> +disable wpa_supplicant-wired at .service
> +
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 9dcebca9bf..42b12b1fb4 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -227,6 +227,8 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>                 $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
>         $(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
>                 $(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
> +       $(INSTALL) -D -m 644 package/wpa_supplicant/50-wpa_supplicant.preset \
> +               $(TARGET_DIR)/usr/lib/systemd/system-preset/50-wpa_supplicant.preset
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
