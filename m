From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:18 +0100
Subject: [Buildroot] [PATCH v2 01/10] package/pkg-cargo.mk: Introduce the
 cargo package infrastructure.
Message-ID: <20200214124827.30767-1-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be package agnostic, the install phase is now using
cargo instead of install.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
This is the V2 of the previously posted series :
http://patchwork.ozlabs.org/project/buildroot/list/?series=156166&state=%2A&archive=both

A lot of changes following the buildroot developer meeting's
decisions from February 2020.

Needs to be applied on top of the rust 1.40 bump
---
 package/Makefile.in  |  1 +
 package/pkg-cargo.mk | 89 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 package/pkg-cargo.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 285e2837ef..650d7c166e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -426,3 +426,4 @@ include package/pkg-kernel-module.mk
 include package/pkg-waf.mk
 include package/pkg-golang.mk
 include package/pkg-meson.mk
+include package/pkg-cargo.mk
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
new file mode 100644
index 0000000000..2242f3a082
--- /dev/null
+++ b/package/pkg-cargo.mk
@@ -0,0 +1,89 @@
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
+$(2)_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+$(2)_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
+
+ifeq ($(4),target)
+    $(2)_CARGO_TARGET_OPT = --target $$(RUSTC_TARGET_NAME)
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+		cargo build \
+			--$$($(2)_CARGO_MODE) \
+			$$($(2)_CARGO_TARGET_OPT) \
+			--manifest-path $$(@D)/Cargo.toml
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+		cargo install \
+			--root $(TARGET_DIR)/usr/ \
+			--bins \
+			--path $$(@D) \
+			$$($(2)_CARGO_TARGET_OPT) \
+			--force
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
-- 
2.17.1
