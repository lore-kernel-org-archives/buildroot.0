From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:12:20 +0100
Subject: [Buildroot] [PATCH] package/ntp: use common sysv init install
In-Reply-To: <1549233531-21486-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549233531-21486-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <b1a76f63-6951-70c0-940f-63970804919a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/02/2019 23:38, Matt Weber wrote:
> Previously the sysv init script install was conditional based on ntpd
> being selected, now that sntp also has an init script and could be
> selected independent of ntpd, a common install is necessary.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/ntp/ntp.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index aad1cdd..c62d59e 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -102,9 +102,8 @@ endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NTP_NTPD),y)
> -define NTP_INSTALL_INIT_SYSV
> +define NTP_INSTALL_INIT_SYSV_NTPD
>  	$(INSTALL) -D -m 755 package/ntp/S49ntp $(TARGET_DIR)/etc/init.d/S49ntp
> -	$(NTP_INSTALL_INIT_SYSV_SNTP)
>  endef
>  
>  define NTP_INSTALL_INIT_SYSTEMD
> @@ -115,4 +114,9 @@ define NTP_INSTALL_INIT_SYSTEMD
>  endef
>  endif
>  
> +define NTP_INSTALL_INIT_SYSV
> +	$(NTP_INSTALL_INIT_SYSV_NTPD)
> +	$(NTP_INSTALL_INIT_SYSV_SNTP)
> +endef
> +
>  $(eval $(autotools-package))
> 
