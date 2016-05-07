From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 21:54:51 +0200
Subject: [Buildroot] [PATCH 02/13 v7] core/legal-info: use the helper to
 install source archives
In-Reply-To: <84c5747e72fbcb03c644e27d4c0a79402d50f2d3.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <84c5747e72fbcb03c644e27d4c0a79402d50f2d3.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <f969119f-bda4-9dc4-f81a-585c82367791@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 18:14, Yann E. MORIN wrote:
> .. and use $(Q) instead of a hard-coded @.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>
> ---
> Changes v6 -> v7:
>   - directly call the wrapper without the variable pointing to it
>     (Arnout)
>   - fix left-over comma  (Arnout)
>
> Changes v5 -> v6:
>   - directly call the helper script  (Thomas, Arnout)
>   - drop Luca's and Arnout's tags, as the code did change a bit
>
> Changes v4 -> v5:
>   - s/Copy/Save/ because we're not really copying
>
> Changes v2 -> v3:
>   - comment the @ -> $(Q) change  (Arnout)
> ---
>  package/pkg-generic.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3904c09..f9c7cf8 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -803,9 +803,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>  	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
>  endif
> -# Copy the source tarball (just hardlink if possible)
> -	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> -	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +# Save the source tarball
> +	$$(Q)support/scripts/hardlink-or-copy \
> +		$$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
> +		$$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  endif # redistribute
>
>  endif # other packages
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
