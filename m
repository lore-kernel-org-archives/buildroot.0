From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Jun 2014 23:06:16 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: rework network.service
 installation
In-Reply-To: <1402951952-31334-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1402951952-31334-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140616210616.GA572@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-06-16 22:52 +0200, Eric Le Bihan spake thusly:
> The installation of the network.service file is now performed via the
> <pkg>_INIT_SYSTEMD mechanism instead of an installation hook.

Would mind also switching the other hooks over to use _INIT_SYSTEMD while
you are at it? ;-)

> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/systemd.mk | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index f3874db..97fa61a 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -101,6 +101,13 @@ ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
>  SYSTEMD_CONF_OPT += --enable-networkd
>  else
>  SYSTEMD_CONF_OPT += --disable-networkd
> +define SYSTEMD_INSTALL_SERVICE_NETWORK
> +	$(INSTALL) -D -m 644 package/systemd/network.service \
> +		$(TARGET_DIR)/etc/systemd/system/network.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../network.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> +endef

So, if networkd is disabled, you still install the network units?

Should that block not go in the non-else part of the condition instead?

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
> @@ -145,28 +152,20 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
>  		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
>  endef
>  
> -define SYSTEMD_INSTALL_NETWORK_HOOK
> -	$(INSTALL) -D -m 644 package/systemd/network.service \
> -		$(TARGET_DIR)/etc/systemd/system/network.service
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -	ln -fs ../network.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> -endef
> -
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_TTY_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_SANITIZE_PATH_IN_UNITS
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
> -SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_NETWORK_HOOK
> -endif
> -
>  define SYSTEMD_USERS
>  	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
>  	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
>  	$(SYSTEMD_USER_TIMESYNC)
>  endef
>  
> +define SYSTEMD_INSTALL_INIT_SYSTEMD
> +	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
> +endef
> +
>  $(eval $(autotools-package))
> -- 
> 1.9.3
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
