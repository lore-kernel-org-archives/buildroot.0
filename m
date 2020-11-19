From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:53 +0100
Subject: [Buildroot] [PATCH next 08/12] docs/manual/cargo: document the
 cargo-package infrastructure
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Havelange <patrick.havelange@essensium.com>

The Buildroot manual was already providing some details on how to
integrate Cargo packages, and those details now need to be updated
with a proper documentation for the cargo-package infrastructure.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Thomas: numerous updates and extensions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-cargo.txt | 88 ++++++++++++---------------
 1 file changed, 39 insertions(+), 49 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 8fcc80bcc6..c65a32f017 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Integration of Cargo-based packages
+=== Infrastructure for Cargo-based packages
 
 Cargo is the package manager for the Rust programming language. It allows the
 user to build programs or libraries written in Rust, but it also downloads and
@@ -10,7 +10,7 @@ called "crates".
 
 [[cargo-package-tutorial]]
 
-==== Cargo-based package's +Config.in+ file
+==== +cargo-package+ tutorial
 
 The +Config.in+ file of Cargo-based package 'foo' should contain:
 
@@ -25,11 +25,7 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 08: 	  http://foosoftware.org/foo/
 ---------------------------
 
-==== Cargo-based package's +.mk+ file
-
-Buildroot does not (yet) provide a dedicated package infrastructure for
-Cargo-based packages. So, we will explain how to write a +.mk+ file for such a
-package. Let's start with an example:
+And the +.mk+ file for this package should contain:
 
 ------------------------------
 01: ################################################################################
@@ -44,52 +40,48 @@ package. Let's start with an example:
 10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
-13: FOO_DEPENDENCIES = host-rustc
-14:
-15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-16:
-17: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
-18:
-19: FOO_CARGO_OPTS = \
-20: 	$(if $(BR2_ENABLE_DEBUG),,--release) \
-21: 	--target=$(RUSTC_TARGET_NAME) \
-22: 	--manifest-path=$(@D)/Cargo.toml
-23:
-24: define FOO_BUILD_CMDS
-25: 	$(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
-26: 		cargo build $(FOO_CARGO_OPTS)
-27: endef
-28:
-29: define FOO_INSTALL_TARGET_CMDS
-30: 	$(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
-31: 		$(TARGET_DIR)/usr/bin/foo
-32: endef
-33:
-34: $(eval $(generic-package))
+13: $(eval $(cargo-package))
 --------------------------------
 
-The Makefile starts with the definition of the standard variables for package
-declaration (lines 7 to 11).
+The Makefile starts with the definition of the standard variables for
+package declaration (lines 7 to 11).
+
+As seen in line 13, it is based on the +cargo-package+
+infrastructure. Cargo will be invoked automatically by this
+infrastructure to build and install the package.
+
+It is still possible to define custom build commands or install
+commands (i.e.  with FOO_BUILD_CMDS and FOO_INSTALL_TARGET_CMDS).
+Those will then replace the commands from the cargo infrastructure.
+
+==== +cargo-package+ reference
+
+The main macros for the Cargo package infrastructure are
++cargo-package+ for target packages and +host-cargo-package+ for host
+packages.
+
+Just like the generic infrastructure, the Cargo infrastructure works
+by defining a number of variables before calling the +cargo-package+
+or +host-cargo-package+ macros.
 
-As seen in line 34, it is based on the
-xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
-the variables required by this particular infrastructure, where Cargo is
-invoked:
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the Cargo infrastructure:
++FOO_VERSION+, +FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+,
++FOO_DEPENDENCIES+, +FOO_LICENSE+, +FOO_LICENSE_FILES+, etc.
 
-* +FOO_BUILD_CMDS+: Cargo is invoked to perform the build. The options required
-  to configure the cross-compilation of the package are passed via
-  +FOO_CONF_OPTS+.
+A few additional variables, specific to the Cargo infrastructure, can
+also be defined. Many of them are only useful in very specific cases,
+typical packages will therefore only use a few of them.
 
-* +FOO_INSTALL_TARGET_CMDS+: The binary executable generated is installed on
-  the target.
+* +FOO_CARGO_ENV+ can be used to pass additional variables in the
+  environment of +cargo+ invocations. It used at both build and
+  installation time
 
-In order to have Cargo available for the build, +FOO_DEPENDENCIES+ needs to
-contain +host-cargo+.
+* +FOO_CARGO_BUILD_OPTS+ can be used to pass additional options to
+  +cargo+ at build time.
 
-To sum it up, to add a new Cargo-based package, the Makefile example can be
-copied verbatim then edited to replace all occurences of +FOO+ with the
-uppercase name of the new package and update the values of the standard
-variables.
+* +FOO_CARGO_INSTALL_OPTS+ can be used to pass additional options to
+  +cargo+ at install time.
 
 ==== About Dependencies Management
 
@@ -99,9 +91,7 @@ automatically them. This step can also be performed independently, via the
 +cargo fetch+ command.
 
 Cargo maintains a local cache of the registry index and of git checkouts of the
-crates, whose location is given by +$CARGO_HOME+. As seen in the package
-Makefile example at line 15, this environment variable is set to
-+$(HOST_DIR)/share/cargo+.
+crates, whose location is given by +$CARGO_HOME+.
 
 This dependency download mechanism is not convenient when performing an offline
 build, as Cargo will fail to fetch the dependencies. In that case, it is advised
-- 
2.28.0
