From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 18:27:14 +0100
Subject: [Buildroot] [PATCH v4] package/sqlite: add optional support for
 libedit
In-Reply-To: <1454951043-29268-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454951043-29268-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160208172714.GB3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-02-08 18:04 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v4: rebased
> v3: rebased
> v2: removed BR2_PACKAGE_SQLITE_READLINE (Thomas, Peter)
> 
>  Config.in.legacy         | 11 +++++++++++
>  package/sqlite/Config.in |  7 -------
>  package/sqlite/sqlite.mk |  9 ++++++---
>  3 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3677f86..0ea8c7d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,17 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.02"
>  
> +config BR2_PACKAGE_SQLITE_READLINE
> +	bool "command-line editing support was updated"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_READLINE
> +	select BR2_LEGACY
> +	help
> +	  This option was removed in favour of the sqlite package
> +	  deciding itself depending on the enabled packages whether
> +	  command-line editing should be enabled, it also also takes
> +	  libedit into account.
> +
>  config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
>  	bool "openpowerlink debug option has been removed"
>  	select BR2_LEGACY
> diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
> index 7ea9eb1..c9fde53 100644
> --- a/package/sqlite/Config.in
> +++ b/package/sqlite/Config.in
> @@ -8,13 +8,6 @@ config BR2_PACKAGE_SQLITE
>  
>  if BR2_PACKAGE_SQLITE
>  
> -config BR2_PACKAGE_SQLITE_READLINE
> -	bool "Command-line editing"
> -	select BR2_PACKAGE_NCURSES
> -	select BR2_PACKAGE_READLINE
> -	help
> -	  Enable command-line editing. This requires ncurses and readline.
> -
>  config BR2_PACKAGE_SQLITE_STAT3
>  	bool "Additional query optimizations (stat3)"
>  	help
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index 1603e00..df59d1f 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -45,11 +45,14 @@ else
>  SQLITE_CONF_OPTS += --disable-threadsafe
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
> +ifeq ($(BR2_PACKAGE_READLINE),y)
>  SQLITE_DEPENDENCIES += ncurses readline

If you /etc/profile.d/sendfileneed both ncurses and readline, then the
condition should be something like:

    ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)

Yes, I know that readline forcibly depends on ncurses. Still, it is best
to match the condition to the packages you actually depend on .

Otherwise, looks OK.

When you fix that, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> -SQLITE_CONF_OPTS += --enable-readline
> +SQLITE_CONF_OPTS += --disable-editline --enable-readline
> +else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> +SQLITE_DEPENDENCIES += libedit
> +SQLITE_CONF_OPTS += --enable-editline --disable-readline
>  else
> -SQLITE_CONF_OPTS += --disable-readline
> +SQLITE_CONF_OPTS += --disable-editline --disable-readline
>  endif
>  
>  $(eval $(autotools-package))
> -- 
> 2.7.0
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
