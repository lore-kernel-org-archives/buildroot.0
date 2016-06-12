From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 16:03:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] efivar: new package
In-Reply-To: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
References: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20160612160349.1dbf4753@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 22:23:55 -0300, Erico Nunes wrote:

> diff --git a/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
> new file mode 100644
> index 0000000..e4e5a2c
> --- /dev/null
> +++ b/package/efivar/0002-Make.rules-fix-build-with-make-3.81.patch
> @@ -0,0 +1,45 @@
> +From 00376f4dec71d4abb591ba07bc8164ba29e5955e Mon Sep 17 00:00:00 2001
> +From: Erico Nunes <nunes.erico@gmail.com>
> +Date: Tue, 22 Mar 2016 21:43:44 -0300
> +Subject: [PATCH] Make.rules: fix build with make <= 3.81
> +
> +Building with host make 3.81 resulted in an issue where src/efivar.pc
> +was never generated.
> +Even by running 'make efivar.pc' inside the src directory, make always
> +returned that there was nothing to do.
> +This was not observed when using make 3.82 or 4.x.
> +It is apparently caused by the assignment operators in the multi-line
> +defines in Make.rules, which do not seem to be supported by make 3.81.
> +By omitting the assignment operators, the rule works with both versions
> +of make.
> +
> +Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Please make sure to send this patch upstream.

> diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
> new file mode 100644
> index 0000000..6619229
> --- /dev/null
> +++ b/package/efivar/efivar.hash
> @@ -0,0 +1,2 @@
> +# locally computed hash
> +sha256 f807f5f0846323bc21b18043542b296f5ad81514f91f13c74a4b8da30c965c94 efivar-0.23.tar.gz
> diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> new file mode 100644
> index 0000000..6e0ba68
> --- /dev/null
> +++ b/package/efivar/efivar.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# efivar
> +#
> +################################################################################
> +
> +EFIVAR_VERSION = 0.23
> +EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
> +EFIVAR_LICENSE = LGPLv2.1
> +EFIVAR_LICENSE_FILES = COPYING
> +EFIVAR_DEPENDENCIES = popt
> +EFIVAR_INSTALL_STAGING = YES
> +
> +# BINTARGETS is set to skip efivar-static which requires static popt.
> +# -fPIC is requested at least on MIPS, otherwise fails to build shared library.
> +# Explicitly linking with shared libgcc is required at least on MicroBlaze,
> +# otherwise it fails due to FDE encoding in static libgcc.
> +EFIVAR_MAKE_OPTS = \
> +	libdir=/usr/lib \
> +	BINTARGETS=efivar \
> +	LDFLAGS=-fPIC \

I've changed this to

	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"

so that the standard LDFLAGS are also passed.

> +	SOFLAGS="-shared -shared-libgcc"

I've made this line conditional on Microblaze.

Applied with those changes, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
