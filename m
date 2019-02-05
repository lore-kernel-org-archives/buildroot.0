From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue,  5 Feb 2019 15:31:25 +0100
Subject: [Buildroot] [PATCH v5 2/3] openjdk: new package
In-Reply-To: <20190205143126.13857-1-aduskett@gmail.com>
References: <20190205143126.13857-1-aduskett@gmail.com>
Message-ID: <20190205143126.13857-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

OpenJDK is a free and open-source implementation of the Java Platform.
This package provides the option to build a client or a server JVM interpreter.

The default option is the server option, as that is what the majority of users
use. This JVM interpreter loads more slowly, putting more effort into JIT
compilations to yield higher performance.

Unlike most autotools packages, OpenJDK is exceptionally different and has many
quirks, some of which are documented below:

- X11, alsa, and cups are required to build Java, even if it's a headless build.

- There is no autogen.sh file, instead, a user calls ./configure autogen.

- If ccache is enabled, BuildRoot sets CC, CXX, and CPP to
  the ccache binary, which causes OpenJDK to throw an error during the
  configure step, so LD, CC, CXX, and CPP must set explicitly to the actual
  binaries.

- Some variables are ignored unless set as a configure option. These variables
  are OBJCOPY, OBJDUMP, NM, STRIP, and AR.

- Other variables must be environment variables, these are PATH, LD, CC, CXX, and CPP.

- Parallel make is possible, but not with make -jN, instead, one has to pass the
  --with-jobs=$(PARALLEL_JOBS) to ./configure, or pass JOBS=$(PARALLEL_JOBS) to
  make. The formner was chosen as it seems cleaner.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed the patch name.

Changes v2 -> v3:
  - Changed the install location of the libraries and binaries to
    $(TARGET_DIR)/bin and $(TARGET_DIR)/lib.

  - Changed -with-boot-jdk location to $(HOST_DIR)/openjdk

  - Added a more in-depth commit message explaining some of the my reasoning
    for some of the quirks in the package files.

Changes v3 -> v4:
  - Changed GPLv2+ -> GPL-2.0+ (Thomas)
  - Added BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS to Config.in
  - Removed first person wordage. (Thomas)

Changes v4 -> v5:
  - Add jpeg, giflib, libpng, and zlib as dependencies. (Thomas)
  - Remove dependencies that aren't necessary. (Thomas)
  - Add better comments in the openjdk.mk file. (Matthew)
  - Change --with-boot-jdk location to just $(HOST_DIR)
  - Use newer Oracle provided cpu port for aarch64.
  - Update version to 11.0.2+9

 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/openjdk/Config.in    |  56 ++++++++++++++++
 package/openjdk/openjdk.hash |   3 +
 package/openjdk/openjdk.mk   | 122 +++++++++++++++++++++++++++++++++++
 5 files changed, 183 insertions(+)
 create mode 100644 package/openjdk/Config.in
 create mode 100644 package/openjdk/openjdk.hash
 create mode 100644 package/openjdk/openjdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 460e4de7b9..e4f5ac6258 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -50,6 +50,7 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/nginx-naxsi/
+F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/policycoreutils/
 F:	package/python-flask-sqlalchemy/
diff --git a/package/Config.in b/package/Config.in
index bca61f14ed..e43770f7d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
new file mode 100644
index 0000000000..70cddc1ccc
--- /dev/null
+++ b/package/openjdk/Config.in
@@ -0,0 +1,56 @@
+config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_OPENJDK
+	bool "OpenJDK"
+	depends on !BR2_SOFT_FLOAT
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP # cups
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_GIFLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_ZLIB
+	help
+	  OpenJDK is a free and open-source implementation of the
+	  Java Platform.
+
+	  http://openjdk.java.net/
+
+if BR2_PACKAGE_OPENJDK
+
+menu "JVM Variants"
+
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
+	bool "client"
+	help
+	  Quick loading, but slower run-time performance.
+
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
+	bool "server"
+	default y
+	help
+	  Slower loading, but faster run-time performance.
+
+endmenu
+endif
+
+comment "OpenJDK needs X11, glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "OpenJDK does not support soft floats"
+	depends on BR2_SOFT_FLOAT
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
new file mode 100644
index 0000000000..8b14609066
--- /dev/null
+++ b/package/openjdk/openjdk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 6c69a2c1b5177659d4263545cf83e0fbcd697669b0107481372be3648af7b89b  openjdk-jdk-11.0.2+9.tar.gz
+sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
new file mode 100644
index 0000000000..8a4aaad3d0
--- /dev/null
+++ b/package/openjdk/openjdk.mk
@@ -0,0 +1,122 @@
+################################################################################
+#
+# openjdk
+#
+################################################################################
+
+OPENJDK_VERSION_MAJOR = 11.0.2
+OPENJDK_VERSION_MINOR = 9
+OPENJDK_VERSION=jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_RELEASE = jdk11u
+OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk11u,$(OPENJDK_VERSION))
+OPENJDK_LICENSE = GPL-2.0+ with exception
+OPENJDK_LICENSE_FILES = LICENSE
+
+OPENJDK_DEPENDENCIES = \
+	host-openjdk-bin \
+	host-pkgconf \
+	alsa-lib \
+	cups \
+	fontconfig \
+	giflib \
+	jpeg \
+	libpng \
+	libusb \
+	xlib_libXrender \
+	xlib_libXt \
+	xlib_libXtst \
+	zlib
+
+# JVM variants
+ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT),y)
+OPENJDK_JVM_VARIANTS += client
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER),y)
+OPENJDK_JVM_VARIANTS += server
+endif
+OPENJDK_JVM_VARIANT_LIST = $(subst $(space),$(comma),$(OPENJDK_JVM_VARIANTS))
+
+# Some environment variables will be ignored unless passed via environment
+# variables.
+# OpenJDK will default to ld, but will pass -Xlinker and -z as arguments,
+# which will cause compilation failures. Instead, tell OpenJDK to use gcc.
+# Furthermore, if ccache is enabled, BuildRoot will set CC,CXX, and CPP to
+# the ccache binary, which will cause OpenJDK to throw an error during the
+# configure step, so we must set these variables explicitly to the actual
+# binaries.
+OPENJDK_CONF_ENV = \
+	PATH=$(BR_PATH) \
+	LD=$(TARGET_CC) \
+	CC=$(TARGET_CC) \
+	CXX=$(TARGET_CXX) \
+	CPP=$(TARGET_CPP)
+
+OPENJDK_CONF_OPTS = \
+	--disable-full-docs \
+	--disable-hotspot-gtest \
+	--disable-manpages \
+	--disable-warnings-as-errors \
+	--enable-headless-only \
+	--enable-openjdk-only \
+	--enable-unlimited-crypto \
+	--openjdk-target=$(GNU_TARGET_NAME) \
+	--prefix=$(TARGET_DIR)/usr \
+	--with-boot-jdk=$(HOST_DIR) \
+	--with-debug-level=release \
+	--with-devkit=$(HOST_DIR) \
+	--with-extra-cflags="$(TARGET_CFLAGS)" \
+	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
+	--with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin \
+	--with-giflib=system \
+	--with-jobs=$(PARALLEL_JOBS) \
+	--with-jvm-variants=$(OPENJDK_JVM_VARIANT_LIST) \
+	--with-libjpeg=system \
+	--with-libpng=system \
+	--with-native-debug-symbols=none \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-vendor-name="AdoptOpenJDK" \
+	--with-vendor-url="https://adoptopenjdk.net/" \
+	--with-vendor-version-string="AdoptOpenJDK" \
+	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
+	--with-version-string="$(OPENJDK_VERSION_MAJOR)" \
+	--with-zlib=system \
+	--without-version-pre \
+	OBJCOPY=$(TARGET_OBJCOPY) \
+	OBJDUMP=$(TARGET_OBJDUMP) \
+	NM=$(TARGET_NM) \
+	STRIP=$(TARGET_STRIP) \
+	AR=$(TARGET_AR)
+
+# Use the newer Oracle provided cpu port for aarch64
+ifeq ($(BR2_aarch64),y)
+OPENJDK_CONF_OPTS += --with-cpu-port=arm64 --with-abi-profile=arm64
+endif
+
+ifeq ($(BR2_CCACHE),y)
+OPENJDK_CONF_OPTS += \
+	--enable-ccache \
+	--with-ccache-dir=$(BR2_CCACHE_DIR)
+endif
+
+# Autogen and configure are done in a single step.
+define OPENJDK_CONFIGURE_CMDS
+	chmod +x $(@D)/configure
+	cd $(@D); $(OPENJDK_CONF_ENV) ./configure autogen $(OPENJDK_CONF_OPTS)
+endef
+
+# Build just the JRE image for the target.
+# Make -jn is unsupported, so $(MAKE1) is called and --with-jobs is specified
+# in the configure options.
+define OPENJDK_BUILD_CMDS
+	$(MAKE1) -C $(@D) legacy-jre-image
+endef
+
+# Calling make install will build and install the JDK instad of the JRE,
+# which makes manual installation necessary.
+define OPENJDK_INSTALL_TARGET_CMDS
+	cp -rf $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
+	cp -rf $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.17.2 (Apple Git-113)
