From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 11 Feb 2015 15:06:02 +0100
Subject: [Buildroot] [PATCH 03/10 v7] package/mesa3d-headers: new package
In-Reply-To: <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <f37c4782a8b2fb8e9e41b92bf1f321a9a154c843.1423597914.git.yann.morin.1998@free.fr>
Message-ID: <20150211150602.7fbe2f38@nserafini-N550JK>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

I have done some build tests with the nvidia-tegra packages and opengl
support.

I was able to build QT5 with opengl without problem but I get errors
with QT4.

This is a known problem of QT4 with the inclusion of eglplatform.h
inside which there is an inclusion of X11 headers.
The result is that we have some conflicting #define. For me this can be
resolved by adding several #undef at the end of eglplatform.h.

Here is the end of my eglplatform.h header

 typedef khronos_int32_t EGLint;

 #undef None
 #undef KeyPress
 #undef KeyRelease
 #undef FocusIn
 #undef FocusOut
 #undef FontChange
 #undef CursorShape
 #undef Bool
 #undef Status
 #undef Unsorted
 #undef GrayScale
 #undef Expose
 
 #endif /* __eglplatform_h */



Best regards,

Nicolas


On Tue, 10 Feb 2015 21:01:10 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Some OpenGL/EGL/GLES/VG providers do not provide the corresponding
> headers, and rely on using "the headers provided by the distribution".
> 
> In our case, we can not rely on such headers, because we are not a
> distribution, and we have no way to provide those headers (not even
> speaking about relying on the headers provided by hte host
> distribution, because they might well not be installed at all).
> 
> Also, we can not rely on another package to provide those headers,
> because we can only have one provider enabled in any configuration.
> 
> The Khronos group provides such headers, and they are the reference
> headers, but we can not realy use them:
> 
>   - most of them are not packaged: they are not versioned and not
>     provided in a tarball, but as separately downloadable files;
> 
>   - those headers are anyway incomplete: there are headers not
> provided by Khronos, like GL.h
> 
> Instead, we rely on mesa3d to provide those headers: mesa3d has all
> the headers we need.
> 
> Modifying the existing mesa3d package would not be easy; we'd have to
> differentiate whther we need only the headers or the full package. The
> meas3d Config.in and .mk are already quite non-trivial that adding
> such a feature would render them even more illegible.
> 
> So, we introduce mea3d-headers as a new package, that is in fact just
> mesa3d with a much simplified Config.in and .mk, that other OpenXXX
> providers may select if they do not provide the OpenXXX headers.
> 
> Note: we're not installing GLES3 headers, because what Buildroot
> currently calls libgles is in fact libgles2; we have no way to specify
> that we have libgles3. So, we just install headers for GLES and GLES2.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Notes:
> 
> It should not be possible to select both mesa3d *and* mesa3d-headers
> at the same time, but it is difficult to foresee the multiple
> combinations we may have, due to poor understanding on how binary
> drivers may behave and what they may require, as well as my own poor
> understanding of the GL stack(s).
> 
> So I decided to just print a warning in that case, and just depend on
> mesa3d, which would ultimately provide the headers we are interested
> in anyway. This can be turned into an error if preferred.
> ---
>  package/Config.in                          |  1 +
>  package/mesa3d-headers/Config.in           |  8 ++++
>  package/mesa3d-headers/mesa3d-headers.hash |  1 +
>  package/mesa3d-headers/mesa3d-headers.mk   | 60
> ++++++++++++++++++++++++++++++
> package/mesa3d/mesa3d.mk                   |  1 + 5 files changed, 71
> insertions(+) create mode 100644 package/mesa3d-headers/Config.in
>  create mode 120000 package/mesa3d-headers/mesa3d-headers.hash
>  create mode 100644 package/mesa3d-headers/mesa3d-headers.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 757237e..f25886a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -211,6 +211,7 @@ endif
>  	source "package/linux-fusion/Config.in"
>  	source "package/lite/Config.in"
>  	source "package/mesa3d/Config.in"
> +	source "package/mesa3d-headers/Config.in"
>  	source "package/ocrad/Config.in"
>  	source "package/psplash/Config.in"
>  	source "package/sawman/Config.in"
> diff --git a/package/mesa3d-headers/Config.in
> b/package/mesa3d-headers/Config.in new file mode 100644
> index 0000000..a64fc0c
> --- /dev/null
> +++ b/package/mesa3d-headers/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MESA3D_HEADERS
> +	bool
> +	help
> +	  Mesa 3D, an open-source implementation of the OpenGL
> specification. +
> +	  This package only installs headers needed by other
> packages. +
> +	  http://mesa3d.org
> diff --git a/package/mesa3d-headers/mesa3d-headers.hash
> b/package/mesa3d-headers/mesa3d-headers.hash new file mode 120000
> index 0000000..137d0be
> --- /dev/null
> +++ b/package/mesa3d-headers/mesa3d-headers.hash
> @@ -0,0 +1 @@
> +../mesa3d/mesa3d.hash
> \ No newline at end of file
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk
> b/package/mesa3d-headers/mesa3d-headers.mk new file mode 100644
> index 0000000..acfc9a3
> --- /dev/null
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -0,0 +1,60 @@
> +################################################################################
> +#
> +# mesa3d-headers
> +#
> +################################################################################
> +
> +# mesa3d-headers is inherently incompatible with mesa3d, so if mesa3d
> +# is enabled, just rely on it.
> +
> +ifeq ($(BR2_PACKAGE_MESA3D),y)
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_HEADERS),y)
> +$(warning mesa3d-headers enabled, but mesa3d enabled too)
> +endif
> +
> +MESA3D_HEADERS_SOURCE =
> +MESA3D_HEADERS_DEPENDENCIES = mesa3d
> +
> +else # mesa3d
> +
> +# Not possible to directly refer to mesa3d variables, because of
> first/second +# expansion trickery...
> +MESA3D_HEADERS_VERSION = 10.4.4
> +MESA3D_HEADERS_SOURCE = MesaLib-$(MESA3D_HEADERS_VERSION).tar.bz2
> +MESA3D_HEADERS_SITE =
> ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
> +MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
> +MESA3D_HEADERS_LICENSE_FILES = docs/license.html +
> +# Only installs header files
> +MESA3D_HEADERS_INSTALL_STAGING = YES
> +MESA3D_HEADERS_INSTALL_TARGET = NO
> +
> +MESA3D_HEADERS_DIRS = KHR
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +MESA3D_HEADERS_DIRS += GL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +MESA3D_HEADERS_DIRS += EGL
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +MESA3D_HEADERS_DIRS += GLES GLES2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
> +MESA3D_HEADERS_DIRS += VG
> +endif
> +
> +define MESA3D_HEADERS_INSTALL_STAGING_CMDS
> +	$(foreach d,$(MESA3D_HEADERS_DIRS),\
> +		for h in $(@D)/include/$(d)/*.h; do \
> +			$(INSTALL) -D -m 0644 $${h}
> $(STAGING_DIR)/usr/include/$(d)/$$(basename $${h}) || exit 1; \
> +		done$(sep))
> +endef
> +
> +endif # !mesa3d
> +
> +$(eval $(generic-package))
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index eb38a9a..ca98524 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -4,6 +4,7 @@
>  #
>  ################################################################################
>  
> +# When updating the version, please also update mesa3d-headers
>  MESA3D_VERSION = 10.4.4
>  MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
>  MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)



-- 
Nicolas Serafini
R&D Embedded Software Engineer

www.sensefly.com
Route de Gen?ve 38
1033 Cheseaux-Lausanne
Switzerland
