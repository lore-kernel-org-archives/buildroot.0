From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 23 Jul 2017 10:12:00 +0200
Subject: [Buildroot] [Patch v7 04/10] rust-bootstrap: new package
In-Reply-To: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170723081206.7774-5-eric.le.bihan.dev@free.fr>
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
index 312b176..208c98d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -494,6 +494,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/rust-bin/
+F:	package/rust-bootstrap/
 F:	package/s6/
 F:	package/s6-dns/
 F:	package/s6-linux-init/
diff --git a/package/rust-bootstrap/rust-bootstrap.hash b/package/rust-bootstrap/rust-bootstrap.hash
new file mode 100644
index 0000000..7095220
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.hash
@@ -0,0 +1,8 @@
+# From https://static.rust-lang.org/dist/rustc-1.18.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 0cb9bb95373cee8ba26e8f517c46f8c58a29e22f2c7c08a4d152306c6ffc7115  rustc-1.18.0-i686-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rustc-1.18.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 f2a34e20166ccf6eda4de46a9efb02821df5c3f34667e2988284a8eaee408113  rustc-1.18.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-x86_64-unknown-linux-gnu.tar.gz.sha256
+sha256 4a66150781e224412ebd9dd6d643ad65ecc5668a7754e4a12e115be6ce7bf527  rust-std-1.18.0-x86_64-unknown-linux-gnu.tar.gz
+# From https://static.rust-lang.org/dist/rust-std-1.18.0-i686-unknown-linux-gnu.tar.gz.sha256
+sha256 3b93c7b856b98f61ec0f640bc96373f4762484ab3340866902c8c96933bcf10b  rust-std-1.18.0-i686-unknown-linux-gnu.tar.gz
diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-bootstrap/rust-bootstrap.mk
new file mode 100644
index 0000000..04d3fc6
--- /dev/null
+++ b/package/rust-bootstrap/rust-bootstrap.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rust-bootstrap
+#
+################################################################################
+
+RUST_BOOTSTRAP_VERSION = 1.18.0
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
