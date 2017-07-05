From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Jul 2017 22:26:57 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/kodi: Add support for more
	archs
In-Reply-To: <20170705163254.15156-3-bernd.kuhls@t-online.de>
References: <20170705163254.15156-1-bernd.kuhls@t-online.de>
 <20170705163254.15156-3-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMK5kgFrNrnxroea7ZAcxEEEeoHHSTRMhqCnAAgGxvnn4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Wed, Jul 5, 2017 at 6:32 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> For the autoconf-based build system it was necessary to allow each
> supported architecture separatly:
> https://github.com/xbmc/xbmc/blob/Krypton/m4/xbmc_arch.m4
>
> For the CMake build system this is not necessary anymore so we only
> blacklist archs in Config.in known to be broken.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rebased
>
>  package/kodi/Config.in |  6 +++---
>  package/kodi/kodi.mk   | 45 +++++++++++++++++++++++++++++++++++----------
>  2 files changed, 38 insertions(+), 13 deletions(-)
>
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 00e4fbaef..e0c16fac3 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>         bool
> -       default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
> -               && BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
> -               && BR2_TOOLCHAIN_HAS_SYNC_8
>         depends on BR2_USE_MMU # libcdio, and others
> +# i386: needs sse (see upstream PR 10351)
> +       default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
> +               && !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
>
>  comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, locale, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
>         depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 3d6c70bee..e6fe5a6fa 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -57,6 +57,7 @@ KODI_EXTRA_DOWNLOADS = \
>         https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
>
>  KODI_CONF_OPTS += \
> +       -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
>         -DENABLE_CCACHE=OFF \
>         -DENABLE_DVDCSS=ON \
>         -DENABLE_INTERNAL_CROSSGUID=OFF \
> @@ -70,14 +71,34 @@ KODI_CONF_OPTS += \
>         -DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
>         -DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
>
> -ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
> +KODI_DEPENDENCIES += rpi-userland
> +# These CPU-specific options are only used on rbpi:
> +# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
> +ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
> +KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)
> +endif
> +else
> +ifeq ($(BR2_arceb)$(BR2_arcle),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
> +else ifeq ($(BR2_armeb),y)
>  KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
> -else ifeq ($(BR2_mips),y)
> -KODI_CONF_OPTS += -DWITH_ARCH=mips -DWITH_CPU=mips
> -else ifeq ($(BR2_i386),y)
> -KODI_CONF_OPTS += -DWITH_ARCH=i486-linux -DWITH_CPU=$(BR2_GCC_TARGET_ARCH)
> -else ifeq ($(BR2_x86_64),y)
> -KODI_CONF_OPTS += -DWITH_ARCH=x86_64-linux -DWITH_CPU=x86_64
> +else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +KODI_CONF_OPTS += \
> +       -DWITH_ARCH=mips$(if $(BR2_ARCH_IS_64),64) \
> +       -DWITH_CPU=mips$(if $(BR2_ARCH_IS_64),64)
> +else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
> +KODI_CONF_OPTS += \
> +       -DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
> +       -DWITH_CPU=powerpc$(if $(BR2_ARCH_IS_64),64)
> +else ifeq ($(BR2_powerpc64)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
> +else
> +# Kodi auto-detects ARCH, tested: arm, aarch64, i386, x86_64
> +# see project/cmake/scripts/linux/ArchSetup.cmake
> +KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
> +endif
>  endif
>
>  ifeq ($(BR2_X86_CPU_HAS_SSE),y)
> @@ -128,6 +149,11 @@ else
>  KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
>  endif
>
> +# mips: uses __atomic_load_8
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +KODI_CXX_FLAGS += -latomic
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
>  KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
>  KODI_DEPENDENCIES += mysql
> @@ -229,9 +255,8 @@ endif
>
>  ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
>  KODI_DEPENDENCIES += libegl libgles
> -KODI_CONF_OPTS += \
> -       -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`" \
> -       -DENABLE_OPENGLES=ON
> +KODI_CONF_OPTS += -DENABLE_OPENGLES=ON
> +KODI_CXX_FLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`

s/=/+=/ otherwise you may override "-latomic" set just above.

>  else
>  KODI_CONF_OPTS += -DENABLE_OPENGLES=OFF
>  endif
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
