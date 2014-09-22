From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 22 Sep 2014 21:21:37 +0200
Subject: [Buildroot] [PATCH 10/23 v5] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <7b0fc250f94242ca764f011219f817f16afa5f67.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <7b0fc250f94242ca764f011219f817f16afa5f67.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVb9s5BVonSBk_j3P_Z6Hs+GebjTxU9z8k-kAwOgYb4Hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, GENDOC_INNER har-codes some variables to have the name of the
> document in them:
>     MANUAL_$(2)_ASCIIDOC_CONF
>     MANUAL_$(2)_ASCIIDOC_OPTS
>     MANUAL_$(2)_A2X_OPTS
>     MANUAL_$(2)_INSTALL_CMDS
>     ...
>
> Also, it defines some dependency on the generation rule, onto:
>     manual-check-dependencies
>     manual-check-dependencies-$(3)
>     manual-prepare-sources
>
> This is problematic, as it is not possible to have another document
> generated with the GENDOC infra, or it would trigger the rules, and use
> the variables for our own document, 'manual'.
>
> Add a new argument to GENDOC_INNER to be the uppercase name of the
> document, much like it is done for the PKG_*_INNER functions. Replace
> any reference to 'manual' with the currently passed named of the current
> document, $(1).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/manual.mk | 67 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 33 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 0ae2d83..a37f5e7 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -55,11 +55,12 @@ MANUAL_XSLTPROC_IS_BROKEN = \
>  #
>  #  argument 1 is the name of the document and must be a subdirectory of docs/;
>  #             the top-level asciidoc file must have the same name
> -#  argument 2 is the type of document to generate (-f argument of a2x)
> -#  argument 3 is the document type as used in the make target
> -#  argument 4 is the output file extension for the document type
> -#  argument 5 is the human text for the document type
> -#  argument 6 (optional) are extra arguments for a2x
> +#  argument 2 is the uppercase name of the document
> +#  argument 3 is the type of document to generate (-f argument of a2x)
> +#  argument 4 is the document type as used in the make target
> +#  argument 5 is the output file extension for the document type
> +#  argument 6 is the human text for the document type
> +#  argument 7 (optional) are extra arguments for a2x
>  #
>  # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
>  #
> @@ -67,50 +68,50 @@ MANUAL_XSLTPROC_IS_BROKEN = \
>  # all variable references except the arguments must be $$-quoted.
>  ################################################################################
>  define GENDOC_INNER
> -$(1): $(1)-$(3)
> -.PHONY: $(1)-$(3)
> -$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
> +$(1): $(1)-$(4)
> +.PHONY: $(1)-$(4)
> +$(1)-$(4): $$(O)/docs/$(1)/$(1).$(5)
>
> -manual-check-dependencies-$(3):
> +$(1)-check-dependencies-$(4):
>
> -MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
> -ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
> -MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
> +$(2)_$(3)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(3).conf
> +ifneq ($$(wildcard $$($(2)_$(3)_ASCIIDOC_CONF)),)
> +$(2)_$(3)_ASCIIDOC_OPTS += -f $$($(2)_$(3)_ASCIIDOC_CONF)
>  endif
>
>  # Handle a2x warning about --destination-dir option only applicable to HTML
>  # based outputs. So:
>  # - use the --destination-dir option if possible (html and split-html),
>  # - otherwise copy the generated manual to the output directory

In this comment and elsewhere in the file, there are still some
mentions to 'manual'. This patch could be a good opportunity to rename
these occurrences into 'document' or something.

> -MANUAL_$(2)_A2X_OPTS =
> -ifneq ($$(filter $(3),html split-html),)
> -MANUAL_$(2)_A2X_OPTS += --destination-dir="$$(@D)"
> +$(2)_$(3)_A2X_OPTS =
> +ifneq ($$(filter $(4),html split-html),)
> +$(2)_$(3)_A2X_OPTS += --destination-dir="$$(@D)"
>  else
> -define MANUAL_$(2)_INSTALL_CMDS
> -       $$(Q)cp -f $$(BUILD_DIR)/$(1)/$(1).$(4) $$(@D)
> +define $(2)_$(3)_INSTALL_CMDS
> +       $$(Q)cp -f $$(BUILD_DIR)/$(1)/$(1).$(5) $$(@D)
>  endef
>  endif
>
> -ifeq ($(4)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
> -$$(O)/docs/$(1)/$(1).$(4):
> +ifeq ($(5)-$$(MANUAL_XSLTPROC_IS_BROKEN),pdf-y)
> +$$(O)/docs/$(1)/$(1).$(5):
>         $$(error PDF manual generation is disabled because of a bug in \
>                 xsltproc. To be able to generate the PDF manual, you should \
>                 build xsltproc from the libxslt sources >=1.1.29 and pass it \
>                 to make through the command line: \
>                 'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
>  else
> -$$(O)/docs/$(1)/$(1).$(4): $$($$(call UPPERCASE,$(1))_SOURCES) \
> -                          manual-check-dependencies \
> -                          manual-check-dependencies-$(3) \
> -                          manual-prepare-sources
> -       $$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
> +$$(O)/docs/$(1)/$(1).$(5): $$($$(call UPPERCASE,$(1))_SOURCES) \
> +                          $(1)-check-dependencies \
> +                          $(1)-check-dependencies-$(4) \
> +                          $(1)-prepare-sources
> +       $$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
>         $$(Q)mkdir -p $$(@D)
> -       $$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
> -               $$(MANUAL_$(2)_A2X_OPTS) \
> -               --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
> +       $$(Q)a2x $(7) -f $(3) -d book -L -r $$(TOPDIR)/docs/images \
> +               $$($(2)_$(3)_A2X_OPTS) \
> +               --asciidoc-opts="$$($(2)_$(3)_ASCIIDOC_OPTS)" \
>                 $$(BUILD_DIR)/$(1)/$(1).txt
>  # install the generated manual
> -       $$(MANUAL_$(2)_INSTALL_CMDS)
> +       $$($(2)_$(3)_INSTALL_CMDS)
>  endif
>  endef
>
> @@ -129,17 +130,17 @@ $(pkgname)-rsync: $$(BUILD_DIR)/$(pkgname)
>
>  $(pkgname)-prepare-sources: $(pkgname)-rsync
>
> -$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
> +$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),xhtml,html,html,HTML,\
>         --xsltproc-opts "--stringparam toc.section.depth 1")
> -$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
> +$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),chunked,split-html,chunked,split HTML,\
>         --xsltproc-opts "--stringparam toc.section.depth 1")
>  # dblatex needs to pass the '--maxvars ...' option to xsltproc to prevent it
>  # from reaching the template recursion limit when processing the (long) target
>  # package table and bailing out.
> -$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
> +$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),pdf,pdf,pdf,PDF,\
>         --dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
> -$(call GENDOC_INNER,$(pkgname),text,text,text,text)
> -$(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
> +$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),text,text,text,text)
> +$(call GENDOC_INNER,$(pkgname),$$(call UPPERCASE,$(pkgname)),epub,epub,epub,ePUB)

I'm unsure about these double dollars here. In none of the other
infras do we add double dollars for the UPPERCASE call, when going
from outer to inner infra. There was some discussion on this in the
dollar threads, but I currently don't remember all the details.
Shouldn't we follow the same strategy as for the other infras here and
use single dollars for this UPPERCASE call?

Side note on this patch: it was not trivial to review this patch: it
combines the addition of the new argument with the shifting off
arguments 2-... It could have been more easy by first introducing the
argument as last one, and then performing the shift in another patch.
Anyway, I was able to review it using graphical diff, and aside from
the comments above this looks good.

Best regards,
Thomas
