From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Nov 2014 22:11:50 +0100
Subject: [Buildroot] [PATCH v3 1/5] Makefile: don't depend on the umask
In-Reply-To: <1416244750-24256-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <546A6496.6050709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/14 18:19, Guido Mart?nez wrote:
> Some packages and BR itself create files and directories on the target
> with cp/mkdir/etc which depend on the umask at the time of building.
> 
> To fix this, use a trick inside the Makefile which wraps all rules when
> the umask is not 0022. This sets the umask at the top level, and then
> the building process continues as usual.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 471edf9..5ad8235 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,6 +24,19 @@
>  # You shouldn't need to mess with anything beyond this point...
>  #--------------------------------------------------------------
>  
> +# Trick for always running with a fixed umask
> +UMASK=0022
> +ifneq ($(shell umask),$(UMASK))
> +.PHONY:*

 What is this * supposed to do? It will expand to all existing files and
directories in the buildroot directory... Don't you mean:

.PHONY: all $(MAKECMDGOALS)

?


 Otherwise, looks good.

 BTW wouldn't it be nice to add the umask setting to the generated Makefile in
the $(O) directory, to avoid another level of make?


 Regards,
 Arnout

> +
> +all:
> +	@umask $(UMASK) && make --no-print-directory
> +
> +%:
> +	@umask $(UMASK) && make --no-print-directory $@
> +
> +else # umask
> +
>  # This is our default rule, so must come first
>  all:
>  
> @@ -932,3 +945,5 @@ include docs/manual/manual.mk
>  -include $(BR2_EXTERNAL)/docs/*/*.mk
>  
>  .PHONY: $(noconfig_targets)
> +
> +endif #umask
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
