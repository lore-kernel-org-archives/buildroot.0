From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Nov 2014 17:35:13 +0100
Subject: [Buildroot] [PATCH 2/2] Add guile programming language: Guile
 is an interpreter and compiler for the Scheme programming language,
 a clean and elegant dialect of Lisp.
In-Reply-To: <1414941345-16581-3-git-send-email-paguilar@paguilar.org>
References: <1414941345-16581-1-git-send-email-paguilar@paguilar.org>
 <1414941345-16581-3-git-send-email-paguilar@paguilar.org>
Message-ID: <20141102163513.GD11634@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-02 16:15 +0100, Pedro Aguilar spake thusly:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

As for the previous patch, the commit log should be formatted as
specified in the manual.

> diff --git a/package/guile/Config.in b/package/guile/Config.in
> new file mode 100644
> index 0000000..2653fca
> --- /dev/null
> +++ b/package/guile/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_GUILE
> +	bool "guile"
> +	select BR2_PACKAGE_LIBUNINSTRING
> +	select BR2_PACKAGE_LIBFFI

libffi depends on threads, so you have to propagate the dependency to
guile, too:

    depends on BR2_TOOLCHAIN_HAS_THREADS # libffi

Also, that's BR2_PACKAGE_LIBUNISTRING  (extra 'N' after 'UNI').

> +	select BR2_PACKAGE_LIBGMP

The package is clled just 'gmp', not 'libgmp', so this should be:

    select BR2_PACKAGE_GMP

> +	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_FLEX
> +	select BR2_PACKAGE_LIBTOOL
> +	help
> +	  Guile is an interpreter and compiler for the Scheme 
> +	  programming language, a clean and elegant dialect of Lisp.
> +
> +	  http://www.gnu.org/software/guile

And then add a comment stating the dependencies:

    comment "guile needs a toolchain w/ threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/guile/guile-001-fix_arm_endianness.patch b/package/guile/guile-001-fix_arm_endianness.patch
> new file mode 100644
> index 0000000..d079c1e
> --- /dev/null
> +++ b/package/guile/guile-001-fix_arm_endianness.patch
> @@ -0,0 +1,13 @@

Patches should have a description and a Signed-off-by line, too. Se the
manual, section 18.1. Providing patches:
    http://nightly.buildroot.org/#patch-policy

> +--- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
> ++++ guile-2.0.11/module/system/base/target.scm	2014-11-01 21:23:15.301242749 +0100
> +@@ -70,7 +70,9 @@
> +             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
> +                            "mips" "mips64"))
> +              (endianness big))
> +-            ((string-match "^arm.*el" cpu)
> ++            ((string-match "^arm.*eb" cpu)
> ++             (endianness big))
> ++            ((string-match "^arm.*" cpu)
> +              (endianness little))
> +             (else
> +              (error "unknown CPU endianness" cpu)))))
> diff --git a/package/guile/guile-002-calculate-csqrt_manually.patch b/package/guile/guile-002-calculate-csqrt_manually.patch
> new file mode 100644
> index 0000000..ca259fa
> --- /dev/null
> +++ b/package/guile/guile-002-calculate-csqrt_manually.patch
> @@ -0,0 +1,11 @@

Ditto.

> +--- guile-2.0.11.orig/libguile/numbers.c	2014-03-12 14:24:54.000000000 +0100
> ++++ guile-2.0.11/libguile/numbers.c	2014-11-01 21:07:20.301263587 +0100
> +@@ -10260,8 +10260,6 @@
> +     {
> + #if defined HAVE_COMPLEX_DOUBLE && defined HAVE_USABLE_CSQRT	\
> +       && defined SCM_COMPLEX_VALUE
> +-      return scm_from_complex_double (csqrt (SCM_COMPLEX_VALUE (z)));
> +-#else
> +       double re = SCM_COMPLEX_REAL (z);
> +       double im = SCM_COMPLEX_IMAG (z);
> +       return scm_c_make_polar (sqrt (hypot (re, im)),
> diff --git a/package/guile/guile-003-undef_use_gnu_local_locale_api.patch b/package/guile/guile-003-undef_use_gnu_local_locale_api.patch
> new file mode 100644
> index 0000000..97fb455
> --- /dev/null
> +++ b/package/guile/guile-003-undef_use_gnu_local_locale_api.patch
> @@ -0,0 +1,11 @@

Ditto.

> +--- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
> ++++ guile-2.0.11/libguile/i18n.c	2014-11-01 21:59:29.001195319 +0100
> +@@ -54,7 +54,7 @@
> +    Specifications Issue 7'' (aka. "POSIX 2008"):
> + 
> +      http://www.opengroup.org/onlinepubs/9699919799/basedefs/locale.h.html  */
> +-# define USE_GNU_LOCALE_API
> ++# undef USE_GNU_LOCALE_API
> + #endif
> + 
> + #include "libguile/posix.h"  /* for `scm_i_locale_mutex' */
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> new file mode 100644
> index 0000000..a37f47a
> --- /dev/null
> +++ b/package/guile/guile.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# guile
> +#
> +################################################################################
> +
> +GUILE_VERSION = 2.0.11
> +GUILE_SOURCE  = guile-$(GUILE_VERSION).tar.xz
> +GUILE_SITE    = ftp://ftp.gnu.org/pub/gnu/guile
> +GUILE_INSTALL_STAGING = YES
> +GUILE_LICENSE = LGPLv3

This is an "or later", so: LGPLv3+

> +GUILE_LICENSE_FILES = LICENSE

You should also include COPYING and COPYING.LESSER.

> +GUILE_DEPENDENCIES = host-guile

You also need: libunistring libffi gmp bdwgc flex libtool

> +HOST_GUILE_DEPENDENCIES = host-intltool host-libffi host-gmp host-bdwgc

And I guess you need the host variants of all the target dependencies as
well.

> +PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config

No, that's already set by the pkg-conf package.

> +GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
> +	LIBFFI_CFLAGS="-I$(TARGET_DIR)/usr/include" \
> +	LIBFFI_LIBS="-L$(TARGET_DIR)/usr/lib -lffi" \

The LIBFFI_CFLAGS and LIBFFI_LIBS should not be necessary, they should
be found by ./configure automatically.

> +	BDW_GC_CFLAGS="-I$(TARGET_DIR)/usr/include" \
> +	BDW_GC_LIBS="-L$(TARGET_DIR)/usr/lib -lgc" \

Ditto.

> +	CFLAGS+="-DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND"

You should add a comment explaining why those flags are required, since
it is not obvious what they mean and why they are needed.

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> +
> -- 
> 1.9.1
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
