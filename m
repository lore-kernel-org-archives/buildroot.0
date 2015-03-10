From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 10 Mar 2015 18:35:21 +0100
Subject: [Buildroot] [PATCH v5 1/3] pkg-cmake: allow to build package in
	a subdirectory
In-Reply-To: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
References: <1426011874-11011-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <CAHXCMMK00FKgwO0iHs3J3kguRsFvMD5hfBgUUJ8dKcdKw0CDSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

On Tue, Mar 10, 2015 at 7:24 PM, Gwenhael Goavec-Merou
<gwenj@trabucayre.com> wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
>
> For some cmake based packages, like GNURadio, it's forbidden to do the
> compilation directly in the sources directory. This patch add a new
> variable to specify, if needed, the name of a sub-directory used to compile.
>
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v4 -> v5:
>  * Instead of overloading BUILDDIR uses a variable to set if package is compiled
>    in-source-tree or not
>  * update again manual
> Changes v2 -> v3:
>  * Update docs to add detail about LIBFOO_BUILDDIR
> Changes v1 -> v2:
>  * Allow to overload $(2)_BUILDDIR instead of adding a new variable and test
> ---
>  docs/manual/adding-packages-cmake.txt |  3 +++
>  package/pkg-cmake.mk                  | 11 +++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index d92b209..0d4f2fa 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -146,3 +146,6 @@ possible to customize what is done in any particular step:
>    +LIBFOO_CONFIGURE_CMDS+ variable, it will be used instead of the
>    default CMake one. However, using this method should be restricted
>    to very specific cases. Do not use it in the general case.
> +
> +* By adding +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = no+ when a package
> +  prevents doing an in-source-tree build.
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 2404c40..9de21b5 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -61,7 +61,12 @@ $(2)_INSTALL_STAGING_OPTS    ?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS               ?= DESTDIR=$$(TARGET_DIR) install
>
>  $(2)_SRCDIR                    = $$($(2)_DIR)/$$($(2)_SUBDIR)
> +
> +ifeq ($$($(2)_SUPPORTS_IN_SOURCE_BUILD), no)
s/, no/,no/

s/$(2)/$(3)/
When in-srctree build is forbidden, it is for both target and host
package, so there is no need for having
HOST_FOO_SUPPORTS_IN_SOURCE_BUILD set when
FOO_SUPPORTS_IN_SOURCE_BUILD is already set.

> +$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
> +else
>  $(2)_BUILDDIR                  = $$($(2)_SRCDIR)
> +endif
>
>  #
>  # Configure step. Only define it if not already defined by the package
> @@ -73,7 +78,8 @@ ifeq ($(4),target)
>
>  # Configure package for target
>  define $(2)_CONFIGURE_CMDS
> -       (cd $$($$(PKG)_BUILDDIR) && \
> +       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> +       cd $$($$(PKG)_BUILDDIR) && \
>         rm -f CMakeCache.txt && \
>         PATH=$$(BR_PATH) \
>         $$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> @@ -98,7 +104,8 @@ else
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

-- 
Samuel
