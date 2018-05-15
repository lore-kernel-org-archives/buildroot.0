From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 15 May 2018 21:51:52 +0200
Subject: [Buildroot] [RFC PATCH v2 1/8] pkg-meson: new infrastructure
In-Reply-To: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
References: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180515195159.6694-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new infrastructure to ease the development of packages that use Meson as
their build system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS           |   1 +
 package/Makefile.in  |   1 +
 package/pkg-meson.mk | 166 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 package/pkg-meson.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43b1668343..997dc27d78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -579,6 +579,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/meson/
 F:	package/ninja/
+F:	package/pkg-meson.mk
 F:	package/rust-bin/
 F:	package/rust/
 F:	package/s6/
diff --git a/package/Makefile.in b/package/Makefile.in
index 4325f7b3a9..a268016cdf 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -447,3 +447,4 @@ include package/pkg-rebar.mk
 include package/pkg-kernel-module.mk
 include package/pkg-waf.mk
 include package/pkg-golang.mk
+include package/pkg-meson.mk
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
new file mode 100644
index 0000000000..474417125b
--- /dev/null
+++ b/package/pkg-meson.mk
@@ -0,0 +1,166 @@
+################################################################################
+# Meson package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Meson packages. It should be used for all
+# packages that use Meson as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Meson infrastructure requires
+# the .mk file to only specify metadata information about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default Meson behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+
+################################################################################
+# inner-meson-package -- defines how the configuration, compilation and
+# installation of a Meson package should be done, implements a few hooks to
+# tune the build process and calls the generic package infrastructure to
+# generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-meson-package
+
+$(2)_CONF_ENV		?=
+$(2)_CONF_OPTS		?=
+$(2)_NINJA_ENV		?=
+$(2)_SRCDIR		= $$($(2)_DIR)/$$($(2)_SUBDIR)
+
+#
+# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
+# $(HOST_DIR)/bin/python3 will not look for Meson modules in
+# $HOME/.local/lib/python3.x/site-packages
+#
+MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
+NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
+NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+ifeq ($(4),target)
+
+# Configure package for target
+#
+#
+define $(2)_CONFIGURE_CMDS
+	rm -rf $$($$(PKG)_SRCDIR)/build
+	mkdir -p $$($$(PKG)_SRCDIR)/build
+	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
+		--prefix=/usr \
+		--libdir=lib \
+		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
+		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
+		--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+		$$($$(PKG)_CONF_OPTS) \
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+endef
+else
+
+# Configure package for host
+define $(2)_CONFIGURE_CMDS
+	rm -rf $$($$(PKG)_SRCDIR)/build
+	mkdir -p $$($$(PKG)_SRCDIR)/build
+	$$(HOST_CONFIGURE_OPTS) \
+	$$($$(PKG)_CONF_ENV) $$(MESON) \
+		--prefix="$$(HOST_DIR)" \
+		--libdir=lib \
+		--sysconfdir="$$(HOST_DIR)/etc" \
+		--localstatedir="$$(HOST_DIR)/var" \
+		--default-library=shared \
+		--buildtype=release \
+		$$($$(PKG)_CONF_OPTS) \
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+endef
+endif
+endif
+
+$(2)_DEPENDENCIES += host-meson
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build
+endef
+else
+define $(2)_BUILD_CMDS
+	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build
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
+	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build install
+endef
+endif
+
+#
+# Staging installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
+		$$(NINJA) $$(NINJA_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build install
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
+		$$(NINJA) $$(NINJA_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build install
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+################################################################################
+# meson-package -- the target generator macro for Meson packages
+################################################################################
+
+meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.14.3
