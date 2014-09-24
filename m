From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 24 Sep 2014 21:50:04 +0200
Subject: [Buildroot] [PATCH 21/23 v5] docs/asciidoc: make it possible to
 use $(@D) in hooks
In-Reply-To: <2dc7586ac17c407aef3adc68f49cbdb663074ed1.1410692671.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <2dc7586ac17c407aef3adc68f49cbdb663074ed1.1410692671.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXn0+yWsgFypYxxdfjRWu5kgwo6TH30bQpT9JW7iZr_=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, it is not possible to use $(@D) in documents' hooks, because
> there is no actual target file for the copying rule.
>
> So, use the same mechanism as for generic-package.
>
> We do not touch the target file, so it is easy to regenerate the manual
> without calling the -clean rule first.

Shouldn't we add this note as a comment in doc/asciidoc.mk, to avoid
later 'correction' that adds a touch?

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/manual.mk   |  2 +-
>  package/doc-asciidoc.mk | 10 ++++------
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index b221664..9a86113 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -8,7 +8,7 @@ MANUAL_RESSOURCES = $(TOPDIR)/docs/images
>  # Our manual needs to generate lists
>  define MANUAL_GEN_LISTS
>         $(Q)$(call MESSAGE,"Updating the manual lists...")
> -       $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/$(pkgname) \
> +       $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(@D) \
>                 BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>                 python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
>  endef
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 38c9ced..13e4479 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -118,16 +118,14 @@ define ASCIIDOC
>  $(pkgname)-check-dependencies: asciidoc-check-dependencies
>         $$(Q)$$(foreach hook,$$($(2)_CHECK_EXTRA_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))

This patch does not allow $(@D) in the CHECK_EXTRA_DEPENDENCIES_HOOKS.
Is that intentional?
