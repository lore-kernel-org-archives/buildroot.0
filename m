From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:53:15 +0100
Subject: [Buildroot] [PATCH v7 07/18] package/pkgconf: make the
 pkg-config wrapper relocatable
In-Reply-To: <1457564339-27294-8-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20160310215315.6555ac80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Wed,  9 Mar 2016 23:58:48 +0100, Samuel Martin wrote:

> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
> old mode 100644
> new mode 100755
> index 4dec487..aa4e484
> --- a/package/pkgconf/pkg-config.in
> +++ b/package/pkgconf/pkg-config.in
> @@ -1,2 +1,4 @@
>  #!/bin/sh
> -PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:- at PKG_CONFIG_LIBDIR@} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:- at STAGING_DIR@} $(dirname $0)/pkgconf @STATIC@ $@
> +STAGING_DIR="$(readlink -f "$(dirname "$0")/../..")/@STAGING_SUBDIR@"

I think Peter said on IRC that $0 is not guaranteed to be correct, and
that /proc/self/exe should be used instead.

> +TARGET_PKG_CONFIG_LIBDIR="$( echo @PKG_CONFIG_LIBDIR@ | sed -e "s@^@${STAGING_DIR}/@ ; s@:@:${STAGING_DIR}/@g" )"

I must say I hate those spaces after ( and before ). Especially when
the line just above doesn't have those spaces.

> +PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${TARGET_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${STAGING_DIR}} $(dirname $0)/pkgconf @STATIC@ $@
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index c8b0cba..d27672c 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -19,8 +19,12 @@ endef
>  define HOST_PKGCONF_INSTALL_WRAPPER
>  	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
>  		$(HOST_DIR)/usr/bin/pkg-config
> -	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
> -		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
> +	# @PKG_CONFIG_LIBDIR@ is a colon-separated list of paths to search.
> +	# These paths are relative to the root of the staging directory; they will
> +	# be automatically prefixed with the staging directory path by the wrapper
> +	# at runtime to ensure its relocatability.
> +	$(SED) 's, at PKG_CONFIG_LIBDIR@,/usr/lib/pkgconfig:/usr/share/pkgconfig,' \

I don't understand this first part of the expression. Why are you doing
a replacement if you're replacing by something that always has the same
value? Why don't you simply
hardcode /usr/lib/pkgconfig:/usr/share/pkgconfig in the wrapper?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
