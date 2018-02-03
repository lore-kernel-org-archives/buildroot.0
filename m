From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:00:41 +0100
Subject: [Buildroot] [PATCH v3 6/9] package/zsh: add /bin/zsh to
 /etc/shells
In-Reply-To: <1516356909-18620-7-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-7-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203150041.GG2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When zsh is selected, /bin/zsh is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using zsh as shell in /etc/passwd.
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
> v2: add double-dollar after /bin/zsh (Yann)
> ---
>  package/zsh/zsh.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
> index bfd0a1a..e19a896 100644
> --- a/package/zsh/zsh.mk
> +++ b/package/zsh/zsh.mk
> @@ -34,6 +34,14 @@ else
>  ZSH_CONF_OPTS += --disable-pcre
>  endif
>  
> +# Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define ZSH_ADD_ZSH_TO_SHELLS
> +	grep -qsE '^/bin/zsh$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/zsh" >> $(TARGET_DIR)/etc/shells
> +endef
> +ZSH_TARGET_FINALIZE_HOOKS += ZSH_ADD_ZSH_TO_SHELLS
> +
>  # Remove versioned zsh-x.y.z binary taking up space
>  define ZSH_TARGET_INSTALL_FIXUPS
>  	rm -f $(TARGET_DIR)/bin/zsh-$(ZSH_VERSION)
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
