From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 17:09:56 +0100
Subject: [Buildroot] [PATCH v5 21/36] package/efl/libelementary: bump to
 version 1.15.2
In-Reply-To: <1445720476-21517-22-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-22-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025160956.GS11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:01 +0200, Romain Naour spake thusly:
> Use the newly added libefl package wich provide a new version
> of libeina, libevas, libecore and libedje.
> 
> Update the upstream url and add a hash file.
> 
> Since eet, eolian_gen and eldbus_codegen are installed in
> HOST_DIR by host-efl package, help configure script to find
> them.
> 
> Explicitly disable doxygen and elementary-test.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

See however a comment in the next patch of yours.

Regards,
Yann E. MORIN.

> ---
> v5: move the hash file to package/efl/libelementary
> v4: keep libelementary in package/efl/
> v3: bump to 1.15.2
>     remove trailing slash (Vicente Bergas)
> v2: bump to 1.15.1
>     remove glibc only dependency
> ---
>  package/efl/libelementary/Config.in          | 11 +----------
>  package/efl/libelementary/libelementary.hash |  2 ++
>  package/efl/libelementary/libelementary.mk   | 25 +++++++++----------------
>  3 files changed, 12 insertions(+), 26 deletions(-)
>  create mode 100644 package/efl/libelementary/libelementary.hash
> 
> diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
> index 4f62592..182b14a 100644
> --- a/package/efl/libelementary/Config.in
> +++ b/package/efl/libelementary/Config.in
> @@ -1,17 +1,8 @@
> -comment "libelementary needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> -
>  config BR2_PACKAGE_LIBELEMENTARY
>  	bool "libelementary"
> -	select BR2_PACKAGE_LIBEINA
> -	select BR2_PACKAGE_LIBEVAS
> -	select BR2_PACKAGE_LIBECORE
> -	select BR2_PACKAGE_LIBEDJE
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
> -	depends on !BR2_STATIC_LIBS
>  	help
>  	  Elementary is a widget toolkit and EFL wrapper and convenience
>  	  library to make it easy to build applications and tools with UIs
>  	  with less code.
>  
> -	  http://trac.enlightenment.org/e/wiki/Elementary
> +	  https://enlightenment.org
> diff --git a/package/efl/libelementary/libelementary.hash b/package/efl/libelementary/libelementary.hash
> new file mode 100644
> index 0000000..2cd36d8
> --- /dev/null
> +++ b/package/efl/libelementary/libelementary.hash
> @@ -0,0 +1,2 @@
> +# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.2.tar.xz.sha256
> +sha256	523c3073210b611817d0f56aa8348962ec757282f9f7dfde93825afa164a0f3f	elementary-1.15.2.tar.xz
> diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
> index 8bd69fe..a2c4a60 100644
> --- a/package/efl/libelementary/libelementary.mk
> +++ b/package/efl/libelementary/libelementary.mk
> @@ -4,29 +4,22 @@
>  #
>  ################################################################################
>  
> -LIBELEMENTARY_VERSION = 1.7.10
> -LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
> -LIBELEMENTARY_SITE = http://download.enlightenment.org/releases
> +LIBELEMENTARY_VERSION = 1.15.2
> +LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.xz
> +LIBELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
>  LIBELEMENTARY_LICENSE = LGPLv2.1
>  LIBELEMENTARY_LICENSE_FILES = COPYING
>  
>  LIBELEMENTARY_INSTALL_STAGING = YES
>  
> -LIBELEMENTARY_DEPENDENCIES = \
> -	libeina libevas libecore libedje host-libedje \
> -	host-libeet
> +LIBELEMENTARY_DEPENDENCIES = host-pkgconf host-libefl libefl
>  
>  LIBELEMENTARY_CONF_OPTS = \
>  	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
> -	--with-eet-eet=$(HOST_DIR)/usr/bin/eet
> -
> -# libethumb_client is only built when ethumbd is built.
> -# ethumbd is only built if edbus is built.
> -ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
> -LIBELEMENTARY_DEPENDENCIES += libethumb
> -LIBELEMENTARY_CONF_OPTS += --enable-ethumb
> -else
> -LIBELEMENTARY_CONF_OPTS += --disable-ethumb
> -endif
> +	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
> +	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
> +	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
> +	--with-doxygen=no \
> +	--disable-elementary-test
>  
>  $(eval $(autotools-package))
> -- 
> 2.4.3
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
