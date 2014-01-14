From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jan 2014 18:10:16 +0100
Subject: [Buildroot] [PATCH v3 2/2] ffmpeg: Add sse4 related options
 BR2_X86_CPU_HAS_SSE4 / BR2_X86_CPU_HAS_SSE4
In-Reply-To: <BLU0-SMTP37762C5CD6B3E076E490852D9CB0@phx.gbl>
References: <1388685585-23467-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP37762C5CD6B3E076E490852D9CB0@phx.gbl>
Message-ID: <52D56F78.50304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/01/14 18:59, Bernd Kuhls wrote:
>
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
>   arch/Config.in.x86       |    4 ++++
>   package/ffmpeg/ffmpeg.mk |   14 +++++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index ce30605..15d5c16 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -9,6 +9,10 @@ config BR2_X86_CPU_HAS_SSE3
>   	bool
>   config BR2_X86_CPU_HAS_SSSE3
>   	bool
> +config BR2_X86_CPU_HAS_SSE4
> +	bool
> +config BR2_X86_CPU_HAS_SSE42
> +	bool

  Since nobody selects these symbols, this patch just adds dead code, right?

  Regards,
  Arnout

>
>   choice
>   	prompt "Target Architecture Variant"
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index ea7b20d..6b5060d 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -244,6 +244,18 @@ else
>   FFMPEG_CONF_OPT += --disable-ssse3
>   endif
>
> +ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
> +FFMPEG_CONF_OPT += --enable-sse4
> +else
> +FFMPEG_CONF_OPT += --disable-sse4
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
> +FFMPEG_CONF_OPT += --enable-sse42
> +else
> +FFMPEG_CONF_OPT += --disable-sse42
> +endif
> +
>   # Explicitly disable everything that doesn't match for ARM
>   # FFMPEG "autodetects" by compiling an extended instruction via AS
>   # This works on compilers that aren't built for generic by default
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
