From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Feb 2019 11:39:52 +0100
Subject: [Buildroot] [PATCH 1/5] package/mender: adding a writable
 location
In-Reply-To: <1549359793-12666-2-git-send-email-angelo@amarulasolutions.com>
References: <1549359793-12666-1-git-send-email-angelo@amarulasolutions.com>
 <1549359793-12666-2-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190205103952.GC18066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2019-02-05 10:43 +0100, Angelo Compagnucci spake thusly:
> Mender needs /var/lib/mender to be writable at the service start, the
> path is hardcoded and thus we cannot change it.
> This patch solves the problem using the same approach we have for
> dropbear.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mender/mender.mk      |  2 ++
>  package/mender/mender.service | 12 +++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
> index a5cece7..1f66615 100644
> --- a/package/mender/mender.mk
> +++ b/package/mender/mender.mk
> @@ -49,6 +49,8 @@ define MENDER_INSTALL_CONFIG_FILES
>  		$(INSTALL) -D -m 0755 $(@D)/support/mender-inventory-$(f) \
>  			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
>  	)
> +
> +	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
>  endef
>  
>  MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
> diff --git a/package/mender/mender.service b/package/mender/mender.service
> index 9ede55a..8b60a4f 100644
> --- a/package/mender/mender.service
> +++ b/package/mender/mender.service
> @@ -6,7 +6,17 @@ After=systemd-resolved.service
>  Type=idle
>  User=root
>  Group=root
> -ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
> +ExecStartPre=/bin/sh -c '\
> +if [ -L /var/lib/mender \
> +     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]; then \
> +    if rm -f /var/lib/mender >/dev/null 2>&1; then \
> +        mkdir -p /var/lib/mender; \
> +    else \
> +        echo "No persistent location to store mender data. Data will be lost\
> +        echo "at reboot. Are you sure this is what you want to do?"; \
> +        mkdir -p "$(readlink /var/lib/mender)"; \
> +    fi; \
> +fi'
>  ExecStart=/usr/bin/mender -daemon
>  Restart=on-abort
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
