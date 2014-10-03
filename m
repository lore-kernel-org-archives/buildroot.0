From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 3 Oct 2014 21:40:39 +0200
Subject: [Buildroot] [PATCH 25/25 v7] docs/manual: document the asciidoc
	infra
In-Reply-To: <dda88aca0a62478ffc5be7e7fd9635376be4e3a8.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
 <dda88aca0a62478ffc5be7e7fd9635376be4e3a8.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXTXDyLHDVA+dum+f95XBHdKG7hawfikJGifKRutF7k+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Oct 3, 2014 at 7:01 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v6 -> v7:
>   - typo  (Samuel)
>   - some rephrasing  (Thomas DS)
>
> Chamges v5 -> v6:
>   - fix names of hooks  (Thomas DS)
>   - remove trailing spaces
>   - typo  (Thomas DS)
> ---
>  docs/manual/adding-packages-asciidoc.txt | 119 +++++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt          |   2 +
>  2 files changed, 121 insertions(+)
>  create mode 100644 docs/manual/adding-packages-asciidoc.txt
>
> diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
> new file mode 100644
> index 0000000..6f925a0
> --- /dev/null
> +++ b/docs/manual/adding-packages-asciidoc.txt
> @@ -0,0 +1,119 @@
> +// -*- mode:doc; -*-
> +// vim: syntax=asciidoc
> +
> +=== Infrastructure for asciidoc documents
> +
> +[[asciidoc-documents-tutorial]]
> +
> +The Buildroot manual, which you are currently reading, is entirely written
> +using the http://asciidoc.org/[AsciiDoc] mark-up syntax. The manual is then
> +rendered to many formats:
> +
> +* html
> +* split-html
> +* pdf
> +* epub
> +* text
> +
> +Although Buildroot only contains one document written in AsciiDoc, there
> +is, as for packages, an infrastructure for rendering documents using the
> +AsciiDoc syntax.
> +
> +Also as for packages, the AsciiDoc infrastructure is available from
> +xref:outside-br-custom[BR2_EXTERNAL]. This allows documentation for a
> +BR2_EXTERNAL tree to match the Buildroot documentation, as it will be
> +rendered to the same formats and use the same layout and theme.
> +
> +==== +asciidoc-document+ tutorial
> +
> +Whereas package infrastructures are suffixed with +-package+, the document
> +infrastructures are suffixed with +-document+. So, the AsciiDoc infrastructure
> +is named +asciidoc-document+.
> +
> +Here is an example to render a simple AsciiDoc document.
> +
> +----
> +01: ################################################################################
> +02: #
> +03: # foo-document
> +04: #
> +05: ################################################################################
> +06:
> +07: FOO_SOURCES = $(sort $(wildcard $(pkgdir)/*))
> +08: $(eval $(call asciidoc-document))
> +----
> +
> +On line 7, the Makefile declares what the sources of the document are.
> +Currently, it is expected that the document's sources are only local;
> +Buildroot will not attempt to download anything to render a document.
> +Thus, you must indicate where the sources are. Usually, the string
> +above is sufficient for a document with no sub-directory structure.
> +
> +On line 8, we call the +asciidoc-document+ function, which generates all
> +the Makefile code necessary to render the document.
> +
> +==== +asciidoc-document+ reference
> +
> +The list of variables that can be set in a +.mk+ file to give metadata
> +information is (assuming the document name is +foo+) :
> +
> +* +FOO_SOURCES+, mandatory, defines the source files for the document.
> +
> +* +FOO_RESOURCES+, optional, may contain a space-separated list of paths
> +  to one or more directories containing so-called resources (like CSS or
> +  images). By default, empty.
> +
> +There are also additional hooks (see xref:hooks[] for general information
> +on hooks), that a document may set to define extra actions to be done at
> +various steps:
> +
> +* +FOO_POST_RSYNC_HOOKS+ to run additional commands after the sources
> +  have been copied by Buildroot. This can for example be used to
> +  generate part of the manual with information extracted from the
> +  tree. As an example, Buildroot uses this hook to generate the tables
> +  in the appendices.
> +
> +* +FOO_CHECK_DEPENDENCIES_HOOKS+ to run additional tests on required
> +  components to generate the document. In AsciiDoc, it is possible to
> +  call filters, that is, programs that will parse an AsciiDoc block and
> +  render it appropriately (e.g. http://ditaa.sourceforge.net/[ditaa] or
> +  https://pythonhosted.org/aafigure/[aafigure].)

Here the period should be outside the parentheses, right?
See http://english.stackexchange.com/questions/6632/where-does-the-period-go-when-using-parentheses

> +
> +* +FOO_CHECK_DEPENDENCIES_<FMT>_HOOKS+, to run additional tests for
> +  the specified format +<FMT>+ (see the list of rendered formats, above.)

Same here I'd say.


Both are minor comments, really, and since the series went through so
much iterations already I'd say it's good to go and the above can be
fixed with a follow-up patch.

Hence:

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
