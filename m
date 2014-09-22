From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 22:42:02 +0200
Subject: [Buildroot] [PATCH 18/23 v5] docs: separate the GENDOC infra
	from our manual definition
In-Reply-To: <308773fe2883c6a3a4e13be8fdabcf3f2ba6c42a.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <308773fe2883c6a3a4e13be8fdabcf3f2ba6c42a.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKPMg-S1pYckGZ0re-b+S6yVW24V0kU1orCpmuZkUVw9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the GENDOC infra to its own file, so it is even less tied to our
> manual document, so that it is more obvious that GENDOC is an infra like
> our packages infras, and 'manual' is a document like we have packages.
>
> Ideally, this new file should better go in docs/ rather than in package/ .
> However, docs/ is already full of our website stuff, so adding it in
> there would just serve to clutter the website.
>
> So, let's just put alongside the other infrastructures, in package/ .
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Makefile              |   1 +
>  docs/manual/manual.mk | 148 --------------------------------------------------
>  package/gendoc.mk     | 147 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+), 148 deletions(-)
>  create mode 100644 package/gendoc.mk
>
[...]
> diff --git a/package/gendoc.mk b/package/gendoc.mk
> new file mode 100644
> index 0000000..b859860
> --- /dev/null
> +++ b/package/gendoc.mk
> @@ -0,0 +1,147 @@
> +# we can't use suitable-host-package here because that's not available in
> +# the context of 'make release'
> +gendoc-check-dependencies:
> +       $(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
> +               echo "You need a sufficiently recent asciidoc on your host" \
> +                       "to generate the manual"; \
> +               exit 1; \
> +       fi
> +       $(Q)if [ -z "`which w3m 2>/dev/null`" ]; then \
> +               echo "You need w3m on your host to generate the manual"; \
> +               exit 1; \
> +       fi
> +
> +gendoc-check-dependencies-pdf:
> +       $(Q)if [ -z "`which dblatex 2>/dev/null`" ]; then \
> +               echo "You need dblatex on your host to generate the pdf manual"; \
> +               exit 1; \
> +       fi
> +
> +# PDF manual generation is broken because of a bug in xsltproc program provided
> +# by libxslt <=1.1.28, which does not honor an option we need to set.
> +# Fortunately, this bug is already fixed upstream:
> +#   https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
> +#
> +# So, bail out when trying to build the pdf manual using a buggy version of the
> +# xsltproc program.
> +#
> +# So, to overcome this issue and being able to build the pdf manual, you can
> +# build xsltproc from it source repository, then run:
> +#   $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual
> +MANUAL_XSLTPROC_IS_BROKEN = \

Maybe  this variable could be renamed as well.
It is more related to asciidoc/a2x than specific tou Buildroot's manual.

> +       $(shell xsltproc --maxvars 0 >/dev/null 2>/dev/null || echo y)
> +
[...]

Regards,

-- 
Samuel
