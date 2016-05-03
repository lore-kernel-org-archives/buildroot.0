From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 01:14:49 +0200
Subject: [Buildroot] [PATCH 06/13 v6] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <c8abc350498d27f8b6a31a2db583da0dcf2e6d0a.1461881416.git.yann.morin.1998@free.fr>
References: <cover.1461881416.git.yann.morin.1998@free.fr>
 <c8abc350498d27f8b6a31a2db583da0dcf2e6d0a.1461881416.git.yann.morin.1998@free.fr>
Message-ID: <2db32ff5-7ff9-e343-d31b-cb06404a1017@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/16 00:27, Yann E. MORIN wrote:
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
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
> Chages v5 -> v6:
>   - variable with raw name was renamed  (Thomas)
>
> Changes v1 -> v2:
>   - perl no longer has a post-legal-info hook  (Thomas, Luca)
> ---
>  package/pkg-generic.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 7aca958..a362b73 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -496,6 +496,8 @@ endif
>
>  $(2)_REDISTRIBUTE		?= YES
>
> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
> +
>  # When a target package is a toolchain dependency set this variable to
>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
>  # dependency
> @@ -823,8 +825,8 @@ else
>
>  ifeq ($$($(2)_REDISTRIBUTE),YES)
>  # Save the source tarball
> -	$$(Q)$$(HARDLINK_OR_COPY) $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
> -				  $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +	$$(Q)$$(HARDLINK_OR_COPY) $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \

  Did I really give my Rev-by without noticing that comma disappearing? :-)

  Regards,
  Arnout

> +				  $$($(2)_REDIST_SOURCES_DIR)
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
