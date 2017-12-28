From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:42 +0100
Subject: [Buildroot] [PATCH v9 4/8] rust: new package
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-5-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides rustc, the compiler for the Rust programming
language, built from source.

Currently, only the host variant is built.

The Rust compiler uses LLVM as its backend: a copy of LLVM source code
is provided and CMake is used to build it. It is possible to use a
pre-built external copy. When LLVM/clang will be available in Buildroot,
it would be possible to benefit from this feature and thus decrease
build time.

LLVM is configured to generate code for x86, ARM, PowerPC and MIPS
architectures.

The Rust compiler uses Cargo as its build system and is written in Rust.
Therefore this package depends on cargo-bin and rust-bin.

The internal build process is as follows:

 1. rustc-stage0, provided by rust-bin, is used to build rustc-stage1.
 2. rust-stage1 builds the final Rust compiler (rust-stage2)
    and the standard library for the host architecture.
 3. the standard library for the target architecture is built.

The target architecture to support is given by the GNU/LLVM target
triple. Rust supports some predefined targets [1]. As the build system
expects the triple to be in the form of <arch>-unknown-<system> and
Buildroot toolchain wrapper uses <arch>-buildroot-<system>, the package
Makefile uses $(RUST_TARGET_NAME) defined in the rustc package and uses
it instead of $(GNU_TARGET_NAME).

When compiling Rust code with this compiler, the generated program only
depends on the target C library, as it is statically linked to the Rust
standard library and any other code from Rust packages (a.k.a.
"crates").

If the jemalloc package is selected, support for this memory allocator
will be enabled in the target standard library.

The menuconfig entry for rustc is also updated to expose this provider.

[1] https://forge.rust-lang.org/platform-support.html

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                   |  1 +
 package/rust/rust.hash       |  2 ++
 package/rust/rust.mk         | 82 ++++++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host | 16 +++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0374e45eda..1c16ec9598 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -545,6 +545,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/rust-bin/
+F:	package/rust/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
new file mode 100644
index 0000000000..51aa9e3361
--- /dev/null
+++ b/package/rust/rust.hash
@@ -0,0 +1,2 @@
+# From https://static.rust-lang.org/dist/rustc-1.22.1-src.tar.xz.sha256
+sha256 80ee9ecc1e03ee63ea13c2612b61fc04fce9240476836f70c553ebaebd58fed6  rustc-1.22.1-src.tar.xz
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
new file mode 100644
index 0000000000..8dbec99bc5
--- /dev/null
+++ b/package/rust/rust.mk
@@ -0,0 +1,82 @@
+################################################################################
+#
+# rust
+#
+################################################################################
+
+RUST_VERSION = 1.22.1
+RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
+RUST_SITE = https://static.rust-lang.org/dist
+RUST_LICENSE = Apache-2.0 or MIT
+RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_PROVIDES = host-rustc
+
+HOST_RUST_DEPENDENCIES = \
+	toolchain \
+	host-rust-bin \
+	host-cargo-bin \
+	host-python \
+	host-cmake
+
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+HOST_RUST_DEPENDENCIES += jemalloc
+HOST_RUST_JEMALLOC_ENABLED = true
+HOST_RUST_JEMALLOC_CONF = 'jemalloc = "$(STAGING_DIR)/usr/lib/libjemalloc_pic.a"'
+else
+HOST_RUST_JEMALLOC_ENABLED = false
+endif
+
+HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
+
+# Some vendored crates contain Cargo.toml.orig files. The associated
+# .cargo-checksum.json file will contain a checksum for Cargo.toml.orig but
+# support/scripts/apply-patches.sh will delete them. This will cause the build
+# to fail, as Cargo will not be able to find the file and verify the checksum.
+# So, remove all Cargo.toml.orig entries from the affected .cargo-checksum.json
+# files
+define HOST_RUST_EXCLUDE_ORIG_FILES
+	for file in $$(find $(@D) -name '*.orig'); do \
+		crate=$$(dirname $${file}); \
+		fn=$${crate}/.cargo-checksum.json; \
+		sed -i -e 's/"Cargo.toml.orig":"[a-z0-9]\+",//g' $${fn}; \
+	done
+endef
+
+HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
+
+define HOST_RUST_CONFIGURE_CMDS
+	( \
+		echo '[build]'; \
+		echo 'target = ["$(RUST_TARGET_NAME)"]'; \
+		echo 'cargo = "$(HOST_CARGO_BIN_DIR)/cargo/bin/cargo"'; \
+		echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \
+		echo 'python = "$(HOST_DIR)/bin/python2"'; \
+		echo 'submodules = false'; \
+		echo 'vendor = true'; \
+		echo 'compiler-docs = false'; \
+		echo 'docs = false'; \
+		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
+		echo '[install]'; \
+		echo 'prefix = "$(HOST_DIR)"'; \
+		echo '[rust]'; \
+		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
+		echo '[target.$(RUST_TARGET_NAME)]'; \
+		echo 'cc = "$(TARGET_CROSS)gcc"'; \
+		echo $(HOST_RUST_JEMALLOC_CONF); \
+	) > $(@D)/config.toml
+endef
+
+define HOST_RUST_BUILD_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py \
+		build $(HOST_RUST_BUILD_OPTS))
+endef
+
+define HOST_RUST_INSTALL_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py \
+		dist $(HOST_RUST_BUILD_OPTS))
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py \
+		install $(HOST_RUST_BUILD_OPTS))
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index e42187d477..3a03140bcd 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -26,6 +26,21 @@ choice
 	help
 	  Select a Rust compiler
 
+config BR2_PACKAGE_HOST_RUST
+	bool "host rust"
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
+	# triggers ICE on trunc_int_for_mode, at explow.c:56
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
+	select BR2_PACKAGE_HAS_HOST_RUSTC
+	help
+	  This package will build the compiler for the host as well as
+	  two flavors of the standard library: one for the host, another
+	  for the target. Both are installed in the host directory.
+
+comment "host-rust needs a toolchain w/ gcc >= 5"
+	depends on BR2_aarch64
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+
 config BR2_PACKAGE_HOST_RUST_BIN
 	bool "host rust (pre-built)"
 	select BR2_PACKAGE_HAS_HOST_RUSTC
@@ -40,6 +55,7 @@ config BR2_PACKAGE_HAS_HOST_RUSTC
 
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
+	default "host-rust" if BR2_PACKAGE_HOST_RUST
 	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 
 endif
-- 
2.14.3
