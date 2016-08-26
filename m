From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 21:46:28 +0200
Subject: [Buildroot] [PATCH/next v5 2/6] package/ffmpeg: default to
 --cpu=generic for MIPS architecture
In-Reply-To: <1471273421-12076-2-git-send-email-bernd.kuhls@t-online.de>
References: <1471273421-12076-1-git-send-email-bernd.kuhls@t-online.de>
 <1471273421-12076-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160826214628.78298b65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Aug 2016 17:03:37 +0200, Bernd Kuhls wrote:

> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index a816cea..154a091 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -455,6 +455,11 @@ else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
>  FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
>  endif
>  
> +# Default to --cpu=generic for MIPS architecture
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +FFMPEG_CONF_OPTS += --cpu=generic
> +endif

The conditionals above were already adding a --cpu option. Even though
the last option probably wins, it isn't that nice, so I've changed the
code to:

# Default to --cpu=generic for MIPS architecture, in order to avoid a
# warning from ffmpeg's configure script.
ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
FFMPEG_CONF_OPTS += --cpu=generic
else ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
endif

However, the configure script makes it pretty clear that not all
BR2_GCC_TARGET_{CPU,ARCH} values might be valid, so maybe this is
something we should revisit at some point.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
