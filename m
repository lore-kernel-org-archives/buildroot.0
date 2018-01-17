From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jan 2018 20:25:01 +0100
Subject: [Buildroot] [PATCH v2 4/8] package/screen: add /usr/bin/screen
 to /etc/shells
In-Reply-To: <1516211058-466-5-git-send-email-romain.naour@smile.fr>
References: <1516211058-466-1-git-send-email-romain.naour@smile.fr>
 <1516211058-466-5-git-send-email-romain.naour@smile.fr>
Message-ID: <20180117192501.GE11009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-17 18:44 +0100, Romain Naour spake thusly:
> When screen is selected, /usr/bin/screen is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using screen as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a comment below...

> ---
> v2: add double-dollar after /usr/bin/screen (Yann)
>     remove /etc/shells handling from SCREEN_INSTALL_SCREENRC (Yann)
>     fix conding style (Yann)
> ---
>  package/screen/screen.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 8d67c04..b6428fa 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -17,7 +17,14 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  define SCREEN_INSTALL_SCREENRC
>  	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
>  endef

Spurious removal of empty line.

I personally prefer when there is no empty line between the hook
definition and its registration, but we are not consistent throughout
the tree.

But since this file had pre-existing empty liens, it is better to keep
it as-is.

But my ack still stands as I prefer it that way! ;-)

Regards,
Yann E. MORIN.

> -
>  SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
>  
> +# Add /usr/bin/screen to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
> +define SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS
> +	grep -qsE '^/usr/bin/screen$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
> +endef
> +SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS
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
