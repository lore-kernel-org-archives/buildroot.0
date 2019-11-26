From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 23:25:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/libargon2: new package
In-Reply-To: <20191121081223.2883-1-p.debruijn@unilogic.nl>
References: <20191121081223.2883-1-p.debruijn@unilogic.nl>
Message-ID: <20191126232508.25e1acf7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied to next, but after fixing a number of things. See below.

On Thu, 21 Nov 2019 09:12:23 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/Config.in                                  |  1 +
>  ...1-libargon2-dont-fail-on-existing-symlink.patch | 23 +++++++++++++++++
>  package/libargon2/Config.in                        |  8 ++++++
>  package/libargon2/libargon2.hash                   |  3 +++
>  package/libargon2/libargon2.mk                     | 29 ++++++++++++++++++++++
>  5 files changed, 64 insertions(+)

The entry in the DEVELOPERS file was missing.



>  create mode 100644 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch
>  create mode 100644 package/libargon2/Config.in
>  create mode 100644 package/libargon2/libargon2.hash
>  create mode 100644 package/libargon2/libargon2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index c2b48a6..37dec3e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1262,6 +1262,7 @@ menu "Crypto"
>  	source "package/libscrypt/Config.in"
>  	source "package/libsecret/Config.in"
>  	source "package/libsha1/Config.in"
> +	source "package/libargon2/Config.in"

Alphabetic ordering was not correct, and this is reported by "make
check-package".

> diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
> new file mode 100644
> index 0000000..aea861a
> --- /dev/null
> +++ b/package/libargon2/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBARGON2
> +	bool "libargon2"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  A modern password hashing algorithm
> +
> +	  https://password-hashing.net/#argon2

The Config.in comment for the !BR2_STATIC_LIBS dependency was missing.

> diff --git a/package/libargon2/libargon2.hash b/package/libargon2/libargon2.hash
> new file mode 100644
> index 0000000..c524b42
> --- /dev/null
> +++ b/package/libargon2/libargon2.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 eaea0172c1f4ee4550d1b6c9ce01aab8d1ab66b4207776aa67991eb5872fdcd8  libargon2-20171227.tar.gz
> +sha256 220f8736a89ff51c92ef3d497f413b48e6cf1df3d6278bc909c6308c78e1718e  LICENSE
> diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
> new file mode 100644
> index 0000000..db87d15
> --- /dev/null
> +++ b/package/libargon2/libargon2.mk
> @@ -0,0 +1,29 @@
> +################################################################################
> +#
> +# libargon2
> +#
> +################################################################################
> +
> +LIBARGON2_VERSION = 20171227		# 20190702 is not recognized by php7.3
> +LIBARGON2_SITE = $(call github,P-H-C,phc-winner-argon2,$(LIBARGON2_VERSION))
> +LIBARGON2_LICENSE = CC0

The SPDX encoding for this license is CC0-1.0, and the license is in
fact CC0-1.0 or Apache-2.0, as explained in the LICENSE file that
you're using in LIBARGON2_LICENSE_FILES.

> +LIBARGON2_LICENSE_FILES = LICENSE
> +LIBARGON2_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> +LIBARGON2_OPTS += NO_THREADS=1
> +endif
> +
> +define LIBARGON2_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) OPTTARGET=$(GCC_TARGET_ARCH) $(LIBARGON2_OPTS)

I have moved the OPTTARGET=$(GCC_TARGET_ARCH) into LIBARGON2_OPTS, only
added it when GCC_TARGET_ARCH is non-empty, and added a comment to
explain why this is needed, as it is quite odd.

I've applied to next with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
