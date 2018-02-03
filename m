From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:13:38 +0100
Subject: [Buildroot] [PATCH v3 9/9] package/bash: use target finalize
 hook
In-Reply-To: <1516356909-18620-10-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-10-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203151338.GJ2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> Arnout reported an issue with the upcoming top-level parallel build.
> The file /etc/shells can be modified by several packages (shell providers)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/bash/bash.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index ab6b43b..12f33f1 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -40,14 +40,18 @@ endif
>  endif
>  
>  # Make /bin/sh -> bash (no other shell, better than busybox shells)

While reviewing this patch, I was really puzzled at what this comment
meant. It turns out I was not careful years ago when I made /bin/sh
configurable.

Patch sent: https://patchwork.ozlabs.org/patch/868907/

Regards,
Yann E. MORIN.

> -# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
> -# can reject the user connexion. See man shells.
>  define BASH_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
>  	rm -f $(TARGET_DIR)/bin/bashbug
> +endef
> +
> +# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define BASH_ADD_MKSH_TO_SHELLS
>  	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
>  		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
>  endef
> +BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_MKSH_TO_SHELLS
>  
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
