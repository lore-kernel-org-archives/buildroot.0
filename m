From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 22:01:28 +0200
Subject: [Buildroot] [PATCH 05/13 v7] core/legal-info: add package
 version to license directory
In-Reply-To: <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
References: <cover.1462637351.git.yann.morin.1998@free.fr>
 <5e1963c6feb57cd7a5096d296b86624f14bf3d8d.1462637351.git.yann.morin.1998@free.fr>
Message-ID: <f99ee6fa-bb3a-411e-9b78-899dcad0c5b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 18:14, Yann E. MORIN wrote:
> Now that we save the source archives in a directory named after the
> package and its version, do the same for the license files, for
> consistency.
>
> It has a not-so-bad side-effect of also saving the version string in
> the all-licenses list.
>
> The only (small) side-effect, is that the warnings about undefined
> _LICENSE_FILES now contains the version string, too. That's unavoidable,
> since that's what is stored in the legal report.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
>
> ---
> Chages v5 -> v6:
>   - raw name variable was renamed  (Thomas)
>
> Changes v1 -> v2:
>   - s/drawback/side-effect/  (Luca)
> ---
>  package/pkg-generic.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b031879..7a86355 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -786,10 +786,10 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  # is that the license still applies to the files distributed as part
>  # of the rootfs, even if the sources are not themselves redistributed.
>  ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> -	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
> -	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +	@$$(call legal-license-nofiles,$$($(2)_RAW_BASE_NAME),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))

  I think this should stay $(2)_RAWNAME, or either it should change as well for 
the legal-warning-source below.

  Other than that:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

>  else
> -	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> +	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAW_BASE_NAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
>  endif # license files
>
>  ifeq ($$($(2)_SITE_METHOD),local)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
