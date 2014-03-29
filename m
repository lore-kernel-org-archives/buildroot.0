From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 14:21:19 +0100
Subject: [Buildroot] [PATCH 1/1] libstrophe: new package
In-Reply-To: <1394618657-12162-1-git-send-email-lefinnois@lefinnois.net>
References: <1394618657-12162-1-git-send-email-lefinnois@lefinnois.net>
Message-ID: <20140329142119.0b0a9c2d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Denis Bodor,

On Wed, 12 Mar 2014 11:04:17 +0100, Denis Bodor wrote:

> +config BR2_PACKAGE_LIBSTROPHE
> +	bool "libstrophe"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_EXPAT

In fact it can work with either libxml2 or expat. So I've change this
to:

	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT

> diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
> new file mode 100644
> index 0000000..2a12a1d
> --- /dev/null
> +++ b/package/libstrophe/libstrophe.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +# 
> +# libstrophe
> +#
> +################################################################################
> +
> +LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
> +LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
> +LIBSTROPHE_DEPENDENCIES = expat openssl host-pkgconf

I've also adapted the dependencies to allow building against either
expat or libxml2.

> +LIBSTROPHE_AUTORECONF = YES
> +LIBSTROPHE_LICENSE = MIT GPLv3

The license is actually MIT *or* GPLv2.

> +LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
> +LIBSTROPHE_INSTALL_STAGING = YES
> +LIBSTROPHE_INSTALL_TARGET = NO
> +
> +# This package only consists of header and static lib that need 
> +# to be copied over to the sysroot for compile time use
> +
> +$(eval $(autotools-package))

Committed with those changes, see
http://git.buildroot.net/buildroot/commit/?id=1acff22d5e34a91ed6e2f87312962160612fbd3d.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
