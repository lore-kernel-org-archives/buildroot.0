From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:40 +0200
Subject: [Buildroot] [Patch v5 7/7] rust: new package
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-8-eric.le.bihan.dev@free.fr>
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
Therefore this package depends on cargo-bootstrap and rust-bootstrap.

The internal build process is as follows:

 1. rustc-stage0, provided by rust-bootstrap, is used to build
    rustc-stage1.
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
 package/rust/rust.mk         | 77 ++++++++++++++++++++++++++++++++++++++++++++
 package/rustc/Config.in.host | 15 +++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 package/rust/rust.hash
 create mode 100644 package/rust/rust.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b323efd..57af5ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -454,6 +454,7 @@ F:	package/jemalloc/
 F:	package/ninja/
 F:	package/rust-bin/
 F:	package/rust-bootstrap/
+F:	package/rust/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
new file mode 100644
index 0000000..3b04dfd
--- /dev/null
+++ b/package/rust/rust.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 f966b31eb1cd9bd2df817c391a338eeb5b9253ae0a19bf8a11960c560f96e8b4  rustc-1.16.0-src.tar.gz
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
new file mode 100644
index 0000000..540e9ff
--- /dev/null
+++ b/package/rust/rust.mk
@@ -0,0 +1,77 @@
+################################################################################
+#
+# rust
+#
+################################################################################
+
+RUST_VERSION = 1.16.0
+RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.gz
+RUST_SITE = https://static.rust-lang.org/dist
+RUST_LICENSE = Apache-2.0 or MIT
+RUST_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+HOST_RUST_PROVIDES = host-rustc
+
+HOST_RUST_DEPENDENCIES = \
+	toolchain \
+	host-rust-bootstrap \
+	host-cargo-bootstrap \
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
+HOST_RUST_BUILD_OPTS = $(if $(VERBOSE),--verbose)
+
+define HOST_RUST_CONFIGURE_CMDS
+	(cd $(@D); \
+		echo '[build]' > config.toml; \
+		echo 'target = ["$(RUST_TARGET_NAME)"]' >> config.toml; \
+		echo 'cargo = "$(HOST_CARGO_BOOTSTRAP_DIR)/cargo/bin/cargo"' >> config.toml; \
+		echo 'rustc = "$(HOST_RUST_BOOTSTRAP_DIR)/rustc/bin/rustc"' >> config.toml; \
+		echo 'python = "$(HOST_DIR)/usr/bin/python2"' >> config.toml; \
+		echo 'submodules = false' >> config.toml; \
+		echo 'vendor = true' >> config.toml; \
+		echo 'compiler-docs = false' >> config.toml; \
+		echo 'docs = false' >> config.toml; \
+		echo '[install]' >> config.toml; \
+		echo 'prefix = "$(HOST_DIR)/usr"' >> config.toml; \
+		echo '[rust]' >> config.toml; \
+		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)' >> config.toml; \
+		echo '[target.$(RUST_TARGET_NAME)]' >> config.toml; \
+		echo 'cc = "$(TARGET_CROSS)gcc"' >> config.toml; \
+		echo 'cxx = "$(TARGET_CROSS)g++"' >> config.toml; \
+		echo $(HOST_RUST_JEMALLOC_CONF) >> config.toml; \
+	)
+endef
+
+define HOST_RUST_BUILD_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
+		build $(HOST_RUST_BUILD_OPTS))
+endef
+
+define HOST_RUST_INSTALL_LIBSTD_TARGET
+	(cd $(@D)/build/tmp/dist/rust-std-$(RUST_VERSION)-dev-$(RUST_TARGET_NAME); \
+		./install.sh \
+			--prefix=$(HOST_DIR)/usr \
+			--docdir=$(HOST_DIR)/usr/share/doc/rust \
+			--libdir=$(HOST_DIR)/usr/lib \
+			--mandir=$(HOST_DIR)/usr/share/man \
+			--disable-ldconfig)
+endef
+
+define HOST_RUST_INSTALL_CMDS
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
+		dist $(HOST_RUST_BUILD_OPTS))
+	(cd $(@D); $(HOST_MAKE_ENV) $(HOST_RUST_MAKE_ENV) python2 x.py \
+		dist --install $(HOST_RUST_BUILD_OPTS))
+	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 7f2c276..30bab8f 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -26,6 +26,20 @@ choice
 	help
 	  Choose a provider for the Rust compiler.
 
+config BR2_PACKAGE_HOST_RUST
+	bool "host rust"
+	depends on BR2_HOST_GCC_AT_LEAST_4_7 # required by LLVM
+	# triggers ICE on trunc_int_for_mode, at explow.c:56
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_aarch64
+	select BR2_PACKAGE_HAS_HOST_RUSTC
+	help
+	  This package will build the compiler for the host as well as
+	  a cross-compiled version of the Rust standard library for the
+	  target.
+
+comment "host-rust needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_aarch64
+
 config BR2_PACKAGE_HOST_RUST_BIN
 	bool "host rust (pre-built)"
 	select BR2_PACKAGE_HAS_HOST_RUSTC
@@ -40,6 +54,7 @@ config BR2_PACKAGE_HAS_HOST_RUSTC
 
 config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	string
+	default "host-rust" if BR2_PACKAGE_HOST_RUST
 	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 
 endif
-- 
2.9.3
