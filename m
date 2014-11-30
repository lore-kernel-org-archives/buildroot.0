From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:04:33 +0100
Subject: [Buildroot] [PATCHv3 10/74] stunnel: use the
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130150433.GO4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> Since the existing STUNNEL_INSTALL_CONF_SCRIPT hook no longer installs
> the init script, we rename it to STUNNEL_INSTALL_CONF.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/stunnel/stunnel.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
> index dc56261..ac2963e 100644
> --- a/package/stunnel/stunnel.mk
> +++ b/package/stunnel/stunnel.mk
> @@ -18,14 +18,17 @@ else
>  STUNNEL_CONF_OPTS += --disable-systemd
>  endif
>  
> -define STUNNEL_INSTALL_CONF_SCRIPT
> -	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
> +define STUNNEL_INSTALL_CONF
>  	[ -f $(TARGET_DIR)/etc/stunnel/stunnel.conf ] || \

What is the stance on removing those conditional installs? I thought we
wanted to get rid oif all of them, in favour of using a post-build
script or rootfs-overlay.

Can be done in a separate patch, maybe.

Otherwise, loks good:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  		$(INSTALL) -m 0644 -D $(@D)/tools/stunnel.conf \
>  			$(TARGET_DIR)/etc/stunnel/stunnel.conf
>  	rm -f $(TARGET_DIR)/etc/stunnel/stunnel.conf-sample
>  endef
>  
> -STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
> +STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF
> +
> +define STUNNEL_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/stunnel/S50stunnel $(TARGET_DIR)/etc/init.d/S50stunnel
> +endef
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
