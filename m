From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 22 Apr 2017 19:38:38 +0200
Subject: [Buildroot] [Patch v5 5/7] rust-bootstrap: new package
In-Reply-To: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
References: <20170422173840.19694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170422173840.19694-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package fetches a binary snapshot of the Rust compiler,
suitable to bootstrap the host variant of the Rust compiler.

To bootstrap rustc version N, rustc N-1 is used.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 DEVELOPERS                                 |  1 +
 package/rust-bootstrap/rust-bootstrap.hash |  5 +++++
 package/rust-bootstrap/rust-bootstrap.mk   | 27 +++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b352042..f707f2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -452,6 +452,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/rust-bin/
+F:	package/rust-bootstrap/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bootstrap/rust-bootstrap.hash b/package/rust-bootstrap/rust-bootstrap.hash
new file mode 100644
index 0000000..b418ea0
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 a833304f99071600c72ecd868c1c7bd5ce49d1102332637a8eb7adb942f349ab  rustc-1.15.1-i686-unknown-linux-gnu.tar.gz
+sha256 33ff44672b731fc71145974ce84194a1a9bafe6da3a74fd1e7543f12467f8894  rustc-1.15.1-x86_64-unknown-linux-gnu.tar.gz
+sha256 eff452a54b208a83b35432f226cb7de046d27b5e43edfc31d71ff340af686db0  rust-std-1.15.1-i686-unknown-linux-gnu.tar.gz
+sha256 69b251b478e284dfcaefc1153183f26f41d504ae213a81224f2101d8dbd52bb0  rust-std-1.15.1-x86_64-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-bootstrap/rust-bootstrap.mk
new file mode 100644
index 0000000..a49ac25
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rust-bootstrap
+#
+################################################################################
+
+RUST_BOOTSTRAP_VERSION = 1.15.1
+RUST_BOOTSTRAP_SITE = https://static.rust-lang.org/dist
+
+RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_VERSION)-$(RUST_HOST_NAME).tar.gz
+RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
+RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+RUST_BOOTSTRAP_LIBSTD_SOURCE= rust-std-$(RUST_BOOTSTRAP_VERSION)-$(RUST_HOST_NAME).tar.gz
+RUST_BOOTSTRAP_LIBSTD_ROOT = rust-std-$(RUST_BOOTSTRAP_VERSION)-$(RUST_HOST_NAME)/rust-std-$(RUST_HOST_NAME)
+RUST_BOOTSTRAP_EXTRA_DOWNLOADS = $(RUST_BOOTSTRAP_SITE)/$(RUST_BOOTSTRAP_LIBSTD_SOURCE)
+
+define RUST_BOOTSTRAP_LIBSTD_EXTRACT
+	$(call suitable-extractor,$(RUST_BOOTSTRAP_LIBSTD_SOURCE)) \
+		$(DL_DIR)/$(RUST_BOOTSTRAP_LIBSTD_SOURCE) | \
+		$(TAR) --strip-components=2 -C $(@D)/rustc $(TAR_OPTIONS) - \
+			$(RUST_BOOTSTRAP_LIBSTD_ROOT)/lib
+endef
+
+HOST_RUST_BOOTSTRAP_EXTRA_DOWNLOADS = $(RUST_BOOTSTRAP_EXTRA_DOWNLOADS)
+HOST_RUST_BOOTSTRAP_POST_EXTRACT_HOOKS += RUST_BOOTSTRAP_LIBSTD_EXTRACT
+
+$(eval $(host-generic-package))
-- 
2.9.3
