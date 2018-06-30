From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 19:23:35 +0200
Subject: [Buildroot] [PATCH 1/1] Adding opkg configuration options for
 curl, curl with  ssl, and sha256
In-Reply-To: <SN6PR02MB39982FB384F220BD142434F9F24A0@SN6PR02MB3998.namprd02.prod.outlook.com>
References: <SN6PR02MB39982FB384F220BD142434F9F24A0@SN6PR02MB3998.namprd02.prod.outlook.com>
Message-ID: <20180630172335.GH2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Derek, All,

On 2018-06-25 15:21 +0000, Baker, Derek spake thusly:
> From 51a9bc5b2fc6e40f8b076a7b153caf3d84489c9c Mon Sep 17 00:00:00 2001
> From: Derek Baker <derek-baker@idexx.com>
> Date: Thu, 14 Jun 2018 16:36:31 -0400
> Subject: [PATCH 1/1] Adding opkg configuration options for curl, curl with
>  ssl, and sha256
> 
> Signed-off-by: Derek Baker <derek-baker@idexx.com>
> ---
>  package/opkg/Config.in | 13 +++++++++++++
>  package/opkg/opkg.mk   | 20 +++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opkg/Config.in b/package/opkg/Config.in
> index 20f6fa2f53..4ce3372bc0 100644
> --- a/package/opkg/Config.in
> +++ b/package/opkg/Config.in
> @@ -30,4 +30,17 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
>        Enable opkg package signature checking support using
>        gnupg/libgpgme.
> 
> +config BR2_PACKAGE_OPKG_CURL
> +    bool "curl support"
> +    select BR2_PACKAGE_LIBCURL
> +
> +if BR2_PACKAGE_OPKG_CURL
> +config BR2_PACKAGE_OPKG_CURL_SSL
> +    select BR2_PACKAGE_OPENSSL
> +    bool "ssl support for curl"
> +endif

We don;t usually add options like that for optional features. Instead,
we let user enable the appropriate packages, and so...

> +config BR2_PACKAGE_OPKG_SHA256
> +    bool "SHA256 support"

Adding sha256 support looks like it is orthogonal to using libcurl,
right? If so, then this should be two patches, please: one to add
libcurl, then one to add sha256.

If sha256 is a requirement for libcurl, then make that the first patch.

>  endif
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 4d34c6d4d3..d72f0bd97d 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -10,7 +10,6 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
>  OPKG_LICENSE = GPL-2.0+
>  OPKG_LICENSE_FILES = COPYING
>  OPKG_INSTALL_STAGING = YES
> -OPKG_CONF_OPTS = --disable-curl
>  # Populate the conf/ directory
>  OPKG_AUTORECONF = YES
> 
> @@ -37,6 +36,25 @@ else
>  OPKG_CONF_OPTS += --disable-gpg
>  endif
> 
> +ifeq ($(BR2_PACKAGE_OPKG_SHA256),y)
> +OPKG_CONF_OPTS += --enable-sha256
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPKG_CURL),y)
> +OPKG_CONF_OPTS += --enable-curl
> +OPKG_DEPENDENCIES += libcurl
> +
> +ifeq ($(BR2_PACKAGE_OPKG_CURL_SSL),y)
> +OPKG_CONF_OPTS += --enable-ssl-curl
> +OPKG_DEPENDENCIES += libopenssl

Note in passing: you select the 'openssl' package, but you depend on
'libopenssl'. openssl is a virtual package that depends on either
'libopenssl' or 'libressl'. But see below on how to solve this...

> +else
> +OPKG_CONF_OPTS += --disable-ssl-curl
> +endif
> +
> +else
> +OPKG_CONF_OPTS += --disable-curl
> +endif

Here, we would just depend on the appropriate package being enabled.
Also, we like to forcibly disable the features. This would lo0ok a bit
like so:

    ifeq ($(BR2_PACKAGE_LIBCURL),y)
    OPKG_CONF_OPTS += --enable-curl
    OPKG_DEPENDENCIES += libcurl
    ifeq ($(BR2_PACKAGE_OPENSSL),y)
    OPKG_CONF_OPTS += --enable-ssl-curl
    OPKG_DEPENDENCIES += openssl
    else
    OPKG_CONF_OPTS += --disable-ssl-curl
    endif
    else
    OPKG_CONF_OPTS += --disable-curl --disable-ssl-curl
    endif # libcurl

Note: if only 'libopenssl' (aka upstream openssl) is supported, then
replace BR2_PACKAGE_OPENSSL by BR2_PACKAGE_LIBOPENSSL.

Regards,
Yann E. MORIN.

>  OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
> 
>  $(eval $(autotools-package))
> --
> 2.17.1

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
