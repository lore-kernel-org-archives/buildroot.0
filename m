From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 May 2016 00:50:26 +0200
Subject: [Buildroot] [PATCH] Config.in: add -Og option
In-Reply-To: <1463183826-28562-1-git-send-email-martin@surround.io>
References: <1463183826-28562-1-git-send-email-martin@surround.io>
Message-ID: <06c3a186-7b7e-a66e-9a55-fe6afcaef10e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Martin,

  In addition to Thomas's comments, I'd like to reword the help text a little.


On 05/14/16 01:57, Martin Kelly wrote:
> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
> which can be useful for when you want optimized code that is nonetheless
> debuggable.
>
> Signed-off-by: Martin Kelly <martin@surround.io>
> ---
>  Config.in           | 11 +++++++++++
>  package/Makefile.in |  3 +++
>  2 files changed, 14 insertions(+)
>
> diff --git a/Config.in b/Config.in
> index b5cc892..9330de1 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -510,6 +510,17 @@ config BR2_OPTIMIZE_3
>  	  and also turns on the -finline-functions, -funswitch-loops and
>  	  -fgcse-after-reload options.
>
> +config BR2_OPTIMIZE_g
> +	bool "optimize debugging experience"

	bool "optimize for debugging"

> +	select BR2_HOST_GCC_AT_LEAST_4_8
> +	help
> +	  Optimize debugging experience. -Og enables optimizations that do not
> +	  interfere with debugging. It should be the optimization level of choice for
> +	  the standard edit-compile-debug cycle, offering a reasonable level of
> +	  optimization while maintaining fast compilation and a good debugging
> +	  experience. If you use multiple -O options, with or without level numbers,
> +	  the last such option is the one that is effective.

  The last sentence doesn't fit here. So:

	  Optimize for debugging. This enables optimizations that do not
	  interfere with debugging. It should be the optimisation level of
	  choice for the standard edit-compile-debug cycle, offering a
	  reasonable level of optimization while maintaining fast compilation
	  and a good debugging experience.


  Regards,
  Arnout

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
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
