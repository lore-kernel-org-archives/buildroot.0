From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Aug 2014 22:32:33 +0200
Subject: [Buildroot] [PATCH 1 of 4 v2 for 2014.08] gendoc infra: use
 $(pkgname) instead of explicitly passing 'manual'
In-Reply-To: <8a3834f24594bf372176.1407867068@localhost>
References: <patchbomb.1407867067@localhost>
 <8a3834f24594bf372176.1407867068@localhost>
Message-ID: <20140812203233.GD4055@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-12 20:11 +0200, Thomas De Schampheleire spake thusly:
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

This breaks generating the manual:

    $ make manual-html
    make: *** No rule to make target `manual-html'.  Stop.
    $ make manual
    make: *** No rule to make target `manual'.  Stop.

Did I miss something? Was that patch supposed to do that? ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: no changes
> 
>  docs/manual/manual.mk |  18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff -r 3bcf63a46bc1 -r 8a3834f24594 docs/manual/manual.mk
> --- a/docs/manual/manual.mk	Tue Aug 05 18:25:11 2014 -0300
> +++ b/docs/manual/manual.mk	Sat Aug 09 18:18:58 2014 +0200
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
> -$(1)-clean:
> -	$$(Q)$$(RM) -rf $$(O)/docs/$(1)
> -.PHONY: $(1) $(1)-clean manual-update-lists
> +$(pkgname)-clean:
> +	$$(Q)$$(RM) -rf $$(O)/docs/$(pkgname)
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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
