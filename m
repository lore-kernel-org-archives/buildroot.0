From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Jun 2017 22:56:12 +0200
Subject: [Buildroot] [Patch v6 5/7] rust-bootstrap: new package
In-Reply-To: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170625205614.6723-6-eric.le.bihan.dev@free.fr>
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
 package/rust-bootstrap/rust-bootstrap.hash |  8 ++++++++
 package/rust-bootstrap/rust-bootstrap.mk   | 27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
 create mode 100644 package/rust-bootstrap/rust-bootstrap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ab48ba..ddcaadd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -484,6 +484,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/rust-bin/
+F:	package/rust-bootstrap/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bootstrap/rust-bootstrap.hash b/package/rust-bootstrap/rust-bootstrap.hash
new file mode 100644
index 0000000..8533019
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.hash
@@ -0,0 +1,8 @@
+# From https://static.rust-lang.org/dist/rustc-1.17.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 9d3e3ff343f22b5288676b40d6749ebeabea863fa9e6009fbc5a018ede83c57c  rustc-1.17.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rustc-1.17.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 3eebd92512040baf3c0974c3ce61859646d8cf422cc515d724d857577da0dbd5  rustc-1.17.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.17.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 2902bb0da78208f441f1d983aeafcad01ea653d2e062a8192892868e2b41130d  rust-std-1.17.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.17.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 3dbaa44a07b14e5af05633c5f1a7d6b0538c6f8fa404ee6d3f85714d4f2bf39b  rust-std-1.17.0-i686-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-bootstrap/rust-bootstrap.mk
new file mode 100644
index 0000000..930f32c
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rust-bootstrap
+#
+################################################################################
+
+RUST_BOOTSTRAP_VERSION = 1.17.0
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
2.9.4
