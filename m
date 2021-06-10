From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  9 Jun 2021 20:06:32 -0600
Subject: [Buildroot] [PATCH 1/1] pkg-rust: new infrastructure
Message-ID: <20210610020632.236282-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new infrastructure to ease the development of packages that use
rust's cargo as their build system.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Makefile.in |   1 +
 package/pkg-rust.mk | 113 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 package/pkg-rust.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 955e6a8e8c..c4fb6a3cb1 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -434,3 +434,4 @@ include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
+include package/pkg-rust.mk
diff --git a/package/pkg-rust.mk b/package/pkg-rust.mk
new file mode 100644
index 0000000000..3906fc12b4
--- /dev/null
+++ b/package/pkg-rust.mk
@@ -0,0 +1,113 @@
+################################################################################
+# Rust package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Rust packages. It should be used for all
+# packages that use Rust as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Rust infrastructure requires
+# the .mk file to only specify metadata information about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default Rust behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+CARGO = $(HOST_DIR)/bin/cargo
+
+RUSTC_TARGET_TRIPLE = $(subst -,_,$(call UPPERCASE,$(RUSTC_TARGET_NAME)))
+
+PKG_RUST_CARGO_ENV = \
+	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	CARGO_BUILD_TARGET=$(RUSTC_TARGET_NAME) \
+	CARGO_INSTALL_ROOT=$(TARGET_DIR)/usr \
+	CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc
+
+HOST_PKG_RUST_CARGO_ENV = \
+	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	CARGO_INSTALL_ROOT=$(HOST_DIR) \
+	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
+
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
+PKG_RUST_CARGO_OPTS = --debug
+else
+PKG_RUST_CARGO_OPTS = --release
+endif
+
+################################################################################
+# inner-rust-package -- defines how the configuration, compilation and
+# installation of a Rust package should be done, implements a few hooks to
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
+define inner-rust-package
+
+$(2)_DEPENDENCIES += host-rustc
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) $$(PKG_RUST_CARGO_ENV) \
+		$$(CARGO) build $$(PKG_RUST_CARGO_OPTS) $$($$(PKG)_RUST_CARGO_OPTS) --manifest-path=$$($$(PKG)_BUILDDIR)/Cargo.toml
+endef
+else
+define $(2)_BUILD_CMDS
+	$$(HOST_MAKE_ENV) $$(HOST_PKG_RUST_CARGO_ENV) \
+		$$(CARGO) build $$(PKG_RUST_CARGO_OPTS) $$($$(PKG)_RUST_CARGO_OPTS) --manifest-path=$$($$(PKG)_BUILDDIR)/Cargo.toml
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
+	$$(HOST_MAKE_ENV) $$(HOST_PKG_RUST_CARGO_ENV) \
+		$$(CARGO) install --offline --frozen --path $$($$(PKG)_BUILDDIR)
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$(PKG_RUST_CARGO_ENV) \
+		$$(CARGO) install --offline --frozen --path $$($$(PKG)_BUILDDIR)
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
+# rust-package -- the target generator macro for Rust packages
+################################################################################
+
+rust-package = $(call inner-rust-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-rust-package = $(call inner-rust-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.25.1
