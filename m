From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 25 Feb 2015 14:43:57 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-cmake: allow to build package in a
	subdirectory
In-Reply-To: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
References: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMLcfvNBw0K85cu2XqTyp_hFAVcMfjTsYNaiDivk4ZaEjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Tue, Feb 17, 2015 at 6:55 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> For some cmake based packages, like GNURadio, it's forbidden to do the
> compilation directly in the sources directory. This patch add a new
> variable to specify, if needed, the name of a sub-directory used to compile.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/pkg-cmake.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 6c9955d..20243aa 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -57,7 +57,11 @@ $(2)_INSTALL_STAGING_OPTS    ?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS               ?= DESTDIR=$$(TARGET_DIR) install
>
>  $(2)_SRCDIR                    = $$($(2)_DIR)/$$($(2)_SUBDIR)
> +ifneq ($$($2)_BUILD_DIR,)
> +$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/$$($(2)_BUILD_DIR)
> +else
>  $(2)_BUILDDIR                  = $$($(2)_SRCDIR)

I suggest you just do something similar to what is done in the generic
infra [1].

> +endif
>
>  #
>  # Configure step. Only define it if not already defined by the package
> @@ -69,7 +73,8 @@ ifeq ($(4),target)
>
>  # Configure package for target
>  define $(2)_CONFIGURE_CMDS
> -       (cd $$($$(PKG)_BUILDDIR) && \
> +       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> +       cd $$($$(PKG)_BUILDDIR) && \
>         rm -f CMakeCache.txt && \
>         PATH=$$(BR_PATH) \
>         $$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> @@ -93,7 +98,8 @@ else
>
>  # Configure package for host
>  define $(2)_CONFIGURE_CMDS
> -       (cd $$($$(PKG)_BUILDDIR) && \
> +       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> +       cd $$($$(PKG)_BUILDDIR) && \
>         rm -f CMakeCache.txt && \
>         PATH=$$(BR_PATH) \
>         $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> --
> 2.0.5
>

Regards,

[1] http://git.buildroot.org/buildroot/tree/package/pkg-generic.mk#n350

-- 
Samuel
