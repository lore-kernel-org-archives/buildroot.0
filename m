From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 31 Jan 2020 12:27:49 +0100
Subject: [Buildroot] [RFC PATCH 4/4] package/pkg-cargo.mk: set CARGO_HOME to
 DL_DIR for make source
In-Reply-To: <20200131112749.30915-1-patrick.havelange@essensium.com>
References: <20200131112749.30915-1-patrick.havelange@essensium.com>
Message-ID: <20200131112749.30915-4-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This permits to have all the cached dependencies available inside
the DL_DIR.

CARGO_HOME is still set inside HOST/share/cargo for the rest of
the build process, and symlinks are added to reuse the cached files
from DL_DIR.
The build and install steps do not write to the cargo cache
(tested by setting the dir readonly).

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

---
Current state of this patch serie
Supported features:
- make source
- DL_DIR can be shared (even read only) after a make source

features not working:
- DL_DIR can't be updated by multiple cargo fetch at the same time
- build not guaranteed reproducible, currently due to automagic
	dependencies management done by cargo.
- support for PRIMARY SITE
- support for BACKUP_SITE
- need to verify behaviour if hashes of upstream dependencies are
	changed
- legal-info for dependencies
---
 package/pkg-cargo.mk | 5 ++++-
 package/rust/rust.mk | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index cfdae06a4e..654b368020 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -39,6 +39,9 @@ define inner-cargo-package
 # We need host-rustc to run cargo
 $(2)_DEPENDENCIES += host-rustc
 
+# Temporarily set CARGO_HOME in the download dir as it will contain downloaded dependencies.
+# For the rest of the build, CARGO_HOME is back inside $HOST_DIR
+$(2)_CARGO_DL_ENV = CARGO_HOME=$(BR2_DL_DIR)/cargo_home
 $(2)_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 $(2)_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 
@@ -47,7 +50,7 @@ ifeq ($(4),target)
 endif
 
 define $(2)_CARGO_DL_STEP
-	$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
+	$(TARGET_MAKE_ENV) $$($(2)_CARGO_DL_ENV) \
 		$(TOPDIR)/support/download/cargo \
 		$$($(2)_DL_DIR)/$$($(2)_SOURCE) \
 		$$($(2)_CARGO_TARGET_OPT)
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index a473b5e8af..30c928fb8f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -79,6 +79,12 @@ endef
 define HOST_RUST_INSTALL_CARGO_CONFIG
 	$(INSTALL) -D package/rust/config.in \
 		$(HOST_DIR)/share/cargo/config
+# dependencies were downloaded with a CARGO_HOME inside DL_DIR
+# add symlinks to point to the cached files in DL_DIR
+	ln -sfT $(BR2_DL_DIR)/cargo_home/.package-cache \
+		$(HOST_DIR)/share/cargo/.package-cache
+	ln -sfT $(BR2_DL_DIR)/cargo_home/registry \
+		$(HOST_DIR)/share/cargo/registry
 	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
 		$(HOST_DIR)/share/cargo/config
 	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
-- 
2.17.1
