From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 13:49:35 +0100
Subject: [Buildroot] [git commit] package/openjdk: new package
Message-ID: <20190317124716.AA5188EA53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5366b8f734fe7aff7e95c1f92627265c5a75becc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenJDK is a free and open-source implementation of the Java Platform.
This package provides the option to build a client or a server JVM
interpreter.

The default option is the server option, as that is what the majority
of users use. This JVM interpreter loads more slowly, putting more
effort into JIT compilations to yield higher performance.

Unlike most autotools packages, OpenJDK is exceptionally different and
has many quirks, some of which are below:

- X11, alsa, and cups are required to build Java, even if it's a headless build.
  See
  http://hg.openjdk.java.net/jdk10/jdk10/raw-file/tip/common/doc/building.html#external-library-requirements
  for more information.

- host-zip is needed for the zip executable.

- There is no autogen.sh file, instead, a user must call "./configure
  autogen."

- OpenJDK ignores some variables unless passed via the environment.
  These variables are: PATH, LD, CC, CXX, and CPP.

- OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
  arguments during the linking process, which causes linking failures.
  To fix this issue, ld is set to gcc.

- Make -jn is unsupported. Instead, one must use the "--with-jobs="
  configure option, and use $(MAKE1).

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas:
 - drop explanations about CC, LD, CXX, etc. be set to their "actual
   binaries" instead of ccache: TARGET_CC/TARGET_LD/TARGET_CXX point
   to the compiler wrapper, so the usage of ccache is hidden
 - make sure at least one of the variants is enabled in Config.in
 - drop the submenu for variant selection
 - use system zlib instead of the bundled one. This works fine when
   BUILD_SYSROOT_CFLAGS and BUILD_SYSROOT_LDFLAGS are passed
 - fix minor nits in the Config.in comments]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/openjdk/Config.in    |  60 +++++++++++++++++++++++
 package/openjdk/openjdk.hash |   3 ++
 package/openjdk/openjdk.mk   | 113 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 178 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a188b075fe..4412c4512e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -51,6 +51,7 @@ F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/libwebsockets/
 F:	package/nginx-naxsi/
+F:	package/openjdk/
 F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
diff --git a/package/Config.in b/package/Config.in
index bc855060c9..6891004660 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
new file mode 100644
index 0000000000..96eef79eb0
--- /dev/null
+++ b/package/openjdk/Config.in
@@ -0,0 +1,60 @@
+config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "x86_64"
+
+config BR2_PACKAGE_OPENJDK
+	bool "openjdk"
+	depends on !BR2_SOFT_FLOAT
+	depends on !BR2_STATIC_LIBS # glibc
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
+	select BR2_PACKAGE_ZLIB
+	# make sure at least one variant is enabled
+	select BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER \
+	       if !BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
+	help
+	  OpenJDK is a free and open-source implementation of the
+	  Java Platform.
+
+	  http://openjdk.java.net/
+
+if BR2_PACKAGE_OPENJDK
+
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
+	bool "build client variant"
+	help
+	  Quick loading, but slower run-time performance.
+
+config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
+	bool "build server variant"
+	help
+	  Slower loading, but faster run-time performance.
+
+endif
+
+comment "openjdk needs X.Org"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_XORG7
+
+comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+
+comment "openjdk does not support soft float configurations"
+	depends on BR2_USE_MMU
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
index 0000000000..2730d014d8
--- /dev/null
+++ b/package/openjdk/openjdk.mk
@@ -0,0 +1,113 @@
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
+	host-zlib \
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
+# OpenJDK ignores some variables unless passed via the environment.
+# These variables are PATH, LD, CC, CXX, and CPP.
+# OpenJDK defaults ld to the ld binary but passes -Xlinker and -z as
+# arguments during the linking process, which causes compilation failures.
+# To fix this issue, LD is set to point to gcc.
+OPENJDK_CONF_ENV = \
+	PATH=$(BR_PATH) \
+	CC=$(TARGET_CC) \
+	CPP=$(TARGET_CPP) \
+	CXX=$(TARGET_CXX) \
+	LD=$(TARGET_CC) \
+	BUILD_SYSROOT_CFLAGS="$(HOST_CFLAGS)" \
+	BUILD_SYSROOT_LDFLAGS="$(HOST_LDFLAGS)"
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
+	--with-zlib=system \
+	--with-native-debug-symbols=none \
+	--without-version-pre \
+	--with-sysroot=$(STAGING_DIR) \
+	--with-vendor-name="AdoptOpenJDK" \
+	--with-vendor-url="https://adoptopenjdk.net/" \
+	--with-vendor-version-string="AdoptOpenJDK" \
+	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
+	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
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
