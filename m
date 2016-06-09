From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:42:03 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: fix build when
 BR2_PACKAGE_LIBFSLVPUWRAP=y
In-Reply-To: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1463500440-25200-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20160609224203.599c50c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 17:54:00 +0200, S?bastien Szymanski wrote:
> Kodi now needs the following headers to sucessfully build on some i.MX
> platforms:
> 
> * ipu.h and mxcfb.h from the kernel
> * g2d.h from the imx-gpu-viv package
> 
> Add the missing dependencies.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> Note: I had to install .py files to test Kodi on my target (APF6D) with 
> BR2_PACKAGE_PYTHON_PY_PYC otherwise Kodi complained that it couldn't find 
> site.py and crashed at startup.

This is a known bug in Kodi, which nobody has investigated so far.

> 
>  package/kodi/Config.in | 1 +
>  package/kodi/kodi.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index ff2e75c..f27f6ed 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -58,6 +58,7 @@ menuconfig BR2_PACKAGE_KODI
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_FREETYPE
>  	select BR2_PACKAGE_GIFLIB
> +	select BR2_PACKAGE_IMX_GPU_VIV_G2D if BR2_PACKAGE_LIBFSLVPUWRAP

I would prefer this to be:

	select BR2_PACKAGE_IMX_GPU_VIV_G2D if BR2_PACKAGE_IMX_GPU_VIV

>  	select BR2_PACKAGE_JASPER
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBASS
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index e163c24..394b174 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -54,8 +54,10 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBFSLVPUWRAP),y)

Change this to:

ifeq ($(BR2_PACKAGE_IMX_GPU_VIV)$(BR2_PACKAGE_LIBFSLVPUWRAP),y)

> -KODI_DEPENDENCIES += libfslvpuwrap
> +# imx-lib needs access to imx-specific kernel headers

You're talking about imx-lib here, but it doesn't appear anywhere, so
this comment is confusing, and can be removed IMO.

> +KODI_DEPENDENCIES += imx-gpu-viv libfslvpuwrap linux

Remove linux from this line. libfslvpuwrap already depends on it, so
it's not really useful to have it.

>  KODI_CONF_OPTS += --enable-codec=imxvpu
> +KODI_CONF_ENV += INCLUDES="-idirafter $(LINUX_DIR)/include/uapi"

Maybe above this line:

# Kodi needs access to some specific kernel headers, which are
# Freescale specific and therefore not part of the toolchain, so we have
# to access directly the headers from the kernel sources

I think this way your patch would be a bit easier to understand.
Basically the logic is that as soon as libfslvpuwrap *and*  the
imx-gpu-viv packages are enabled, i.MX6 support in Kodi will be enabled.

Could you rework this, test that it works fine for you, and resubmit?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
