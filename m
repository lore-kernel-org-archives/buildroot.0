From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:26:28 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/libpsl: new package
In-Reply-To: <20210521103737.3802646-2-aperez@igalia.com>
References: <20210521103737.3802646-1-aperez@igalia.com>
 <20210521103737.3802646-2-aperez@igalia.com>
Message-ID: <20210524132628.GB3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-21 13:37 +0300, Adrian Perez de Castro spake thusly:
> Package libpsl is a new non-optional dependency of libsoup.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
> fixup! package/libpsl: new package

I like 'fixup!' too. :-)

> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
[--SNIP--]
> diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
> new file mode 100644
> index 0000000000..552935e9ec
> --- /dev/null
> +++ b/package/libpsl/libpsl.hash
> @@ -0,0 +1,6 @@
> +# Locally generated
> +sha256  ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c  libpsl-0.21.1.tar.gz
> +
> +# Hashes for license files:
> +sha256  7903413e7aa0bbcb77aa19150a3f1034edc0a760cff174f9a53efe4de6f056a4  COPYING
> +sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
> diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
> new file mode 100644
> index 0000000000..1abdc6b208
> --- /dev/null
> +++ b/package/libpsl/libpsl.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# libpsl
> +#
> +################################################################################
> +
> +LIBPSL_VERSION = 0.21.1
> +LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
> +LIBPSL_INSTALL_STAGING = YES
> +LIBPSL_DEPENDENCIES = host-pkgconf
> +LIBPSL_LICENSE = MIT, BSD-3-Clause
> +LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium

Pet-peeve of mine: try and be consistent in variable ordering. ;-)

so I've done a bit of reordering, and Applied to next, thanks.

Regards,
Yann E. MORIN.

> +LIBPSL_CONF_OPTS = -Ddocs=false
> +
> +# The order of checks is the same as done by libpsl when configured.
> +ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
> +LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
> +LIBPSL_DEPENDENCIES += libidn2 libunistring
> +else ifeq ($(BR2_PACKAGE_ICU),y)
> +LIBPSL_CONF_OPTS += -Druntime=libicu -Dbuiltin=libicu
> +LIBPSL_DEPENDENCIES += icu
> +else
> +LIBPSL_CONF_OPTS += -Druntime=libidn -Dbuiltin=libidn
> +LIBPSL_DEPENDENCIES += libidn libunistring
> +endif
> +
> +$(eval $(meson-package))
> -- 
> 2.31.1
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
