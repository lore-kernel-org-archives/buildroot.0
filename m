From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Feb 2018 16:01:30 +0100
Subject: [Buildroot] [PATCH v3 7/9] package/mksh: add /bin/mksh to
 /etc/shells
In-Reply-To: <1516356909-18620-8-git-send-email-romain.naour@smile.fr>
References: <1516356909-18620-1-git-send-email-romain.naour@smile.fr>
 <1516356909-18620-8-git-send-email-romain.naour@smile.fr>
Message-ID: <20180203150130.GH2369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2018-01-19 11:15 +0100, Romain Naour spake thusly:
> When mksh is selected, /bin/mksh is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connections for users using mksh as shell in /etc/passwd.
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
> v2: add double-dollar after /bin/mksh (Yann)
> ---
>  package/mksh/mksh.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/mksh/mksh.mk b/package/mksh/mksh.mk
> index b5706db..4fa0e02 100644
> --- a/package/mksh/mksh.mk
> +++ b/package/mksh/mksh.mk
> @@ -21,4 +21,12 @@ define MKSH_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/mksh $(TARGET_DIR)/bin/mksh
>  endef
>  
> +# Add /bin/mksh to /etc/shells otherwise some login tools like dropbear
> +# can reject the user connection. See man shells.
> +define MKSH_ADD_MKSH_TO_SHELLS
> +	grep -qsE '^/bin/mksh$$' $(TARGET_DIR)/etc/shells \
> +		|| echo "/bin/mksh" >> $(TARGET_DIR)/etc/shells
> +endef
> +MKSH_TARGET_FINALIZE_HOOKS += MKSH_ADD_MKSH_TO_SHELLS
> +
>  $(eval $(generic-package))
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
