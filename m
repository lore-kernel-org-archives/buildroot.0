From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 23:03:39 +0200
Subject: [Buildroot] [PATCH v6 09/25] package/kodi: bump to version
 18.4-Leia
In-Reply-To: <20190921192826.10143-10-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-10-bernd.kuhls@t-online.de>
Message-ID: <c40f0485-9441-c34f-ea65-c7f256f3f8ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 21:28, Bernd Kuhls wrote:
> Reworked raspberry pi handling, it is not treated as separate platform
> anymore.
> 
> Removed backported patches
> - 0003-cmake-iconv-is-a-required-dependency.patch
> - kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
> 
> Rebased patches
> - 0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> - 0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch

 Is there no chance of upstreaming these?

> 
> Updated dependencies
> - fmt (upstream PR 11039)
> - yajl was replaced by RapidJSON (upstream PR 8008)
> - internal rar support was removed (upstream PR 11912)
>   CMake option ENABLE_NONFREE was also removed
> - internal sftp support was removed (upstream PR 12005)
> - host-zip was removed (upstream PR 12643)
> - bzip2 is not used anymore
> - CMake option ENABLE_OPENSSL was removed (upstream PR 13650)
> - lirc support is now provided by lirc-tools (upstream PR 13761)
> - IMX support was removed (upstream PR 12990)
> - ENABLE_X11 was renamed to -DCORE_PLATFORM_NAME=x11 (upstream PR 12134)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-jsonschemabuilder.mk                 |   4 +-
>  ...-fix-texture-packer-cmake-source-dir.patch |  14 ++
>  .../0002-fix_reallocarray.patch               | 170 ------------------
>  .../kodi-texturepacker/kodi-texturepacker.mk  |   7 +-
>  ...e-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |   4 +-
>  ...endency-on-gmp-and-libintl-from-Find.patch |   4 +-
>  ...h => 0003-Fix-crosscompiling-issues.patch} |  29 ++-
>  ...cmake-iconv-is-a-required-dependency.patch |  92 ----------
>  .../kodi/0004-Fix-ffmpeg-build-for-mips.patch |  43 -----
>  package/kodi/Config.in                        |  26 +--
>  package/kodi/kodi.hash                        |  11 +-
>  package/kodi/kodi.mk                          |  79 ++++----
>  12 files changed, 79 insertions(+), 404 deletions(-)
>  create mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
>  delete mode 100644 package/kodi-texturepacker/0002-fix_reallocarray.patch
>  rename package/kodi/{0005-Fix-crosscompiling-issues.patch => 0003-Fix-crosscompiling-issues.patch} (86%)
>  delete mode 100644 package/kodi/0003-cmake-iconv-is-a-required-dependency.patch
>  delete mode 100644 package/kodi/0004-Fix-ffmpeg-build-for-mips.patch

 Kodi and texturepacker are bumped in a single patch, but all the rest is bumped
separately. What is the reasoning behind that? I mean, do the old plugins still
work with the new kodi?

> 
> diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> index fcf4888a9c..072875c4cc 100644
> --- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> +++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
> @@ -6,11 +6,11 @@
>  
>  # Not possible to directly refer to kodi variables, because of
>  # first/second expansion trickery...
> -KODI_JSONSCHEMABUILDER_VERSION = 17.6-Krypton
> +KODI_JSONSCHEMABUILDER_VERSION = 18.4-Leia
>  KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
>  KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
>  KODI_JSONSCHEMABUILDER_LICENSE = GPL-2.0
> -KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.GPL
> +KODI_JSONSCHEMABUILDER_LICENSE_FILES = LICENSE.md
>  HOST_KODI_JSONSCHEMABUILDER_SUBDIR = tools/depends/native/JsonSchemaBuilder
>  
>  HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
> diff --git a/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
> new file mode 100644
> index 0000000000..aed0a9d592
> --- /dev/null
> +++ b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch
> @@ -0,0 +1,14 @@
> +Downloaded from
> +https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/mediacenter/kodi/patches/kodi-100.25-hack-fix-texture-packer-cmake-source-dir.patch

 A slightly better commit message would help. Like, why is this needed?

> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -Naur a/tools/depends/native/TexturePacker/CMakeLists.txt b/tools/depends/native/TexturePacker/CMakeLists.txt
> +--- a/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:28.593185862 +0000
> ++++ b/tools/depends/native/TexturePacker/CMakeLists.txt	2016-12-23 17:10:39.469253011 +0000
> +@@ -1,3 +1,5 @@
> ++set(CMAKE_SOURCE_DIR ${CMAKE_SOURCE_DIR}/../../../..)
> ++
> + list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules)
> + 
> + if(APPLE)

[snip]

>  # taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
> -KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
> +KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
>  KODI_EXTRA_DOWNLOADS += \
>  	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz

 Not for this patch, but: it would be nice to use github helper here, and add a
filename.

 Actually, we might want to add a second github helper that does the full name, e.g.

github-full = $(call github,$(1),$(2),$(3))/$(4)-$(3).tar.gz

>  
> -KODI_LIBDVDCSS_VERSION = 2f12236
> -KODI_LIBDVDNAV_VERSION = 981488f
> -KODI_LIBDVDREAD_VERSION = 17d99db
> +# 1.4.2-Leia-Beta-5
> +KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75

 So, why not use the tag? Seems much more descriptive than a random commit...

> +# 6.0.0-Leia-Alpha-3
> +KODI_LIBDVDNAV_VERSION = 9277007ce2263b908e9ce3091cc31b3dd87c351c
> +# 6.0.0-Leia-Alpha-3
> +KODI_LIBDVDREAD_VERSION = bd6b329f0137ab6a9f779a28dd96f04713735e17
>  KODI_EXTRA_DOWNLOADS += \
>  	https://github.com/xbmc/libdvdcss/archive/$(KODI_LIBDVDCSS_VERSION).tar.gz \
>  	https://github.com/xbmc/libdvdnav/archive/$(KODI_LIBDVDNAV_VERSION).tar.gz \
>  	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
>  
> +define KODI_CPLUFF_AUTOCONF
> +	cd $(KODI_SRCDIR)/lib/cpluff && ./autogen.sh

 Assuming this indeed does an autconf/automake, you should add the corresponding
dependencies. They are of course implied by a number of existing dependencies
that do an AUTORECONF, but it's better to be explicit here :-) Maybe even put
those dependencies here, rather than together with the rest of the dependencies,
to make it clear that it goes together with the autogen.

> +endef
> +KODI_PRE_CONFIGURE_HOOKS += KODI_CPLUFF_AUTOCONF
> +
>  KODI_CONF_OPTS += \
>  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
>  	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
> +	-DENABLE_APP_AUTONAME=OFF \
>  	-DENABLE_CCACHE=OFF \
>  	-DENABLE_DVDCSS=ON \
>  	-DENABLE_INTERNAL_CROSSGUID=OFF \
>  	-DENABLE_INTERNAL_FFMPEG=ON \
> +	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
>  	-DFFMPEG_URL=$(KODI_DL_DIR)/$(KODI_FFMPEG_VERSION).tar.gz \
>  	-DKODI_DEPENDSBUILD=OFF \
> -	-DENABLE_OPENSSL=ON \
> +	-DENABLE_LDGOLD=OFF \
>  	-DNATIVEPREFIX=$(HOST_DIR) \
>  	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
> +	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
>  	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
>  	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
>  	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
> -	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz \
> -	-DENABLE_IMX=OFF
> +	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
>  
>  ifeq ($(BR2_ENABLE_LOCALE),)
>  KODI_DEPENDENCIES += libiconv
> @@ -88,8 +100,7 @@ ifeq ($(BR2_PACKAGE_KODI_PLATFORM_RBPI),y)
>  ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
>  KODI_CONF_OPTS += -DWITH_CPU="$(GCC_TARGET_CPU)"
>  endif
> -else
> -ifeq ($(BR2_arceb)$(BR2_arcle),y)
> +else ifeq ($(BR2_arceb)$(BR2_arcle),y)

 Unrelated change but OK.

>  KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
>  else ifeq ($(BR2_armeb),y)
>  KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
> @@ -108,7 +119,6 @@ else
>  # see project/cmake/scripts/linux/ArchSetup.cmake
>  KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
>  endif
> -endif
[snip]
> @@ -317,9 +300,7 @@ KODI_CONF_OPTS += -DENABLE_LCMS2=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
> -KODI_CONF_OPTS += -DENABLE_LIRC=ON
> -else
> -KODI_CONF_OPTS += -DENABLE_LIRC=OFF
> +KODI_DEPENDENCIES += lirc-tools

 Is there no longer an enable/disable for this? In that case, the condition
should change to BR2_PACKAGE_LIRC_TOOLS instead of BR2_PACKAGE_KODI_LIRC,
otherwise it still depends on random build order whether it's built with lirc
support or not if the option is not given.

 Regards,
 Arnout

>  endif
>  
>  ifeq ($(BR2_PACKAGE_KODI_LIBTHEORA),y)
> 
