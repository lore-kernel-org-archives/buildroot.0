From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 20:12:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/mysql: fix debugging options
In-Reply-To: <1392244774-15356-2-git-send-email-kuyurix@gmail.com>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
 <1392244774-15356-2-git-send-email-kuyurix@gmail.com>
Message-ID: <20140223191228.GG32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcello, All,

On 2014-02-12 22:39 +0000, Marcelo Guti?rrez spake thusly:
> From: Marcelo Gutierrez <kuyurix@gmail.com>
> 
> The usual --{en,dis}able-debug passed by the infrastructure are not
> recognised by mysql's ./configure, as it uses unusual options.
> 
> Also, debugging is only meaningfull to the server, not the client.
> 
> Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
> [yann.morin.1998 at free.fr: actually add the options, move in server if-block]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Obviously, this already has my SoB-line.

So this is just a reminder for Peter. ;-)

Regards,
Yann E. MORIN.

> ---
>  package/mysql/mysql.mk |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
> index 27afc9f..95b30b7 100644
> --- a/package/mysql/mysql.mk
> +++ b/package/mysql/mysql.mk
> @@ -30,8 +30,7 @@ MYSQL_CONF_OPT = \
>  	--without-libedit \
>  	--without-readline \
>  	--with-low-memory \
> -	--enable-thread-safe-client \
> -	$(ENABLE_DEBUG)
> +	--enable-thread-safe-client
>  
>  ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
>  MYSQL_DEPENDENCIES += host-mysql host-bison
> @@ -57,6 +56,14 @@ MYSQL_CONF_OPT += \
>  	--without-plugin-innodb_plugin \
>  	--without-plugin-ndbcluster
>  
> +# Debugging is only available for the server, so no need for
> +# this if-block outside of the server if-block
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +MYSQL_CONF_OPT += --with-debug=full
> +else
> +MYSQL_CONF_OPT += --without-debug
> +endif
> +
>  define HOST_MYSQL_BUILD_CMDS
>  	$(MAKE) -C $(@D)/include my_config.h
>  	$(MAKE) -C $(@D)/mysys libmysys.a
> -- 
> 1.7.9.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
