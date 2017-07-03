From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 14:25:11 +0200
Subject: [Buildroot] [PATCH] Makefile: generate wrapper makefile when
 running make without a .config
In-Reply-To: <20170703102405.25977-1-peter@korsgaard.com>
References: <20170703102405.25977-1-peter@korsgaard.com>
Message-ID: <3fbe1d36-1909-634c-5f72-ea432d19f15a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 12:24, Peter Korsgaard wrote:
> The recent change to error out instead of running menuconfig when no .config
> is available broke an existing use case:
> 
> make O=output-foo; cd output-foo; br-init-conf (or similar to get a sensible .config); make
> 
> As there is no wrapper makefile in output-foo.
> 
> Fix it by ensuring the wrapper gets created if needed.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However, the br-init-conf script doesn't exist in utils/. Perhaps someone
should add it? :-P

 Regards,
 Arnout

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 36231fa9d6..bfe6fa3e07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -816,7 +816,7 @@ else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  # rule for it.
>  # Also for 'all' we error out and ask the user to configure first.
>  .PHONY: linux toolchain
> -linux toolchain all:
> +linux toolchain all: outputmakefile
>  	$(error Please configure Buildroot first (e.g. "make menuconfig"))
>  	@exit 1
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
