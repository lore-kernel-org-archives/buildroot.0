From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 18:46:12 +0200
Subject: [Buildroot] [PATCH 6/6] systemd: install timesync service if
 selected
In-Reply-To: <1404406659-31109-7-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-7-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53BACED4.3000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/14 18:57, Eric Le Bihan wrote:
> If support for systemd-timesyncd is selected, install the associated
> service.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/systemd/systemd.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2da65e6..3454e43 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -112,6 +112,11 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
>  SYSTEMD_CONF_OPT += --enable-timesyncd
> +define SYSTEMD_INSTALL_SERVICE_TIMESYNC
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
> +	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
> +		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
> +endef

 Not for this patch, but perhaps a cleaner way to do this would be to add

SYSTEMD_INSTALL_INIT_SYSTEMD += $(SYSTEMD_INSTALL_SERVICE_TIMESYNC)

instead having the list explicit below? Or wouldn't that work because there is
no separator between networkd and timesync?


 Regards,
 Arnout

>  else
>  SYSTEMD_CONF_OPT += --disable-timesyncd
>  endif
> @@ -180,6 +185,7 @@ endef
>  
>  define SYSTEMD_INSTALL_INIT_SYSTEMD
>  	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
> +	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
>  endef
>  
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
