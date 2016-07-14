From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 15 Jul 2016 00:01:15 +0200
Subject: [Buildroot] [Patch v3 1/2] rust-bootstrap: new package
In-Reply-To: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1468533676-10894-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1468533676-10894-2-git-send-email-eric.le.bihan.dev@free.fr>
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
index 0000000..0a21802
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d0704d10237c66c3efafa6f7e5570c59a1d3fe5c6d99487540f90ebb37cd84c4 rustc-1.9.0-x86_64-unknown-linux-gnu.tar.gz
+sha256 2951dec835827974d03c7aafbf2c969f39bb530e1c200fd46f90bc01772fae39 rustc-1.9.0-i686-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-bootstrap/rust-bootstrap.mk
new file mode 100644
index 0000000..df5fb82
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# rust-bootstrap
+#
+################################################################################
+
+RUST_BOOTSTRAP_VERSION = 1.9.0
+RUST_BOOTSTRAP_DATE = 2016-05-24
+
+ifeq ($(HOSTARCH),x86_64)
+RUST_BOOTSTRAP_ARCH = x86_64
+else ifeq ($(HOSTARCH),x86)
+RUST_BOOTSTRAP_ARCH = i686
+else
+$(error Unsupported host architecture)
+endif
+
+RUST_BOOTSTRAP_SITE = https://static.rust-lang.org/dist/$(RUST_BOOTSTRAP_DATE)
+
+RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_VERSION)-$(RUST_BOOTSTRAP_ARCH)-unknown-linux-gnu.tar.gz
+RUST_BOOTSTRAP_LICENSE = Apache-2.0, MIT
+RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(host-generic-package))
-- 
2.4.11
