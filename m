From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 1 Jul 2016 23:18:54 +0200
Subject: [Buildroot] [PATCH v3] supertuxkart: new package
In-Reply-To: <1465673942-840-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1465673942-840-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <325b82b7-7232-082d-30ce-88a433d51090@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

Le 11/06/2016 ? 21:39, Ezequiel Garcia a ?crit :
> Note that this package builds and bundles a number of libraries,
> such as GLEW and Irrlicht. We are not interested in doing
> non-upstreamable changes, so it is not desirable to modify
> this choice in any way.
> 
> In addition, Supertuxkart builds a version of the angelscript
> interpreter. If a compatible version of angelscript is installed
> on the system, it's possible to use it.

While trying to build supertuxkart with the cs x86 toolchain, the build fail
with the following error:

CImageLoaderJPG.cpp: In static member function 'static boolean
irr::video::CImageLoaderJPG::fill_input_buffer(j_decompress_ptr)':
CImageLoaderJPG.cpp:69:9: error: invalid conversion from 'int' to 'boolean'
[-fpermissive]

boolean CImageLoaderJPG::fill_input_buffer (j_decompress_ptr cinfo)
{
	// DO NOTHING
	return 1;
}

It seem a issue with libjpeg like this one [1].
If we change 1 by TRUE the build continue. Can you take a look ?

[1] http://permalink.gmane.org/gmane.comp.lib.fltk.bugs/10895

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> --
> Changes from v2:
>   * Reformat patch to git format
>   * Add sourceforge md5 and sha1 hashes
>   * Prevent building with musl toolchains
>   * Fix license to GPLv3+ and document about other licenses
>   * Add missing Config.in comments
>   * Re-wrap and order alphabetically package dependencies in .mk
>   * Explicitly enable USE_WIIUSE
> 
> Changes from v1:
>   * Made fribidi optional
>   * Made the bluez5_utils optional, which simplifies dependencies
>   * Disable Wii only if bluez5_utils is disabled
>   * Fixed dependencies inherited from OpenAL
>   * Added a patch to remove -I/usr/X11R6/include from bundled irrlicht-based engine
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
>  package/Config.in                                  |  1 +
>  ...001-Get-rid-of-unprefixed-irrlicht-cflags.patch | 31 ++++++++++++++
>  package/supertuxkart/Config.in                     | 34 +++++++++++++++
>  package/supertuxkart/supertuxkart.hash             |  5 +++
>  package/supertuxkart/supertuxkart.mk               | 48 ++++++++++++++++++++++
>  5 files changed, 119 insertions(+)
>  create mode 100644 package/supertuxkart/0001-Get-rid-of-unprefixed-irrlicht-cflags.patch
>  create mode 100644 package/supertuxkart/Config.in
>  create mode 100644 package/supertuxkart/supertuxkart.hash
>  create mode 100644 package/supertuxkart/supertuxkart.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9d668bf34f31..ec3dce5ace53 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -233,6 +233,7 @@ menu "Games"
>  	source "package/prboom/Config.in"
>  	source "package/rubix/Config.in"
>  	source "package/sl/Config.in"
> +	source "package/supertuxkart/Config.in"
>  endmenu
>  
>  menu "Graphic libraries and applications (graphic/text)"
> diff --git a/package/supertuxkart/0001-Get-rid-of-unprefixed-irrlicht-cflags.patch b/package/supertuxkart/0001-Get-rid-of-unprefixed-irrlicht-cflags.patch
> new file mode 100644
> index 000000000000..162b95e586ac
> --- /dev/null
> +++ b/package/supertuxkart/0001-Get-rid-of-unprefixed-irrlicht-cflags.patch
> @@ -0,0 +1,31 @@
> +From 61dce4cfced026a1680493ffe8b69204c6d461af Mon Sep 17 00:00:00 2001
> +From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> +Date: Thu, 9 Jun 2016 18:58:51 -0300
> +Subject: [PATCH] Get rid of unprefixed irrlicht cflags
> +
> +Cross-building requires proper include paths. This commit
> +removes the unprefixed -I/usr/X11R6/include in irrlicht cflags.
> +
> +Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

It would be great if this patch can be upstreamed :)

> +---
> + lib/irrlicht/CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/irrlicht/CMakeLists.txt b/lib/irrlicht/CMakeLists.txt
> +index 8fcd23c928d6..c97fdfed6e45 100644
> +--- a/lib/irrlicht/CMakeLists.txt
> ++++ b/lib/irrlicht/CMakeLists.txt
> +@@ -25,8 +25,8 @@ elseif(MINGW)
> +   add_definitions(-D_IRR_STATIC_LIB_)
> +   add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Shut up about unsafe stuff
> + else()
> +-  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
> +-  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
> ++  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
> ++  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
> + endif()
> + 
> + # Xrandr
> +-- 
> +2.7.0
> +
> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
> new file mode 100644
> index 000000000000..4ee8c4d57efe
> --- /dev/null
> +++ b/package/supertuxkart/Config.in
> @@ -0,0 +1,34 @@
> +config BR2_PACKAGE_SUPERTUXKART
> +	bool "supertuxkart"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_INSTALL_LIBSTDCPP # openal
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	select BR2_PACKAGE_JPEG

A package can't select a virtual package, see section "Notes on depending on a
virtual package" in [2].

[2] http://nightly.buildroot.org/manual.html#_infrastructure_for_virtual_packages

Other than that, this package looks ok.

Best regards,
Romain Naour

> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_LIBGLU
> +	select BR2_PACKAGE_LIBOGG
> +	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_OPENAL
> +	select BR2_PACKAGE_XLIB_LIBXRANDR
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
> +	  racer with multiple karts, tracks and modes you can play.
> +	  Beat the evil Nolok by any means necessary, and make the
> +	  mascot kingdom safe once again!
> +
> +	  http://supertuxkart.sourceforge.net/Main_Page
> +
> +comment "supertux needs X, an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_PACKAGE_HAS_LIBGL \
> +		|| BR2_TOOLCHAIN_USES_MUSL \
> +		|| !BR2_PACKAGE_XORG7
> diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
> new file mode 100644
> index 000000000000..ed4d0375618c
> --- /dev/null
> +++ b/package/supertuxkart/supertuxkart.hash
> @@ -0,0 +1,5 @@
> +# Locally computed
> +sha256	c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149  supertuxkart-0.9.1-src.tar.xz
> +# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.1/
> +sha1	2208405a3a0f2117caf6ae00c24debb611ad7d2e  supertuxkart-0.9.1-src.tar.xz
> +md5	5d87d943f2e746043aed87dc80004701  supertuxkart-0.9.1-src.tar.xz
> diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
> new file mode 100644
> index 000000000000..9106351bc2b7
> --- /dev/null
> +++ b/package/supertuxkart/supertuxkart.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# supertuxkart
> +#
> +################################################################################
> +
> +SUPERTUXKART_VERSION = 0.9.1
> +SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
> +SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
> +
> +# Supertuxkart itself is GPLv3+, but it bundles a few libraries with different
> +# licenses. Irrlicht, bullet and angelscript have zlib license, while glew is
> +# BSD-3c. Since they are linked statically, the result is GPLv3+.
> +SUPERTUXKART_LICENSE = GPLv3+
> +SUPERTUXKART_LICENSE_FILES = COPYING
> +
> +SUPERTUXKART_DEPENDENCIES += \
> +	jpeg \
> +	libcurl \
> +	libgl \
> +	libglu \
> +	libogg \
> +	libpng \
> +	libvorbis \
> +	openal \
> +	xlib_libXrandr \
> +	zlib
> +
> +# Since supertuxkart is not installing libstkirrlicht.so, and since it is
> +# the only user of the bundled libraries, turn off shared libraries entirely.
> +SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
> +
> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> +SUPERTUXKART_DEPENDENCIES += libfribidi
> +SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=ON
> +else
> +SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
> +SUPERTUXKART_DEPENDENCIES += bluez5_utils
> +SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON
> +else
> +# Wiimote support relies on bluez5.
> +SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
