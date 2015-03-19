From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 01:41:49 +0100
Subject: [Buildroot] [PATCH v2] wpa_supplicant: install systemd service
 files
In-Reply-To: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
References: <1425917011-16598-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <550A1B4D.7000108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/15 17:03, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 As discussed on IRC, adding symlinks to actually start those services is not
such a great idea because
- you probably don't want all of them;
- also other things are needed, like hostapd config and ifup wlan0;
- you may have something to manage these services, like network-manager or networkd.

 Could be good to add that in a comment though.

 Regards,
 Arnout

> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 682cb4c..242bea5 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -164,4 +164,15 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
>  	$(WPA_SUPPLICANT_INSTALL_DBUS)
>  endef
>  
> +define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant at .service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-nl80211 at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-nl80211 at .service
> +	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant-wired at .service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired at .service
> +endef
> +
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
