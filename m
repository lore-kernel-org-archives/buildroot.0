From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Mar 2015 23:23:10 +0100
Subject: [Buildroot] [PATCH v6 1/3] pkg-cmake: allow to build package in
 a subdirectory
In-Reply-To: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
References: <1426076003-12088-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <5500C04E.7050008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/15 13:13, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> For some cmake based packages, like GNURadio, it's forbidden to do the
> compilation directly in the sources directory. This patch add a new 
> variable to specify, if needed, the name of a sub-directory used to compile.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I still have improvements proposed below, but since this is already v6 and it's
pretty OK as it is I don't mind doing that in a follow-up patch. Gwenhael, if
you do produce a v7, don't forget to keep my Reviewed-by.

> ---
> Changes v5 -> v6:
>  * s/, no/,NO/
>  * s/$$($(2)_SUPPORTS_IN_SOURCE_BUILD)/$$($(3)_SUPPORTS_IN_SOURCE_BUILD)/
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
> +* By adding +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ when a package
> +  prevents doing an in-source-tree build.

 This is not the right place for documenting this variable. It should be two
paragraphs higher, together with all the other variables. And then it should be
reformulated like this:

* +LIBFOO_SUPPORTS_IN_SOURCE_BUILD = NO+ should be set when the package cannot
  be built inside the source tree but needs a separate build directory.


> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 2404c40..9de21b5 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -61,7 +61,12 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
>  
>  $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
> +
> +ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),NO)

 For all other variables like this (except _LIBTOOL_PATCH) we compare with YES,
not NO. So we should have:

$(2)_SUPPORTS_IN_SOURCE_BUILD ?= YES

ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
...


 Regards,
 Arnout

> +$(2)_BUILDDIR			= $$($(2)_SRCDIR)/buildroot-build
> +else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
> +endif
>  
>  #
>  # Configure step. Only define it if not already defined by the package
> @@ -73,7 +78,8 @@ ifeq ($(4),target)
>  
>  # Configure package for target
>  define $(2)_CONFIGURE_CMDS
> -	(cd $$($$(PKG)_BUILDDIR) && \
> +	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> +	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> @@ -98,7 +104,8 @@ else
>  
>  # Configure package for host
>  define $(2)_CONFIGURE_CMDS
> -	(cd $$($$(PKG)_BUILDDIR) && \
> +	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> +	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
