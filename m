From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:29:31 +0100
Subject: [Buildroot] [PATCH 4/7] package/screen: add /usr/bin/screen to
 /etc/shells
In-Reply-To: <1515963815-5843-5-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-5-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114222931.GD16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> When screen is selected, /usr/bin/screen is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using screen as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/screen/screen.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 8d67c04..5f2eb1e 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -16,8 +16,18 @@ SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
>  define SCREEN_INSTALL_SCREENRC
>  	$(INSTALL) -m 0755 -D $(@D)/etc/screenrc $(TARGET_DIR)/etc/screenrc
> +	grep -qsE '^/usr/bin/screen' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
>  endef
>  
> -SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
> +# Add /usr/bin/screen to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
> +define SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS
> +	grep -qsE '^/usr/bin/screen' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/screen" >> $(TARGET_DIR)/etc/shells
> +endef

Uh? Why are you doing it twice?

I prefer indeed that we have a macro for each thing.

> +SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC \
> +	SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS

For multi=line assignments, we usually try to have a single assignment
per line and the first line is just a continuation line. Besides, not
need for a append-assign (+=), here, it is a sinmple assignment (=):

    SCREEN_POST_INSTALL_TARGET_HOOKS = \
        SCREEN_INSTALL_SCREENRC \
        SCREEN_INSTALL_ADD_SCREEN_TO_SHELLS

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
