From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:47 +0100
Subject: [Buildroot] [git commit] rust: new package
Message-ID: <20180205140233.47FD98746B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b50522d838d8ddfef80bf8036e511319982da16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

 1. stage0 compiler, provided by rust-bin, is used to build stage1
    compiler.
 2. stage1 compiler builds the final Rust compiler (stage2 compiler)
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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                   |  1 +
 package/rust/rust.hash       |  5 +++
 package/rust/rust.mk         | 79 ++++++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host | 19 +++++++++++
 4 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70ca569feb..0e041d6f40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -550,6 +550,7 @@ F:	package/jemalloc/
 F:	package/meson/
 F:	package/ninja/
 F:	package/rust-bin/
+F:	package/rust/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
new file mode 100644
index 0000000000..d6731b6dc2
--- /dev/null
+++ b/package/rust/rust.hash
@@ -0,0 +1,5 @@
+# From https://static.rust-lang.org/dist/rustc-1.23.0-src.tar.xz.sha256
+sha256 7196032371b50dd5582465b3bfa79ffd783b74f0711420d99b61b26c96fb3d80  rustc-1.23.0-src.tar.xz
+# Locally generated
+sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
new file mode 100644
index 0000000000..6d6ac4370a
--- /dev/null
+++ b/package/rust/rust.mk
@@ -0,0 +1,79 @@
+################################################################################
+#
+# rust
+#
+################################################################################
+
+RUST_VERSION = 1.23.0
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
+	$(BR2_CMAKE_HOST_DEPENDENCY)
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
+# Some vendor crates contain Cargo.toml.orig files. The associated
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
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py build
+endef
+
+define HOST_RUST_INSTALL_CMDS
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py dist
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py install
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 66c50c4579..d93ff05209 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -40,6 +40,24 @@ choice
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
+comment "host-rust needs host gcc >= 4.7"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_7
+
 config BR2_PACKAGE_HOST_RUST_BIN
 	bool "host rust (pre-built)"
 	select BR2_PACKAGE_HAS_HOST_RUSTC
@@ -54,6 +72,7 @@ config BR2_PACKAGE_HAS_HOST_RUSTC
 
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
+	default "host-rust" if BR2_PACKAGE_HOST_RUST
 	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 
 endif
