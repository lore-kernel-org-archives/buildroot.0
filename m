From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 9 Apr 2017 11:28:16 +0200
Subject: [Buildroot] [PATCH v2] atest: new package
In-Reply-To: <1491156583-9920-1-git-send-email-festevam@gmail.com>
References: <1491156583-9920-1-git-send-email-festevam@gmail.com>
Message-ID: <CAKcgs2w6ms9T2KcwnAkJku-JBsq2OB7mKsutciu7bTbxsK2BQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, all,

2017-04-02 20:09 GMT+02:00 Fabio Estevam <festevam@gmail.com>:
> Add support for atest application, which is useful for testing
> alsa kernel drivers and detecting if playback/capture are correct
> without artifacts, such as channel swap.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Fix license type and add COPYING entry
>
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/atest/Config.in  |  9 +++++++++
>  package/atest/atest.hash |  2 ++
>  package/atest/atest.mk   | 20 ++++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/atest/Config.in
>  create mode 100644 package/atest/atest.hash
>  create mode 100644 package/atest/atest.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c89468b..bf64f98 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -501,6 +501,7 @@ F:  configs/mx6sx_udoo_neo_defconfig
>  F:     configs/mx6udoo_defconfig
>  F:     configs/wandboard_defconfig
>  F:     configs/warp7_defconfig
> +F:     package/atest/
>  F:     package/kmscube/
>
>  N:     Fabio Porcedda <fabio.porcedda@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index d6d134d..226a6e1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -5,6 +5,7 @@ menu "Target packages"
>
>  menu "Audio and video applications"
>         source "package/alsa-utils/Config.in"
> +       source "package/atest/Config.in"
>         source "package/aumix/Config.in"
>         source "package/bellagio/Config.in"
>         source "package/dvblast/Config.in"
> diff --git a/package/atest/Config.in b/package/atest/Config.in
> new file mode 100644
> index 0000000..64c9e7c
> --- /dev/null
> +++ b/package/atest/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_ATEST
> +       bool "atest"
> +       depends on BR2_PACKAGE_ALSA_LIB
> +       depends on BR2_PACKAGE_LIBEV
I would actually use SELECT here. Just to increase the chances of the
package to be visible
then
depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
depends on !BR2_bfin # libev

> +       help
> +         atest is a test software for checking ALSA Asoc drivers
> +         concerning the proper frame generation and capture.
> +
> +         https://github.com/amouiche/atest
> diff --git a/package/atest/atest.hash b/package/atest/atest.hash
> new file mode 100644
> index 0000000..16b05c9
> --- /dev/null
> +++ b/package/atest/atest.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 6572b42170d3ad00dfc6362501f0e41fda7e2e7d79ff1757a2050415ad3f6ee4  atest-2e2299e9949b713f3c89cf84692dc6db6ab3a2e9.tar.gz
> diff --git a/package/atest/atest.mk b/package/atest/atest.mk
> new file mode 100644
> index 0000000..af1760d
> --- /dev/null
> +++ b/package/atest/atest.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# atest
> +#
> +################################################################################
> +
> +ATEST_VERSION = 2e2299e9949b713f3c89cf84692dc6db6ab3a2e9
There's a newer version (895b0183a89c15f5e2305a6795bb1667753cd3f0)

> +ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
> +ATEST_LICENSE = GPLv2+
Please use SPDX short identifier (GPL-2.0+)

> +ATEST_LICENSE_FILES = COPYING
> +ATEST_DEPENDENCIES = host-pkgconf libev alsa-lib
> +ATEST_AUTORECONF = YES
You need to provide a comment such as "Fetched from Github, with no
configure script"

> +
> +# Autoreconf requires an existing m4 directory
> +define ATEST_PATCH_M4
> +       mkdir -p $(@D)/m4
> +endef
> +ATEST_POST_PATCH_HOOKS += ATEST_PATCH_M4
> +
> +$(eval $(autotools-package))
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
