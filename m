From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 18:20:34 +0100
Subject: [Buildroot] [PATCH 2/3] alsa-lib: Force arm mode instead of
 Thumb1 mode
In-Reply-To: <1421753079-27665-2-git-send-email-richard.genoud@gmail.com>
References: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
 <1421753079-27665-2-git-send-email-richard.genoud@gmail.com>
Message-ID: <54CFB1E2.4010809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/01/15 12:24, Richard Genoud wrote:
> alsa-lib has some assembly that doesn't exist in thumb1 mode.
> So, force arm mode for alsa-lib.
>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

However, I can't find the assembly that you refer to. And of course
this problem only becomes apparent at runtime.


 Regards,
 Arnout

> ---
>  package/alsa-lib/alsa-lib.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index 16d184ea0e80..1740cc6728c6 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -54,6 +54,13 @@ ifeq ($(BR2_avr32),y)
>  ALSA_LIB_CFLAGS += -DAVR32_INLINE_BUG
>  endif
>  
> +# alsa-lib has some assembly function that are not present in thumb1 mode.
> +# so, we desactivate thumb mode
> +# (would be better to fix alsa-lib)
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +ALSA_LIB_CFLAGS += -marm
> +endif
> +
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
>  ALSA_LIB_CONF_OPTS += \
>  	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
