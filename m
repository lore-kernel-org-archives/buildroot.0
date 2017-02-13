From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:31:17 +0100
Subject: [Buildroot] [PATCH v2] kmscube: Add new package
In-Reply-To: <1487011784-24966-1-git-send-email-festevam@gmail.com>
References: <1487011784-24966-1-git-send-email-festevam@gmail.com>
Message-ID: <20170213223117.0125c14e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 16:49:44 -0200, Fabio Estevam wrote:
> Add support for kmscube application, which is helpful for testing
> kms/drm drivers.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks for this patch. I have a few comments, see below.

> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> new file mode 100644
> index 0000000..b3c3c8d
> --- /dev/null
> +++ b/package/kmscube/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_KMSCUBE
> +	bool "kmscube"
> +	depends on BR2_PACKAGE_MESA3D && BR2_PACKAGE_LIBDRM

kmscube apparently wants EGL and OpenGL ES:

PKG_CHECK_MODULES(EGL, egl)
PKG_CHECK_MODULES(GLES2, glesv2)

so probably this needs to be taken into account here by using the
BR2_PACKAGE_MESA3D_OPENGL_EGL and BR2_PACKAGE_MESA3D_OPENGL_ES symbols.

> +	help
> +	  kmscube is an application to test kms/drm drivers.  

Trailing space at the end of the line + missing upstream project URL.

> diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
> new file mode 100644
> index 0000000..267fffa
> --- /dev/null
> +++ b/package/kmscube/kmscube.mk
> @@ -0,0 +1,14 @@

Missing usual comment header.

> +KMSCUBE_VERSION = 8c6a20901f95e1b465bbca127f9d47fcfb8762e6
> +KMSCUBE_SITE = $(call github,robclark,kmscube,$(KMSCUBE_VERSION))
> +KMSCUBE_DEPENDENCIES = host-pkgconf libdrm mesa3d
> +KMSCUBE_INSTALL_TARGET = YES

This is useless, as it is the default.

> +KMSCUBE_AUTORECONF = YES
> +KMSCUBE_INSTALL_STAGING = Y

This line doesn't do anything because 'Y' is not a valid value. And
anyway, there's most likely no point in installing kmscube to staging.

License information is also missing, and you forgot to add yourself to
the DEVELOPERS file (should be done in the same patch).

Could you address those issues and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
