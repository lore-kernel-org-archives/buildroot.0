From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 15:53:58 +0100
Subject: [Buildroot] [PATCH v3 2/9] package/busybox: add /bin/{a,
 hu}sh to /etc/shells
In-Reply-To: <1516356909-18620-3-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-3-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203145358.GC2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When ash (busybox) is selected, /bin/{a,hu}sh is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using {a,hu}sh as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3: Fix typo (Thomas)
>     Use TARGET_FINALIZE_HOOKS to avoid issues with the upcoming
>     top-level parallel build (Arnout)
> v2: add double-dollar after /bin/{a,hu}sh (Yann)
>     add hush handling
>     msh has been removed from Busybox 1.28
>     https://git.busybox.net/busybox/commit/?id=2e989ef232e35750df573898077dd356003705b2
>     msh is unlikely used.
> ---
>  package/busybox/busybox.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index d0bbd3f..145bc7c 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -258,6 +258,20 @@ define BUSYBOX_INSTALL_TELNET_SCRIPT
>  	fi
>  endef
>  
> +# Add /bin/{a,hu}sh to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define BUSYBOX_INSTALL_ADD_TO_SHELLS
> +	if grep -q CONFIG_ASH=y $(@D)/.config; then \
> +		grep -qsE '^/bin/ash$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/ash" >> $(TARGET_DIR)/etc/shells; \
> +	fi
> +	if grep -q CONFIG_HUSH=y $(@D)/.config; then \
> +		grep -qsE '^/bin/hush$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/hush" >> $(TARGET_DIR)/etc/shells; \
> +	fi
> +endef
> +BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
> +
>  # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
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
