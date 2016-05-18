From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 21:52:24 +0200
Subject: [Buildroot] [PATCH v2] Config.in: add -Og option
In-Reply-To: <1463442955-8178-1-git-send-email-martin@surround.io>
References: <1463442955-8178-1-git-send-email-martin@surround.io>
Message-ID: <7e07c970-b00e-f605-7192-3152d53885e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/17/16 01:55, Martin Kelly wrote:
> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
> which can be useful for when you want optimized code that is nonetheless
> debuggable.
>
> Signed-off-by: Martin Kelly <martin@surround.io>
> ---
> Changes based on feedback:
> - select --> depends on
> - Reworded help text
> - Wrapped text to 72 lines

  Well, actually you didn't: you just copied my text, which I incorrectly 
wrapped at 78 columns instead of 72...

> ---
>
>  Config.in           | 10 ++++++++++
>  package/Makefile.in |  3 +++
>  2 files changed, 13 insertions(+)
>
> diff --git a/Config.in b/Config.in
> index 9bc8e51..3fe6b7a 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -510,6 +510,16 @@ config BR2_OPTIMIZE_3
>  	  and also turns on the -finline-functions, -funswitch-loops and
>  	  -fgcse-after-reload options.
>
> +config BR2_OPTIMIZE_g

  I didn't notice this the first time: config options should be all capitals, 
like BR2_OPTIMIZE_S (for the -Os option).

  Regards,
  Arnout

> +	bool "optimize for debugging"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +	help
> +	  Optimize for debugging. This enables optimizations that do not
> +	  interfere with debugging. It should be the optimization level of
> +	  choice for the standard edit-compile-debug cycle, offering a
> +	  reasonable level of optimization while maintaining fast compilation
> +	  and a good debugging experience.
> +
>  config BR2_OPTIMIZE_S
>  	bool "optimize for size"
>  	help
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 616bdd0..2d6ff89 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -122,6 +122,9 @@ endif
>  ifeq ($(BR2_OPTIMIZE_3),y)
>  TARGET_OPTIMIZATION = -O3
>  endif
> +ifeq ($(BR2_OPTIMIZE_g),y)
> +TARGET_OPTIMIZATION = -Og
> +endif
>  ifeq ($(BR2_OPTIMIZE_S),y)
>  TARGET_OPTIMIZATION = -Os
>  endif
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
