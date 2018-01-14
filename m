From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:43:50 +0100
Subject: [Buildroot] [PATCH 2/7] package/busybox: add /bin/ash to
 /etc/shells
In-Reply-To: <1515963815-5843-3-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-3-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114224350.GI16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> When ash (busybox) is selected, /bin/ash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using ash as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> ash is disabled for MMUless systems, so don't add /bin/ash in
> /etc/shells in this case.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/busybox/busybox.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d0bbd3f..37d064a 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -258,6 +258,15 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
>  	fi
>  endef
>  
> +# Add /bin/ash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
> +ifeq ($(BR2_USE_MMU),y)
> +define BUSYBOX_INSTALL_ADD_ASH_TO_SHELLS
> +	grep -qsE '^/bin/ash' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/ash" >> $(TARGET_DIR)/etc/shells

What if the user uses a custom config file where ash is not enabled?
What about the other shells busybox may install?

    define BUSYBOX_INSTALL_ADD_TO_SHELLS
        if grep -qsE '^CONFIG_ASH=y$$' $(@D)/.config; then
            grep -qsE '^/bin/ash' $(TARGET_DIR)/etc/shells \
            || echo "/bin/ash" >> $(TARGET_DIR)/etc/shells; \
        fi
        if grep -qsE '^CONFIG_HUSH=y$$' $(@D)/.config; then
            grep -qsE '^/bin/hush' $(TARGET_DIR)/etc/shells \
            || echo "/bin/hush" >> $(TARGET_DIR)/etc/shells; \
        fi
        if grep -qsE '^CONFIG_MSH=y$$' $(@D)/.config; then
            grep -qsE '^/bin/msh' $(TARGET_DIR)/etc/shells \
            || echo "/bin/msh" >> $(TARGET_DIR)/etc/shells; \
        fi
    endef

(msh is just an alias for hush, but it can be a shell nonethless...)

Regards,
Yann E. MORIN.

> +endef
> +endif
> +
>  # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
> @@ -291,6 +300,7 @@ define BUSYBOX_INSTALL_TARGET_CMDS
>  	$(BUSYBOX_INSTALL_INITTAB)
>  	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
> +	$(BUSYBOX_INSTALL_ADD_ASH_TO_SHELLS)
>  endef
>  
>  define BUSYBOX_INSTALL_INIT_SYSV
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
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
