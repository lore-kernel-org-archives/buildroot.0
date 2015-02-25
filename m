From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Wed, 25 Feb 2015 10:40:19 +0100
Subject: [Buildroot] [PATCH 1/4] pkg-cmake: allow to build package in a
 subdirectory
In-Reply-To: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
References: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150225104019.48948b35@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

up

On Tue, 17 Feb 2015 18:55:11 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

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
> @@ -57,7 +57,11 @@ $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
>  $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
>  
>  $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
> +ifneq ($$($2)_BUILD_DIR,)
> +$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/$$($(2)_BUILD_DIR)
> +else
>  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
> +endif
>  
>  #
>  # Configure step. Only define it if not already defined by the package
> @@ -69,7 +73,8 @@ ifeq ($(4),target)
>  
>  # Configure package for target
>  define $(2)_CONFIGURE_CMDS
> -	(cd $$($$(PKG)_BUILDDIR) && \
> +	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> +	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> @@ -93,7 +98,8 @@ else
>  
>  # Configure package for host
>  define $(2)_CONFIGURE_CMDS
> -	(cd $$($$(PKG)_BUILDDIR) && \
> +	(mkdir -p $$($$(PKG)_BUILDDIR) && \
> +	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
>  	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
> -- 
> 2.0.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
