From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:35:00 +0200
Subject: [Buildroot] [git commit] lcdapi: bump version to fix
 static-only build
In-Reply-To: <20140719090138.272F99D28A@busybox.osuosl.org>
References: <20140719090138.272F99D28A@busybox.osuosl.org>
Message-ID: <20140719113500.4ee64f69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

You're the upstream for lcdapi. If you have a bit of time, it'd be
great to fix the two issues above:

 * Improper installation of examples and docs.

 * The need to create the m4 directory manually for autoreconf to work
   correctly.

Also, tagging a new release after the autotools migration is over would
be nice.

Thanks!

Thomas

On Sat, 19 Jul 2014 11:00:19 +0200, Thomas Petazzoni wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=4638e2b97f783346c2c9e18f233a35755e49e7dc
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The upstream lcdapi has moved over from a basic Makefile to the
> autotools build system, which has the advantage of fixing static-only
> build. Therefore, this commit bumps the lcdapi version. Unfortunately,
> one patch is needed to fix an upstream issue.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/6fd/6fd65b3fd7d6f439ed14dc38fb28ad3e8e6678b1/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...0001-Remove-installation-of-docs-examples.patch |   39 ++++++++++++++++++++
>  package/lcdapi/lcdapi.mk                           |   20 +++-------
>  2 files changed, 45 insertions(+), 14 deletions(-)
> 
> diff --git a/package/lcdapi/lcdapi-0001-Remove-installation-of-docs-examples.patch b/package/lcdapi/lcdapi-0001-Remove-installation-of-docs-examples.patch
> new file mode 100644
> index 0000000..dcadcf4
> --- /dev/null
> +++ b/package/lcdapi/lcdapi-0001-Remove-installation-of-docs-examples.patch
> @@ -0,0 +1,39 @@
> +From ede0fa7d410be407164b68570a1540378bf0bd09 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sat, 19 Jul 2014 10:40:59 +0200
> +Subject: [PATCH] Remove installation of docs/examples
> +
> +They get installed in the wrong directory, i.e if DESTDIR is
> +/path/to/output/target, they will be installed in
> +/path/to/output/target./examples and /path/to/output/target./docs.
> +
> +Since we don't need docs and examples in Buildroot anyway, simply get
> +rid of them.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + Makefile.am | 11 -----------
> + 1 file changed, 11 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index c56860a..6b1267b 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -69,14 +69,3 @@ liblcdapi_la_CXXFLAGS = \
> + 	-g0 -DNODEBUG -Os
> + 
> + ACLOCAL_AMFLAGS = -I m4
> +-
> +-docsdir = $(top_srcdir)/docs
> +-exampledir = $(top_srcdir)/example
> +-dist_docs_DATA = \
> +-	docs/Makefile.am \
> +-	docs/Makefile.in \
> +-	docs/Doxyfile.in
> +-dist_example_DATA = \
> +-	example/client.cpp \
> +-	example/Makefile.am \
> +-	example/Makefile.in
> +-- 
> +2.0.0
> +
> diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
> index d90511d..bcf5c47 100644
> --- a/package/lcdapi/lcdapi.mk
> +++ b/package/lcdapi/lcdapi.mk
> @@ -4,25 +4,17 @@
>  #
>  ################################################################################
>  
> -LCDAPI_VERSION = v0.4
> +LCDAPI_VERSION = dbbdca06f271b8cf81b4817a9da3d558cfe59905
>  LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
>  LCDAPI_LICENSE = LGPLv2.1+
>  LCDAPI_LICENSE_FILES = COPYING
> -
> +LCDAPI_AUTORECONF = YES
>  LCDAPI_INSTALL_STAGING = YES
>  
> -define LCDAPI_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> -endef
> -
> -define LCDAPI_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> -		DESTDIR="$(STAGING_DIR)" install
> +define LCDAPI_CREATE_M4_DIR
> +	mkdir -p $(@D)/m4
>  endef
>  
> -define LCDAPI_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> -		DESTDIR="$(TARGET_DIR)" install
> -endef
> +LCDAPI_POST_PATCH_HOOKS += LCDAPI_CREATE_M4_DIR
>  
> -$(eval $(generic-package))
> +$(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
