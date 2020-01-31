From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 31 Jan 2020 12:27:47 +0100
Subject: [Buildroot] [RFC PATCH 2/4] package/pkg-cargo.mk: Introduce the
 cargo package infrastructure.
In-Reply-To: <20200131112749.30915-1-patrick.havelange@essensium.com>
References: <20200131112749.30915-1-patrick.havelange@essensium.com>
Message-ID: <20200131112749.30915-2-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to be package agnostic, the install phase is now using
cargo instead of install.
Documentation for cargo packages has been updated.
ripgrep has been updated to take advantage of this new
infrastructure.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 54 +++-------------
 package/Makefile.in                   |  1 +
 package/pkg-cargo.mk                  | 89 +++++++++++++++++++++++++++
 package/ripgrep/ripgrep.mk            | 23 +------
 4 files changed, 101 insertions(+), 66 deletions(-)
 create mode 100644 package/pkg-cargo.mk

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index bb078b6981..9a496224e3 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -27,9 +27,9 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 
 ==== Cargo-based package's +.mk+ file
 
-Buildroot does not (yet) provide a dedicated package infrastructure for
-Cargo-based packages. So, we will explain how to write a +.mk+ file for such a
-package. Let's start with an example:
+Buildroot provides a dedicated package infrastructure for Cargo-based packages.
+So, we will explain how to write a +.mk+ file for such a package. Let's start
+with an example:
 
 ------------------------------
 01: ################################################################################
@@ -44,53 +44,19 @@ package. Let's start with an example:
 10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
-13: FOO_DEPENDENCIES = host-rustc
-14:
-15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
-17:
-18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
-19:
-20: FOO_CARGO_OPTS = \
-21:   --$(FOO_CARGO_MODE) \
-22: 	--target=$(RUSTC_TARGET_NAME) \
-23: 	--manifest-path=$(@D)/Cargo.toml
-24:
-25: define FOO_BUILD_CMDS
-26: 	$(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
-27: 		cargo build $(FOO_CARGO_OPTS)
-28: endef
-29:
-30: define FOO_INSTALL_TARGET_CMDS
-31: 	$(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
-32: 		$(TARGET_DIR)/usr/bin/foo
-33: endef
-34:
-35: $(eval $(generic-package))
+13: $(eval $(cargo-package))
 --------------------------------
 
 The Makefile starts with the definition of the standard variables for package
 declaration (lines 7 to 11).
 
-As seen in line 35, it is based on the
-xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
-the variables required by this particular infrastructure, where Cargo is
-invoked:
+As seen in line 13, it is based on the cargo-package infrastructure. Cargo will
+be invoked automatically by this infrastructure. The required dependencies of the
+crate will be downloaded and the buildroot dependencies will also be set.
 
-* +FOO_BUILD_CMDS+: Cargo is invoked to perform the build. The options required
-  to configure the cross-compilation of the package are passed via
-  +FOO_CONF_OPTS+.
-
-* +FOO_INSTALL_TARGET_CMDS+: The binary executable generated is installed on
-  the target.
-
-In order to have Cargo available for the build, +FOO_DEPENDENCIES+ needs to
-contain +host-cargo+.
-
-To sum it up, to add a new Cargo-based package, the Makefile example can be
-copied verbatim then edited to replace all occurences of +FOO+ with the
-uppercase name of the new package and update the values of the standard
-variables.
+It is still possible to define custom build commands or install commands (i.e.
+with FOO_BUILD_CMDS and FOO_INSTALL_TARGET_CMDS).
+Those will then replace the commands from the cargo infrastructure.
 
 ==== About Dependencies Management
 
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
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 832c076f26..97e9e2ce5f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -9,25 +9,4 @@ RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 
-RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
-
-RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
-
-RIPGREP_CARGO_OPTS = \
-	--$(RIPGREP_CARGO_MODE) \
-	--target=$(RUSTC_TARGET_NAME) \
-	--manifest-path=$(@D)/Cargo.toml
-
-define RIPGREP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
-		cargo build $(RIPGREP_CARGO_OPTS)
-endef
-
-define RIPGREP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(RIPGREP_BIN_DIR)/rg \
-		$(TARGET_DIR)/usr/bin/rg
-endef
-
-$(eval $(generic-package))
+$(eval $(cargo-package))
-- 
2.17.1
