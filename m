From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:44:03 +0200
Subject: [Buildroot] [git commit] rust: bump version to 1.27.1
Message-ID: <20180718093941.C20CF88890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f09c6907cf770ff927bacc50842abd8bd6e64baf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to 1.27.1 and backport some patches to fix build of
rust-installer.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-warnings-in-library-from-error-chain.patch | 25 ++++++++++++++++++++++
 ...mit-warnings-inside-error-chain-expansion.patch | 25 ++++++++++++++++++++++
 package/rust/rust.hash                             |  4 ++--
 package/rust/rust.mk                               |  2 +-
 4 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch b/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch
new file mode 100644
index 0000000000..be9d2a87c7
--- /dev/null
+++ b/package/rust/0001-Fix-warnings-in-library-from-error-chain.patch
@@ -0,0 +1,25 @@
+From ac3ffd15e1cf16059b4ccd90b7c816b078a621a5 Mon Sep 17 00:00:00 2001
+From: Mark Simulacrum <mark.simulacrum@gmail.com>
+Date: Wed, 20 Jun 2018 19:47:00 -0600
+Subject: [PATCH] Fix warnings in library from error-chain
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/lib.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git rust-1.27.1.orig/src/tools/rust-installer/src/lib.rs rust-1.27.1/src/tools/rust-installer/src/lib.rs
+index ff0495b..cc5e740 100644
+--- rust-1.27.1.orig/src/tools/rust-installer/src/lib.rs
++++ rust-1.27.1/src/tools/rust-installer/src/lib.rs
+@@ -22,6 +22,7 @@ extern crate winapi;
+ #[macro_use]
+ extern crate lazy_static;
+ 
++#[allow(warnings)]
+ mod errors {
+     error_chain!{
+         foreign_links {
+-- 
+2.11.0
+
diff --git a/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch b/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch
new file mode 100644
index 0000000000..6c332bc0ba
--- /dev/null
+++ b/package/rust/0001-Permit-warnings-inside-error-chain-expansion.patch
@@ -0,0 +1,25 @@
+From d90cef58439bcd14426d64b16599e060cd6464f9 Mon Sep 17 00:00:00 2001
+From: Mark Simulacrum <mark.simulacrum@gmail.com>
+Date: Wed, 20 Jun 2018 16:54:40 -0600
+Subject: [PATCH] Permit warnings inside error-chain expansion
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/main.rs | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git rust-1.27.1.orig/src/tools/rust-installer/src/main.rs rust-1.27.1/src/tools/rust-installer/src/main.rs
+index cabffb8..007ed71 100644
+--- rust-1.27.1.orig/src/tools/rust-installer/src/main.rs
++++ rust-1.27.1/src/tools/rust-installer/src/main.rs
+@@ -7,6 +7,7 @@ extern crate installer;
+ use errors::*;
+ use clap::{App, ArgMatches};
+ 
++#[allow(warnings)]
+ mod errors {
+     error_chain!{
+         links {
+-- 
+2.11.0
+
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 495722e355..6e6b0d9b6f 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,5 +1,5 @@
-# From https://static.rust-lang.org/dist/rustc-1.25.0-src.tar.xz.sha256
-sha256 14fcb82d5959df758aaf422539359300917217fa8420e34bd596e3fb6ed2de87  rustc-1.25.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.27.1-src.tar.xz.sha256
+sha256 948e2645057960ee1c03d9f0e8f78133a5f73d9ca9a24bc56126e395a212d25c  rustc-1.27.1-src.tar.xz
 # Locally generated
 sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index af5c366495..74df7d234a 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.25.0
+RUST_VERSION = 1.27.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
