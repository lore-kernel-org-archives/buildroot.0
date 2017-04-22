From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 22:24:57 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
 17.1-Krypton
In-Reply-To: <20170417195433.26672-9-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
Message-ID: <20170422202457.GJ15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Removed unneeded patches
> - 0001-Fixup-include-path.patch (not needed after CMake switch)
> - 0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
>   (applied upstream)
> - 0006-ffmpeg30.patch (was backported from 17.0-Krypton to 16.0-Jarvis)
> - 0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
>   (was backported from 17.0-Krypton to 16.0-Jarvis)
> - 0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
>   (was backported from 17.0-Krypton to 16.0-Jarvis)
> - 0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
>   (cximage was removed in bump from 16.x to 17.0)
> - 0010-curl-support-version-7.5.0-and-upwards.patch
>   (applied upstream)
> - 0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
>   (applied upstream)
> - 0012-Fix_includes_in_amcodec.patch
>   (was backported from 17.0-Krypton to 16.0-Jarvis)
> 
> Rebased patches
> - 0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> 
> Removed dependencies not needed anymore:
> - boost
>   https://github.com/xbmc/xbmc/commit/41ae93f0913f7ba72087a48370f8d66a3eac9fcc
> - giflib
>   https://github.com/xbmc/xbmc/commit/d44338baf1f6d1e6b76cd7dbab6453d76cc2ac31
> - jasper/tiff
>   https://github.com/xbmc/xbmc/commit/00724eb109a702f0098089d849f7c02ea173a4a9
> - jpeg
>   https://github.com/xbmc/xbmc/commit/7d5bdfb9a09348bde92b323ef6077b5e75edaca7
> - libdcadec
>   https://github.com/xbmc/xbmc/commit/378eb2687c1da5f97ef47c78431033b52f0d4417
> - libglew
>   https://github.com/xbmc/xbmc/commit/03ff0d5ea02963b1283fe8bc7c1bad18f2dd97b6
> - libmpeg2
>   https://github.com/xbmc/xbmc/commit/d22c829d67937e8d03fdac8f8b0bf2d1fa8fbf70
> - libogg/libvorbis
>   https://github.com/xbmc/xbmc/commit/4c609691776ab845d83153e19d191b7fd445edb9
> - libpng
>   https://github.com/xbmc/xbmc/commit/be6b50c6c3f91809a9045c199d054cbc1d637d5d
> - libsquish
>   https://github.com/xbmc/xbmc/commit/ed03f828be3615d294eb4a4cfccc5cdccec22997
> - xlib_libXmu
> - xlib_libXt
> 
> Switched to CMake, autoconf was deprecated:
> https://github.com/xbmc/xbmc/pull/10797
> 
> Added support for various archs, relax arm dependencies.

The bump in itself is already a big patch, so please split the arch
support to a separate patch.

> Bumped BR2_TOOLCHAIN_GCC_AT_LEAST to 4.8 to fix compile error with
> http://autobuild.buildroot.net/toolchains/configs/sourcery-x86.config

So is it a bug in this toolchain, or does Kodi really need gcc-4.8 now?

If the former, then you should just make an exception for that toolchain
and keep the requirement to gcc-4.7.

If the latter, then the rationale is incorrect: it is not to avoid a
build failure with a specific toolchain.

> Added hard-dependency for libegl, needed after
> https://github.com/xbmc/xbmc/commit/0ac305f7cf82e98021b6e0d70c3d4c51fc1cf18a
> 
> Updated clean-up hook and added host-xmlstarlet as dependency to
> manipulate the list of default system addons in addon-manifest.xml.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/0001-Fixup-include-path.patch         |   33 -
>  ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   42 +
>  package/kodi/0002-cmake-add-FindIconv.cmake.patch  |  171 +++

That patch to find iconv is a feature patch (add support for building
under uClibc). We avoid having feature patches. At best make it a
separate changeset.

>  ...0003-ALSA-fix-device-change-event-support.patch |   67 -
>  ...e-dependency-on-gmp-and-libintl-from-Find.patch |   34 +
>  ....cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   41 -
>  ...exturePacker-fix-compilation-with-gcc-4.6.patch |   53 -
>  package/kodi/0006-ffmpeg30.patch                   |  646 ---------
>  ...r-out-of-memory-errors-with-large-numbers.patch |   45 -
>  ...ding-issue-when-reading-certain-id3v1-tag.patch |   82 --
>  ...lib-cximage-6.0-fix-compilation-with-gcc6.patch | 1438 --------------------
>  ...10-curl-support-version-7.5.0-and-upwards.patch |   34 -
>  ...bmc_pvr_types.h-Fix-compilation-with-gcc6.patch |   30 -
>  package/kodi/0012-Fix_includes_in_amcodec.patch    |   38 -
>  package/kodi/Config.in                             |   63 +-
>  package/kodi/kodi.hash                             |    8 +-
>  package/kodi/kodi.mk                               |  300 ++--
>  17 files changed, 455 insertions(+), 2670 deletions(-)
>  delete mode 100644 package/kodi/0001-Fixup-include-path.patch
>  create mode 100644 package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
>  create mode 100644 package/kodi/0002-cmake-add-FindIconv.cmake.patch
>  delete mode 100644 package/kodi/0003-ALSA-fix-device-change-event-support.patch
>  create mode 100644 package/kodi/0003-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
>  delete mode 100644 package/kodi/0004-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
>  delete mode 100644 package/kodi/0005-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
>  delete mode 100644 package/kodi/0006-ffmpeg30.patch
>  delete mode 100644 package/kodi/0007-exif-Fix-for-out-of-memory-errors-with-large-numbers.patch
>  delete mode 100644 package/kodi/0008-Fix-nullpadding-issue-when-reading-certain-id3v1-tag.patch
>  delete mode 100644 package/kodi/0009-lib-cximage-6.0-fix-compilation-with-gcc6.patch
>  delete mode 100644 package/kodi/0010-curl-support-version-7.5.0-and-upwards.patch
>  delete mode 100644 package/kodi/0011-xbmc_pvr_types.h-Fix-compilation-with-gcc6.patch
>  delete mode 100644 package/kodi/0012-Fix_includes_in_amcodec.patch

[--SNIP--]

> diff --git a/package/kodi/0003-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch b/package/kodi/0003-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
> new file mode 100644
> index 000000000..9aa199e51
> --- /dev/null
> +++ b/package/kodi/0003-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
> @@ -0,0 +1,34 @@
> +From 5cf1a4936eca0c89a79cda1cc165abf633e69f98 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sun, 19 Feb 2017 17:59:24 +0100
> +Subject: [PATCH 1/1] CMake: Remove dependency on gmp and libintl from
> + FindPython.cmake

The commit title says what the patch is doing, but there is not commit
log that explains why. The why is even more important than the how.

[--SNIP--]
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index f94e2c7c2..d603bfc83 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
[--SNIP--]

> +	select BR2_PACKAGE_GMP

Weird that you have a patch that removes dependency on gmp, but at the
same time you add that dependency...

> @@ -233,19 +224,25 @@ config BR2_PACKAGE_KODI_LIBUSB
>  
>  config BR2_PACKAGE_KODI_LIBVA
>  	bool "va"
> +	depends on !BR2_PACKAGE_KODI_EGL_GLES
> +	depends on BR2_PACKAGE_XORG7

Is this change really related to the bump, or is it a fix? If the
latter, then it should be a separate patch.

>  config BR2_PACKAGE_KODI_LIBVDPAU
>  	bool "vdpau"
> +	depends on !BR2_PACKAGE_KODI_EGL_GLES

Ditto, is this really related to the bump?

> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index ebce84dad..357776779 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk

> +KODI_SUBDIR = project/cmake
> +
> +KODI_LIBDVDCSS_VERSION = 2f12236
> +KODI_LIBDVDNAV_VERSION = 981488f
> +KODI_LIBDVDREAD_VERSION = 17d99db
> +
> +KODI_EXTRA_DOWNLOADS = \
> +	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
> +
> +KODI_CONF_OPTS += \
> +	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
> +	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> +	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz

So does that mean that the libs are downloaded at build time?

If so, that's unfortnate, but I prefer this situation rather than the
big patching of the previous iteration.

> +
> +ifeq ($(BR2_aarch64),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=aarch64 -DWITH_CPU=aarch64
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
> +else ifeq ($(BR2_mips),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=mips -DWITH_CPU=mips
> +else ifeq ($(BR2_mips64el),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=mips64 -DWITH_CPU=mips64
> +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=powerpc64 -DWITH_CPU=powerpc64
> +else ifeq ($(BR2_i386),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=i486-linux -DWITH_CPU=$(BR2_GCC_TARGET_ARCH)
> +else ifeq ($(BR2_x86_64),y)
> +KODI_CONF_OPTS += -DWITH_ARCH=x86_64-linux -DWITH_CPU=x86_64
> +endif

So, except for i386, the ARCH and CPU are the same? We do have the
opportunity to set the actual CPU value.

For example, Kodi has at least a check of CPU against cortx-a53.

>  ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
> -KODI_CONF_OPTS += --enable-optical-drive --enable-dvdcss
> +KODI_CONF_OPTS += -DENABLE_OPTICAL=ON
>  else
> -KODI_CONF_OPTS += --disable-optical-drive --disable-dvdcss
> +KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
>  endif

Speaking of which, have you seen my other patch that restores the prompt
for supporrt of optical drives?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
