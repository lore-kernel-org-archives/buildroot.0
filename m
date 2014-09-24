From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 24 Sep 2014 21:11:06 +0200
Subject: [Buildroot] [PATCH 15/23 v5] docs/manual: allow documents to
 define some hooks, as for a package
In-Reply-To: <23bf1e5cf8d3e8664077e5e85657193f1a363181.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <23bf1e5cf8d3e8664077e5e85657193f1a363181.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUqdPr-XNXcsMRCT2jvfSRrPo3Y75FS1px7zaHx-pXM0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Allow documents to define two hooks:
>   - DOC_EXTRA_CHECK_DEPENDENCIES
>     to check for extra dependencies required by this document
>   - DOC_EXTRA_CHECK_DEPENDENCIES_FMT
>     ditto, but for the specific format

Is this EXTRA_ string necessary?

>   - DOC_POST_EXTRACT_HOOKS:
>     to run additional actions to fill-in the build directory

I assume you called this POST_EXTRACT to line up with the package
infras, but for gendoc no extraction is done.
In fact, an rsync of DOC_SOURCES is done. Doesn't it make more sense
to use DOC_POST_RSYNC_HOOKS ?
Such a hook also exists in pkg-generic, so it also lines up with the
existing infras.


>
> (Replace 'DOC' with the uppercase name of the document, and 'FMT' with
> the format.)
>
> This is supposed to replace the current use of overloading the internal
> dependency rules, and makes GENDOC behave yet a bit more like the
> package infrastructure.
>
> Note that GENDOC_INNER already has the uppercase name as an argument,
> whereas GENDOC does not, so the two foreach loops are not exactly
> similar (for now.)
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>
> ---
> Changes v1 -> v2:
>   - call post-extract hook in rsync rule
> ---
>  docs/manual/manual.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index cd944fa..52fac0e 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -55,10 +55,9 @@ $(1): $(1)-$(5)
>  .PHONY: $(1)-$(5)
>  $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
>
> -$(1)-check-dependencies: gendoc-check-dependencies
> -
>  gendoc-check-dependencies-$(5):
>  $(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
> +       $$(Q)$$(foreach hook,$$($(2)_CHECK_EXTRA_DEPENDENCIES_$(5)_HOOKS),$$(call $$(hook))$$(sep))

Here you didn't add the '# Single line' comment. Is that intentional?

>
>  $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
>  ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
> @@ -110,12 +109,18 @@ endef
>  # resources, such as images, are located; must be an absolute path.
>  ################################################################################
>  define GENDOC
> +# Single line, because splitting a foreach is not easy...
> +$(pkgname)-check-dependencies: gendoc-check-dependencies
> +       $$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_CHECK_EXTRA_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
> +
>  $$(BUILD_DIR)/$(pkgname):
>         $$(Q)mkdir -p $$@
>
> +# Single line, because splitting a foreach is not easy...
>  $(pkgname)-rsync: $$(BUILD_DIR)/$(pkgname)
>         $$(Q)$$(call MESSAGE,"Preparing the $(pkgname) sources...")
>         $$(Q)rsync -a $(pkgdir) $$^
> +       $$(Q)$$(foreach hook,$$($$(call UPPERCASE,$(pkgname))_POST_EXTRACT_HOOKS),$$(call $$(hook))$$(sep))
>
>  $(pkgname)-prepare-sources: $(pkgname)-rsync
>


Best regards,
Thomas
