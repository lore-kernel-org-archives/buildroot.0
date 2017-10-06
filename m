From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 6 Oct 2017 18:27:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] tbb: new package
In-Reply-To: <20170928235043.31891-2-bradford@density.io>
References: <20170928235043.31891-1-bradford@density.io>
 <20170928235043.31891-2-bradford@density.io>
Message-ID: <CAGm1_kuOScex2Tb7Eh-z9c2Gzd6PWn3-cyM=QM69PeECjzvZ9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bradford,

On Fri, Sep 29, 2017 at 1:50 AM, Bradford Barr <bradford@density.io> wrote:
> From: bradford barr <bradford@density.io>
>
> Intel Threading Building Blocks (TBB), is a C++ library to help developers
> write highly parallelized applications. OpenCV uses it to accelerate some of
> it's more heavy weight procedures.
>
> Signed-off-by: bradford barr <bradford@density.io>
> ---
>  package/Config.in                    |  1 +
>  package/tbb/0001-cross-compile.patch | 41 +++++++++++++++++++++++++++++
>  package/tbb/Config.in                | 16 ++++++++++++
>  package/tbb/tbb.hash                 |  2 ++
>  package/tbb/tbb.mk                   | 50 ++++++++++++++++++++++++++++++++++++

DEVELOPERS file entry missing.

Yegor

>  5 files changed, 110 insertions(+)
>  create mode 100644 package/tbb/0001-cross-compile.patch
>  create mode 100644 package/tbb/Config.in
>  create mode 100644 package/tbb/tbb.hash
>  create mode 100644 package/tbb/tbb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1580a9e..7ea362e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1504,6 +1504,7 @@ endif
>         source "package/skalibs/Config.in"
>         source "package/sphinxbase/Config.in"
>         source "package/startup-notification/Config.in"
> +       source "package/tbb/Config.in"
>         source "package/tinycbor/Config.in"
>         source "package/tz/Config.in"
>         source "package/tzdata/Config.in"
> diff --git a/package/tbb/0001-cross-compile.patch b/package/tbb/0001-cross-compile.patch
> new file mode 100644
> index 0000000..7c57603
> --- /dev/null
> +++ b/package/tbb/0001-cross-compile.patch
> @@ -0,0 +1,41 @@
> +Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: unsuitable
> +
> +Signed-off-by: bradford barr <bradford@density.io>
> +---
> + build/linux.gcc.inc |    5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +Index: tbb2017_20170118oss/build/linux.gcc.inc
> +===================================================================
> +--- tbb2017_20170118oss.orig/build/linux.gcc.inc
> ++++ tbb2017_20170118oss/build/linux.gcc.inc
> +@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
> + EXPORT_KEY = -Wl,--version-script,
> + LIBDL = -ldl
> +
> +-CPLUS = g++
> +-CONLY = gcc
> ++CPLUS = $(CXX)
> ++CONLY = $(CC)
> ++CPLUS_FLAGS = $(CXXFLAGS)
> + LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> + LIBS += -lpthread -lrt
> + LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> +Index: tbb2017_20170118oss/build/linux.clang.inc
> +===================================================================
> +--- tbb2017_20170118oss.orig/build/linux.clang.inc
> ++++ tbb2017_20170118oss/build/linux.clang.inc
> +@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
> + EXPORT_KEY = -Wl,--version-script,
> + LIBDL = -ldl
> +
> +-CPLUS = clang++
> +-CONLY = clang
> ++CPLUS = $(CXX)
> ++CONLY = $(CC)
> ++CPLUS_FLAGS = $(CXXFLAGS)
> + LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> + LIBS += -lpthread -lrt
> + LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
> new file mode 100644
> index 0000000..eda1f09
> --- /dev/null
> +++ b/package/tbb/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_TBB
> +       bool "tbb"
> +       depends on !BR2_STATIC_LIBS
> +       depends on BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       help
> +         Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
> +         easily write parallel C++ programs that take full advantage
> +         of multicore performance, that are portable, composable and
> +         have future-proof scalability.
> +
> +         https://www.threadingbuildingblocks.org/
> +
> +comment "tbb needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> new file mode 100644
> index 0000000..2a3cd6e
> --- /dev/null
> +++ b/package/tbb/tbb.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  c6462217d4ecef2b44fce63cfdf31f9db4f6ff493869899d497a5aef68b05fc5  tbb-2018_U1.tar.gz
> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> new file mode 100644
> index 0000000..ad94a27
> --- /dev/null
> +++ b/package/tbb/tbb.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# tbb
> +#
> +################################################################################
> +
> +TBB_VERSION = 2018_U1
> +TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
> +TBB_INSTALL_STAGING = YES
> +TBB_LICENSE = Apache-2.0
> +TBB_LICENSE_FILES = LICENSE
> +
> +TBB_SO_VERSION = 2
> +TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
> +
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +TBB_BIN_PATH = $(@D)/build/linux_*_debug
> +else
> +TBB_BIN_PATH = $(@D)/build/linux_*_release
> +endif
> +
> +define TBB_BUILD_CMDS
> +       $(MAKE) $(TARGET_CONFIGURE_OPTS) arch=$(BR2_ARCH) -C $(@D)
> +endef
> +
> +define TBB_INSTALL_LIBS
> +       $(foreach lib,$(TBB_LIBS),
> +               $(if $(BR2_ENABLE_DEBUG),
> +                       $(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib)_debug.so.$(TBB_SO_VERSION) \
> +                               $(1)/usr/lib/$(lib)_debug.so.$(TBB_SO_VERSION) ;
> +                       ln -sf $(lib)_debug.so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib)_debug.so
> +               ,
> +                       $(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
> +                               $(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
> +                       ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
> +               )
> +       )
> +endef
> +
> +define TBB_INSTALL_STAGING_CMDS
> +       mkdir -p $(STAGING_DIR)/usr/include/tbb
> +       cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/tbb
> +       $(call TBB_INSTALL_LIBS,$(STAGING_DIR))
> +endef
> +
> +define TBB_INSTALL_TARGET_CMDS
> +       $(call TBB_INSTALL_LIBS,$(TARGET_DIR))
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
