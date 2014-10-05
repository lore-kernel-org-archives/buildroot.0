From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 17:00:47 +0200
Subject: [Buildroot] [PATCH 5/8] package/apr-util: Rework dependencies
In-Reply-To: <1412516718-12597-5-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005150047.GJ4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> - add expat hard-dependency, when missing apr-util compiles its own expat
> - all database libs are optional
> - add optional OpenSSL support
> - remove unused dependencies neon and zlib

I'd prefer those are done in separate patches:
  - add hard-dependency to expat
  - remove unused neon and zlib
  - make sqlite optional
  - add optional bdb
  - add optional gdbm
  - add optional mysql
  - add optional openssl

Also, see below for additional comments...

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
> index 3e9ce54..4d5d988 100644
> --- a/package/apr-util/apr-util.mk
> +++ b/package/apr-util/apr-util.mk
> @@ -9,7 +9,7 @@ APR_UTIL_SITE = http://archive.apache.org/dist/apr
>  APR_UTIL_LICENSE = Apache-2.0
>  APR_UTIL_LICENSE_FILES = LICENSE
>  APR_UTIL_INSTALL_STAGING = YES
> -APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
> +APR_UTIL_DEPENDENCIES = apr expat
>  APR_UTIL_CONF_OPTS = \
>  	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
>  APR_UTIL_CONFIG_SCRIPTS = apu-1-config
> @@ -18,4 +18,39 @@ APR_UTIL_CONFIG_SCRIPTS = apu-1-config
>  # features.
>  APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  
> +ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
> +APR_UTIL_CONF_OPTS += --with-dbm=db53 --with-berkeley-db="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += berkeleydb
> +else
> +APR_UTIL_CONF_OPTS += --without-berkeley-db
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GDBM),y)
> +APR_UTIL_CONF_OPTS += --with-gdbm="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += gdbm
> +else
> +APR_UTIL_CONF_OPTS += --without-gdbm
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MYSQL),y)
> +APR_UTIL_CONF_OPTS += --with-mysql="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += mysql
> +else
> +APR_UTIL_CONF_OPTS += --without-mysql
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += openssl
> +else
> +APR_UTIL_CONF_OPTS += --without-ssl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE),y)
> +APR_UTIL_CONF_OPTS += --with-sqlite3="$(STAGING_DIR)/usr"
> +APR_UTIL_DEPENDENCIES += sqlite
> +else
> +APR_UTIL_CONF_OPTS += --without-sqlite3
> +endif

I see you use an alphabetical order. I would prefer they be sorted by
category, and then alphabetically:

  - bdb
  - gdbm
  - mysql
  - sqlite
  - openssl

It seems more logical to me (personal preference), but I won't care much
either way.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
