From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 4 Feb 2019 14:43:34 -0600
Subject: [Buildroot] [PATCH v4 2/3] openjdk: new package
In-Reply-To: <20190204085610.66064-3-aduskett@gmail.com>
References: <20190204085610.66064-1-aduskett@gmail.com>
 <20190204085610.66064-3-aduskett@gmail.com>
Message-ID: <CANQCQpaBymgYT12RmMABvEfcwDWuBb-nuu6Guh5P1eL=HqCDMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Mon, Feb 4, 2019 at 2:56 AM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
[snip]
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
> +       --with-boot-jdk=$(HOST_DIR)/openjdk \
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

Are there default profiles and cpu supported?  Could be good to note
in a comment above these explicit enables.

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

For this _CONF_OPTS and those below, suggest adding the else condition
and moving your defaults (--with-libjpeg=bundled) from above down
here.

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

It would be good to add a comment of why MAKE1

> +endef
> +
> +# Calling make install will build and install the JDK instad of the JRE,
> +# which makes manual installation necessary.
> +define OPENJDK_INSTALL_TARGET_CMDS
> +       cp -rf $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
> +       cp -rf $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +$(eval $(generic-package))
> --

Thanks for sending this out!
Matt
