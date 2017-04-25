From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 25 Apr 2017 16:00:51 +1200
Subject: [Buildroot] [PATCH v6 31/31] package/kodi: Add support for more
	archs
In-Reply-To: <20170424213206.26247-32-bernd.kuhls@t-online.de>
References: <20170424213206.26247-1-bernd.kuhls@t-online.de>
 <20170424213206.26247-32-bernd.kuhls@t-online.de>
Message-ID: <CAFOYHZABJ6nDTRv0xxT=daZM4VacXDSepiCF9p3exCHyQ3j9ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Apr 25, 2017 at 9:32 AM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> For the autoconf-based build system it was necessary to allow each
> supported architecture separatly:
> https://github.com/xbmc/xbmc/blob/Krypton/m4/xbmc_arch.m4
>
> The CMake build system supports more archs which are added by this
> commit.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 9 ++++++++-
>  package/kodi/kodi.mk   | 8 +++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index a5fc940a2b..1f56874077 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -1,7 +1,14 @@
>  config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>         bool
>         depends on BR2_USE_MMU # libcdio, and others
> -       default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
> +       default y if ( \
> +               BR2_aarch64 || BR2_aarch64_be || \
> +               BR2_arcle || BR2_arceb || \
> +               BR2_arm || BR2_armeb || \
> +               BR2_mips || BR2_mips64 || \
> +               BR2_mipsel || BR2_mips64el || \
> +               BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
> +               BR2_i386 || BR2_x86_64) \
>                 && BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
>                 && BR2_TOOLCHAIN_HAS_SYNC_8
>
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 245b8bfbe6..455d38d97e 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -73,10 +73,16 @@ KODI_CONF_OPTS += \
>         -DDEPENDS_PATH=$(@D) \
>         -DWITH_TEXTUREPACKER=$(HOST_DIR)/usr/bin/TexturePacker
>
> -ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_aarch64),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=aarch64 -DWITH_CPU=aarch64

Would it make more sense to have

  KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)

and have explicit cases where BR2_arch doesn't meet Kodi's view of the world

> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
>  KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
>  else ifeq ($(BR2_mips),y)
>  KODI_CONF_OPTS += -DWITH_ARCH=mips -DWITH_CPU=mips
> +else ifeq ($(BR2_mips64el),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=mips64 -DWITH_CPU=mips64
> +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=powerpc64 -DWITH_CPU=powerpc64
>  else ifeq ($(BR2_i386),y)
>  KODI_CONF_OPTS += -DWITH_ARCH=i486-linux -DWITH_CPU=$(BR2_GCC_TARGET_ARCH)
>  else ifeq ($(BR2_x86_64),y)
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
