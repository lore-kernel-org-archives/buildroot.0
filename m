From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Dec 2018 05:36:41 -0600
Subject: [Buildroot] [PATCH 3/5 v5] core/pkg-infra: allow meson packages
 to specify custom build rules
In-Reply-To: <acd0d092fa0c62970c3c8b5e3cecedeb73dcc4aa.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <acd0d092fa0c62970c3c8b5e3cecedeb73dcc4aa.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <CADvTj4qeYHq9+QuBfzHoYdhfF0WrVB_f5yxJivuxUdJQcR6EVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 26, 2018 at 2:52 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Some packages may want to build only specific targets, instead of the
> default.
>
> So, allow them to provide FOO_NINJA_OPTS (not really options, but we
> just mimicked the naming we already have for autotools packages).
>
> Update the manual accordingly.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  docs/manual/adding-packages-meson.txt | 3 +++
>  package/pkg-meson.mk                  | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index c52fe10506..549319b192 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -94,3 +94,6 @@ will therefore only use a few of them.
>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
> +
> +* +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
> +  default, empty, to build the default target(s).
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 507e686068..0588660dbf 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -103,12 +103,12 @@ ifndef $(2)_BUILD_CMDS
>  ifeq ($(4),target)
>  define $(2)_BUILD_CMDS
>         $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +               $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
>  endef
>  else
>  define $(2)_BUILD_CMDS
>         $$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
> -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
> +               $$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
shouldn't $$($$(PKG)_NINJA_OPTS) come after $$($$(PKG)_SRCDIR)/build?
>  endef
>  endif
>  endif
> --
> 2.14.1
>
