From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Apr 2016 21:58:46 +0200
Subject: [Buildroot] [PATCH v2] package/wpa_supplicant: Fix systemd
 service stop
In-Reply-To: <1460123993-18653-2-git-send-email-m.niestroj@grinn-global.com>
References: <1460123993-18653-1-git-send-email-m.niestroj@grinn-global.com>
 <1460123993-18653-2-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <570AB076.5010402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Subject line is not entirely accurate, as far as I understand, it's not really 
started so I think it should just be "Fix systemd service for new DBus bus name".

On 04/08/16 15:59, Marcin Niestroj wrote:
> Fix systemd service stop when using only new DBus bus name.

  This repetition of the subject line is not needed.

>
> By default systemd service description comes with old DBus bus name for
> wpa_supplicant. If only new bus name is used, then systemd stops
> wpa_supplicant.service, because it has not started old bus name with
> specified time. In order to suppress stopping wpa_supplicant.service in
> such case, we just rename BusName property to the new one, so systemd
> sees that the service has started properly.

  I don't think this is very clear, let me try to rephrase it.

By default, the systemd service supplied with the wpa_supplicant package comes 
with the old DBus bus name. However, when the new bus name is used by 
wpa_supplicant, systemd will not be able to detect its appearance on the bus. 
Therefore it will terminate the service again after some timeout, because 
systemd assumes it is malfunctioning.

To fix this, make sure that the correct BusName property is used.


  Otherwise looks good to me. However, I'd prefer to have an upstreamable patch 
instead that uses the CONFIG_CTRL_IFACE_DBUS_NEW config knob to set it correctly 
in wpa_supplicant/Makefile.

>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>   package/wpa_supplicant/wpa_supplicant.mk | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index ba1180d..7d4ab42 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -193,6 +193,19 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>   	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
>   endef
>
> +# By default systemd service description comes with old DBus bus name for
> +# wpa_supplicant. If only new bus name is used, then systemd stops
> +# wpa_supplicant.service, because it has not started old bus name with
> +# specified time.
> +# To suppress stopping wpa_supplicant.service in such case, just rename
> +# BusName property to the new one.

  The comment should be clarified as well.

  Regards,
  Arnout

> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),)
> +define WPA_SUPPLICANT_UPDATE_DBUS_NAME
> +	sed -i -e 's/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE)/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE)/g' \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
> +endef
> +endif
> +
>   define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
> @@ -202,6 +215,7 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>   		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
>   	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
> +	$(WPA_SUPPLICANT_UPDATE_DBUS_NAME)
>   endef
>
>   $(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
