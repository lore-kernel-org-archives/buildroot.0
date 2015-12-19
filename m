From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Dec 2015 00:28:30 +0100
Subject: [Buildroot] [PATCH v3] package/vsxu: new package
In-Reply-To: <1450547215-8524-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450547215-8524-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5675E81E.8010606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-12-15 18:46, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: only available on Intel platforms (Thomas)
>     - https://github.com/vovoid/vsxu/blob/glfw3/CMakeLists.txt#L93
>     - https://github.com/vovoid/vsxu/blob/glfw3/CMakeLists.txt#L95
>     - http://gpo.zugaina.org/media-video/vsxu/USE
>     - http://forum.kodi.tv/showthread.php?tid=114617&pid=1962960
>     updated 1st patch to detect execinfo.h (Thomas)
>     sent patches upstream
>     reworked cal3d handling, a cal3d package is not necessary anymore
>     (used code from Thomas: http://patchwork.ozlabs.org/patch/559204/)
> v2: added patch to make BR2_COMPILER_PARANOID_UNSAFE_PATH=y happy
[snip]
> +diff --git a/engine/include/debug/vsx_backtrace.h b/engine/include/debug/vsx_backtrace.h
> +index 0fbcf86..a83fdc4 100644
> +--- a/engine/include/debug/vsx_backtrace.h
> ++++ b/engine/include/debug/vsx_backtrace.h
> +@@ -7,7 +7,9 @@
> + 
> + #include <stdio.h>
> + #include <errno.h>
> ++#ifdef HAVE_EXECINFO
> + #include <execinfo.h>
> ++#endif
> + #include <unistd.h>
> + #include <string.h>
> + #include <malloc.h>
> +@@ -18,7 +20,7 @@ namespace vsx_backtrace
> + 
> + inline void full_write(int fd, const char *buf, size_t len)
> + {
> +-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
> ++#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) && defined(HAVE_EXECINFO)

 Most likely it's not necessary to keep the windows part of the condition,
because execinfo won't be defined on Windows, right? Well, unless you can
actually test on Windows, it's hard to be sure of... Something for upstream to
look at I guess. God I'm glad I don't have to worry about that kind of stuff :-)

> +   while (len > 0) {
> +   ssize_t ret = write(fd, buf, len);
> + 
> +@@ -34,7 +36,7 @@ inline void full_write(int fd, const char *buf, size_t len)
> + 
> + inline void print_backtrace(void)
> + {
> +-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
> ++#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) && defined(HAVE_EXECINFO)
> +   static const char start[] = "BACKTRACE ------------\n";
> +   static const char end[] = "----------------------\n";
> + 
> +-- 
> +2.6.4
> +
> diff --git a/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch b/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
> new file mode 100644
> index 0000000..f3fb885
> --- /dev/null
> +++ b/package/vsxu/0002-Do-not-use-host-paths-when-cross-compiling.patch
> @@ -0,0 +1,55 @@
> +From 927e98180736612bccebfa04e9b681dc92541b5e Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 19 Dec 2015 18:32:38 +0100
> +Subject: [PATCH 2/2] Do not use host paths when cross-compiling.
> +
> +Patch sent upstream: https://github.com/vovoid/vsxu/pull/171
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + plugins/src/render.text/CMakeLists.txt | 4 +++-
> + plugins/src/texture/CMakeLists.txt     | 6 +++++-
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/plugins/src/render.text/CMakeLists.txt b/plugins/src/render.text/CMakeLists.txt
> +index 38f3994..3f322eb 100644
> +--- a/plugins/src/render.text/CMakeLists.txt
> ++++ b/plugins/src/render.text/CMakeLists.txt
> +@@ -8,6 +8,8 @@ project (${module_id})
> + 
> + message("configuring vsxu module            " ${module_id})
> + 
> ++find_package(Freetype REQUIRED)

 This should definitly be inside a if(UNIX). Obviously for buildroot that
doesn't matter but for upstream it probably does.

> ++
> + # set defines for MOD_CM, MOD_DM, MOD_NM
> + CREATE_STATIC_GLUE(${module_id})
> + 
> +@@ -21,7 +23,7 @@ if(WIN32)
> + endif(WIN32)
> + 
> + if(UNIX)
> +-  include_directories(/usr/include/freetype2)
> ++  include_directories(${FREETYPE_INCLUDE_DIRS})
> + endif(UNIX)
> + 
> + # include common
> +diff --git a/plugins/src/texture/CMakeLists.txt b/plugins/src/texture/CMakeLists.txt
> +index e65ae9b..1c667e6 100644
> +--- a/plugins/src/texture/CMakeLists.txt
> ++++ b/plugins/src/texture/CMakeLists.txt
> +@@ -8,7 +8,11 @@ project (${module_id})
> + 
> + message("configuring vsxu module            " ${module_id})
> + 
> +-include_directories(/usr/include/OpenEXR)
> ++find_package(OpenEXR)
> ++
> ++if(OpenEXR_FOUND)
> ++  include_directories(${OPENEXR_INCLUDE_DIRS})
> ++endif(OpenEXR_FOUND)
> + 
> + # set defines for MOD_CM, MOD_DM, MOD_NM
> + CREATE_STATIC_GLUE(${module_id})

 I see there are several other packages that are searched for in /usr/include
from the extra modules in cmake/modules/. We have jack in buildroot, I don't
think we have the others, but won't this create problems if any of these are
installed in /usr/include? AFAIU, FIND_PATH will first look in the default
directories (which we make sure are the proper ones for cross-compilation), but
then continues to look at the specified hints, which includes /usr/include.

 If you'd like to test this, just create /usr/include/GL/glew.h and
/usr/lib/libglew.so and see if things go wrong somewhere.


> +-- 
> +2.6.4
> +
> diff --git a/package/vsxu/Config.in b/package/vsxu/Config.in
> new file mode 100644
> index 0000000..e8db892
> --- /dev/null
> +++ b/package/vsxu/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_VSXU
> +	bool "vsxu"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBGLEW
> +	select BR2_PACKAGE_LIBGLFW
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  VSXu (VSX Ultra) is an OpenGL-based (hardware-accelerated),
> +	  modular programming environment with its main purpose to
> +	  visualize music and create real time graphic effects.
> +
> +	  http://www.vsxu.com
> +
> +comment "vsxu depends on X.org and needs an OpenGL backend"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
> diff --git a/package/vsxu/vsxu.mk b/package/vsxu/vsxu.mk
> new file mode 100644
> index 0000000..73d9267
> --- /dev/null
> +++ b/package/vsxu/vsxu.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# vsxu
> +#
> +################################################################################
> +
> +# instead of using master branch we use branch glfw3
> +VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
> +VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
> +VSXU_CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
> +VSXU_CAL3D_SOURCE = cal3d-$(VSXU_CAL3D_VERSION).tar.gz
> +VSXU_EXTRA_DOWNLOADS = $(call github,vovoid,cal3d,$(VSXU_CAL3D_VERSION))/$(VSXU_CAL3D_SOURCE)
> +VSXU_LICENSE = GPLv3

 Only artiste_main.c is really GPLv3+, all the rest is GPLv2+ or LGPLv2.1+.
Also, the whole of cal3d is LGPLv2.1+. So I'd give it GPLv3+, LGPLv2.1+.


> +VSXU_LICENSE_FILES = COPYING

 and add COPYING.LESSER here.

> +VSXU_INSTALL_STAGING = YES
> +VSXU_DEPENDENCIES = freetype jpeg libgl libglew libglfw libglu \
> +	libpng zlib
> +
> +# cal3d is a git submodule
> +define VSXU_EXTRACT_CAL3D
> +	mkdir -p $(@D)/plugins/src/mesh.importers/cal3d
> +	$(call suitable-extractor,$(VSXU_CAL3D_SOURCE)) $(DL_DIR)/$(VSXU_CAL3D_SOURCE) | \
> +	 $(TAR) --strip-components=1 -C $(@D)/plugins/src/mesh.importers/cal3d $(TAR_OPTIONS) -
> +endef
> +VSXU_POST_EXTRACT_HOOKS += VSXU_EXTRACT_CAL3D
> +
> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +VSXU_DEPENDENCIES += alsa-lib
> +endif

 I guess there should be an optional dependency on jack and pulseaudio as well
(plugins/src/sound.rtaudio).

 Regards,
 Arnout

> +
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +VSXU_DEPENDENCIES += opencv
> +endif
> +
> +$(eval $(cmake-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
