From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 24 Jun 2016 21:46:31 +0200
Subject: [Buildroot] [Patch v2 2/3] rust-bootstrap: new package
In-Reply-To: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1466797592-5565-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1466797592-5565-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary snapshot of the Rust compiler,
suitable for the host, in order to bootstrap the Rust compiler.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rust-bootstrap/rust-bootstrap.hash |  3 +++
 package/rust-bootstrap/rust-bootstrap.mk   | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk

diff --git a/package/rust-bootstrap/rust-bootstrap.hash b/package/rust-bootstrap/rust-bootstrap.hash
new file mode 100644
index 0000000..00f686b
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 a8ca657d78162a9f0a69a1ec8b0460e97259cdf2e6353ee256ae206876c9637e rust-stage0-2016-03-18-235d774-linux-x86_64-1273b6b6aed421c9e40c59f366d0df6092ec0397.tar.bz2
+sha256 36958fcd55387d7b1b86618111fa8660c1d488fe191e85ad9659c6470874322b rust-stage0-2016-03-18-235d774-linux-i386-0e0e4448b80d0a12b75485795244bb3857a0a7ef.tar.bz2
diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-bootstrap/rust-bootstrap.mk
new file mode 100644
index 0000000..9a74c3b
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# rust-bootstrap
+#
+################################################################################
+
+# Taken from src/snapshots.txt
+RUST_BOOTSTRAP_DATE = 2016-03-18
+RUST_BOOTSTRAP_REV = 235d774
+
+ifeq ($(HOSTARCH),x86_64)
+RUST_BOOTSTRAP_HASH = 1273b6b6aed421c9e40c59f366d0df6092ec0397
+else
+RUST_BOOTSTRAP_HASH = 0e0e4448b80d0a12b75485795244bb3857a0a7ef
+endif
+
+RUST_BOOTSTRAP_VERSION = $(RUST_BOOTSTRAP_DATE)-$(RUST_BOOTSTRAP_REV)-linux-$(HOSTARCH)-$(RUST_BOOTSTRAP_HASH)
+RUST_BOOTSTRAP_SITE = https://static.rust-lang.org/stage0-snapshots
+
+RUST_BOOTSTRAP_SOURCE = rust-stage0-$(RUST_BOOTSTRAP_VERSION).tar.bz2
+RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT
+RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(host-generic-package))
-- 
2.4.11
