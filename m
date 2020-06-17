From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 17 Jun 2020 20:41:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build on
 64-bit Raspberry Pi 3
In-Reply-To: <0478efa17e8530ec60d74c8e3fff37fccbed614f.camel@rovoreed.com>
References: <0478efa17e8530ec60d74c8e3fff37fccbed614f.camel@rovoreed.com>
Message-ID: <20200617204119.73ee93af@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

On Wed, 17 Jun 2020 18:21:59 +0100, Mike Davies <busybox_mail@rovoreed.com> wrote:

> Prior to this patch it was not possible to select the package rpi-userland if
> raspberrypi3_64_defconfig was used.
> Then the .mk file needed updating to allow 64 bit builds.
>

There was already some discussion/patch predating yours with this topic in
January (see [1]), a test showed that not the complete set of libraries/features
are available with the 64-bit build (and therefore all rpi-userland
dependencies should be checked)...

One of the latest upstream rpi-userland commits ([2]) reverts part of the
64-bit support...

Which part of the rpi-userland do you use on a 64-bit build?

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2020-January/271588.html
[2] https://github.com/raspberrypi/userland/commit/f97b1af1b3e653f9da2c1a3643479bfd469e3b74

> Signed-off-by: Mike Davies <git-user44@rovoreed.com>
> ---
>  package/rpi-userland/Config.in       | 4 ++--
>  package/rpi-userland/rpi-userland.mk | 6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
> index 342faf26e3..81f3588822 100644
> --- a/package/rpi-userland/Config.in
> +++ b/package/rpi-userland/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_RPI_USERLAND
>         bool "rpi-userland"
> -       depends on BR2_arm
> +       depends on BR2_arm || BR2_aarch64
>         depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_STATIC_LIBS
> @@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
>  endif
>
>  comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
> -       depends on BR2_arm
> +       depends on BR2_arm || BR2_aarch64
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>                 BR2_STATIC_LIBS
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index efb02f719f..d8b2a281af 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -13,6 +13,12 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
>
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>
> +ifeq ($(BR2_aarch64),y)
> +
> +RPI_USERLAND_CONF_OPTS += -DARM64=YES
> +
> +endif # BR2_aarch64
> +
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
>
>  RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
