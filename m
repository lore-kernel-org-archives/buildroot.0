From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:23 +0100
Subject: [Buildroot] [PATCH v9 02/23] package/kodi: bump to version
 18.5-Leia
In-Reply-To: <20200119110735.1104443-3-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
 <20200119110735.1104443-3-bernd.kuhls@t-online.de>
Message-ID: <d2a6b010-4165-10d7-ce36-05056a17da44@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

 I'm applying to master (hopefully I'll be able to finish that) but I have a few
follow-up questions/requests.

On 19/01/2020 12:07, Bernd Kuhls wrote:
> Reworked raspberry pi handling, it is not treated as separate platform
> anymore.

 That's a nice cleanup from upstream!

> Added dependencies to autoreconf cpluff.

 You don't explain here, nore in the .mk file, while cpluff needs to be
autoreconf'ed.

> 
> Rebased patch
> - 0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> 
> Removed unneeded patch
> - 0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
> 
> Removed backported patches
> - 0003-cmake-iconv-is-a-required-dependency.patch
> - 0004-Fix-ffmpeg-build-for-mips.patch
> - kodi-texturepacker/0002-fix_reallocarray.patch

 You don't mention the added kodi-texturepacker/0002 patch.

 BTW, there's a patch 0001 remaining. Any chance of getting that upstream?

[snip]
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index db6931ed8a..f592e18e13 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -23,7 +23,9 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
>  	# List of valid CPUs can be found here:
>  	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
>  	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
> +	depends on BR2_ENABLE_LOCALE # libinput
>  	depends on BR2_PACKAGE_RPI_USERLAND
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput

 Maybe the two new dependencies warrant a comment? The arch dependency and the
rpi-userland dependency are kind of obvious, but these new ones aren't.

[snip]
> @@ -152,11 +155,6 @@ config BR2_PACKAGE_KODI_LCMS2
>  	help
>  	  Enable color management support.
>  
> -config BR2_PACKAGE_KODI_LIRC
> -	bool "lirc"
> -	help
> -	  Enable lirc support
> -

 This huge commit could have been made a bit more manageable by splitting off
the lirc, nonfree and libssh removal in separate commits.

 Also, when removing options, the commit message should specify why legacy
handling isn't needed. Actually in this case I believe it really *is* needed,
but I don't consider it important enough to block the merge.

>  config BR2_PACKAGE_KODI_LIBMICROHTTPD
>  	bool "web server"
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
> @@ -181,12 +179,6 @@ config BR2_PACKAGE_KODI_MYSQL
>  	help
>  	  Enable MySQL support
>  
> -config BR2_PACKAGE_KODI_NONFREE
> -	bool "nonfree components"
> -	help
> -	  Enable components with non-free licenses. This option
> -	  currently only controls support for RAR archives.
> -
>  choice
>  	prompt "platform"
>  	default BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
> @@ -194,6 +186,8 @@ choice
>  config BR2_PACKAGE_KODI_PLATFORM_RBPI
>  	bool "Raspberry Pi"
>  	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
> +	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBXKBCOMMON

 The comment I mentioned should come here.

>  
>  config BR2_PACKAGE_KODI_PLATFORM_X11_OPENGL
>  	bool "X11/OpenGL"
> @@ -229,12 +223,6 @@ config BR2_PACKAGE_KODI_LIBSMBCLIENT
>  	help
>  	  Enable Samba support
>  
> -config BR2_PACKAGE_KODI_LIBSSH
> -	bool "ssh"
> -	select BR2_PACKAGE_LIBSSH
> -	help
> -	  Enable sftp virtual filesystem using libssh.
> -
>  config BR2_PACKAGE_KODI_LIBTHEORA
>  	bool "theora"
>  	select BR2_PACKAGE_LIBTHEORA
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 2b2e5e64f9..cc248e537e 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,12 +1,11 @@
>  # Locally computed
> -sha256 c8312fe92e5bab1cdac1da93d60baed88fa1574146c50c44e3c86d01671c2b1d  kodi-17.6-Krypton.tar.gz
> +sha256 108979df8b41ab4168f5cdc0233f46e38767eda5921f4ccae16584e98d0d6b29  kodi-18.5-Leia.tar.gz
> +sha256 9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md

 Commit message should mention explicitly why the license hash changed.

>  # Locally computed - ffmpeg
> -sha256 7df8bce40765b39de5766ca9d08b5b9ac1f498c65c805c989461b907cee6b7c0  3.1.11-Krypton-17.5.tar.gz
> +sha256 e11e7594af35f36ab2711252c3d6bb106908f26605498aef4a9be2d7bc001db2  4.0.4-Leia-18.4.tar.gz
>  # Locally computed - libdvdcss
> -sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
> +sha256 d816ed421ca5b70319298bda7830cff475a77d446539c54cf6d576dd6c651cee  e646b950095589e74a2c08cf0c34b758c669aa75.tar.gz
>  # Locally computed - libdvdnav
> -sha256 312b3d15bc448d24e92f4b2e7248409525eccc4e75776026d805478e51c5ef3d  981488f.tar.gz
> +sha256 e50db40a823ddc795d1fe5f18db2517fb3e05fe0c4a88abf1578d95d7a1cce63  9277007ce2263b908e9ce3091cc31b3dd87c351c.tar.gz
>  # Locally computed - libdvdread
> -sha256 e7179b2054163652596a56301c9f025515cb08c6d6310b42b897c3ad11c0199b  17d99db.tar.gz
> -# Locally computed
> -sha256 89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
> +sha256 2d9d6d185dd25a983d6dfc2a00207cafdc396a969c227d5edd84b6215b2fba89  bd6b329f0137ab6a9f779a28dd96f04713735e17.tar.gz
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 9ea170ff6b..435f47cae8 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -6,18 +6,23 @@
>  
>  # When updating the version, please also update kodi-jsonschemabuilder
>  # and kodi-texturepacker
> -KODI_VERSION = 17.6-Krypton
> +KODI_VERSION = 18.5-Leia
>  KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
>  KODI_LICENSE = GPL-2.0
> -KODI_LICENSE_FILES = LICENSE.GPL
> +KODI_LICENSE_FILES = LICENSE.md
>  # needed for binary addons
>  KODI_INSTALL_STAGING = YES
> +# kodi recommends building out-of-source
> +KODI_SUPPORTS_IN_SOURCE_BUILD = NO
>  KODI_DEPENDENCIES = \
> -	bzip2 \
>  	expat \
> +	flatbuffers \
> +	fmt \
>  	fontconfig \
>  	freetype \
> +	fstrcmp \
>  	gnutls \
> +	host-flatbuffers \
>  	host-gawk \
>  	host-gettext \
>  	host-gperf \
> @@ -26,7 +31,6 @@ KODI_DEPENDENCIES = \
>  	host-nasm \
>  	host-swig \
>  	host-xmlstarlet \
> -	host-zip \
>  	libass \
>  	libcdio \
>  	libcrossguid \
> @@ -39,44 +43,53 @@ KODI_DEPENDENCIES = \
>  	openssl \
>  	pcre \
>  	python \
> +	rapidjson \
>  	sqlite \
>  	taglib \
>  	tinyxml \
> -	yajl \
>  	zlib
>  
> -KODI_SUBDIR = project/cmake
> -
>  # taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
> -KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
> +KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
>  KODI_EXTRA_DOWNLOADS += \
>  	https://github.com/xbmc/FFmpeg/archive/$(KODI_FFMPEG_VERSION).tar.gz

 I believe this could be improved a little by using github helper and a more
descriptive file name:

KODI_EXTRA_DOWNLOAD += \
	$(call
github,xbmc,FFmpeg,$(KODI_FFMPEG_VERSION))/kodi-ffmpeg-$(KODI_FFMPEG_VERSION).tar.gz

>  
> -KODI_LIBDVDCSS_VERSION = 2f12236
> -KODI_LIBDVDNAV_VERSION = 981488f
> -KODI_LIBDVDREAD_VERSION = 17d99db
> +# 1.4.2-Leia-Beta-5
> +KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75
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

 Instead of using autogen, it would be better to use AUTORECONF_HOOK (or
something resembling it because the directory it uses is not correct).

> +endef
> +KODI_PRE_CONFIGURE_HOOKS += KODI_CPLUFF_AUTOCONF
> +KODI_DEPENDENCIES += host-automake host-autoconf host-libtool



 Regards,
 Arnout

[snip]
