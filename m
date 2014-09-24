From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 24 Sep 2014 21:21:35 +0200
Subject: [Buildroot] [PATCH 17/23 v5] docs/manual: always look for
 ressources in destination directory
In-Reply-To: <f1a0a2c203f426242b9c35172efec6aba4f3dd54.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <f1a0a2c203f426242b9c35172efec6aba4f3dd54.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXLLkjjky0LN5ZqpafPAnAHBci1Mzp_M4RSt=Dgrwha6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Our manual does not use external filters in asciidoc, so we are happy
> with just looking for ressources from our source tree.
>
> However, other documents (like ones in br2-external) may use such
> filters, to generate diagrams, graphs...
>
> External filters generate their output files in the output directory, so
> we must also look for ressources in there.
>
> Note: external filters in asccidoc are used thus:
>     ["filter-name"]
>     ----
>     Text to be rendered
>     ----
>
> In the future, our own manual may even make use of filters to include
> some of the graphs we generate, to store in the documentation.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>
> ---
> Note: this is to work around a deficiency (bug?) in asccidoc. Asciidoc
> actually tells the filter where to put the output files, but forgets to
> look in there when it needs to link to those files...
> ---
>  docs/manual/manual.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index f3638a7..e649ffe 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -92,7 +92,7 @@ $$(O)/docs/$(1)/$(1).$(6): $$($$(call UPPERCASE,$(1))_SOURCES) \
>         $$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
>         $$(Q)mkdir -p $$(@D)
>         $$(Q)a2x $(8) -f $(4) -d book -L \
> -               $$(foreach r,$$($(2)_RESSOURCES),-r $$(r)) \
> +               $$(foreach r,$$($(2)_RESSOURCES),-r $$(r)) -r $$(@D) \

Alternatively, you could have expanded FOO_RESOURCES from , right?
Something like

$(2)_RESOURCES += $$(@D)

and then keeping the foreach line untouched ?
I'd add a short comment line to explain why this is done though...

Best regards,
Thomas
