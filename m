From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2017 11:04:36 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
 the various providers
In-Reply-To: <20684119.X7ZmMtA3r5@sagittae>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
 <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
 <20684119.X7ZmMtA3r5@sagittae>
Message-ID: <20170217110436.0366d6f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 09:34:38 +0100, J?r?me Pouiller wrote:

> On Thursday 16 February 2017 18:46:10 CET Arnout Vandecappelle wrote:
> > 
> > On 14-02-17 22:13, Yann E. MORIN wrote:  
> > > Some GL providers will provide libegl and libgles, but not libgl, while
> > > other will provide libgl but not libegl not libgles. This can be the
> > > case with:
> > >   - mesa3d       -> libgl
> > >   - rpi-userland -> libegl and libgles  
> 
> Unfortunately, as far as I remember, this kind of configuration is
> necessary to build xdriver_xf86-video-imx-viv. Mesa is necessary to
> build GLX support but, EGL/GLes have to be provided by imx-gpu-viv.

Nope, it's not actually needed. Even with xdriver_xf86-video-imx-viv,
the OpenGL provider is imx-gpu-viv, as it's ultimately the one that
provides libGL.so.

However, it is true that imx-gpu-viv is a special case as it provides a
libGL.so that itself uses libraries provided by Mesa.

So the hack I've done so far is:

-	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_HAS_LIBGL if BR2_PACKAGE_XORG7 && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11

and:

-	default "mesa3d" if BR2_PACKAGE_XORG7
+	default "mesa3d" if BR2_PACKAGE_XORG7 && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 
This is a quick hack, but it allows mesa3d to *NOT* be seen as an
OpenGL provider if imx-gpu-viv X11 support is enabled.

So I still think the rule should be: we support only one OpenGL
provider. And the rest should be solved by exposing mesa3d as an OpenGL
provider or not depending on Config.in options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
