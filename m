From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Jul 2015 00:09:11 +0200
Subject: [Buildroot] [PATCH] Makefile: optimize umask setting
In-Reply-To: <1437083717-2736-1-git-send-email-guido@vanguardiasur.com.ar>
References: <20150716225237.367d958a@free-electrons.com>
 <1437083717-2736-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <55A82B87.6030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/16/15 23:55, Guido Mart?nez wrote:
> When using make to build multiple targets ("make a b ..."), the makefile
> would get called individually for each target, making the build a lot
> slower since every Makefile in BR's tree was parsed each time.
> 
> Fix this by making every invoked target depend on an "_all" rule, and
> doing the real work there, only one time. This is similar to the logic
> used in the generated makefile (support/scripts/mkmakefile).
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 531ac5d..f50f767 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -27,13 +27,13 @@
>  # Trick for always running with a fixed umask
>  UMASK=0022
>  ifneq ($(shell umask),$(UMASK))
> -.PHONY: all $(MAKECMDGOALS)
> +.PHONY: _all

 $(MAKECMDGOALS) should still be .PHONY (the non-phony targets are only
non-phony on the next level of make invocation).

 But in my patch, I forgot to replace all by _all :-)

>  
> -all:
> -	@umask $(UMASK) && $(MAKE) --no-print-directory
> +$(MAKECMDGOALS): _all
> +	@:
>  
> -$(MAKECMDGOALS):
> -	@umask $(UMASK) && $(MAKE) --no-print-directory $@
> +_all:
> +	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)

 That's indeed a more logical order.

 mkmakefile also adds $(MAKEARGS) - should we keep that?

 Regards,
 Arnout

>  
>  else # umask
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
