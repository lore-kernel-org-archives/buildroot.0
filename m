From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 07:50:37 +0100
Subject: [Buildroot] [PATCH 10/13] Move the manual build infrastructure
	to docs/manual/manual.mk
In-Reply-To: <ec70344eaa4dc73d4d7fc0ccae8575b8562ef80d.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <ec70344eaa4dc73d4d7fc0ccae8575b8562ef80d.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVjAcxD8mpvn0hozp13cDr-WhPnEAm=ExQHQ0VucBJKtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 7, 2012 at 8:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

> ---
> ?Makefile ? ? ? ? ? ? ?| ? 49 +------------------------------------------------
> ?docs/manual/manual.mk | ? 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> ?2 files changed, 49 insertions(+), 48 deletions(-)
> ?create mode 100644 docs/manual/manual.mk
>
> diff --git a/Makefile b/Makefile
> index ab6cee1..1986e33 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -679,54 +679,7 @@ release:
> ? ? ? ?bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
> ? ? ? ?rm -rf $(OUT) $(OUT).tar
>
> -################################################################################
> -# GENDOC -- generates the make targets needed to build a specific type of
> -# ? ? ? ? ? asciidoc documentation.
> -#
> -# ?argument 1 is the name of the document and must be a subdirectory of docs/;
> -# ? ? ? ? ? ? the top-level asciidoc file must have the same name
> -# ?argument 2 is the type of document to generate (-f argument of a2x)
> -# ?argument 3 is the document type as used in the make target
> -# ?argument 4 is the output file extension for the document type
> -# ?argument 5 is the human text for the document type
> -# ?argument 6 (optional) are extra arguments for a2x
> -#
> -# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
> -################################################################################
> -define GENDOC_INNER
> -$(1): $(1)-$(3)
> -.PHONY: $(1)-$(3)
> -$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
> -
> -$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
> - ? ? ? @echo "Generating $(5) $(1)..."
> - ? ? ? $(Q)mkdir -p $$(@D)
> - ? ? ? $(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
> - ? ? ? ? -D $$(@D) $$<
> -endef
> -
> -################################################################################
> -# GENDOC -- generates the make targets needed to build asciidoc documentation.
> -#
> -# ?argument 1 is the name of the document and must be a subdirectory of docs/;
> -# ? ? ? ? ? ? the top-level asciidoc file must have the same name
> -#
> -# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
> -################################################################################
> -define GENDOC
> -$(call GENDOC_INNER,$(1),xhtml,html,html,HTML)
> -$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
> -$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
> -$(call GENDOC_INNER,$(1),text,txt,text,Text)
> -$(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
> -clean: clean-$(1)
> -clean-$(1):
> - ? ? ? $(Q)$(RM) -rf $(O)/docs/$(1)
> -.PHONY: $(1) clean-$(1)
> -endef
> -
> -MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
> -$(eval $(call GENDOC,manual))
> +include docs/manual/manual.mk
>
> ?.PHONY: $(noconfig_targets)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> new file mode 100644
> index 0000000..1eaf73a
> --- /dev/null
> +++ b/docs/manual/manual.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +# GENDOC -- generates the make targets needed to build a specific type of
> +# ? ? ? ? ? asciidoc documentation.
> +#
> +# ?argument 1 is the name of the document and must be a subdirectory of docs/;
> +# ? ? ? ? ? ? the top-level asciidoc file must have the same name
> +# ?argument 2 is the type of document to generate (-f argument of a2x)
> +# ?argument 3 is the document type as used in the make target
> +# ?argument 4 is the output file extension for the document type
> +# ?argument 5 is the human text for the document type
> +# ?argument 6 (optional) are extra arguments for a2x
> +#
> +# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
> +################################################################################
> +define GENDOC_INNER
> +$(1): $(1)-$(3)
> +.PHONY: $(1)-$(3)
> +$(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
> +
> +$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
> + ? ? ? @echo "Generating $(5) $(1)..."
> + ? ? ? $(Q)mkdir -p $$(@D)
> + ? ? ? $(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
> + ? ? ? ? -D $$(@D) $$<
> +endef
> +
> +################################################################################
> +# GENDOC -- generates the make targets needed to build asciidoc documentation.
> +#
> +# ?argument 1 is the name of the document and must be a subdirectory of docs/;
> +# ? ? ? ? ? ? the top-level asciidoc file must have the same name
> +#
> +# The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
> +################################################################################
> +define GENDOC
> +$(call GENDOC_INNER,$(1),xhtml,html,html,HTML)
> +$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
> +$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
> +$(call GENDOC_INNER,$(1),text,txt,text,Text)
> +$(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
> +clean: clean-$(1)
> +clean-$(1):
> + ? ? ? $(Q)$(RM) -rf $(O)/docs/$(1)
> +.PHONY: $(1) clean-$(1)
> +endef
> +
> +MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
> +$(eval $(call GENDOC,manual))
> --
> 1.7.4.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
