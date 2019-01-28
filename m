From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Jan 2019 20:42:16 +0100
Subject: [Buildroot] [PATCH v2 2/2] openjdk: new package
In-Reply-To: <20190128163624.107243-3-aduskett@gmail.com>
References: <20190128163624.107243-1-aduskett@gmail.com>
 <20190128163624.107243-3-aduskett@gmail.com>
Message-ID: <CAAXf6LXnxXDQ2aMSaZKVdy957OrhfZBeLx_i_uriditacxQMuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El lun., 28 ene. 2019 a las 17:36, <aduskett@gmail.com> escribi?:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> OpenJDK is a free and open-source implementation of the Java Platform.
> This package provides the option to build a client or a server JVM interpreter.
>
> The default option is the server option, as that is what the majority of users
> use. This JVM interpreter loads more slowly, putting more effort into JIT
> compilations to yield higher performance.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fixed the patch name.
>
>  DEVELOPERS                   |   1 +
>  package/Config.in            |   1 +
>  package/openjdk/Config.in    |  54 ++++++++++++++
>  package/openjdk/openjdk.hash |   3 +
>  package/openjdk/openjdk.mk   | 141 +++++++++++++++++++++++++++++++++++
>  5 files changed, 200 insertions(+)
>  create mode 100644 package/openjdk/Config.in
>  create mode 100644 package/openjdk/openjdk.hash
>  create mode 100644 package/openjdk/openjdk.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 28ba480d85..0893af58dc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -50,6 +50,7 @@ F:    package/libselinux/
>  F:     package/libsemanage/
>  F:     package/libsepol/
>  F:     package/nginx-naxsi/
> +F:     package/openjdk/
>  F:     package/openjdk-bin/
>  F:     package/policycoreutils/
>  F:     package/python-flask-sqlalchemy/
> diff --git a/package/Config.in b/package/Config.i
> index 5036421a73..e150e32563 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -671,6 +671,7 @@ menu "Mono libraries/modules"
>  endmenu
>  endif
>         source "package/nodejs/Config.in"
> +       source "package/openjdk/Config.in"
>         source "package/perl/Config.in"
>  if BR2_PACKAGE_PERL
>  menu "Perl libraries/modules"
> diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
> new file mode 100644
> index 0000000000..287e1077e7
> --- /dev/null
> +++ b/package/openjdk/Config.in
> @@ -0,0 +1,54 @@
> +config BR2_PACKAGE_OPENJDK
> +       bool "OpenJDK"
> +       depends on !BR2_SOFT_FLOAT
> +       depends on !BR2_STATIC_LIBS
> +       depends on BR2_INSTALL_LIBSTDCPP # gtk2, cups
> +       depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
> +       depends on BR2_PACKAGE_XORG7
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # gtk2 -> pango -> harfbuzz
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # gtk2 -> glib2
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       depends on BR2_USE_MMU # gtk2 -> glib2
> +       depends on BR2_USE_WCHAR # gtk2 -> glib2
> +       select BR2_PACKAGE_ALSA_LIB
> +       select BR2_PACKAGE_CUPS
> +       select BR2_PACKAGE_FONTCONFIG
> +       select BR2_PACKAGE_HOST_OPENJDK_BIN
> +       select BR2_PACKAGE_LIBUSB
> +       select BR2_PACKAGE_XLIB_LIBXRENDER
> +       select BR2_PACKAGE_XLIB_LIBXT
> +       select BR2_PACKAGE_XLIB_LIBXTST
> +       help
> +         OpenJDK is a free and open-source implementation of the
> +         Java Platform.
> +
> +         http://openjdk.java.net/
> +
> +if BR2_PACKAGE_OPENJDK
> +
> +menu "JVM Variants"
> +
> +config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
> +       bool "client"
> +       help
> +         Quick loading, but slower run-time performance.
> +
> +config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
> +       bool "server"
> +       default y
> +         Slower loading, but faster run-time performance.
> +
> +endmenu
> +endif
> +
> +comment "OpenJDK needs a glibc toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +       depends on BR2_PACKAGE_XORG7
> +       depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
> +               !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS || \
> +               !BR2_TOOLCHAIN_USES_GLIBC
> +
> +comment "OpenJDK does not support soft floats"
> +       depends on BR2_SOFT_FLOAT
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> new file mode 100644
> index 0000000000..dc201863a7
> --- /dev/null
> +++ b/package/openjdk/openjdk.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256 9bb8c44e42fbfcee8402f6d0722fbe2209647b7959544d924a6790bc053e8f20  openjdk-jdk-11.0.2+7.tar.gz
> +sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> new file mode 100644
> index 0000000000..8717320693
> --- /dev/null
> +++ b/package/openjdk/openjdk.mk
> @@ -0,0 +1,141 @@
> +################################################################################
> +#
> +# openjdk
> +#
> +################################################################################
> +
> +OPENJDK_VERSION_MAJOR = 11.0.2
> +OPENJDK_VERSION_MINOR = 7
> +OPENJDK_VERSION=jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
> +OPENJDK_RELEASE = jdk11u
> +OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk11u,$(OPENJDK_VERSION))
> +OPENJDK_LICENSE = GPLv2+ with exception
> +OPENJDK_LICENSE_FILES = LICENSE
> +
> +OPENJDK_DEPENDENCIES = \
> +       host-openjdk-bin \
> +       host-pkgconf \
> +       alsa-lib \
> +       cups \
> +       fontconfig \
> +       libusb \
> +       xlib_libXrender \
> +       xlib_libXt \
> +       xlib_libXtst
> +
> +# JVM variants
> +ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT),y)
> +OPENJDK_JVM_VARIANTS += client
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER),y)
> +OPENJDK_JVM_VARIANTS += server
> +endif
> +OPENJDK_JVM_VARIANT_LIST = $(subst $(space),$(comma),$(OPENJDK_JVM_VARIANTS))
> +
> +# Some environment variables will be ignored unless passed via environment
> +# variables.
> +# OpenJDK will default to ld, but will pass -Xlinker and -z as arguments,
> +# which will cause compilation failures. Instead, tell OpenJDK to use gcc.
> +# Furthermore, if ccache is enabled, BuildRoot will set CC,CXX, and CPP to
> +# the ccache binary, which will cause OpenJDK to throw an error during the
> +# configure step, so we must set these variables explicitly to the actual
> +# binaries.
> +OPENJDK_CONF_ENV = \
> +       PATH=$(BR_PATH) \
> +       LD=$(TARGET_CC) \
> +       CC=$(TARGET_CC) \
> +       CXX=$(TARGET_CXX) \
> +       CPP=$(TARGET_CPP)
> +
> +OPENJDK_CONF_OPTS = \
> +       --disable-full-docs \
> +       --disable-hotspot-gtest \
> +       --disable-manpages \
> +       --disable-warnings-as-errors \
> +       --enable-headless-only \
> +       --enable-openjdk-only \
> +       --enable-unlimited-crypto \
> +       --openjdk-target=$(GNU_TARGET_NAME) \
> +       --prefix=$(TARGET_DIR)/usr \
> +       --with-boot-jdk=$(HOST_OPENJDK_BIN_INSTALL_DIR) \
> +       --with-debug-level=release \
> +       --with-devkit=$(HOST_DIR) \
> +       --with-extra-cflags="$(TARGET_CFLAGS)" \
> +       --with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> +       --with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin \
> +       --with-giflib=bundled \
> +       --with-jobs=$(PARALLEL_JOBS) \
> +       --with-jvm-variants=$(OPENJDK_JVM_VARIANT_LIST) \
> +       --with-libjpeg=bundled \
> +       --with-libpng=bundled \
> +       --with-native-debug-symbols=none \
> +       --without-version-pre \
> +       --with-sysroot=$(STAGING_DIR) \
> +       --with-vendor-name="AdoptOpenJDK" \
> +       --with-vendor-url="https://adoptopenjdk.net/" \
> +       --with-vendor-version-string="AdoptOpenJDK" \
> +       --with-version-build="$(OPENJDK_VERSION_MAJOR)" \
> +       --with-version-string="$(OPENJDK_VERSION_MAJOR)" \
> +       --with-zlib=bundled \
> +       OBJCOPY=$(TARGET_OBJCOPY) \
> +       OBJDUMP=$(TARGET_OBJDUMP) \
> +       NM=$(TARGET_NM) \
> +       STRIP=$(TARGET_STRIP) \
> +       AR=$(TARGET_AR)
> +
> +ifeq ($(BR2_aarch64),y)
> +OPENJDK_CONF_OPTS += --with-cpu-port=aarch64 --with-abi-profile=aarch64
> +endif
> +
> +ifeq ($(BR2_CCACHE),y)
> +OPENJDK_CONF_OPTS += \
> +       --enable-ccache \
> +       --with-ccache-dir=$(BR2_CCACHE_DIR)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JPEG),y)
> +OPENJDK_DEPENDENCIES += jpeg
> +OPENJDK_CONF_OPTS += --with-libjpeg=system
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> +OPENJDK_DEPENDENCIES += giflib
> +OPENJDK_CONF_OPTS += --with-giflib=system
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBPNG),y)
> +OPENJDK_DEPENDENCIES += libpng
> +OPENJDK_CONF_OPTS += --with-libpng=system
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +OPENJDK_DEPENDENCIES += libzlib
> +OPENJDK_CONF_OPTS += --with-zlib=system
> +endif
> +
> +# Autogen and configure are done in a single step.
> +define OPENJDK_CONFIGURE_CMDS
> +       chmod +x $(@D)/configure
> +       cd $(@D); $(OPENJDK_CONF_ENV) ./configure autogen $(OPENJDK_CONF_OPTS)
> +endef
> +
> +# Build just the JRE image for the target.
> +define OPENJDK_BUILD_CMDS
> +       $(MAKE1) -C $(@D) legacy-jre-image
> +endef

In the openjdk package I sent last year, I did this:

+ $(OPENJDK_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1)
JOBS=$(PARALLEL_JOBS) -C $(@D) $(OPENJDK_MAKE_OPTS) images

I have following questions:

- what is the difference between 'images' and 'legacy-jre-image'.
- did you consider passing 'JOBS' to enable parallel compilation?


Best regards,
Thomas
