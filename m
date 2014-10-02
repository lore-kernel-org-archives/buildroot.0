From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Oct 2014 12:17:27 +0200
Subject: [Buildroot] [PATCH 22/25 v6] doc/asciidoc: always apply
	Buildroot's AsciiDoc config
In-Reply-To: <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUr6kTc_xxjVy=-QChiXbNqSmed24JsD_M1jhesTmmOyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

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

The above two snippets almost are the same and at first I thought this
was a merge/rebase issue.
In fact, one of the comments should change.

Moreover, I have been staring at this patch for several minutes to
verify if I misunderstood something. The confusing thing is that
variable $(2)_ASCIIDOC_BR_CONF, which can expand to
MANUAL_ASCIIDOC_BR_CONF or SOMEDOC_ASCIIDOC_BR_CONF will both contain
the same common value docs/conf/asciidoc.conf, while the name of the
variable suggests that it is document-specific.

Strictly speaking, you have following levels:

- buildroot conf for all formats
- buildroot conf for a specific format
- <doc> conf for all formats
- <doc> conf for a specific format

Currently, the variables mapped on this are (respectively)

$(2)_ASCIIDOC_BR_CONF
$(2)_$(4)_ASCIIDOC_BR_CONF
$(2)_ASCIIDOC_CONF
$(2)_$(4)_ASCIIDOC_CONF

while I would find it more logical to have:

BR_ASCIIDOC_CONF
BR_$(4)_ASCIIDOC_CONF
$(2)_ASCIIDOC_CONF
$(2)_$(4)_ASCIIDOC_CONF


Best regards,
Thomas
