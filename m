From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:18:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libspatialindex: bump to
 version 1.9.0
In-Reply-To: <20190921183547.28206-1-fontaine.fabrice@gmail.com>
References: <20190921183547.28206-1-fontaine.fabrice@gmail.com>
Message-ID: <5edd1037-d226-a052-df14-9c096a9a0a7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 21/09/2019 20:35, Fabrice Fontaine wrote:
> - Switch site to github to get latest version
> - Switch to cmake to be able to disable tests
> - Drop patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-configure.ac-do-not-force-O2.patch   | 30 -------------------
>  package/libspatialindex/libspatialindex.hash  |  9 +++---
>  package/libspatialindex/libspatialindex.mk    | 11 ++++---
>  3 files changed, 10 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libspatialindex/0001-configure.ac-do-not-force-O2.patch
> 
[snip]
> diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
> index 8dd85e2700..f5a6d3acac 100644
> --- a/package/libspatialindex/libspatialindex.mk
> +++ b/package/libspatialindex/libspatialindex.mk
> @@ -4,15 +4,14 @@
>  #
>  ################################################################################
>  
> -LIBSPATIALINDEX_VERSION = 1.8.5
> -LIBSPATIALINDEX_SITE = http://download.osgeo.org/libspatialindex
> +LIBSPATIALINDEX_VERSION = 1.9.0
> +LIBSPATIALINDEX_SITE = \
> +	https://github.com/libspatialindex/libspatialindex/releases/download/$(LIBSPATIALINDEX_VERSION)
>  LIBSPATIALINDEX_SOURCE = spatialindex-src-$(LIBSPATIALINDEX_VERSION).tar.bz2
>  LIBSPATIALINDEX_INSTALL_STAGING = YES
>  LIBSPATIALINDEX_LICENSE = MIT
>  LIBSPATIALINDEX_LICENSE_FILES = COPYING
> -
> -# 0001-configure.ac-do-not-force-O2.patch
> -LIBSPATIALINDEX_AUTORECONF = YES
> +LIBSPATIALINDEX_CONF_OPTS = -DSIDX_BUILD_TESTS=OFF
>  
>  LIBSPATIALINDEX_CXXFLAGS = $(TARGET_CXXFLAGS)
>  LIBSPATIALINDEX_CONF_ENV = CXXFLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"

 I don't think this still works with CMake, you have to set
-DCMAKE_CXX_FLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"


 It would be better to do the cmake conversion in a separate patch, if that is
possible.


 Regards,
 Arnout

> @@ -21,4 +20,4 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>  LIBSPATIALINDEX_CXXFLAGS += -O0
>  endif
>  
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
> 
