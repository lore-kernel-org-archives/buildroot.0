From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 21:18:42 +0100
Subject: [Buildroot] [PATCH v6 05/13] core: make staging *-config
 scripts relocatable
In-Reply-To: <1454342021-22960-6-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-6-git-send-email-s.martin49@gmail.com>
Message-ID: <56AFBDA2.60408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 16:53, Samuel Martin wrote:
> This change adjusts the _CONFIG_SCRIPTS hook to set add {exec_,}prefix computed
> relatively to the script location.
> 
> This patch hook only fixes *-config scripts located in the staging area,
> the target ones are already removed. A follow-up change will fix those
> from the HOST_DIR location.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5 -> v6:
> - new patch
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1e024d3..1bf613e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -240,7 +240,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>  		$(call MESSAGE,"Fixing package configuration files") ;\
>  			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
>  				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
> -				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
> +				-e "s,^\(exec_\)\?prefix=.*,\1prefix=\`dirname \$$0\`/../../usr,g" \
>  				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
>  				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
>  				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \

 Since this is still there, it is not really relocatable yet... To make it
really relocatable, we should probably use $${BR_STAGING_DIR}} and export
BR_STAGING_DIR=$(STAGING_DIR).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
