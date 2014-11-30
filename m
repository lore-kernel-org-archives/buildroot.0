From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:45:16 +0100
Subject: [Buildroot] [PATCHv3 58/74] rsyslog: install init script and
 config file unconditionally
In-Reply-To: <1417357142-14307-59-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-59-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130174516.GN4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Also, we take this opportunity to rename RSYSLOG_INSTALL_CONF_SCRIPT
> to RSYSLOG_INSTALL_CONF because it is no longer installing an init
> script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rsyslog/rsyslog.mk | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index d7dc930..6b72bb5 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -39,18 +39,16 @@ else
>  endif
>  
>  define RSYSLOG_INSTALL_INIT_SYSV
> -	[ -f $(TARGET_DIR)/etc/init.d/S01rsyslog ] || \
> -		$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
> -			$(TARGET_DIR)/etc/init.d/S01rsyslog
> +	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
> +		$(TARGET_DIR)/etc/init.d/S01rsyslog
>  endef
>  
> -define RSYSLOG_INSTALL_CONF_SCRIPT
> -	[ -f $(TARGET_DIR)/etc/rsyslog.conf ] || \
> -		$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
> -			$(TARGET_DIR)/etc/rsyslog.conf
> +define RSYSLOG_INSTALL_CONF
> +	$(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
> +		$(TARGET_DIR)/etc/rsyslog.conf
>  	mkdir -p $(TARGET_DIR)/etc/rsyslog.d
>  endef
>  
> -RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
> +RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF
>  
>  $(eval $(autotools-package))
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
