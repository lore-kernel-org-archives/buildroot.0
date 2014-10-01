From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 1 Oct 2014 22:00:31 +0200
Subject: [Buildroot] [PATCH 15/25 v6] docs/manual: use the new hooks
	instead of gendoc rules
In-Reply-To: <b132b93c9bbef9ef3b27f116590e845c5f9c42ca.1411812968.git.yann.morin.1998@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <b132b93c9bbef9ef3b27f116590e845c5f9c42ca.1411812968.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXJLOQqQZgA2=5OkA4UbJjps55HgvsqpkhQuYxES2Nt0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Also reorder a bit the definition of the variables, to more resemble
> a package. Yet a bit more...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v5 -> v6:
>   - hooks were renamed  (Thomas DS)
>   - typo  (Thomas DS)
> ---
>  docs/manual/manual.mk | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> index 2ee680e..94f7551 100644
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -151,25 +151,28 @@ endef
>  # The Buildroot manual
>  ################################################################################
>
> -# Our manual needs to generate lists
> -manual-prepare-sources: manual-update-lists
> +MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
> +MANUAL_RESOURCES = $(TOPDIR)/docs/images
>
> +# Our manual needs to generate lists
>  # Packages included in BR2_EXTERNAL are not part of buildroot, so they
>  # should not be included in the manual.
> -.PHONY: manual-update-lists
> -manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
> +define MANUAL_GEN_LISTS
>         $(Q)$(call MESSAGE,"Updating the manual lists...")
>         $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
>                 BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>                 python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
> +endef
> +MANUAL_POST_RSYNC_HOOKS += MANUAL_GEN_LISTS
>
> -manual-check-dependencies-lists:
> +# Our list-generating script requires argparse
> +define MANUAL_CHECK_LISTS_DEPS
>         $(Q)if ! python -c "import argparse" >/dev/null 2>&1 ; then \
>                 echo "You need python with argparse on your host to generate" \
>                         "the list of packages in the manual"; \
>                 exit 1; \
>         fi
> +endef
> +MANUAL_CHECK_DEPENDENCIES_HOOKS += MANUAL_CHECK_LISTS_DEPS
>
> -MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
> -MANUAL_RESOURCES = $(TOPDIR)/docs/images
>  $(eval $(call GENDOC))
> --
> 1.9.1
>

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
