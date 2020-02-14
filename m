From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:19 +0100
Subject: [Buildroot] [PATCH v2 02/10] docs/manual/cargo: Update manual for
 cargo packages.
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-2-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 54 +++++----------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

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
 
-- 
2.17.1
