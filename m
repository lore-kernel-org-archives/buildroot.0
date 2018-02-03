From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 15:55:02 +0100
Subject: [Buildroot] [PATCH v3 3/9] package/dash: add /etc/dash to
 /etc/shells
In-Reply-To: <1516356909-18620-4-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-4-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203145501.GD2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When dash is selected, /bin/dash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using dash as shell in /etc/passwd.
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
> v2: add double-dollar after /bin/dash (Yann)
> ---
>  package/dash/dash.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index c8b4164..2a3fd0d 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -13,4 +13,12 @@ define DASH_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 $(@D)/src/dash $(TARGET_DIR)/bin/dash
>  endef
>  
> +# Add /bin/dash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define DASH_ADD_DASH_TO_SHELLS
> +	grep -qsE '^/bin/dash$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/dash" >> $(TARGET_DIR)/etc/shells
> +endef
> +DASH_TARGET_FINALIZE_HOOKS += DASH_ADD_DASH_TO_SHELLS
> +
>  $(eval $(autotools-package))
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
