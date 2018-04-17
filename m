From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 17 Apr 2018 12:17:36 +0200
Subject: [Buildroot] [PATCH 2018.02.x] Revert "package/bash: add
 /bin/bash to /etc/shells"
In-Reply-To: <20180417100109.19655-1-arnout@mind.be>
References: <20180417100109.19655-1-arnout@mind.be>
Message-ID: <5efef0ef-c798-2692-873f-cd529528a486@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 17/04/2018 ? 12:01, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> Commit 4d279697af added /bin/bash to /etc/shells. In the default
> skeleton, however, /etc/shells doesn't exist, so in fact it creates
> this file, containing only /bin/bash. Therefore, when bash is selected,
> /bin/sh does not appear in /etc/shells and bash is the only shell
> allowed. Since /bin/sh is the shell that is used for root in the
> default skeleton's /etc/passwd, root is no longer able to log in.
> 
> The proper solution is to add all available shells to /etc/shells. For
> now, however, just revert commit 4d279697af as a stop-gap measure. That
> way, the default situation still works, and only people who update
> /etc/passwd with additional logins but don't update /etc/shells will
> suffer.

This issue appear with dropbear as far I know.

> 
> This reverts commit 4d279697afbf8fb295274784103be2b837113d5e.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10896
> 
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This is for the 2018.02.x branch; master should take the series at
> http://patchwork.ozlabs.org/project/buildroot/list/?series=24357
> I believe that series is too invasive for the 2018.02.x branch.

Agree, the work on /etc/shells is not complete without the entire series.
I don't know if there is any blocker for this series.
Hopefully it will be merged for 2018.05 :)

Acked-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/bash/bash.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/bash/bash.mk b/package/bash/bash.mk
> index e9384911a0..6e58f0fd64 100644
> --- a/package/bash/bash.mk
> +++ b/package/bash/bash.mk
> @@ -39,14 +39,10 @@ BASH_CONF_ENV += bash_cv_getenv_redef=yes
>  endif
>  endif
>  
> -# Add /bin/bash to /etc/shells otherwise some login tools like dropbear
> -# can reject the user connexion. See man shells.
>  define BASH_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		DESTDIR=$(TARGET_DIR) exec_prefix=/ install
>  	rm -f $(TARGET_DIR)/bin/bashbug
> -	grep -qsE '^/bin/bash' $(TARGET_DIR)/etc/shells \
> -		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
>  endef
>  
>  $(eval $(autotools-package))
> 
