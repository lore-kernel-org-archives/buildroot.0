From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 21:18:17 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/libtalloc: new package
In-Reply-To: <20201013195044.6343-1-dgouarin@gmail.com>
References: <20201013143707.11678-1-dgouarin@gmail.com>
 <20201013195044.6343-1-dgouarin@gmail.com>
Message-ID: <20201014211817.0ef38543@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Oct 2020 21:50:44 +0200
David GOUARIN <dgouarin@gmail.com> wrote:

> talloc is a hierarchical, reference counted memory pool system with destructors.
> It is the core memory allocator used in Samba.
> 
> Change v1 -> v2:
>   - merge with work from jared.bents at rockwellcollins.com, as sujested by Matthew Weber
>     http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com

Changes should go below the --- sign...

> 
> Signed-off-by: David GOUARIN <dgouarin@gmail.com>
> ---

... here.

> diff --git a/package/libtalloc/Config.in b/package/libtalloc/Config.in
> new file mode 100644
> index 0000000000..3e6a97bb6e
> --- /dev/null
> +++ b/package/libtalloc/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBTALLOC
> +	bool "libtalloc"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_USES_GLIBC && !BR2_COMPILER_PARANOID_UNSAFE_PATH || !BR2_TOOLCHAIN_USES_GLIBC

What is the problem with BR2_COMPILER_PARANOID_UNSAFE_PATH ? It
shouldn't matter. If it does, you have a different problem.


> diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
> new file mode 100644
> index 0000000000..20211210d2
> --- /dev/null
> +++ b/package/libtalloc/libtalloc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
> +

We want the hashes of the license files here.

> diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
> new file mode 100644
> index 0000000000..7a42da8145
> --- /dev/null
> +++ b/package/libtalloc/libtalloc.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# libtalloc
> +#
> +################################################################################
> +
> +LIBTALLOC_VERSION = 2.3.1
> +LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
> +LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
> +LIBTALLOC_LICENSE = LGPL-3.0, GPL-3.0+

Are there some specific parts under LGPL-3.0 and others under GPL-3.0+
? If so, it would be good to indicate it, like this for example:

	LGPL-3.0 (library), GPL-3.0+ (tests)

Of course, adjust depending on what is under what license.

> +LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
> +LIBTALLOC_INSTALL_STAGING = YES
> +
> +LIBTALLOC_CONF_OPTS += --prefix=/usr \
> +		--libdir=/usr/lib \

prefix and libdir are already passed by the waf-package infrastructure,
so passing them again here is not necessary.

Otherwise, it looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
