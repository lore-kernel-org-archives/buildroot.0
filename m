From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:52:27 +0100
Subject: [Buildroot] [PATCH] Add mini-snmpd package
In-Reply-To: <20181111150652.17459-4-alexander.sverdlin@gmail.com>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-4-alexander.sverdlin@gmail.com>
Message-ID: <20181113225227.32ee1b8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution! It looks mostly good, I really only have
some minor comments, see below.

The first nit is that the commit title should be:

	package/mini-snmpd: new package

On Sun, 11 Nov 2018 16:06:49 +0100, Alexander Sverdlin wrote:
> Mini SNMPd is a minimal implementation targeted at small or embedded UNIX
> systems with limited resources.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> 
> Note:
> check-package issues "Signed-off-by" warnings on the .patch files, but
> that's how they present in the original repository.

Still, we need *your* SoB added to the patches, so that's why
check-package complains: there should always be at least one SoB in the
patches, the one of the person who added the patch into Buildroot.

> 
>  package/Config.in                             |  1 +
>  ...d-zero-byte-before-unsigned-integers.patch | 29 +++++++++++++++++++
>  ...igned-integers-to-have-an-extra-byte.patch | 26 +++++++++++++++++
>  package/mini-snmpd/Config.in                  |  7 +++++
>  package/mini-snmpd/mini-snmpd.mk              | 21 ++++++++++++++
>  package/mini-snmpd/mini-snmpd.service         | 12 ++++++++
>  6 files changed, 96 insertions(+)

Please add an entry to the DEVELOPERS file.

> diff --git a/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch b/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
> new file mode 100644
> index 0000000000..990d5bb9b7
> --- /dev/null
> +++ b/package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
> @@ -0,0 +1,29 @@
> +From 949ae648bf7c654b8fae607a0988bfa672607156 Mon Sep 17 00:00:00 2001
> +From: Patrick Rauscher <prauscher@prauscher.de>
> +Date: Fri, 18 Aug 2017 17:31:23 +0200
> +Subject: [PATCH] Prepend zero-byte before unsigned integers
> +
> +fixes #8

We need your SoB here.

> diff --git a/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch b/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
> new file mode 100644
> index 0000000000..d1b18050a5
> --- /dev/null
> +++ b/package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
> @@ -0,0 +1,26 @@
> +From 556c8a406c9e08dd9444222e072f7eb9c82a81e8 Mon Sep 17 00:00:00 2001
> +From: Patrick Rauscher <prauscher@prauscher.de>
> +Date: Fri, 18 Aug 2017 17:44:32 +0200
> +Subject: [PATCH] mib.c: allow unsigned integers to have an extra byte
> +
> +The extra byte can be needed when encoding huge unsigned numbers (i.e. 0x80000000 or higher). In this case, during encoding we need an extra byte to make sure clients decoding as signed int do not get negative numbers. For further details, see commit 949ae648

And here.

> diff --git a/package/mini-snmpd/Config.in b/package/mini-snmpd/Config.in
> new file mode 100644
> index 0000000000..1f61cddbcf
> --- /dev/null
> +++ b/package/mini-snmpd/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MINI_SNMPD
> +	bool "mini-snmpd"
> +	help
> +	  Mini SNMPd is a minimal implementation targeted at small or
> +	  embedded UNIX systems with limited resources
> +
> +	  http://troglobit.com/mini-snmpd.html

Just curious, did you test the build of this package
with ./utils/test-pkg ? It would be useful to do so.

> diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
> new file mode 100644
> index 0000000000..ebcbcce1ce
> --- /dev/null
> +++ b/package/mini-snmpd/mini-snmpd.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# mini-snmpd
> +#
> +################################################################################
> +
> +MINI_SNMPD_VERSION = v1.4
> +MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,$(MINI_SNMPD_VERSION))
> +MINI_SNMPD_LICENSE = GPL-2.0
> +MINI_SNMPD_LICENSE_FILES = COPYING
> +MINI_SNMPD_AUTORECONF = YES

mini-snmpd has an optional dependency on libconfuse, when --with-config
is passed, or by default. So, you should either pass --without-config
and not bother with this dependency, or handle it explicitly with
something like this:

ifeq ($(BR2_PACKAGE_LIBCONFUSE),y)
MINI_SNMPD_DEPENDENCIES += host-pkgconf libconfuse
MINI_SNMPD_CONF_OPTS += --with-config
else
MINI_SNMPD_CONF_OPTS += --without-config
endif

Could you fix those various small details and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
