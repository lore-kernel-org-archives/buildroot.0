From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 15 Aug 2014 13:07:22 +0200
Subject: [Buildroot] [PATCH 2 of 5 v3 for 2014.08] gendoc infra: use
 $(pkgname) instead of explicitly passing 'manual'
In-Reply-To: <f7050051dd5a40307465.1407957948@localhost>
References: <patchbomb.1407957946@localhost>
 <f7050051dd5a40307465.1407957948@localhost>
Message-ID: <CAHXCMMJ=HLguk221pG7RZV1Xsc+1LqpgoZJhZoJFzPpyEM91jw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Actually, it's a nack :-/
As is, this patch breaks the clean target, but nothing scary of course ;-)

On Wed, Aug 13, 2014 at 9:25 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> In the gendoc infrastructure, using an assignment of the form
>     FOO = docs/$(1)/bar
> inside GENDOC_INNER does not work as expected: the $(1) value is empty here
> and the value of FOO becomes 'docs//bar'.
>
> Parameters $(2), $(3), etc. do not have this problem. The specific thing
> about $(1) is that it is a parameter to GENDOC itself (indicating the
> document to create) and passed transparently to GENDOC_INNER.
>
> This is different from the package infrastructures, where $(1) is set from
> $(pkgname). In fact, the same strategy could be used by the gendoc
> infrastructure as well, as $(pkgname) resolves to 'manual' for file
> docs/manual/manual.mk. This has the advantage that the described problem
> does not occur.
>
> Note that this means that if we want to use the same GENDOC infrastructure
> for another document, it will have to reside in a separate directory than
> the manual.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v3: no changes
> v2: no changes
>
>  docs/manual/manual.mk |  18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>
> diff -r 9000c07087a5 -r f7050051dd5a docs/manual/manual.mk
> --- a/docs/manual/manual.mk     Wed Aug 13 11:30:25 2014 +0200
> +++ b/docs/manual/manual.mk     Sat Aug 09 18:18:58 2014 +0200
> @@ -78,16 +78,16 @@
>  # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
>  ################################################################################
>  define GENDOC
> -$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
> -$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
> -$(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
> -$(call GENDOC_INNER,$(1),text,text,text,text)
> -$(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
> +$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
> +$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
> +$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
> +$(call GENDOC_INNER,$(pkgname),text,text,text,text)
> +$(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
>  clean: $(1)-clean

Just here ^^^ , you missed a substitution.
With this fix, it's works fine.

> -$(1)-clean:
> -       $$(Q)$$(RM) -rf $$(O)/docs/$(1)
> -.PHONY: $(1) $(1)-clean manual-update-lists
> +$(pkgname)-clean:
> +       $$(Q)$$(RM) -rf $$(O)/docs/$(pkgname)
> +.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
>  endef
>
>  MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
> -$(eval $(call GENDOC,manual))
> +$(eval $(call GENDOC))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
