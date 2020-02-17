From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Feb 2020 09:40:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/libxkbcommon: bump to version
 0.10.0
In-Reply-To: <20200210235857.87591-1-james.hilliard1@gmail.com>
References: <20200210235857.87591-1-james.hilliard1@gmail.com>
Message-ID: <20200217094023.43d909be@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Mon, 10 Feb 2020 16:58:57 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Replaced autotools with meson build system.

Please mention this in the commit title (to allow easy finding in case of regression):

	...and convert to meson

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libxkbcommon/libxkbcommon.hash |  8 ++++----
>  package/libxkbcommon/libxkbcommon.mk   | 12 +++++-------
>  2 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
> index c734f3ad9f..5d4c3af10a 100644
> --- a/package/libxkbcommon/libxkbcommon.hash
> +++ b/package/libxkbcommon/libxkbcommon.hash
> @@ -1,7 +1,7 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/040102.html
> -md5 3c4409058dfd203f641a563358e0187d  libxkbcommon-0.8.4.tar.xz
> -sha1 0ce9df42239d451f61b2112c6ba8d0a1a0879009  libxkbcommon-0.8.4.tar.xz
> -sha256 60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b  libxkbcommon-0.8.4.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2020-January/041133.html
> +md5 2d9ad3a46b317138b5e72a91cf105451  libxkbcommon-0.10.0.tar.xz
> +sha1 d8f956f4bc5382d5d8e0e4dd590c4f090e0e985a  libxkbcommon-0.10.0.tar.xz
> +sha256 57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2  libxkbcommon-0.10.0.tar.xz
>
>  # License file:
>  sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 1f54de4267..3923d69c8d 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -4,22 +4,20 @@
>  #
>  ################################################################################
>
> -LIBXKBCOMMON_VERSION = 0.8.4
> +LIBXKBCOMMON_VERSION = 0.10.0
>  LIBXKBCOMMON_SITE = http://xkbcommon.org/download
>  LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
>  LIBXKBCOMMON_LICENSE = MIT/X11
>  LIBXKBCOMMON_LICENSE_FILES = LICENSE
>  LIBXKBCOMMON_INSTALL_STAGING = YES
>  LIBXKBCOMMON_DEPENDENCIES = host-bison host-flex
> -LIBXKBCOMMON_CONF_OPTS = --disable-wayland
> -# uses C99 features
> -LIBXKBCOMMON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> +LIBXKBCOMMON_CONF_OPTS = -Denable-docs=false -Denable-wayland=false
>
>  ifeq ($(BR2_PACKAGE_XORG7),y)
> -LIBXKBCOMMON_CONF_OPTS += --enable-x11
> +LIBXKBCOMMON_CONF_OPTS += -Denable-x11=true
>  LIBXKBCOMMON_DEPENDENCIES += libxcb
>  else
> -LIBXKBCOMMON_CONF_OPTS += --disable-x11
> +LIBXKBCOMMON_CONF_OPTS += -Denable-x11=false
>  endif
>
> -$(eval $(autotools-package))
> +$(eval $(meson-package))

Besides the commit title nitpick your can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

as it is basically the same change (beside the updated version and the additional
-Denable-docs=false) as suggested already in Oktober 2019 (see [1])...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2019-October/264740.html
