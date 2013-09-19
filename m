From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 19 Sep 2013 13:43:02 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <246bed054da59d6508dc.1379587635@argentina>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
Message-ID: <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

2013/9/19 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> To generate the manual, you need asciidoc and w3m. If these are not
> present,
> pretty cryptic error messages are given.
> This patch adds a simple check for these dependencies, before attempting to
> build the manual.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  docs/manual/manual.mk |  11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -3,6 +3,16 @@ manual-update-lists:
>         $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
>                 $(TOPDIR)/support/scripts/gen-manual-lists.py
>
> +manual-check-dependencies:
> +       $(Q)if [ -z "`which a2x 2>/dev/null`" ]; then \
> +               echo "You need asciidoc on your host to generate the
> manual"; \
> +               false; \
> +       fi
> +       $(Q)if [ -z "`which w3m 2>/dev/null`" ]; then \
> +               echo "You need w3m on your host to generate the manual"; \
> +               false; \
> +       fi
>
To generate the pdf manual, you need dblatex too.
Also, to update the lists of the manual, you need python with argparse
package.


> +
>
>  ################################################################################
>  # GENDOC -- generates the make targets needed to build a specific type of
>  #           asciidoc documentation.
> @@ -24,6 +34,7 @@ define GENDOC_INNER
>
>  $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>                            $$($(call UPPERCASE,$(1))_SOURCES) \
> +                          manual-check-dependencies \
>                            manual-update-lists
>         $(Q)$(call MESSAGE,"Generating $(5) $(1)...")
>         $(Q)mkdir -p $$(@D)/.build
>


Regards,


-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/e84d53e4/attachment.html>
