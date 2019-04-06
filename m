From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  6 Apr 2019 16:42:11 +0200
Subject: [Buildroot] [PATCH 3/3] rust: bump version to 1.33.0
In-Reply-To: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
References: <20190406144211.20894-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190406144211.20894-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump rust to 1.33.0 with the following changes:

- drop support for jemalloc
- add dependency on host-openssl
- add a patch to fix bootstraping with rust 1.33.0 [1]

[1] https://github.com/rust-lang/rust/pull/57765

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...esence-of-LLVM-library-in-stage0-lib.patch | 264 ++++++++++++++++++
 package/rust/rust.hash                        |   5 +-
 package/rust/rust.mk                          |  12 +-
 3 files changed, 269 insertions(+), 12 deletions(-)
 create mode 100644 package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch

diff --git a/package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch b/package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch
new file mode 100644
index 0000000000..0c756e3028
--- /dev/null
+++ b/package/rust/0001-Workaround-presence-of-LLVM-library-in-stage0-lib.patch
@@ -0,0 +1,264 @@
+From 2d21df8a3fd7a68ba9f52389ead7f06f13190c12 Mon Sep 17 00:00:00 2001
+From: Mark Rousskov <mark.simulacrum@gmail.com>
+Date: Mon, 21 Jan 2019 17:47:57 -0700
+Subject: [PATCH] Workaround presence of LLVM library in stage0/lib
+
+This commit works around the newly-introduced LLVM shared library.
+
+This is needed such that llvm-config run from
+librustc_llvm's build script can correctly locate it's own LLVM, not the
+one in stage0/lib. The LLVM build system uses the DT_RUNPATH/RUNPATH
+header within the llvm-config binary, which we want to use, but because
+Cargo always adds the host compiler's "libdir" (stage0/lib in our
+case) to the dynamic linker's search path, we weren't properly finding
+the freshly-built LLVM in llvm/lib. By restoring the environment
+variable setting the search path to what bootstrap sees, the problem is
+resolved and librustc_llvm correctly links and finds the appropriate
+LLVM.
+
+Several run-make-fulldeps tests are also updated with similar handling.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/bootstrap/builder.rs                      |  9 ++++++++-
+ src/bootstrap/compile.rs                      |  1 +
+ src/bootstrap/util.rs                         |  6 +++++-
+ src/build_helper/lib.rs                       | 19 +++++++++++++++++++
+ src/librustc_asan/build.rs                    |  2 ++
+ src/librustc_llvm/build.rs                    |  2 ++
+ src/librustc_lsan/build.rs                    |  2 ++
+ src/librustc_msan/build.rs                    |  2 ++
+ src/librustc_tsan/build.rs                    |  2 ++
+ .../cross-lang-lto-upstream-rlibs/Makefile    |  4 ++--
+ .../run-make-fulldeps/cross-lang-lto/Makefile | 19 ++++++++++---------
+ 11 files changed, 55 insertions(+), 13 deletions(-)
+
+diff --git a/src/bootstrap/builder.rs b/src/bootstrap/builder.rs
+index a69ba20749..f742bce180 100644
+--- a/src/bootstrap/builder.rs
++++ b/src/bootstrap/builder.rs
+@@ -21,7 +21,7 @@ use crate::install;
+ use crate::native;
+ use crate::test;
+ use crate::tool;
+-use crate::util::{add_lib_path, exe, libdir};
++use crate::util::{self, add_lib_path, exe, libdir};
+ use crate::{Build, DocTests, Mode, GitRepo};
+ 
+ pub use crate::Compiler;
+@@ -791,6 +791,13 @@ impl<'a> Builder<'a> {
+             .env("CARGO_TARGET_DIR", out_dir)
+             .arg(cmd);
+ 
++        // See comment in librustc_llvm/build.rs for why this is necessary, largely llvm-config
++        // needs to not accidentally link to libLLVM in stage0/lib.
++        cargo.env("REAL_LIBRARY_PATH_VAR", &util::dylib_path_var());
++        if let Some(e) = env::var_os(util::dylib_path_var()) {
++            cargo.env("REAL_LIBRARY_PATH", e);
++        }
++
+         if cmd != "install" {
+             cargo.arg("--target")
+                  .arg(target);
+diff --git a/src/bootstrap/compile.rs b/src/bootstrap/compile.rs
+index b581271663..ec04dee6c3 100644
+--- a/src/bootstrap/compile.rs
++++ b/src/bootstrap/compile.rs
+@@ -712,6 +712,7 @@ pub fn build_codegen_backend(builder: &Builder,
+             if builder.is_rust_llvm(target) && backend != "emscripten" {
+                 cargo.env("LLVM_RUSTLLVM", "1");
+             }
++
+             cargo.env("LLVM_CONFIG", &llvm_config);
+             if backend != "emscripten" {
+                 let target_config = builder.config.target_config.get(&target);
+diff --git a/src/bootstrap/util.rs b/src/bootstrap/util.rs
+index 2880f1a084..37c6c040da 100644
+--- a/src/bootstrap/util.rs
++++ b/src/bootstrap/util.rs
+@@ -70,7 +70,11 @@ pub fn dylib_path_var() -> &'static str {
+ /// Parses the `dylib_path_var()` environment variable, returning a list of
+ /// paths that are members of this lookup path.
+ pub fn dylib_path() -> Vec<PathBuf> {
+-    env::split_paths(&env::var_os(dylib_path_var()).unwrap_or_default()).collect()
++    let var = match env::var_os(dylib_path_var()) {
++        Some(v) => v,
++        None => return vec![],
++    };
++    env::split_paths(&var).collect()
+ }
+ 
+ /// `push` all components to `buf`. On windows, append `.exe` to the last component.
+diff --git a/src/build_helper/lib.rs b/src/build_helper/lib.rs
+index 5a704e5577..c66c5c9249 100644
+--- a/src/build_helper/lib.rs
++++ b/src/build_helper/lib.rs
+@@ -23,6 +23,25 @@ macro_rules! t {
+     };
+ }
+ 
++// Because Cargo adds the compiler's dylib path to our library search path, llvm-config may
++// break: the dylib path for the compiler, as of this writing, contains a copy of the LLVM
++// shared library, which means that when our freshly built llvm-config goes to load it's
++// associated LLVM, it actually loads the compiler's LLVM. In particular when building the first
++// compiler (i.e., in stage 0) that's a problem, as the compiler's LLVM is likely different from
++// the one we want to use. As such, we restore the environment to what bootstrap saw. This isn't
++// perfect -- we might actually want to see something from Cargo's added library paths -- but
++// for now it works.
++pub fn restore_library_path() {
++    println!("cargo:rerun-if-env-changed=REAL_LIBRARY_PATH_VAR");
++    println!("cargo:rerun-if-env-changed=REAL_LIBRARY_PATH");
++    let key = env::var_os("REAL_LIBRARY_PATH_VAR").expect("REAL_LIBRARY_PATH_VAR");
++    if let Some(env) = env::var_os("REAL_LIBRARY_PATH") {
++        env::set_var(&key, &env);
++    } else {
++        env::remove_var(&key);
++    }
++}
++
+ pub fn run(cmd: &mut Command) {
+     println!("running: {:?}", cmd);
+     run_silent(cmd);
+diff --git a/src/librustc_asan/build.rs b/src/librustc_asan/build.rs
+index 2d921b6669..b42d775deb 100644
+--- a/src/librustc_asan/build.rs
++++ b/src/librustc_asan/build.rs
+@@ -8,6 +8,8 @@ use cmake::Config;
+ 
+ fn main() {
+     if let Some(llvm_config) = env::var_os("LLVM_CONFIG") {
++        build_helper::restore_library_path();
++
+         let (native, target) = match sanitizer_lib_boilerplate("asan") {
+             Ok(native) => native,
+             _ => return,
+diff --git a/src/librustc_llvm/build.rs b/src/librustc_llvm/build.rs
+index ec3dff783c..cd91fcb299 100644
+--- a/src/librustc_llvm/build.rs
++++ b/src/librustc_llvm/build.rs
+@@ -24,6 +24,8 @@ fn main() {
+         return;
+     }
+ 
++    build_helper::restore_library_path();
++
+     let target = env::var("TARGET").expect("TARGET was not set");
+     let llvm_config = env::var_os("LLVM_CONFIG")
+         .map(PathBuf::from)
+diff --git a/src/librustc_lsan/build.rs b/src/librustc_lsan/build.rs
+index 470f2bb3e5..ad528bb039 100644
+--- a/src/librustc_lsan/build.rs
++++ b/src/librustc_lsan/build.rs
+@@ -8,6 +8,8 @@ use cmake::Config;
+ 
+ fn main() {
+     if let Some(llvm_config) = env::var_os("LLVM_CONFIG") {
++        build_helper::restore_library_path();
++
+         let (native, target) = match sanitizer_lib_boilerplate("lsan") {
+             Ok(native) => native,
+             _ => return,
+diff --git a/src/librustc_msan/build.rs b/src/librustc_msan/build.rs
+index e1140278f2..085514b5a0 100644
+--- a/src/librustc_msan/build.rs
++++ b/src/librustc_msan/build.rs
+@@ -8,6 +8,8 @@ use cmake::Config;
+ 
+ fn main() {
+     if let Some(llvm_config) = env::var_os("LLVM_CONFIG") {
++        build_helper::restore_library_path();
++
+         let (native, target) = match sanitizer_lib_boilerplate("msan") {
+             Ok(native) => native,
+             _ => return,
+diff --git a/src/librustc_tsan/build.rs b/src/librustc_tsan/build.rs
+index f63bb46b87..0db3db392d 100644
+--- a/src/librustc_tsan/build.rs
++++ b/src/librustc_tsan/build.rs
+@@ -8,6 +8,8 @@ use cmake::Config;
+ 
+ fn main() {
+     if let Some(llvm_config) = env::var_os("LLVM_CONFIG") {
++        build_helper::restore_library_path();
++
+         let (native, target) = match sanitizer_lib_boilerplate("tsan") {
+             Ok(native) => native,
+             _ => return,
+diff --git a/src/test/run-make-fulldeps/cross-lang-lto-upstream-rlibs/Makefile b/src/test/run-make-fulldeps/cross-lang-lto-upstream-rlibs/Makefile
+index 0a6f226a02..6992dab1a1 100644
+--- a/src/test/run-make-fulldeps/cross-lang-lto-upstream-rlibs/Makefile
++++ b/src/test/run-make-fulldeps/cross-lang-lto-upstream-rlibs/Makefile
+@@ -9,7 +9,7 @@ all: staticlib.rs upstream.rs
+ 
+ 	# Check No LTO
+ 	$(RUSTC) staticlib.rs -Z cross-lang-lto -Ccodegen-units=1 -L. -o $(TMPDIR)/staticlib.a
+-	(cd $(TMPDIR); llvm-ar x ./staticlib.a)
++	(cd $(TMPDIR); $(LD_LIB_PATH_ENVVAR)=$(REAL_LD_LIBRARY_PATH) llvm-ar x ./staticlib.a)
+ 	# Make sure the upstream object file was included
+ 	ls $(TMPDIR)/upstream.*.rcgu.o
+ 
+@@ -19,5 +19,5 @@ all: staticlib.rs upstream.rs
+ 	# Check ThinLTO
+ 	$(RUSTC) upstream.rs -Z cross-lang-lto -Ccodegen-units=1 -Clto=thin
+ 	$(RUSTC) staticlib.rs -Z cross-lang-lto -Ccodegen-units=1 -Clto=thin -L. -o $(TMPDIR)/staticlib.a
+-	(cd $(TMPDIR); llvm-ar x ./staticlib.a)
++	(cd $(TMPDIR); $(LD_LIB_PATH_ENVVAR)=$(REAL_LD_LIBRARY_PATH) llvm-ar x ./staticlib.a)
+ 	ls $(TMPDIR)/upstream.*.rcgu.o
+diff --git a/src/test/run-make-fulldeps/cross-lang-lto/Makefile b/src/test/run-make-fulldeps/cross-lang-lto/Makefile
+index 1d072e03de..4d1fb7b953 100644
+--- a/src/test/run-make-fulldeps/cross-lang-lto/Makefile
++++ b/src/test/run-make-fulldeps/cross-lang-lto/Makefile
+@@ -5,8 +5,9 @@
+ # LLVM bitcode files (as used by linker LTO plugins) when compiling with
+ # -Z cross-lang-lto.
+ 
+-ASSERT_IS_BITCODE_OBJ=llvm-bcanalyzer # this only succeeds for bitcode files
+-EXTRACT_OBJS=(cd $(TMPDIR); rm -f ./*.o; llvm-ar x $(1))
++# this only succeeds for bitcode files
++ASSERT_IS_BITCODE_OBJ=($(LD_LIB_PATH_ENVVAR)=$(REAL_LD_LIBRARY_PATH) llvm-bcanalyzer $(1))
++EXTRACT_OBJS=(cd $(TMPDIR); rm -f ./*.o; $(LD_LIB_PATH_ENVVAR)=$(REAL_LD_LIBRARY_PATH) llvm-ar x $(1))
+ 
+ BUILD_LIB=$(RUSTC) lib.rs -Copt-level=2 -Z cross-lang-lto=on -Ccodegen-units=1
+ BUILD_EXE=$(RUSTC) main.rs -Copt-level=2 -Z cross-lang-lto=on -Ccodegen-units=1 --emit=obj
+@@ -16,31 +17,31 @@ all: staticlib staticlib-fat-lto staticlib-thin-lto rlib exe cdylib rdylib
+ staticlib: lib.rs
+ 	$(BUILD_LIB) --crate-type=staticlib -o $(TMPDIR)/liblib.a
+ 	$(call EXTRACT_OBJS, liblib.a)
+-	for file in $(TMPDIR)/liblib.*.rcgu.o; do $(ASSERT_IS_BITCODE_OBJ) $$file; done
++	for file in $(TMPDIR)/liblib.*.rcgu.o; do $(call ASSERT_IS_BITCODE_OBJ, $$file); done
+ 
+ staticlib-fat-lto: lib.rs
+ 	$(BUILD_LIB) --crate-type=staticlib -o $(TMPDIR)/liblib-fat-lto.a -Clto=fat
+ 	$(call EXTRACT_OBJS, liblib-fat-lto.a)
+-	for file in $(TMPDIR)/liblib-fat-lto.*.rcgu.o; do $(ASSERT_IS_BITCODE_OBJ) $$file; done
++	for file in $(TMPDIR)/liblib-fat-lto.*.rcgu.o; do $(call ASSERT_IS_BITCODE_OBJ, $$file); done
+ 
+ staticlib-thin-lto: lib.rs
+ 	$(BUILD_LIB) --crate-type=staticlib -o $(TMPDIR)/liblib-thin-lto.a -Clto=thin
+ 	$(call EXTRACT_OBJS, liblib-thin-lto.a)
+-	for file in $(TMPDIR)/liblib-thin-lto.*.rcgu.o; do $(ASSERT_IS_BITCODE_OBJ) $$file; done
++	for file in $(TMPDIR)/liblib-thin-lto.*.rcgu.o; do $(call ASSERT_IS_BITCODE_OBJ, $$file); done
+ 
+ rlib: lib.rs
+ 	$(BUILD_LIB) --crate-type=rlib -o $(TMPDIR)/liblib.rlib
+ 	$(call EXTRACT_OBJS, liblib.rlib)
+-	for file in $(TMPDIR)/liblib.*.rcgu.o; do $(ASSERT_IS_BITCODE_OBJ) $$file; done
++	for file in $(TMPDIR)/liblib.*.rcgu.o; do $(call ASSERT_IS_BITCODE_OBJ, $$file); done
+ 
+ cdylib: lib.rs
+ 	$(BUILD_LIB) --crate-type=cdylib --emit=obj -o $(TMPDIR)/cdylib.o
+-	$(ASSERT_IS_BITCODE_OBJ) $(TMPDIR)/cdylib.o
++	$(call ASSERT_IS_BITCODE_OBJ, $(TMPDIR)/cdylib.o)
+ 
+ rdylib: lib.rs
+ 	$(BUILD_LIB) --crate-type=dylib --emit=obj -o $(TMPDIR)/rdylib.o
+-	$(ASSERT_IS_BITCODE_OBJ) $(TMPDIR)/rdylib.o
++	$(call ASSERT_IS_BITCODE_OBJ, $(TMPDIR)/rdylib.o)
+ 
+ exe: lib.rs
+ 	$(BUILD_EXE) -o $(TMPDIR)/exe.o
+-	$(ASSERT_IS_BITCODE_OBJ) $(TMPDIR)/exe.o
++	$(call ASSERT_IS_BITCODE_OBJ, $(TMPDIR)/exe.o)
+-- 
+2.17.2
+
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 1caab5a4ca..62e2e1855c 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.29.2-src.tar.xz.sha256
-sha256 bc7b9d4c041fe8454892a4211a116a4d5243cb04583a18c5292914fc829cb2f6  rustc-1.29.2-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.33.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.33.0-src.tar.xz.asc
+sha256 f4b1a72f1a29b23dcc9d7be5f60878f0434560513273906aa93dcd5c0de39b71  rustc-1.33.0-src.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index bf110f8ade..5d14fc6682 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.29.2
+RUST_VERSION = 1.33.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
@@ -16,17 +16,10 @@ HOST_RUST_DEPENDENCIES = \
 	toolchain \
 	host-rust-bin \
 	host-cargo-bin \
+	host-openssl \
 	host-python \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
-ifeq ($(BR2_PACKAGE_JEMALLOC),y)
-HOST_RUST_DEPENDENCIES += jemalloc
-HOST_RUST_JEMALLOC_ENABLED = true
-HOST_RUST_JEMALLOC_CONF = 'jemalloc = "$(STAGING_DIR)/usr/lib/libjemalloc_pic.a"'
-else
-HOST_RUST_JEMALLOC_ENABLED = false
-endif
-
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
 # Some vendor crates contain Cargo.toml.orig files. The associated
@@ -60,7 +53,6 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo '[install]'; \
 		echo 'prefix = "$(HOST_DIR)"'; \
 		echo '[rust]'; \
-		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
 		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
-- 
2.17.2
