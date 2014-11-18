From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 22:18:19 +0100
Subject: [Buildroot] [PATCH v4 4/4] guile: new package
In-Reply-To: <1415310486-25904-5-git-send-email-paguilar@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-5-git-send-email-paguilar@paguilar.org>
Message-ID: <20141118211819.GL4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-06 22:48 +0100, Pedro Aguilar spake thusly:
> Guile is an interpreter and compiler for the Scheme programming
> language, a clean and elegant dialect of Lisp.
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[--SNIP--]
> diff --git a/package/guile/Config.in b/package/guile/Config.in
> new file mode 100644
> index 0000000..85671e0
> --- /dev/null
> +++ b/package/guile/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_GUILE
> +	bool "guile"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBUNISTRING
> +	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_GMP
> +	select BR2_PACKAGE_BDWGC

Since you select bdwgc, you must also inherot from its dependencies:

    depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc

[--SNIP--]
> diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/guile-01-fix_arm_endianness.patch
> new file mode 100644
> index 0000000..a30a241
> --- /dev/null
> +++ b/package/guile/guile-01-fix_arm_endianness.patch
> @@ -0,0 +1,25 @@
> +Fix support for ARM endianness, otherwise it gives the error
> +"unknown CPU endianness"
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Did you try to send that patch upstream?

> +diff -Nau guile-2.0.11.orig/module/system/base/target.scm guile-2.0.11/module/system/base/target.scm
> +--- guile-2.0.11.orig/module/system/base/target.scm	2013-02-28 09:42:45.000000000 +0100
> ++++ guile-2.0.11/module/system/base/target.scm	2014-11-03 23:05:01.789338997 +0100
> +@@ -70,7 +70,15 @@
> +             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
> +                            "mips" "mips64"))
> +              (endianness big))
> +-            ((string-match "^arm.*el" cpu)
> ++           ((string-match "^arm.*el" cpu)

Nit-picking: that replacement line is not properly aligned.

[--SNIP--]
> diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/guile-02-calculate-csqrt_manually.patch
> new file mode 100644
> index 0000000..98bb0b6
> --- /dev/null
> +++ b/package/guile/guile-02-calculate-csqrt_manually.patch
> @@ -0,0 +1,16 @@
> +Avoid using scm_from_complex_double(csqrt()) when building with uclibc.
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> +
> +diff -Nau guile-2.0.11.orig/configure.ac guile-2.0.11/configure.ac
> +--- guile-2.0.11.orig/configure.ac	2014-03-12 14:36:02.000000000 +0100
> ++++ guile-2.0.11/configure.ac	2014-11-03 23:59:51.897267207 +0100
> +@@ -862,7 +862,7 @@
> + }]])],
> +     [guile_cv_use_csqrt=yes],
> +     [guile_cv_use_csqrt="no, glibc 2.3 bug"],
> +-    [guile_cv_use_csqrt="yes, hopefully (cross-compiling)"])])
> ++    [guile_cv_use_csqrt="no (cross-compiling)"])])

Not OK: it is possible to be cross-compiling with glibc, in which
case the result should be 'yes'.

> +   case $guile_cv_use_csqrt in
> +     yes*)
> +       AC_DEFINE([HAVE_USABLE_CSQRT], 1, [Define to 1 if csqrt is bug-free])
> diff --git a/package/guile/guile-03-remove_unused_funcs.patch b/package/guile/guile-03-remove_unused_funcs.patch
> new file mode 100644
> index 0000000..3d70ee9
> --- /dev/null
> +++ b/package/guile/guile-03-remove_unused_funcs.patch
> @@ -0,0 +1,36 @@
> +Remove unused static inline functions str_upcase_l() and 
> +str_downcase_l() that cause the compilation error:
> +'dereferencing pointer to incomplete type'.
> +
> +Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Indeed, those functions are never called. WTF... :-/

[--SNIP--]
> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
> new file mode 100644
> index 0000000..e0d7e80
> --- /dev/null
> +++ b/package/guile/guile.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# guile
> +#
> +################################################################################
> +
> +GUILE_VERSION = 2.0.11
> +GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
> +GUILE_SITE = $(BR2_GNU_MIRROR)/guile
> +GUILE_INSTALL_STAGING = YES
> +GUILE_LICENSE = LGPLv3+
> +GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
> +GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc
> +
> +HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-libtool
> +
> +# The HAVE_GC* CFLAGS specify that we wil use internal callbacks instead 
> +# of the ones provided by bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies 
> +# that we won't use bdwgc's GC_finalizer_notifier callback.
> +# Trying to use these specific bdwgc's callbacks breaks guile's building.
> +GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
> +	CFLAGS="$(TARGET_CFLAGS) -DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND"

This line is overly long. What about (with tabs, not spaces):

    GUILE_CFLAGS = \
        -DHAVE_GC_SET_FINALIZER_NOTIFIER \
        -DHAVE_GC_GET_HEAP_USAGE_SAFE \
        -DHAVE_GC_GET_FREE_SPACE_DIVISOR \
        -DHAVE_GC_SET_FINALIZE_ON_DEMAND

    GUILE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
