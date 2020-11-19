From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:52 +0100
Subject: [Buildroot] [PATCH next 07/12] package/pkg-cargo.mk: introduce the
 cargo package infrastructure
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Havelange <patrick.havelange@essensium.com>

In order to be package agnostic, the install phase is now using cargo
instead of install. TARGET_CONFIGURE_OPTS is now also set when running
cargo in order to support cross compiling C code within cargo.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Thomas: add support for host-cargo-package]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in  |   1 +
 package/pkg-cargo.mk | 123 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 package/pkg-cargo.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..2af123f36d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -427,3 +427,4 @@ include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
 include package/pkg-qmake.mk
+include package/pkg-cargo.mk
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
new file mode 100644
index 0000000000..52c237aa3c
--- /dev/null
+++ b/package/pkg-cargo.mk
@@ -0,0 +1,123 @@
+################################################################################
+# Cargo package infrastructure
+#
+# This file implements an infrastructure that eases development of package
+# .mk files for Cargo packages. It should be used for all packages that use
+# Cargo as their build system.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this Cargo infrastructure requires the .mk file
+# to only specify metadata information about the package: name, version,
+# download URL, etc.
+#
+# We still allow the package .mk file to override what the different steps
+# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
+# it is used as the list of commands to perform to build the package,
+# instead of the default Cargo behaviour. The package can also define some
+# post operation hooks.
+#
+################################################################################
+
+################################################################################
+# inner-cargo-package -- defines how the configuration, compilation and
+# installation of a cargo package should be done, implements a few hooks
+# to tune the build process for cargo specifities and calls the generic
+# package infrastructure to generate the necessary make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+
+define inner-cargo-package
+
+# We need host-rustc to run cargo
+$(2)_DEPENDENCIES += host-rustc
+
+$(2)_CARGO_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	$$(TARGET_MAKE_ENV) \
+		$$(TARGET_CONFIGURE_OPTS) \
+		$$($(2)_CARGO_ENV) \
+		cargo build \
+			--offline \
+			--target $$(RUSTC_TARGET_NAME) \
+			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
+			--manifest-path $$(@D)/Cargo.toml \
+			--locked \
+			$$($(2)_CARGO_BUILD_OPTS)
+endef
+else # ifeq ($(4),target)
+define $(2)_BUILD_CMDS
+	$$(HOST_MAKE_ENV) \
+		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
+		$$($(2)_CARGO_ENV) \
+		cargo build \
+			--offline \
+			--release \
+			--manifest-path $$(@D)/Cargo.toml \
+			--locked \
+			$$($(2)_CARGO_BUILD_OPTS)
+endef
+endif # ifeq ($(4),target)
+endif # ifndef $(2)_BUILD_CMDS
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+		cargo install \
+			--target $$(RUSTC_TARGET_NAME) \
+			--offline \
+			--root $$(TARGET_DIR)/usr/ \
+			--bins \
+			--path $$(@D) \
+			--force \
+			--locked \
+			$$($(2)_CARGO_INSTALL_OPTS)
+endef
+endif
+
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(HOST_MAKE_ENV) \
+		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
+		$$($(2)_CARGO_ENV) \
+		cargo install \
+			--offline \
+			--root $$(HOST_DIR) \
+			--bins \
+			--path $$(@D) \
+			--force \
+			--locked \
+			$$($(2)_CARGO_INSTALL_OPTS)
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
+# cargo-package -- the target generator macro for Cargo packages
+################################################################################
+
+cargo-package = $(call inner-cargo-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-cargo-package = $(call inner-cargo-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
2.28.0
