From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 20:38:23 +0200
Subject: [Buildroot] [PATCH v2 6/7] glmark2: new package
In-Reply-To: <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
Message-ID: <20130908203823.57dd24bf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu,  5 Sep 2013 23:25:20 -0500, Spenser Gilliland wrote:

> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> new file mode 100644
> index 0000000..6dd7833
> --- /dev/null
> +++ b/package/glmark2/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_GLMARK2
> +	bool "glmark2"
> +	depends on BR2_PACKAGE_MESA3D
> +	depends on BR2_PACKAGE_MESA3D_GBM # depends on udev cannot select

Amazing that we need udev to do an OpenGL benchmark these days. But
indeed, the GBM code in Mesa3d needs the libudev library.

> +	depends on BR2_LARGEFILE
> +	depends on BR2_PACKAGE_HAS_OPENGL || \
> +		(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_LIBPNG12
> +	help
> +	  glmark2 is a benchmark for OpenGL (ES) 2.0. It uses only the subset of the
> +	  OpenGL 2.0 API that is compatible with OpenGL ES 2.0.
> +
> +comment "glmark2 requires an OpenGL implementation and mesa3D to be enabled"
> +	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES \
> +		|| !BR2_PACKAGE_XORG7

We probably need more comments in here: about largefile, and about Mesa
GBM. But maybe mentioning the need for OpenGL isn't really needed: an
user willing to use glmark2 will most likely be aware that OpenGL
support is needed.

So:

comment "glmark2 requires Mesa3D GBM support, and largefile support in toolchain"
	depends on (BR2_PACKAGE_HAS_OPENGL || BR2_PACKAGE_HAS_OPENGL_ES) && (!BR2_LARGEFILE || !BR2_MESA3D_GBM)

(to be verified).

> diff --git a/package/glmark2/glmark2-add-mali-support.patch b/package/glmark2/glmark2-add-mali-support.patch
> new file mode 100644
> index 0000000..c37c88c
> --- /dev/null
> +++ b/package/glmark2/glmark2-add-mali-support.patch
> @@ -0,0 +1,102 @@
> +Mali uses a slightly different windowing structure than most
> +implementations add support through this patch.
> +
> +Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>

Have you tried submitting those patches upstream?

> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> new file mode 100644
> index 0000000..b36eaf9
> --- /dev/null
> +++ b/package/glmark2/glmark2.mk
> @@ -0,0 +1,69 @@
> +################################################################################
> +#
> +# glmark2
> +#
> +################################################################################
> +
> +GLMARK2_VERSION = 279
> +GLMARK2_SITE = http://bazaar.launchpad.net/~laanwj/glmark2/fbdev

So you're not using the main branch of glmark2, but this separate fbdev
branch. Correct? I suppose what it adds is the ability to use glmark2
on non-X.org platforms. Do you have an idea on whether this branch is
likely to be merged in the trunk of glmark2?

> +GLMARK2_SITE_METHOD = bzr
> +GLMARK2_SOURCE = glmark2-$(GLMARK2_VERSION).tar.gz
> +GLMARK2_LICENSE = GPLv3+ SGIv1
> +GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> +
> +GLMARK2_DEPENDENCIES = jpeg libpng12 mesa3d host-python host-pkgconf

I've seen the libpng12 issue being discussed in
https://bugs.launchpad.net/glmark2/+bug/1166506. Some users apparently
tested successfully with libpng 1.5.

Also, do we really need host-python? Python is part of the mandatory
dependencies of Buildroot, so if Python is only needed to get waf
running, then host-python is not needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
