From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 02:10:03 +0200
Subject: [Buildroot] [PATCHv2 08/21] Makefile: use the package infra
 based external-deps
In-Reply-To: <1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552C5ADB.6020509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:37, Thomas Petazzoni wrote:
> This commit changes the global 'external-deps' target to use the newly
> introduced per-package <pkg>-all-external-deps, instead of relying on
> the 'source' target with a custom DL_MODE.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index e91c5e6..40ee2e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -612,8 +612,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  
>  source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
>  
> +_external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
> -	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> +	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u

 If we also remove the sort -u (which removes duplicates, but there should be no
duplicates to begin with), then there's no need for a recursive make and we
avoid the GEN     /home/ymorin/dev/buildroot/O/./Makefile that Yann ran into
(which BTW was not caused by this patch but already existed before).

 The original implementation required recursive make to be able to pass the
DL_MODE override.


 Regards,
 Arnout

>  
>  legal-info-clean:
>  	@rm -fr $(LEGAL_INFO_DIR)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
