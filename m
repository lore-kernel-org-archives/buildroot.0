From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Jun 2016 16:14:27 +0200
Subject: [Buildroot] [PATCH 4/4 v3] kodi: allow enablement of libamcodec
 as	codec if selected
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-4-daggs@gmx.com>
Message-ID: <37g24dxqbs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 24 Jun 2016 21:22:56 +0300 schrieb Dagg Stompler:

> +else ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> +KODI_DEPENDENCIES += libamcodec
> +KODI_CONF_OPTS += --enable-codec=amcodec

Hi,

using this defconfig

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LIBAMCODEC=y

$ grep -i unsafe .config
BR2_COMPILER_PARANOID_UNSAFE_PATH=y

compiling Kodi fails:

CPP     xbmc/cores/dvdplayer/DVDCodecs/Video/AMLCodec.o
arm-buildroot-linux-uclibcgnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '/usr/include/amcodec'

due to not compile-safe code used here:
https://github.com/xbmc/xbmc/blob/Jarvis/xbmc/cores/dvdplayer/DVDCodecs/Video/Makefile.in#L29

Regards, Bernd
