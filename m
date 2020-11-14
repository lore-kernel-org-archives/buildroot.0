From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Nov 2020 16:25:18 +0100
Subject: [Buildroot] [PATCH] package/piglit: Only support mesa and
 nvidia OpenGL provider
In-Reply-To: <20201114144554.1795422-1-romain.naour@gmail.com>
References: <20201114144554.1795422-1-romain.naour@gmail.com>
Message-ID: <20201114162518.2587e563@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Nov 2020 15:45:54 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Even if piglit could be used to test any OpenGl implementation, it's really a
> mesa's project because it follow closely the mesa implementation (API).
> 
> Other OpenGl vendor (binary blob) are quickly out of date and incompatible with
> piglit. Especially ARM OpenGl vendors such TI, Allwinner (sunxi) and rpi.
> 
> So introduce BR2_PACKAGE_PIGLIT_SUPPORTED_GL_PROVIDERS to list all supported
> OpenGL providers. For now only mesa and Nvidia are supported.
> 
> Fixes:
> [BR2_PACKAGE_PROVIDES_LIBEGL="sunxi-mali-mainline"]:
> http://autobuild.buildroot.net/results/76212834a3065c4c3d479a49a16297d4679098a0
> 
> [BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"]:
> http://autobuild.buildroot.net/results/2cb799919d47e57eb401b7ece00b65707f9bd3ec

I'm not sure this is the best way to handle this. Perhaps we need to
have a better handling of OpenGL/EGL versions.

Indeed, looking at the failures with sunxi-mali-mainline, the issue is
that some EGLDeviceEXT stuff is used. From a quick look, this seems to
be related to the EXT_device_base EGL extension, documented at
https://www.khronos.org/registry/EGL/extensions/EXT/EGL_EXT_device_base.txt,
and which appeared in EGL 1.5.

So perhaps we should instead have some logic that allows OpenGL and EGL
providers to also declare which version of the OpenGL/EGL spec they
provide, so that users can appropriate depend on OpenEGL and EGL
providers that are suitable ?

This is something I already intend to work on about libgbm: we need a
virtual package for libgbm, but not all OpenGL implementations provide
the same version of the libgbm API.

What do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
