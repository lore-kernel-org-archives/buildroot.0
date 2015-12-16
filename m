From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Dec 2015 00:56:54 +0100
Subject: [Buildroot] [PATCH 06/13 v2] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <72f53f4f69afe29c7621731bae6eb536864501c5.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <72f53f4f69afe29c7621731bae6eb536864501c5.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <5671FA46.2050903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 19:35, Yann E. MORIN wrote:
> Currently, we put all source archives side-by-side in the same
> directory.
> 
> Since we're about to also save individual patches that were applied
> on those sources, we don't want to make that directory a complete
> mess of unassorted files.
> 
> So, we install each source archive in its own sub-directory, where
> we'll later store the patches too. Store that location in a variable,
> so it can be re-used later on (to install patches in a future commit).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
> Changes v1 -> v2:
>   - perl no longer has a post-legal-info hook  (Thoams, Luca)
> ---
>  package/pkg-generic.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 784c39c..3b6240a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -491,6 +491,8 @@ endif
>  
>  $(2)_REDISTRIBUTE		?= YES
>  
> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME_VERSION)

 Not directly related to this patch, but I find this
$$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) bit extremely ugly.
$(LEGAL_INFO_DIR)/$(4)-sources is a lot nicer. Of course, that means we put
things in target-sources instead of plain sources, but I think that's an
improvement as well.

 Regards,
 Arnout

> +
>  # When a target package is a toolchain dependency set this variable to
>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
>  # dependency
> @@ -824,7 +826,7 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  # Copy the source tarball
>  	$$(Q)$$(call hardlink-copy,\
>  		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
> -		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
> +		     $$($(2)_REDIST_SOURCES_DIR))
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
