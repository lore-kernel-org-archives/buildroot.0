From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:34:54 +0100
Subject: [Buildroot] [PATCH 6/7] package/zsh: add /bin/zsh to /etc/shells
In-Reply-To: <1515963815-5843-7-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-7-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114223454.GF16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> When zsh is selected, /bin/zsh is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using zsh as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/zsh/zsh.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
> index bfd0a1a..c2b0270 100644
> --- a/package/zsh/zsh.mk
> +++ b/package/zsh/zsh.mk
> @@ -34,10 +34,18 @@ else
>  ZSH_CONF_OPTS += --disable-pcre
>  endif
>  
> +# Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
> +define ZSH_INSTALL_ADD_ZSH_TO_SHELLS
> +	grep -qsE '^/bin/zsh' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
> +endef
> +
>  # Remove versioned zsh-x.y.z binary taking up space
>  define ZSH_TARGET_INSTALL_FIXUPS
>  	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
>  endef
> -ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS
> +ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS \
> +	ZSH_INSTALL_ADD_ZSH_TO_SHELLS

The usual dance here... ;-)

    ZSH_POST_INSTALL_TARGET_HOOKS = \
        ZSH_TARGET_INSTALL_FIXUPS \
        ZSH_INSTALL_ADD_ZSH_TO_SHELLS

Although I wonder if we don;t in fact prefer to assign right after the
definition if the hooks...

    define ZSH_INSTALL_ADD_ZSH_TO_SHELLS
        grep -qsE '^/bin/zsh' $(TARGET_DIR)/etc/shells \
        || echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
    endef
    ZSH_POST_INSTALL_TARGET_HOOKS = ZSH_INSTALL_ADD_ZSH_TO_SHELLS

    # Remove versioned zsh-x.y.z binary taking up space
    define ZSH_TARGET_INSTALL_FIXUPS
        rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
    endef
    ZSH_POST_INSTALL_TARGET_HOOKS += ZSH_TARGET_INSTALL_FIXUPS

Note that we register before the existign hook, but use a simple
assignment, so that we don;t need to change the xisting append-assign to
a simple assign...

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
