From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 27 Sep 2014 13:21:00 +0200
Subject: [Buildroot] [PATCH 22/25 v6] doc/asciidoc: always apply
	Buildroot's AsciiDoc config
In-Reply-To: <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJgg7qJQCruYG58ujDMWCtgTCCxMMEJecQQB4e=KhpHOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> As suggested by Thomas: the AsciiDoc options we use ensure we get a sane
> output of the document. We want that configuration to be applied to
> other documents as well.
>
> Up until now, it was implicit that the configuration was applied to
> our manual, becasue we only supported document-specific configuration,
> and the configuration we had was in our manual dir, so we got to use it.
>
> But now, we can render other documents, especially ones from
> br2-external, and we want those to also use the default configuration
> from Buildroot, but still be able to provide their own customisation.
>
> So, always add Buildroot's configuration first, if available, before we
> append the document's configuration.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/{manual => conf}/asciidoc-text.conf |  0
>  package/doc-asciidoc.mk                  | 12 ++++++++++++
>  2 files changed, 12 insertions(+)
>  rename docs/{manual => conf}/asciidoc-text.conf (100%)
>
> diff --git a/docs/manual/asciidoc-text.conf b/docs/conf/asciidoc-text.conf
> similarity index 100%
> rename from docs/manual/asciidoc-text.conf
> rename to docs/conf/asciidoc-text.conf
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index f949733..6185982 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -60,10 +60,21 @@ asciidoc-check-dependencies-$(5):
>  $(1)-check-dependencies-$(5): asciidoc-check-dependencies-$(5)
>         $$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_$(call UPPERCASE,$(5))_HOOKS),$$(call $$(hook))$$(sep))
>
> +# Include output-specific Asciidoc configuration: first, Buildroot's
> +# configuration, then the document's configuration
> +ifneq ($$(wildcard $$($(2)_ASCIIDOC_BR_CONF)),)
> +$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_BR_CONF)
> +endif
>  ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
>  $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
>  endif
>
> +# Include output-specific Asciidoc configuration: first, Buildroot's
> +# configuration, then the document's configuration
> +$(2)_$(4)_ASCIIDOC_BR_CONF = docs/conf/asciidoc-$(4).conf
> +ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_BR_CONF)),)
> +$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_BR_CONF)
> +endif
>  $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
>  ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
>  $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
> @@ -136,6 +147,7 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
>
>  $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
>
> +$(2)_ASCIIDOC_BR_CONF = docs/conf/asciidoc.conf
>  $(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf

It's a bit odd to have *_ASCIIDOC{,_BR}_CONF definitions after using
them, whereas teh output-specific config file is defined just before
using it.
Anyway, it has no impact on the behavior of the infra, so:

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
