From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 17:12:20 +0100
Subject: [Buildroot] [PATCH v2] package/bash: add /bin/bash to
 /etc/shells
In-Reply-To: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
References: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180113161220.GG3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-13 17:05 +0100, Romain Naour spake thusly:
> When bash is selected, /bin/bash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using bash as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> The same issue can happend with other shells.
> 
> v2: add /bin/bash to /etc/shells only if it's missing (Yann)
> ---
>  package/bash/bash.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 089d062..03f8f28 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -40,10 +40,14 @@ endif
>  endif
>  
>  # Make /bin/sh -> bash (no other shell, better than busybox shells)
> +# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
>  define BASH_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
>  	rm -f $(TARGET_DIR)/bin/bashbug
> +	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
>  endef
>  
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
