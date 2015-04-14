From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 22:30:18 +0200
Subject: [Buildroot] [PATCHv2 13/21] Makefile: implement a package based
 source-check target
In-Reply-To: <1428856685-4403-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D78DA.7080303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:37, Thomas Petazzoni wrote:
> This commit switches the implementation of the global source-check
> target to use a package infrastructure based mechanism, using the
> $(1)-all-source-check target added in the previous commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 There is something still missing to complete the conversion: some packages
(at91bootstrap, at91bootstrap3, barebox, uboot, xloader, linux, sunxi-boards)
check that the configuration files specified in .config really exist, _unless_
make source is called (presumably this exception is to support the 'make
allpackageyesconfig; make source' way of refreshing the buildroot mirror).
Previously (actually, before you removed source-check from noconfig_targets),
this would also apply to source-check, but now it doesn't anymore.

 So I'd update all those filter expressions with source-check as well.

 But that doesn't affect this patch, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6937dd3..7d94ee8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -617,8 +617,7 @@ external-deps:
>  	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
>  
>  # check if download URLs are outdated
> -source-check:
> -	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
> +source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
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
