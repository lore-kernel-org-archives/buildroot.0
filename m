From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 15:00:21 +0100
Subject: [Buildroot] [PATCH v6 2/3] openjdk: new package
In-Reply-To: <20190209204716.38581-2-aduskett@gmail.com>
References: <20190209204716.38581-1-aduskett@gmail.com>
 <20190209204716.38581-2-aduskett@gmail.com>
Message-ID: <20190210150021.7dbf0d9e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Sat,  9 Feb 2019 15:47:15 -0500
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> OpenJDK is a free and open-source implementation of the Java Platform.
> This package provides the option to build a client or a server JVM interpreter.
> 
> The default option is the server option, as that is what the majority of users
> use. This JVM interpreter loads more slowly, putting more effort into JIT
> compilations to yield higher performance.
> 
> Unlike most autotools packages, OpenJDK is exceptionally different and has many
> quirks, some of which are documented below:
> 
> - X11, alsa, and cups are required to build Java, even if it's a headless build.
> 
> - There is no autogen.sh file, instead, a user calls ./configure autogen.
> 
> - If ccache is enabled, BuildRoot sets CC, CXX, and CPP to

Buildroot, not BuildRoot

> - Even when cross-compiling, OpenJDK will build a myriad of host-tools using the
>   host's gcc. In the case of zlib, if a host doesn't have the zlib dev
>   package installed, OpenJDK compilation will stop because zlib.h won't be on
>   the host system. Using --with-zlib=bundled fixes this issue.

Meh, this looks dubious. What's happening exactly ?

> Changes v5 -> v6:
>   - Added comment about zlib in the commit message.
>   - Added LCMS2 as a dependency.
>   - Added more comments in Config.in
>   - Added host-zip as a dependency in openjdk.mk.

Why is host-zip needed ?


> +OPENJDK_VERSION_MAJOR = 11.0.2
> +OPENJDK_VERSION_MINOR = 9
> +OPENJDK_VERSION=jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)

Spaces around =

> +OPENJDK_RELEASE = jdk11u

Unless I missed something, this variable is not used anywhere.

> +OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk11u,$(OPENJDK_VERSION))
> +OPENJDK_LICENSE = GPL-2.0+ with exception
> +OPENJDK_LICENSE_FILES = LICENSE
> +
> +OPENJDK_DEPENDENCIES = \
> +	host-openjdk-bin \
> +	host-pkgconf \
> +	host-zip \
> +	alsa-lib \
> +	cups \
> +	fontconfig \
> +	giflib \
> +	jpeg \
> +	lcms2 \
> +	libpng \
> +	libusb \
> +	xlib_libXrender \
> +	xlib_libXt \
> +	xlib_libXtst
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
> +# Some variables will be ignored unless passed via the environment.
> +# OpenJDK will default to ld, but will pass -Xlinker and -z as arguments,
> +# which will cause compilation failures. Instead, tell OpenJDK to use gcc.
> +# Furthermore, if ccache is enabled, BuildRoot will set CC,CXX, and CPP to

BuildRoot -> Buildroot

> +# the ccache binary, which will cause OpenJDK to throw an error during the
> +# configure step, so we must set these variables explicitly to the actual
> +# binaries.
> +OPENJDK_CONF_ENV = \
> +	PATH=$(BR_PATH) \
> +	LD=$(TARGET_CC) \
> +	CC=$(TARGET_CC) \
> +	CXX=$(TARGET_CXX) \
> +	CPP=$(TARGET_CPP)
> +
> +OPENJDK_CONF_OPTS = \
> +	--disable-full-docs \
> +	--disable-hotspot-gtest \
> +	--disable-manpages \
> +	--disable-warnings-as-errors \
> +	--enable-headless-only \

So even if you enable this option, it depends on X11 ?

> +	--enable-openjdk-only \
> +	--enable-unlimited-crypto \
> +	--openjdk-target=$(GNU_TARGET_NAME) \
> +	--prefix=$(TARGET_DIR)/usr \

This looks suspicious. It should be --prefix=/usr, unless OpenJDK has a
non-standard semantic for --prefix.

> +	--with-boot-jdk=$(HOST_DIR) \
> +	--with-debug-level=release \
> +	--with-devkit=$(HOST_DIR) \
> +	--with-extra-cflags="$(TARGET_CFLAGS)" \
> +	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
> +	--with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin \
> +	--with-giflib=system \
> +	--with-jobs=$(PARALLEL_JOBS) \
> +	--with-jvm-variants=$(OPENJDK_JVM_VARIANT_LIST) \
> +	--with-lcms=system \
> +	--with-libjpeg=system \
> +	--with-libpng=system \
> +	--with-zlib=bundled \
> +	--with-native-debug-symbols=none \
> +	--with-sysroot=$(STAGING_DIR) \
> +	--with-vendor-name="AdoptOpenJDK" \
> +	--with-vendor-url="https://adoptopenjdk.net/" \
> +	--with-vendor-version-string="AdoptOpenJDK" \
> +	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
> +	--with-version-string="$(OPENJDK_VERSION_MAJOR)" \
> +	--without-version-pre
> +
> +# If building for aarch64, use the provided cpu port.
> +ifeq ($(BR2_aarch64),y)
> +OPENJDK_CONF_OPTS += --with-cpu-port=aarch64 --with-abi-profile=aarch64
> +endif

What about other architectures ? For example, ARM also has some
--with-cpu-port/--with-abi-profile options.

> +# Calling make install will build and install the JDK instad of the JRE,

instad -> instead

> +# which makes manual installation necessary.
> +define OPENJDK_INSTALL_TARGET_CMDS
> +	cp -rf $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
> +	cp -rf $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +$(eval $(generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
