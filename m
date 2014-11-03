From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2014 08:29:58 +0100
Subject: [Buildroot] [PATCH v2 4/4] guile: new package
In-Reply-To: <1414974851-4819-5-git-send-email-paguilar@paguilar.org>
References: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
 <1414974851-4819-5-git-send-email-paguilar@paguilar.org>
Message-ID: <20141103082958.2cf6cffe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Mon,  3 Nov 2014 01:34:11 +0100, Pedro Aguilar wrote:
> Guile is an interpreter and compiler for the Scheme programming
> language, a clean and elegant dialect of Lisp.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Thanks for this contribution! A few comments below.

> diff --git a/package/guile/Config.in b/package/guile/Config.in
> new file mode 100644
> index 0000000..018fbab
> --- /dev/null
> +++ b/package/guile/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_GUILE
> +	bool "guile"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBUNISTRING
> +	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_GMP
> +	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_FLEX
> +	select BR2_PACKAGE_LIBTOOL

Are sure you really need flex and libtool on the target?

> +	help
> +	  Guile is an interpreter and compiler for the Scheme 
> +	  programming language, a clean and elegant dialect of Lisp.
> +
> +	  http://www.gnu.org/software/guile
> +
> +	comment "guile needs a toolchain w/ threads"
> +	  depends on !BR2_TOOLCHAIN_HAS_THREADS

No indentation for the "comment" line, and indentation of one tab for
the "depends on" line.

> diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
> new file mode 100644
> index 0000000..f3a2092
> --- /dev/null
> +++ b/package/guile/guile-01-fix_arm_endianness.patch
> @@ -0,0 +1,19 @@
> +Fix support for ARM endianness, otherwise it gives the error 
> +"unknown CPU endianness"
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Can you submit this patch upstream to the guile developers? Please Cc
me when sending the patch upstream, as I know the Guile maintainer, so
seeing my name in Cc will probably make him look at the patch :)

> diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/guile-02-calculate-csqrt_manually.patch
> new file mode 100644
> index 0000000..c56963b
> --- /dev/null
> +++ b/package/guile/guile-02-calculate-csqrt_manually.patch
> @@ -0,0 +1,17 @@
> +Calculate manually the sqrt() since scm_from_complex_double() gives an error
> +on ARM using uclibc.
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> +
> +diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
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

It would be good to have an upstreamable version of this. Since uClibc
doesn't implement C99 complex math, I believe HAVE_USABLE_CSQRT should
be false. Can you check why it isn't the case?

> diff --git a/package/guile/guile-03-undef_use_gnu_local_locale_api.patch b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
> new file mode 100644
> index 0000000..b8ac7c3
> --- /dev/null
> +++ b/package/guile/guile-03-undef_use_gnu_local_locale_api.patch
> @@ -0,0 +1,16 @@
> +Undef USE_GNU_LOCALE_API since it's not mandatory.
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> +
> +diff -Nau guile-2.0.11.orig/libguile/i18n.c guile-2.0.11/libguile/i18n.c
> +--- guile-2.0.11.orig/libguile/i18n.c	2014-01-21 22:25:11.000000000 +0100
> ++++ guile-2.0.11/libguile/i18n.c	2014-11-01 21:59:29.001195319 +0100
> +@@ -54,7 +54,7 @@
> +    Specifications Issue 7'' (aka. "POSIX 2008"):
> + 
> +      http://www.opengroup.org/onlinepubs/9699919799/basedefs/locale.h.html  */
> +-# define USE_GNU_LOCALE_API
> ++# undef USE_GNU_LOCALE_API

Can you explain a bit more? Again, our goal is to have patches that can
potentially be accepted by the upstream project.

> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> new file mode 100644
> index 0000000..1cc9f2f
> --- /dev/null
> +++ b/package/guile/guile.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# guile
> +#
> +################################################################################
> +
> +GUILE_VERSION = 2.0.11
> +GUILE_SOURCE  = guile-$(GUILE_VERSION).tar.xz
> +GUILE_SITE    = ftp://ftp.gnu.org/pub/gnu/guile

Use $(BR2_GNU_MIRROR)

Also, do not align the '=' signs.

> +GUILE_INSTALL_STAGING = YES
> +GUILE_LICENSE = LGPLv3+
> +GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
> +GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc flex libtool

So really flex and libtool needed on the target?

> +HOST_GUILE_DEPENDENCIES = host-intltool host-libunistring host-libffi host-gmp host-bdwgc host-flex host-libtool

You need intltool for the host variant but not for the target onbe?

> +
> +# We need to specify libffi and bdwgc CFLAGS and LIBS since guile's configure
> +# script does not find them.
> +# The HAVE_GC* CFLAGS specify that we wil use internal callbacks instead 
> +# of the ones provided by bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies 
> +# that we won't use bdwgc's GC_finalizer_notifier callback.
> +# Trying to use these specific bdwgc's callbacks breaks guile's building.
> +GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
> +	LIBFFI_CFLAGS="-I$(TARGET_DIR)/usr/include" \
> +	LIBFFI_LIBS="-L$(TARGET_DIR)/usr/lib -lffi" \
> +	BDW_GC_CFLAGS="-I$(TARGET_DIR)/usr/include" \
> +	BDW_GC_LIBS="-L$(TARGET_DIR)/usr/lib -lgc" \

Do, pointing to $(TARGET_DIR) for headers and libraries is not the
correct thing to do. You should point to $(STAGING_DIR) instead.

However, passing -L$(STAGING_DIR)/usr/lib or
-I$(STAGING_DIR)/usr/include is unnecessary since the Buildroot
cross-compiler already looks there for libraries/headers by default.

> +	CFLAGS+="-DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND"

Nope, you override the CFLAGS passed by Buildroot here. You should
instead do:

	CFLAGS="$(TARGET_CFLAGS) -foo -bar -baz"


> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
