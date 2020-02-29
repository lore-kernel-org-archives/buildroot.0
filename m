From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 29 Feb 2020 21:55:52 +0100
Subject: [Buildroot] [PATCH 4/4] package/swupdate: bump version to git
 119173d1cfa061140a809cb7589fa1970fb3f44e.
In-Reply-To: <20200223091803.1007790-4-mc5686@mclink.it>
References: <20200223091803.1007790-1-mc5686@mclink.it>
 <20200223091803.1007790-4-mc5686@mclink.it>
Message-ID: <CADvTj4omXc9UZzzESLrZK6ND9b-9RsYT+0UT4bcu6Svpawb+kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 23, 2020 at 10:34 AM Mauro Condarelli <mc5686@mclink.it> wrote:
>
> It has bugfixes for clering U-Boot variables (needs fixed libubootenv).
> Implements support for toolchains without locale.
>
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/swupdate/swupdate.hash | 2 +-
>  package/swupdate/swupdate.mk   | 8 +++++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index 3de8d25..8c43e7e 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  31b2561c9c91ab1e8b6f73704f9a3560816961c2cade4f5d5fc15f55c77ec819  swupdate-2019.11.tar.gz
> +sha256  205b2dccd97285d5535cdb2bc50f808226131825d386f01838863c2d552f1612  swupdate-119173d1cfa061140a809cb7589fa1970fb3f44e.tar.gz
>  sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 60dc0e9..26af1fa 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -SWUPDATE_VERSION = 2019.11
> +SWUPDATE_VERSION = 119173d1cfa061140a809cb7589fa1970fb3f44e
>  SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>  SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
>  SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
> @@ -145,6 +145,12 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
>  SWUPDATE_DEPENDENCIES += librsync
>  endif
>
> +ifeq ($(BR2_ENABLE_LOCALE),y)
From my understanding this does not directly correspond with the locale support
used by swupdate as toolchains such as uclibc which do not select
BR2_ENABLE_LOCALE still provide the functions required by swupdate.
See:
https://git.uclibc.org/uClibc/tree/include/locale.h

On the other hand from my understanding the swupdate locale issue fixed by
https://github.com/sbabic/swupdate/commit/95a2b9961119aac80aea1eeabbc1cd52b72d876a
is mostly just a glibc issue so locale may not be needed for non-glibc
toolchains.
I'm fairly certain that is the case for musl as it defaults to C.UTF-8
but I'm not
entirely sure for uclibc. I'm not sure what use cases would need locale support
for anything other than UTF-8 locales however.
> +SWUPDATE_MAKE_ENV += LOCALE=y
> +else
> +SWUPDATE_MAKE_ENV += LOCALE=n
> +endif
> +
>  SWUPDATE_BUILD_CONFIG = $(@D)/.config
>
>  SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
