From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 11:39:52 +0200
Subject: [Buildroot] [PATCH] package/apache: fixing apxs path mangling
In-Reply-To: <1587717119-16710-1-git-send-email-angelo@amarulasolutions.com>
References: <1587717119-16710-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20200424093952.GB5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-04-24 10:31 +0200, Angelo Compagnucci spake thusly:
> Latest version of Apache introduce a new apxs with a slightly modified
> path handling logic. In order to simplify the crosscompilation, the
> software removes the common prefix from bin install dir and build
> install dir, but for this to work they both should have a common
> prefix. So we introduce a new regexp to fix /usr/bin to staging dir,
> the regexps are also fixed to replace only the exact path between
> double quotes.a

There was a stray 'a' at the end of the sentence, so I replaced it with:

    ', to avoid replacing the she-bang line.'

Also, I did not see the point of enclosing the existing /usr/build
pattern in double-quotes, as it still works without. Yes, i see the
consistency with /usr/bin, but then it woudl still be inconsustent with
the prefix replacement pattern anyway... So I dropped the double quotes
for /usr/build.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/c41f31566974209897a3a1ec35afe2536fb248cc
> http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/apache/apache.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 48a64ea..f0775e6 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -99,7 +99,8 @@ APACHE_CONF_OPTS += --disable-deflate
>  endif
>  
>  define APACHE_FIX_STAGING_APACHE_CONFIG
> -	$(SED) 's%/usr/build%$(STAGING_DIR)/usr/build%' $(STAGING_DIR)/usr/bin/apxs
> +	$(SED) 's%"/usr/bin"%"$(STAGING_DIR)/usr/bin"%' $(STAGING_DIR)/usr/bin/apxs
> +	$(SED) 's%"/usr/build"%"$(STAGING_DIR)/usr/build"%' $(STAGING_DIR)/usr/bin/apxs
>  	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' $(STAGING_DIR)/usr/build/config_vars.mk
>  endef
>  APACHE_POST_INSTALL_STAGING_HOOKS += APACHE_FIX_STAGING_APACHE_CONFIG
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
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
