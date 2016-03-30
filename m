From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Mar 2016 21:43:23 +0200
Subject: [Buildroot] [PATCH] gst1-libav: pass --cpu config option to
 bundled ffmpeg
In-Reply-To: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459358152-21729-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56FC2C5B.4020609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/30/16 19:15, Gustavo Zacarias wrote:
> Like the proper ffmpeg package does, fixes:
> http://autobuild.buildroot.net/results/a46/a462dae8df2450bc0f72cbed6125e106454bde0f/

  So, you didn't need to pass --sysroot for Sourcery toolchains, like I had to 
in my v2 of this patch [1]? (I've marked [1] as Superseded now. Probably if my 
commit log would have been a little terser, it would already have been applied :-)

  Regards,
  Arnout

[1] http://patchwork.ozlabs.org/patch/589657/

>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/gstreamer1/gst1-libav/gst1-libav.mk | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
> index 496190e..8f892d0 100644
> --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
> @@ -7,9 +7,7 @@
>   GST1_LIBAV_VERSION = 1.8.0
>   GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
>   GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
> -
>   GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
> -
>   GST1_LIBAV_CONF_EXTRA_OPTS = --cross-prefix=$(TARGET_CROSS) --target-os=linux
>
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
> @@ -26,6 +24,13 @@ else
>   GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
>   endif
>
> +# Generic CPU setup for bundled ffmpeg
> +ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
> +GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
> +else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
> +GST1_LIBAV_CONF_EXTRA_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
> +endif
> +
>   ifeq ($(BR2_X86_CPU_HAS_MMX),y)
>   GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
>   GST1_LIBAV_DEPENDENCIES += host-yasm
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
