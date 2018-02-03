From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 15:58:48 +0100
Subject: [Buildroot] [PATCH v3 4/9] package/screen: add /usr/bin/screen
 to /etc/shells
In-Reply-To: <1516356909-18620-5-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-5-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203145848.GE2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When screen is selected, /usr/bin/screen is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using screen as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v3: Fix typo (Thomas)
>     Use TARGET_FINALIZE_HOOKS to avoid issues with the upcoming
>     top-level parallel build (Arnout)
> v2: add double-dollar after /usr/bin/screen (Yann)
>     remove /etc/shells handling from SCREEN_INSTALL_SCREENRC (Yann)
>     fix conding style (Yann)
> ---
>  package/screen/screen.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 8d67c04..37d4336 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -17,7 +17,14 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  define SCREEN_INSTALL_SCREENRC
>  	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
>  endef
> -

Spurious empty line removal.

>  SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
>  
> +# Add /usr/bin/screen to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define SCREEN_ADD_SCREEN_TO_SHELLS
> +	grep -qsE '^/usr/bin/screen$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
> +endef
> +SCREEN_TARGET_FINALIZE_HOOKS += SCREEN_ADD_SCREEN_TO_SHELLS

In this case, I would have kept the existing code-style, and I would
have left an empty line between the hook declaration and registration
(even though my preference is to do as you did, I still think we should
keep existign code-style, unless too ugly).

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

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
