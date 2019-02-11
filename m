From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 11 Feb 2019 14:10:49 -0500
Subject: [Buildroot] [PATCH v7 1/3] openjdk: new package
Message-ID: <20190211191051.62970-1-aduskett@gmail.com>
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
quirks, some of which are below:

- X11, alsa, and cups are required to build Java, even if it's a headless build.
  See http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#external-library-requirements
  for more information.

- host-zip is needed for the zip executable.

- There is no autogen.sh file, instead, a user must call "./configure autogen."

- OpenJDK ignores some variables unless passed via the environment.
  These variables are: PATH, LD, CC, CXX, and CPP.

- OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
  arguments during the linking process, which causes linking failures.
  To fix this issue, ld is set to gcc.

- If ccache is enabled, Buildroot sets CC, CXX, and CPP to the ccache binary,
  which causes the configuration error:
  "Please use --enable-ccache instead of providing a wrapped compiler."
  This error is why CC, CPP, and CXX are explicitly set to point to their
  actual binaries.

- Make -jn is unsupported. Instead, one must use the "--with-jobs=" configure
  option, and use $(MAKE1).

- Even when cross-compiling, OpenJDK builds several host-tools using the host's
  gcc. In the case of zlib, if a host doesn't have the zlib development package
  installed, OpenJDK compilation stops because zlib.h won't exist on the host
  system. Because zlib is used to compile both native tools and cross-compiled
  tools, patching make/autoconf/lib-bundled.m4 to call PKG_CHECK_MODULES for
  zlib results in the host gcc trying to use cross-compiled libraries for
  compiling native tools, which results in linking failures.
  Using --with-zlib=bundled allows OpenJDK to compile correctly.

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

Changes v5 -> v6:
  - Added comment about zlib in the commit message.
  - Added LCMS2 as a dependency.
  - Added more comments in Config.in
  - Added host-zip as a dependency in openjdk.mk.
  - Drop zlib as a dependency (See above comment.)
  - Changed --with-zlib=system to --with-zlib=bundled (See above comment.)
  - Cleaned up grammar in openjdk.mk.
  - Removed uneeded conf_opts in openjdk.mk.
  - Reverted previous change of --with-cpu-port=aarch64 to
    --with-cpu-port=arm64. This change breaks compiling, with missing calls to
    NativePltCall.

Changes v6 -> v7:
  - Removed AArch64 support in favor of a separate patch.
    OpenJDK works on AArch64 without the option; it just isn't as fast.
    This change makes the patch set follow section 21.5.1 of the Buildroot
    manual:
    "The patch itself should do only one change, but do it completely."
  - Fix typos (Thomas)
  - Clean up spacing in oppenjdk.mk (Thomas)
  - Add more explanations to the commit message (Thomas)
  - Clean up grammar in the openjdk.mk comments.
  - Clean up grammar in the commit message.
  - Reword many of the comments in the openjdk.mk file to better explain why
    the reasoning behind the logic.
  - Remove --prefix from configure options. This option is used only if
    "make install" is called.
  - Removed --with-extra-path=$(HOST_DIR)/bin:$(HOST_DIR)/sbin, as this is also
    not needed.
  - Change cp -rf to cp -dpfr for the OPENJDK_INSTALL_TARGET_CMDS step.


 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/openjdk/Config.in    |  56 +++++++++++++++++
 package/openjdk/openjdk.hash |   3 +
 package/openjdk/openjdk.mk   | 114 +++++++++++++++++++++++++++++++++++
 5 files changed, 175 insertions(+)
 create mode 100644 package/openjdk/Config.in
 create mode 100644 package/openjdk/openjdk.hash
 create mode 100644 package/openjdk/openjdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 89a8e2d2a2..a36c359561 100644
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
index 29862c478c..4bd946d65e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -668,6 +668,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
new file mode 100644
index 0000000000..4dd55764b7
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
+	depends on !BR2_STATIC_LIBS # Glibc
+	depends on BR2_INSTALL_LIBSTDCPP # cups
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_USE_MMU # cups
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_GIFLIB
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XLIB_LIBXTST
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
index 0000000000..5a486dd200
--- /dev/null
+++ b/package/openjdk/openjdk.mk
@@ -0,0 +1,114 @@
+################################################################################
+#
+# openjdk
+#
+################################################################################
+
+OPENJDK_VERSION_MAJOR = 11.0.2
+OPENJDK_VERSION_MINOR = 9
+OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk11u,$(OPENJDK_VERSION))
+OPENJDK_LICENSE = GPL-2.0+ with exception
+OPENJDK_LICENSE_FILES = LICENSE
+
+# OpenJDK requires Alsa, cups, and X11 even for a headless build.
+# host-zip is needed for the zip executable.
+OPENJDK_DEPENDENCIES = \
+	host-openjdk-bin \
+	host-pkgconf \
+	host-zip \
+	alsa-lib \
+	cups \
+	fontconfig \
+	giflib \
+	jpeg \
+	lcms2 \
+	libpng \
+	libusb \
+	xlib_libXrender \
+	xlib_libXt \
+	xlib_libXtst
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
+# OpenJDK ignores some variables unless passed via the environment.
+# These variables are PATH, LD, CC, CXX, and CPP.
+# OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
+# arguments during the linking process, which causes compilation failures.
+# To fix this issue, LD is set to point to gcc.
+# If ccache is enabled, Buildroot sets CC, CXX, and CPP to the ccache binary,
+# which causes the configuration error:
+# "Please use --enable-ccache instead of providing a wrapped compiler."
+# This error is why CC, CPP, and CXX are explicitly set to point to their
+# actual binaries.
+OPENJDK_CONF_ENV = \
+	PATH=$(BR_PATH) \
+	CC=$(TARGET_CC) \
+	CPP=$(TARGET_CPP) \
+	CXX=$(TARGET_CXX) \
+	LD=$(TARGET_CC)
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
+	--with-boot-jdk=$(HOST_DIR) \
+	--with-debug-level=release \
+	--with-devkit=$(HOST_DIR) \
+	--with-extra-cflags="$(TARGET_CFLAGS)" \
+	--with-extra-cxxflags="$(TARGET_CXXFLAGS)" \
+	--with-giflib=system \
+	--with-jobs=$(PARALLEL_JOBS) \
+	--with-jvm-variants=$(OPENJDK_JVM_VARIANT_LIST) \
+	--with-lcms=system \
+	--with-libjpeg=system \
+	--with-libpng=system \
+	--with-native-debug-symbols=none \
+	--without-version-pre \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-vendor-name="AdoptOpenJDK" \
+	--with-vendor-url="https://adoptopenjdk.net/" \
+	--with-vendor-version-string="AdoptOpenJDK" \
+	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
+	--with-version-string="$(OPENJDK_VERSION_MAJOR)" \
+	--with-zlib=bundled
+
+ifeq ($(BR2_CCACHE),y)
+OPENJDK_CONF_OPTS += \
+	--enable-ccache \
+	--with-ccache-dir=$(BR2_CCACHE_DIR)
+endif
+
+# Autogen and configure are performed in a single step.
+define OPENJDK_CONFIGURE_CMDS
+	chmod +x $(@D)/configure
+	cd $(@D); $(OPENJDK_CONF_ENV) ./configure autogen $(OPENJDK_CONF_OPTS)
+endef
+
+# Make -jn is unsupported. Instead, set the "--with-jobs=" configure option,
+# and use $(MAKE1).
+define OPENJDK_BUILD_CMDS
+	$(MAKE1) -C $(@D) legacy-jre-image
+endef
+
+# Calling make install always builds and installs the JDK instead of the JRE,
+# which makes manual installation necessary.
+define OPENJDK_INSTALL_TARGET_CMDS
+	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/* $(TARGET_DIR)/usr/bin/
+	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
