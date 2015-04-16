From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 23:04:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: Dependency host-pkgconf
 is only needed for OpenSSL detection
In-Reply-To: <1429210360-4753-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429210360-4753-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150416210443.GE4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-16 20:52 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 67dbd64..a95559d 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -9,7 +9,7 @@ EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
>  EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPLv2+
>  EXIM_LICENSE_FILES = LICENCE
> -EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
> +EXIM_DEPENDENCIES = pcre berkeleydb
>  
>  # Modify a variable value. It must already exist in the file, either
>  # commented or not.
> @@ -63,7 +63,7 @@ endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -EXIM_DEPENDENCIES += openssl
> +EXIM_DEPENDENCIES += openssl host-pkgconf

Well, even though we currently only support berkleydb as a DB backend,
exim can also use sqlite. And detecting sqlite is done via pkg-config.

Also, exim uses pkg-config for a lot of other stuff; quoting their
(awfull) buildsystem:

    for name_mod in \
        CDB DBM:dbmdb DNSDB DSEARCH IBASE LSEARCH MYSQL NIS NISPLUS ORACLE \
        PASSWD PGSQL SQLITE TESTDB WHOSON
    do
      emit_module_rule $name_mod
    done

and emit_module_rule() contains this code:

    [--SNIP--]
      echo "LOOKUP_${mod_name}_INCLUDE = $(pkg-config --cflags $pkgconf)"
      echo "LOOKUP_${mod_name}_LIBS = $(pkg-config --libs $pkgconf)"
    [--SNIP--]

So, even though we do not really need it when OpenSSL is disabled, I
think we want to keep it as an uncoditionaly dependency.

Regards,
Yann E. MORIN.

>  define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
>  	$(call exim-config-change,SUPPORT_TLS,yes)
>  	$(call exim-config-change,USE_OPENSSL_PC,openssl)
> -- 
> 1.7.10.4
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
