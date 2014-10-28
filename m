From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 19:34:44 +0100
Subject: [Buildroot] [PATCH v4 1/1] glmark2: new package
In-Reply-To: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413580298-6255-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141028193444.72b79a2d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 17 Oct 2014 23:11:38 +0200, Bernd Kuhls wrote:
> From: Spenser Gilliland <spenser@gillilanding.com>
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for taking care of this package. However, it fails to build
here, with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GLMARK2=y
BR2_PACKAGE_RPI_USERLAND=y
BR2_PACKAGE_WAYLAND=y
# BR2_TARGET_ROOTFS_TAR is not set

Which gives the following error:

Setting top to                           : /home/thomas/projets/buildroot/output/build/glmark2-0005100d7221190720dc130605d07cbd56e83047 
Setting out to                           : /home/thomas/projets/buildroot/output/build/glmark2-0005100d7221190720dc130605d07cbd56e83047/build 
Checking for 'gcc' (c compiler)          : /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc 
Checking for 'g++' (c++ compiler)        : /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-g++ 
Checking for header stdlib.h             : yes 
Checking for header string.h             : yes 
Checking for header unistd.h             : yes 
Checking for header stdint.h             : yes 
Checking for header stdio.h              : yes 
Checking for header jpeglib.h            : yes 
Checking for library m                   : yes 
Checking for library jpeg                : yes 
Checking for function memset             : yes 
Checking for function sqrt               : yes 
Checking for program pkg-config          : /home/thomas/projets/buildroot/output/host/usr/bin/pkg-config 
Checking for 'libpng12' >= 1.2           : not found 
Checking for 'libpng15' >= 1.5           : not found 
Checking for 'libpng16' >= 1.6           : yes 
Checking for 'x11'                       : not found 
Checking for 'gl'                        : not found 
Checking for 'egl'                       : yes 
Checking for 'glesv2'                    : yes 
Checking for 'libdrm'                    : not found 
Checking for 'gbm'                       : not found 
Checking for 'mirclient'                 : not found 
Checking for 'wayland-client'            : yes 
Checking for 'wayland-egl'               : not found 
The configuration failed
(complete log in /home/thomas/projets/buildroot/output/build/glmark2-0005100d7221190720dc130605d07cbd56e83047/build/config.log)
make: *** [/home/thomas/projets/buildroot/output/build/glmark2-0005100d7221190720dc130605d07cbd56e83047/.stamp_configured] Erreur 1


> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND
> +
> +config BR2_PACKAGE_GLMARK2_GL
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND
> +
> +comment "glmark2 needs an OpenGL or an openGL ES and EGL backend with mesa3d, libX11 or wayland"
> +	depends on BR2_LARGEFILE
> +	depends on !BR2_PACKAGE_GLMARK2_GL && !BR2_PACKAGE_GLMARK2_EGL_GLES
> +
> +comment "glmark2 needs a toolchain w/ largefile"
> +	depends on !BR2_LARGEFILE
> +
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_GLMARK2_EGL_GLES || BR2_PACKAGE_GLMARK2_GL
> +	depends on BR2_PACKAGE_MESA3D || BR2_PACKAGE_XLIB_LIBX11 || BR2_PACKAGE_WAYLAND

Do we need this dependency since we already have either
BR2_PACKAGE_GLMARK2_EGL_GLES or BR2_PACKAGE_GLMARK2_GL ?

> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG
> +	help
> +	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
> +
> +	  https://github.com/glmark2/glmark2
> diff --git a/package/glmark2/glmark2-0001-libpng16.patch b/package/glmark2/glmark2-0001-libpng16.patch
> new file mode 100644
> index 0000000..05d4804
> --- /dev/null
> +++ b/package/glmark2/glmark2-0001-libpng16.patch
> @@ -0,0 +1,16 @@
> +glmark2: Add support for libpng16
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr glmark2-0005100d7221190720dc130605d07cbd56e83047.org/wscript glmark2-0005100d7221190720dc130605d07cbd56e83047/wscript
> +--- glmark2-0005100d7221190720dc130605d07cbd56e83047.org/wscript	2014-09-26 11:14:47.000000000 +0200
> ++++ glmark2-0005100d7221190720dc130605d07cbd56e83047/wscript	2014-10-17 19:40:16.011722310 +0200
> +@@ -94,7 +94,7 @@
> +                       uselib = uselib, mandatory = True)
> + 
> +     # Check for a supported version of libpng
> +-    supp_png_pkgs = (('libpng12', '1.2'), ('libpng15', '1.5'),)
> ++    supp_png_pkgs = (('libpng12', '1.2'), ('libpng15', '1.5'), ('libpng16', '1.6'),)
> +     have_png = False
> +     for (pkg, atleast) in supp_png_pkgs:
> +         try:

Great. Glad to see supporting a modern libpng is as simple as that. Can
you submit this patch upstream?

> +define GLMARK2_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_MAKE_ENV) $(GLMARK2_CONF_ENV) $(TARGET_CONFIGURE_OPTS) \
> +		./waf configure $(GLMARK2_CONF_OPTS)
> +endef
> +
> +define GLMARK2_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./waf
> +endef
> +
> +define GLMARK2_INSTALL_TARGET_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) ./waf install --destdir=$(TARGET_DIR)
> +endef

For several of other packages that use waf (example: jack2), we had to
add a dependency on host-python, because waf does not necessarily work
with Python 3. So if the Python provided by the host distribution is
too recent, waf will not work. Even though I hate to add too many host
dependencies, shouldn't we do the same here?

Can you look into those issues, and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
