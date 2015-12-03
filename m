From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:17:29 +0100
Subject: [Buildroot] [PATCH 11/51] core/legal-info: add package version
 to license directory
In-Reply-To: <11dbe139facc8db195d221126c0d69da8ed6bc4d.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <11dbe139facc8db195d221126c0d69da8ed6bc4d.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56607929.9050504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Now that we save the source archives in a directory named after the
> package and its version, do the same for the license files, for
> consistency.
>
> It has a not-so-bad side-effect of also saving the version string in
> the all-licenses list.
>
> The only (small) drawback, is that the warnings about undefined
> _LICENSE_FILES now contains the version string, too. That's unavoidable,
> since that's what is stored in the legal report.

Is it a drawback at all? I don't think so.

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/pkg-generic.mk | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bb3a6da..07ff820 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -791,10 +791,10 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>   # is that the license still applies to the files distributed as part
>   # of the rootfs, even if the sources are not themselves redistributed.
>   ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
> -	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
> -	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
> +	@$$(call legal-license-nofiles,$$($(2)_RAWNAME)-$$($(2)_VERSION),$$(call UPPERCASE,$(4)))
> +	@$$(call legal-warning-pkg,$$($(2)_RAWNAME)-$$($(2)_VERSION),cannot save license ($(2)_LICENSE_FILES not defined))
>   else
> -	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
> +	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME)-$$($(2)_VERSION),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))

Mmh, you're computing "$$($(2)_RAWNAME)-$$($(2)_VERSION)" three times
in a few lines. And it's also computed elsewhere:

package/pkg-generic.mk:156:$(BUILD_DIR)/%/.stamp_patched: NAMEVER = 
$(RAWNAME)-$($(PKG)_VERSION)
package/pkg-generic.mk:427:  $(2)_SOURCE                        ?= 
$$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
package/pkg-generic.mk:485:$(2)_REDIST_SOURCES_DIR = 
$$(REDIST_SOURCES_DIR_$$(call 
UPPERCASE,$(4)))/$$($(2)_RAWNAME)-$$($(2)_VERSION)
package/pkg-generic.mk:821:     @$$(call 
legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call 
UPPERCASE,$(4)))

We should compute it once and store it in a new per-package variable.

BTW, I tested this patch and it works, but I'd like to give my
"Tested-by" tag after you do these changes, thanks.

-- 
Luca
