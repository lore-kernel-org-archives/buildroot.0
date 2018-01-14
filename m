From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 23:30:28 +0100
Subject: [Buildroot] [PATCH 5/7] package/tmux: add /usr/bin/tmux to
 /etc/shells
In-Reply-To: <1515963815-5843-6-git-send-email-romain.naour@smile.fr>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-6-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114223028.GE16760@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-14 22:03 +0100, Romain Naour spake thusly:
> When tmux is selected, /usr/bin/tmux is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using tmux as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/tmux/tmux.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index 6e03d01..27727fe 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -10,4 +10,13 @@ TMUX_LICENSE = ISC
>  TMUX_LICENSE_FILES = README
>  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
>  
> +# Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
> +define TMUX_INSTALL_ADD_TMUX_TO_SHELLS
> +	grep -qsE '^/usr/bin/tmux' $(TARGET_DIR)/etc/shells \
> +		|| echo "/usr/bin/tmux" >> $(TARGET_DIR)/etc/shells
> +endef
> +
> +TMUX_POST_INSTALL_TARGET_HOOKS += TMUX_INSTALL_ADD_TMUX_TO_SHELLS

No need for an append-assign (+=) here, just use a plain asignment (=).

Regards,
Yann E. MORIN.

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
