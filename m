From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:39 +0200
Subject: [Buildroot] [Patch v5 6/7] cargo-bootstrap: new package
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary snapshot of Cargo, suitable to
bootstrap the host variants of the Rust compiler and Cargo, the package
manager.

Note that, contrary to rust-bootstrap which fetches version N-1 of the
rustc binary, this package fetches a nightly version of the cargo
binary, as upstream does not provide binaries for stable releases.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/cargo-bootstrap/cargo-bootstrap.hash |  3 +++
 package/cargo-bootstrap/cargo-bootstrap.mk   | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
 create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f707f2d..b323efd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -445,6 +445,7 @@ F:	package/xxhash/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	package/adwaita-icon-theme/
+F:	package/cargo-bootstrap/
 F:	package/darkhttpd/
 F:	package/eudev/
 F:	package/execline/
diff --git a/package/cargo-bootstrap/cargo-bootstrap.hash b/package/cargo-bootstrap/cargo-bootstrap.hash
new file mode 100644
index 0000000..b193c6f
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256 0655713cacab054e8e5a33e742081eebec8531a8c77d28a4294e6496123e8ab1  cargo-nightly-x86_64-unknown-linux-gnu.tar.gz
+sha256 f20adfdcd6fb61c1252034e998998ec349c8a6b05c0320e47a539b0f6d1c76fa  cargo-nightly-i686-unknown-linux-gnu.tar.gz
diff --git a/package/cargo-bootstrap/cargo-bootstrap.mk b/package/cargo-bootstrap/cargo-bootstrap.mk
new file mode 100644
index 0000000..8a11e6e
--- /dev/null
+++ b/package/cargo-bootstrap/cargo-bootstrap.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cargo-bootstrap
+#
+################################################################################
+
+CARGO_BOOTSTRAP_VERSION = 6e0c18cccc8b0c06fba8a8d76486f81a792fb420
+CARGO_BOOTSTRAP_SITE = https://s3.amazonaws.com/rust-lang-ci/cargo-builds/$(CARGO_BOOTSTRAP_VERSION)
+CARGO_BOOTSTRAP_SOURCE = cargo-nightly-$(HOSTARCH)-unknown-linux-gnu.tar.gz
+CARGO_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
+CARGO_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+CARGO_BOOTSTRAP_STRIP_COMPONENTS = 1
+
+$(eval $(host-generic-package))
-- 
2.9.3
