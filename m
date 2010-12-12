From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 12 Dec 2010 20:29:12 +0100
Subject: [Buildroot] [PATCH 1/4] Add CMAKETARGETS infrastructure for CMake
	packages
In-Reply-To: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
References: <1292182155-29576-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <1292182155-29576-2-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CMAKETARGETS infrastructure makes adding CMake-based packages to
Buildroot easy. It uses the same set of variables as the autotools
infrastructure does, except for autoreconf and libtool stuff which is
not needed. Usage: just call CMAKETARGETS instead of AUTOTARGETS.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 package/Makefile.cmake.in |  216 +++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in       |    1 +
 2 files changed, 217 insertions(+), 0 deletions(-)
 create mode 100644 package/Makefile.cmake.in

diff --git a/package/Makefile.cmake.in b/package/Makefile.cmake.in
new file mode 100644
index 0000000..133876a
--- /dev/null
+++ b/package/Makefile.cmake.in
@@ -0,0 +1,216 @@
+################################################################################
+# CMake package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for CMake packages. It should be used for all
+# packages that use CMake as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this CMake infrastructure requires
+# the .mk file to only specify metadata informations about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default CMake behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+################################################################################
+# CMAKETARGETS_INNER -- defines how the configuration, compilation and
+# installation of a CMake package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define CMAKETARGETS_INNER
+
+# define package-specific variables to default values
+ifndef $(2)_SUBDIR
+ ifdef $(3)_SUBDIR
+  $(2)_SUBDIR = $($(3)_SUBDIR)
+ else
+  $(2)_SUBDIR ?=
+ endif
+endif
+
+$(2)_CONF_ENV			?=
+$(2)_CONF_OPT			?=
+$(2)_MAKE			?= $(MAKE)
+$(2)_MAKE_ENV			?=
+$(2)_MAKE_OPT			?=
+$(2)_INSTALL_HOST_OPT		?= DESTDIR=$$(HOST_DIR) install
+$(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
+$(2)_CLEAN_OPT			?= clean
+
+$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
+
+
+# CMake doesn't support having the --sysroot option directly in the
+# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
+CMAKE_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
+CMAKE_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
+CMAKE_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
+CMAKE_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+ifeq ($(5),target)
+
+# Configure package for target
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_SRCDIR) && \
+	rm -f CMakeCache.txt && \
+	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+		-Wno-dev \
+		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
+		-DCMAKE_C_COMPILER:FILEPATH="$$(CMAKE_TARGET_CC)" \
+		-DCMAKE_CXX_COMPILER:FILEPATH="$$(CMAKE_TARGET_CXX)" \
+		-DCMAKE_C_FLAGS:STRING="$$(CMAKE_TARGET_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS:STRING="$$(CMAKE_TARGET_CXXFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(TARGET_LDFLAGS)" \
+		-DCMAKE_FIND_ROOT_PATH:PATH="$$(STAGING_DIR)" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM:STRING="NEVER" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY:STRING="ONLY" \
+		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE:STRING="ONLY" \
+		-DCMAKE_INSTALL_PREFIX:PATH="/usr" \
+		$$($$(PKG)_CONF_OPT) \
+	)
+endef
+else
+
+# Configure package for host
+define $(2)_CONFIGURE_CMDS
+	(cd $$($$(PKG)_SRCDIR) && \
+	rm -f CMakeCache.txt && \
+	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+		-Wno-dev \
+		-DCMAKE_C_FLAGS="$$(HOST_CFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS:STRING="$$(HOST_LDFLAGS)" \
+		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$$(HOST_LDFLAGS)" \
+		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$$(HOST_LDFLAGS)" \
+		-DCMAKE_INSTALL_PREFIX:STRING="/usr" \
+		$$($$(PKG)_CONF_OPT) \
+	)
+endef
+endif
+endif
+
+$(2)_DEPENDENCIES += host-cmake
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(5),target)
+define $(2)_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+else
+define $(2)_BUILD_CMDS
+	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Clean step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_CLEAN_CMDS
+define $(2)_CLEAN_CMDS
+	-$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)  $$($$(PKG)_CLEAN_OPT) -C $$($$(PKG)_SRCDIR)
+endef
+endif
+
+#
+# Uninstall from staging step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_UNINSTALL_STAGING_CMDS
+define $(2)_UNINSTALL_STAGING_CMDS
+	(cd $$($$(PKG)_SRCDIR) && sed "s:\(.*\):$$(STAGING_DIR)\1:" install_manifest.txt | xargs rm -f)
+endef
+endif
+
+#
+# Uninstall from target step. Only define it if not already defined
+# by the package .mk file.
+#
+ifndef $(2)_UNINSTALL_TARGET_CMDS
+define $(2)_UNINSTALL_TARGET_CMDS
+	(cd $$($$(PKG)_SRCDIR) && sed "s:\(.*\):$$(TARGET_DIR)\1:" install_manifest.txt | xargs rm -f)
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5))
+
+endef
+
+################################################################################
+# CMAKETARGETS -- the target generator macro for CMake packages
+#
+# Argument 1 is the package directory prefix [mandatory]
+# Argument 2 is the lowercase package name   [mandatory]
+# Argument 3 is "target" or "host"           [optional, default: "target"]
+################################################################################
+
+define CMAKETARGETS
+ifeq ($(3),host)
+$(call CMAKETARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host)
+else
+$(call CMAKETARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
+endif
+endef
diff --git a/package/Makefile.in b/package/Makefile.in
index d448a7e..a7650f0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -318,4 +318,5 @@ ENABLE_DEBUG:=
 endif
 
 include package/Makefile.autotools.in
+include package/Makefile.cmake.in
 include package/Makefile.package.in
-- 
1.7.1
