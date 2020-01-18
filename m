From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 23:03:58 +0100
Subject: [Buildroot] [PATCH v8 19/20] package/kodi-visualisation-*: mass
 version bump
In-Reply-To: <20200118200620.3967240-20-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-20-bernd.kuhls@t-online.de>
Message-ID: <20200118220358.GI32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-18 21:06 +0100, Bernd Kuhls spake thusly:
> Rebased
> package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch

You said "rebased" but you removed it altogether. It has however never
been upstreamed, AFAICS... Care to comment/explai, please?

Note: if onlt the commit log needes to be fixed, no need to respin the
series, I can fix locally before applying.

Thanks! :-)

Regards,
Yann E. MORIN.

> Added patch to fix cstddef include and license hash for
> kodi-visualisation-spectrum.
> 
> Visualisation repos were moved to the xbmc project:
> https://github.com/xbmc/repo-binary-addons/commit/38166cbdfa18d361e5b6009296a78c69a1172879
> https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-visualisation-fishbmc.hash           |  2 +-
>  .../kodi-visualisation-fishbmc.mk             |  4 +-
>  ...-also-search-for-egl-with-pkg-config.patch | 44 -------------------
>  .../kodi-visualisation-shadertoy.hash         |  2 +-
>  .../kodi-visualisation-shadertoy.mk           |  4 +-
>  ...Backport-Add-missing-cstddef-include.patch | 30 +++++++++++++
>  .../kodi-visualisation-spectrum.hash          |  3 +-
>  .../kodi-visualisation-spectrum.mk            |  4 +-
>  .../kodi-visualisation-waveform.hash          |  2 +-
>  .../kodi-visualisation-waveform.mk            |  4 +-
>  10 files changed, 43 insertions(+), 56 deletions(-)
>  delete mode 100644 package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
>  create mode 100644 package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
> 
> diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> index 21d80a31cb..cd4734eaab 100644
> --- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> +++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-4.1.0.tar.gz
> +sha256 8142fe4a32c0c113945c5fc9745e54639ca73308371d292e3422730bfad1d064  kodi-visualisation-fishbmc-5.1.2-Leia.tar.gz
> diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> index 8360660ef4..a89c559d26 100644
> --- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> +++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_FISHBMC_VERSION = 4.1.0
> -KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,v$(KODI_VISUALISATION_FISHBMC_VERSION))
> +KODI_VISUALISATION_FISHBMC_VERSION = 5.1.2-Leia
> +KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
>  KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
>  KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
> diff --git a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch b/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
> deleted file mode 100644
> index 8de96a6de3..0000000000
> --- a/package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-for-egl-with-pkg-config.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 9c428c3c9f120a11468f98546bcc754d2c3302af Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Thu, 30 Jul 2015 10:02:15 +0200
> -Subject: [PATCH] FindOpenGLES2: also search for egl with pkg-config
> -
> -The non-pkg-config path looks for both EGL *and* OpenGL ES, but not
> -the pkg-config path, which might lead to missing libraries/headers if
> -egl.pc has more header paths or libraries than glesv2.pc.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ----
> - CMakeLists.txt      | 2 +-
> - FindOpenGLES2.cmake | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 8b084cf..81bbe27 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -35,7 +35,7 @@
> -     endif()
> -   endif()
> - 
> --  include_directories(${OpenGL_INCLUDE_DIR}
> -+  include_directories(${OpenGL_INCLUDE_DIR} ${OpenGLES2_INCLUDE_DIRS}
> -                       ${KODI_INCLUDE_DIR}
> -                       ${p8-platform_INCLUDE_DIRS}
> -                       ${PROJECT_SOURCE_DIR}/lib/kissfft
> -diff --git a/FindOpenGLES2.cmake b/FindOpenGLES2.cmake
> -index e1b7d21..2a9ce0d 100644
> ---- a/FindOpenGLES2.cmake
> -+++ b/FindOpenGLES2.cmake
> -@@ -7,7 +7,7 @@
> - 
> - find_package(PkgConfig)
> - if(PKG_CONFIG_FOUND)
> --  pkg_check_modules(OpenGLES2 glesv2)
> -+  pkg_check_modules(OpenGLES2 glesv2 egl)
> - endif(PKG_CONFIG_FOUND)
> - 
> - if(NOT OPENGLES2_FOUND)
> --- 
> -2.5.0
> -
> diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
> index ae8c59ddb0..cf3e06daa7 100644
> --- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
> +++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-1.1.5.tar.gz
> +sha256 7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
> diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
> index a2b1b14d9f..b928e64d9b 100644
> --- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
> +++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_SHADERTOY_VERSION = 1.1.5
> -KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,v$(KODI_VISUALISATION_SHADERTOY_VERSION))
> +KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.3-Leia
> +KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
>  KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
>  KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
> diff --git a/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch b/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
> new file mode 100644
> index 0000000000..5b1bb0c47c
> --- /dev/null
> +++ b/package/kodi-visualisation-spectrum/0001-Backport-Add-missing-cstddef-include.patch
> @@ -0,0 +1,30 @@
> +From b2c54c1043c2396678005b578e85db30bdf5ccb9 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 18 Jan 2020 20:22:41 +0100
> +Subject: [PATCH] [Backport] Add missing cstddef include
> +
> +Backported from https://github.com/xbmc/visualization.spectrum/pull/37
> +
> +Patch sent upstream:
> +https://github.com/xbmc/visualization.spectrum/pull/38
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + src/opengl_spectrum.cpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/opengl_spectrum.cpp b/src/opengl_spectrum.cpp
> +index 05409ea..2441fd6 100644
> +--- a/src/opengl_spectrum.cpp
> ++++ b/src/opengl_spectrum.cpp
> +@@ -38,6 +38,7 @@
> + #include <string.h>
> + #include <math.h>
> + #include <stdint.h>
> ++#include <cstddef>
> + 
> + #include <glm/glm.hpp>
> + #include <glm/gtc/type_ptr.hpp>
> +-- 
> +2.20.1
> +
> diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> index 2d9ab0f3cf..4064184a75 100644
> --- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> +++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
> -sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-1.1.1.tar.gz
> +sha256 ec88defbb90fdb03f075abdba39c436906a8fbad8f034da3e3b31f75842206cc  kodi-visualisation-spectrum-3.0.2-Leia.tar.gz
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> index 016f405e40..c3d61c1ef4 100644
> --- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> +++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_SPECTRUM_VERSION = 1.1.1
> -KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
> +KODI_VISUALISATION_SPECTRUM_VERSION = 3.0.2-Leia
> +KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
>  KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
>  KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
> diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> index 271dc4a9e0..af6fd37a03 100644
> --- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> +++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-1.1.0.tar.gz
> +sha256 c5fbf48c2251b61d9abfcd679a750199f5efc78e63fded9a1482cfd9b41d0b5b  kodi-visualisation-waveform-3.1.1-Leia.tar.gz
> diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> index 13a621edb0..2d65df8538 100644
> --- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> +++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_WAVEFORM_VERSION = 1.1.0
> -KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,v$(KODI_VISUALISATION_WAVEFORM_VERSION))
> +KODI_VISUALISATION_WAVEFORM_VERSION = 3.1.1-Leia
> +KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
>  KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
>  KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
