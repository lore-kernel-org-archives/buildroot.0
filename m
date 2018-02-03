From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 15:59:22 +0100
Subject: [Buildroot] [PATCH v3 5/9] package/tmux: add /usr/bin/tmux to
 /etc/shells
In-Reply-To: <1516356909-18620-6-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-6-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203145922.GF2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When tmux is selected, /usr/bin/tmux is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using tmux as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v3: Fix typo (Thomas)
>     Use TARGET_FINALIZE_HOOKS to avoid issues with the upcoming
>     top-level parallel build (Arnout)
> v2: add double-dollar after /usr/bin/tmux (Yann)
> ---
>  package/tmux/tmux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 6e03d01..e380227 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -10,4 +10,12 @@ TMUX_LICENSE = ISC
>  TMUX_LICENSE_FILES = README
>  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
>  
> +# Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define TMUX_ADD_TMUX_TO_SHELLS
> +	grep -qsE '^/usr/bin/tmux$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/tmux" >> $(TARGET_DIR)/etc/shells
> +endef
> +TMUX_TARGET_FINALIZE_HOOKS += TMUX_ADD_TMUX_TO_SHELLS
> +
>  $(eval $(autotools-package))
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
