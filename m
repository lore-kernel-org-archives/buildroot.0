From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 May 2020 20:20:37 +0200
Subject: [Buildroot] [for-next] package/rust: allow using python3 interpreter
Message-ID: <20200526182037.592824-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fedora packaging use python3 as python interpreter since rust 1.24.0 [1]
by removing python2 tests from configure script [2].

Using python3 will help to remove python2 in a near future.

[1] https://src.fedoraproject.org/rpms/rust/c/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2
[2] https://src.fedoraproject.org/rpms/rust/blob/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2/f/rust.spec#_314

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Patrick Havelange <patrick.havelange@essensium.com>
---
 ...igure-use-default-python-interpreter.patch | 37 +++++++++++++++++++
 package/rust/rust.mk                          | 17 ++++++---
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 package/rust/0002-configure-use-default-python-interpreter.patch

diff --git a/package/rust/0002-configure-use-default-python-interpreter.patch b/package/rust/0002-configure-use-default-python-interpreter.patch
new file mode 100644
index 0000000000..34d97bb4cf
--- /dev/null
+++ b/package/rust/0002-configure-use-default-python-interpreter.patch
@@ -0,0 +1,37 @@
+From aca7abb537f5caf1c9f027cf65dd0f53fb664e73 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 26 May 2020 18:24:25 +0200
+Subject: [PATCH] configure: use default python interpreter
+
+Don't try to use python2 if available, use the python interpreter available
+in ouput/host/bin/python whateverer the python version is.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/configure b/configure
+index eeb8d081d34..6014a982f47 100755
+--- a/configure
++++ b/configure
+@@ -2,16 +2,4 @@
+ 
+ script="$(dirname $0)"/src/bootstrap/configure.py
+ 
+-try() {
+-    cmd=$1
+-    shift
+-    T=$($cmd --version 2>/dev/null)
+-    if [ $? -eq 0 ]; then
+-        exec $cmd "$script" "$@"
+-    fi
+-}
+-
+-try python2.7 "$@"
+-try python27 "$@"
+-try python2 "$@"
+ exec python $script "$@"
+-- 
+2.25.4
+
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 5d14fc6682..25153966f2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -17,9 +17,16 @@ HOST_RUST_DEPENDENCIES = \
 	host-rust-bin \
 	host-cargo-bin \
 	host-openssl \
-	host-python \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_RUST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
+HOST_RUST_DEPENDENCIES += host-python3
+else
+HOST_RUST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
+HOST_RUST_DEPENDENCIES += host-python
+endif
+
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
 # Some vendor crates contain Cargo.toml.orig files. The associated
@@ -44,7 +51,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'target = ["$(RUSTC_TARGET_NAME)"]'; \
 		echo 'cargo = "$(HOST_CARGO_BIN_DIR)/cargo/bin/cargo"'; \
 		echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \
-		echo 'python = "$(HOST_DIR)/bin/python2"'; \
+		echo 'python = "$(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION)"'; \
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
 		echo 'compiler-docs = false'; \
@@ -61,12 +68,12 @@ define HOST_RUST_CONFIGURE_CMDS
 endef
 
 define HOST_RUST_BUILD_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py build
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py build
 endef
 
 define HOST_RUST_INSTALL_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py dist
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py install
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py dist
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(HOST_RUST_PYTHON_VERSION) x.py install
 endef
 
 $(eval $(host-generic-package))
-- 
2.25.4
