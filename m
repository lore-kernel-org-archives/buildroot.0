From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Oct 2014 22:12:24 +0200
Subject: [Buildroot] [PATCH 04/31] ffmpeg: use the new BR2_ARM_CPU_ARM*
 options
In-Reply-To: <1413749285-1108-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54456CA8.7030304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 22:07, Thomas Petazzoni wrote:
> Instead of using the Config.in options for each individual ARM core,
> use the newly introduced BR2_ARM_CPU_ARM* options, which exist per ARM
> architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ffmpeg/ffmpeg.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 21ec1c9..a3865f3 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -277,15 +277,15 @@ endif
>  # Explicitly disable everything that doesn't match for ARM
>  # FFMPEG "autodetects" by compiling an extended instruction via AS
>  # This works on compilers that aren't built for generic by default
> -ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
> +ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV4T),y)
>  FFMPEG_CONF_OPTS += --disable-armv5te
>  endif
> -ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
> +ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK)$(BR2_ARM_CPU_ARMV7A),y)
>  FFMPEG_CONF_OPTS += --enable-armv6
>  else
>  FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
>  endif
> -ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
> +ifeq ($(BR2_ARM_CPU_ARMV6J)$(BR2_ARM_CPU_ARMV6ZK)$(BR2_ARM_CPU_ARMV7A),y)

 I think there was something wrong in the original, because arm1176jz-s doesn't
have VFP.

 Also, there's a bunch of Cortex-A variants that were added after this selection
was merged and they all have VFP.

 With that in mind, probably BR2_ARM_CPU_HAS_VFPV2 is more appropriate.


 Regards,
 Arnout


>  FFMPEG_CONF_OPTS += --enable-vfp
>  else
>  FFMPEG_CONF_OPTS += --disable-vfp
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
