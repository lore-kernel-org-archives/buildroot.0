From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 00:25:25 +0200
Subject: [Buildroot] [PATCH v3] Config.in: add -Og option
In-Reply-To: <1463606275-21768-1-git-send-email-martin@surround.io>
References: <1463606275-21768-1-git-send-email-martin@surround.io>
Message-ID: <bb06b33b-475c-3f3d-7482-36b98aff0be3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/16 23:17, Martin Kelly wrote:
> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
> which can be useful for when you want optimized code that is nonetheless
> debuggable.
>
> Signed-off-by: Martin Kelly <martin@surround.io>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  For next, obviously.

  As I wrote separately, rewrapping the entire Config.in can be done in a 
separate patch.

  Regards,
  Arnout

> ---
> Changes since v2:
> - BR2_OPTIMIZE_g renamed to BR2_OPTIMIZE_G
> ---
>  Config.in           | 10 ++++++++++
>  package/Makefile.in |  3 +++
>  2 files changed, 13 insertions(+)
>
> diff --git a/Config.in b/Config.in
> index 9bc8e51..16ebce2 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -510,6 +510,16 @@ config BR2_OPTIMIZE_3
>  	  and also turns on the -finline-functions, -funswitch-loops and
>  	  -fgcse-after-reload options.
>
> +config BR2_OPTIMIZE_G
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
> index 616bdd0..2d454a6 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -122,6 +122,9 @@ endif
>  ifeq ($(BR2_OPTIMIZE_3),y)
>  TARGET_OPTIMIZATION = -O3
>  endif
> +ifeq ($(BR2_OPTIMIZE_G),y)
> +TARGET_OPTIMIZATION = -Og
> +endif
>  ifeq ($(BR2_OPTIMIZE_S),y)
>  TARGET_OPTIMIZATION = -Os
>  endif
> --
> 2.1.4
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
