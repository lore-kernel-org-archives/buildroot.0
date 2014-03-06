From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 20:30:55 +0100
Subject: [Buildroot] [PATCH 05/11] clapack: new package
In-Reply-To: <1392588004-13317-6-git-send-email-s.martin49@gmail.com>
References: <1392588004-13317-1-git-send-email-s.martin49@gmail.com>
 <1392588004-13317-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20140306193055.GE3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-02-16 22:59 +0100, Samuel Martin spake thusly:
> This package provides BLAS and LAPACK libraries.
[--SNIP--]
> diff --git a/package/clapack/Config.in b/package/clapack/Config.in
> new file mode 100644
> index 0000000..fc81d43
> --- /dev/null
> +++ b/package/clapack/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_CLAPACK
> +	bool "cblas/clapack"
> +	help
> +	  BLAS and LAPACK C implementation (f2c'ed version of).
> +
> +	  http://www.netlib.org/clapack/
> +
> +config BR2_PACKAGE_CLAPACK_ARITH_H
> +	string "Custom BLAS arith.h"
> +	depends on BR2_PACKAGE_CLAPACK
> +	help
> +	  To optimized BLAS library for the hardware an 'arith.h' header should
> +	  be provided.

    To optimize the BLAS library for the hardware, an [...]

> +	  If empty, the library wil just be not optimized by the compiler.

s/wil just be not/will not be/

> +	  In any case an 'arithchk' program is built (but not installed), to be run
> +	  on the target for generating this arith.h header.

to generate

[-- SNIP Cmake stuff, I expect you know what you're doing there! ;-) --]
> diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
> new file mode 100644
> index 0000000..d8ca3be
> --- /dev/null
> +++ b/package/clapack/clapack.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# clapack
> +#
> +################################################################################
> +
> +CLAPACK_VERSION = 3.2.1
> +CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz

What the difference between this ^^^^ and clapack-3.2.1.tgz at the same site:
    http://www.netlib.org/clapack/clapack-3.2.1.tgz

(Note: only http://www.netlib.org/clapack/clapack.tgz is listed on the
main page, but both URLs do download the same file. The one without the
version string is of course unusable, in case they bump but we don't.)

> +# This package provides 3 libraries:
> +# - libf2c.a (not installed)
> +# - libblas (linking against libf2c.a)
> +# - liblapack (linking against libf2c.a)

s/linking against/staticaly linked with/

> +CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and lapack)

s/lapack/liblapack/  to keep a coherent naming scheme.

> +CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice, COPYING
> +CLAPACK_SITE = http://www.netlib.org/clapack
> +CLAPACK_INSTALL_STAGING = YES
> +CLAPACK_CONF_OPT = -DBUILD_TESTING=OFF \
> +	$(if $(BR2_PACKAGE_CLAPACK_ARITH_H),-DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H))
> +
> +$(eval $(cmake-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
