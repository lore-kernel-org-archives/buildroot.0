From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jan 2018 18:13:57 +0100
Subject: [Buildroot] [PATCH] package/bash: add /bin/bash to /etc/shells
In-Reply-To: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
References: <1515666444-13390-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180111171357.GA3559@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-11 11:27 +0100, Romain Naour spake thusly:
> When bash is selected, /bin/bash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using bash as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> The same issue can happend with other shells.
> ---
>  package/bash/bash.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index 089d062..eec6559 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -40,10 +40,13 @@ endif
>  endif
>  
>  # Make /bin/sh -> bash (no other shell, better than busybox shells)
> +# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connexion. See man shells.
>  define BASH_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
>  	rm -f $(TARGET_DIR)/bin/bashbug
> +	echo "/bin/bash" >> $(TARGET_DIR)/etc/shells

What if the user uses a custom skeleton and bash is already listed
there?

I would do:

    grep -E '^/bin/bash$' $(TARGET_DIR)/etc/shells >/dev/null 2>&1 \
    || echo "/bin/bash" >> $(TARGET_DIR)/etc/shells

That way, we only install it if not already present.

Regards,
Yann E. MORIN.

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
