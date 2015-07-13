From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 11:35:17 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile: don't depend on the umask
In-Reply-To: <1416586748-12936-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <55A38655.3030802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/21/14 17:19, Guido Mart?nez wrote:
> Some packages and BR itself create files and directories on the target
> with cp/mkdir/etc which depend on the umask at the time of building.
> 
> To fix this, use a trick inside the Makefile which wraps all rules when
> the umask is not 0022. This sets the umask at the top level, and then
> the building process continues as usual.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Without this patch, building with umask 077 yields the following in rootfs.tar:

-rw------- 0/0             122 2015-07-13 11:28 ./etc/os-release

After the patch, we get:

-rw-r--r-- 0/0             122 2015-07-13 11:31 ./etc/os-release

 Also verified that it has virtually no impact on the time of 'make -qp'.

 Regards,
 Arnout

> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3d8283b..eeb1412 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,6 +24,19 @@
>  # You shouldn't need to mess with anything beyond this point...
>  #--------------------------------------------------------------
>  
> +# Trick for always running with a fixed umask
> +UMASK=0022
> +ifneq ($(shell umask),$(UMASK))
> +.PHONY: all $(MAKECMDGOALS)
> +
> +all:
> +	@umask $(UMASK) && $(MAKE)
> +
> +$(MAKECMDGOALS):
> +	@umask $(UMASK) && $(MAKE) $@
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
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
