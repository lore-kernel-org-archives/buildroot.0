From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 May 2018 23:24:17 +0200
Subject: [Buildroot] [PATCH 3/3] weston: add weston-imx variant when
 using imx-gpu-viv
In-Reply-To: <20180516155201.10279-4-gary.bisson@boundarydevices.com>
References: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
 <20180516155201.10279-4-gary.bisson@boundarydevices.com>
Message-ID: <2d58cd37-effa-a5bf-5f9b-6d1e143062db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-05-18 17:52, Gary Bisson wrote:
> This variant contains various optimizations for i.MX processors.

 Argh, this is annoying...


> For instance, on i.MX6/7 devices with GPU, the gl-renderer needs to be
> enabled for the fbdev-backend which was removed from upstream weston
> long time ago.
> 
> Also, weston-imx adds support for G2D which is enabled by default, this
> patch makes sure to disable it when imx-gpu-g2d isn't selected.
> 
> The tag version rel_imx_4.9.51_8mq_ga proved to work fine on both
> i.MX6Q/DL and i.MX8MQ processors.
> 
> Here are the commands used to start weston on i.MX6Q:
> - Using 3D GPU (gl-renderer):
>  # weston --tty=1 --device=/dev/fb0
> - Using 2D GPU (G2D):
>  # weston --tty=1 --device=/dev/fb0 --use-g2d=1
> 
> Upstream repository:
> https://source.codeaurora.org/external/imx/weston-imx/
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/weston/weston.hash |  2 ++
>  package/weston/weston.mk   | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/package/weston/weston.hash b/package/weston/weston.hash
> index 55d87ac3b1..c854e66cea 100644
> --- a/package/weston/weston.hash
> +++ b/package/weston/weston.hash
> @@ -3,3 +3,5 @@ md5 33709aa4d5916f89643fca0fc0064b39  weston-4.0.0.tar.xz
>  sha1 df1da4a880920c515162e95b18f3709a46690be7  weston-4.0.0.tar.xz
>  sha256 a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58  weston-4.0.0.tar.xz
>  sha512 0af41016ff4eae85779f95b5c5e44b9683f4ef681a8e52256efeebfa38073082b83e039d0db3c94ac22f22f8d8314c9d6cd16611144b260b353fc5bfdd1ded19  weston-4.0.0.tar.xz
> +# locally computed
> +sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index efe12bc01e..1248e4a6ef 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -4,9 +4,16 @@
>  #
>  ################################################################################
>  
> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)

 It is not entirely impossible that people use Buildroot to generate a rootfs
that should be able to boot on several CPUs, in which case they may not want to
use the NXP fork of weston. So, I'd make an explicit Config.in option for this:

if BR2_PACKAGE_WESTON
config BR2_PACKAGE_WESTON_IMX
	bool "weston-imx"
	default y
	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
	help
	  On i.MX6/7/8 platforms, a fork of weston can be used that enables
	  various optimisations for this platform. Blah blah blah.

	  http://some-url-that-explains-it
endif

 But maybe I'm exaggerating.

> +WESTON_VERSION = rel_imx_4.9.51_8mq_ga
> +WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
> +WESTON_SITE_METHOD = git
> +WESTON_AUTORECONF = YES
> +else
>  WESTON_VERSION = 4.0.0
>  WESTON_SITE = http://wayland.freedesktop.org/releases
>  WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
> +endif
>  WESTON_LICENSE = MIT
>  WESTON_LICENSE_FILES = COPYING
>  
> @@ -50,6 +57,14 @@ else
>  WESTON_CONF_OPTS += --disable-weston-launch
>  endif
>  
> +ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
> +ifeq ($(BR2_PACKAGE_IMX_GPU_G2D),y)

WESTON_CONF_OPTS += --enable-imxg2d

 With that:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> +WESTON_DEPENDENCIES += imx-gpu-g2d
> +else
> +WESTON_CONF_OPTS += --disable-imxg2d
> +endif
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),y)
>  WESTON_CONF_OPTS += --enable-egl
>  WESTON_DEPENDENCIES += libegl
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
