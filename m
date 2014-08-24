From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Sun, 24 Aug 2014 14:57:28 +0200
Subject: [Buildroot] [PATCH v2 4/6] gendoc infra: disable pdf manual
	generation
In-Reply-To: <1408652748-14708-5-git-send-email-s.martin49@gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-5-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LVEDPi5RxXws-nd57WCYhdbhZh4QyNiOuitkqOFhAR7qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> The PDF manual generation reaches the default xsltproc's template
> recursion limit when processing the target package list; this makes the
> PDF manual generation failed [1-3].

fail

>
> This limit an be raised with the '--maxvars' option. Unfortunately,

can

> this option is not correctly handled in the latest xsltproc/libxslt
> release (1.1.28), but this bug is already fixed in the libxslt
> repository [4].
>
> This patch disables the PDF manual generation (makes it failed with a

fail

> meaningful error message) when the xsltproc program found in the PATH
> does not support the --maxvars option.
> So, one can still generate the PDF manual if he/she extends PATH with
> the location of a working xsltproc, by running:
>
>   $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual-pdf
>
> [1] http://lists.busybox.net/pipermail/buildroot/2014-August/104390.html
> [2] http://lists.busybox.net/pipermail/buildroot/2014-August/104418.html
> [3] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html
> [4] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>

I must say that the commit summary 'disable pdf manual generation' was
confusing to me: it is _conditionally_ disabled depending on the
xsltproc check.


> ---
> changes v1 -> v2:
> - simplify the xsltproc check logic
> ---
>  docs/manual/manual.mk | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 42d22be..016246c 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -83,6 +83,27 @@ define MANUAL_$(2)_INSTALL_CMDS
>  endef
>  endif
>
> +# PDF manual generation is currently broken because of a bug in xsltproc
> +# program (provided by libxslt), which does not honor an option we need to set.
> +# Fortunately, this bug is already fixed upstream:
> +#   https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c


This message is not timeless: the 'currently' will remain in the
buildroot sources even in a few releases. I think it would be better
to rewrite this in a way that is accurate even in the future.
Something like: 'in certain versions of xsltproc', for example, or if
you know the version specify that.

> +#
> +# So, bail out when trying to build the pdf manual using a buggy version of the
> +# xsltproc program.
> +#
> +# So, to overcome this issue and being able to build the pdf manual, you can
> +# build xsltproc from it source repository, then run:
> +#   $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual
> +USE_BUGGY_XSLTPROC = $$(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)

The name 'USE_BUGGY_XSLTPROC' is confusing to me: it sounds like it
can be set when you want to build the pdf manual even though xsltproc
is buggy. What about something like: MANUAL_XSLTPROC_IS_BROKEN (I
prefixed with MANUAL to avoid a confusion with the variables of a
possible xsltproc (target) package.

> +
> +ifeq ($(4)-$$(USE_BUGGY_XSLTPROC),pdf-y)
> +$$(O)/docs/$(1)/$(1).$(4):
> +       $$(error PDF manual generation is disabled because of a bug in \
> +               xsltproc program. To be able to generate the PDF manual, you \

I would remove 'program' here.

> +               should build xsltproc from the libxslt sources >=1.1.29 and \
> +               passed it to make through the command line: \

pass

> +               'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
> +else
>  $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>                            $$($$(call UPPERCASE,$(1))_SOURCES) \
>                            manual-check-dependencies \
> @@ -96,6 +117,7 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>                 $$(BUILD_DIR)/$(1)/$(1).txt
>  # install the generated manual
>         $$(MANUAL_$(2)_INSTALL_CMDS)
> +endif
>  endef
>
>  ################################################################################
> @@ -111,8 +133,11 @@ $(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
>         --xsltproc-opts "--stringparam toc.section.depth 1")
>  $(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
>         --xsltproc-opts "--stringparam toc.section.depth 1")
> +# dblatex needs to pass '--maxvars ...' option to xsltproc to prevent it from

the '--maxvars ...' option

> +# reaching the template recursion limit when processing the (long) target
> +# package table and bailing out.
>  $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
> -       --dblatex-opts "-P latex.output.revhistory=0")
> +       --dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
>  $(call GENDOC_INNER,$(pkgname),text,text,text,text)
>  $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
>  clean: $(pkgname)-clean
> --
> 2.1.0
>

Best regards,
Thomas
