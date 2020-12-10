From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Thu, 10 Dec 2020 16:48:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: make sure
 .cargo/config is used
In-Reply-To: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
Message-ID: <20201210154850.28578-1-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The way cargo searches for config file is based (among other rules)
on the current directory. This means that if cargo is started outside
of a package directory, its configuration file will not be taken
into account.
So just 'cd' into it before running cargo build/install

This fix the issue where the build is failing in offline mode and
only the dl/package.tar.gz is available.

Without this, it would have worked only if the CARGO_HOME cache had
been populated (by running cargo vendor for example).

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 package/pkg-cargo.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 6653f64594..2047aa80cc 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -51,6 +51,7 @@ $(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
+	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$($(2)_CARGO_ENV) \
@@ -58,19 +59,20 @@ define $(2)_BUILD_CMDS
 			--offline \
 			--target $$(RUSTC_TARGET_NAME) \
 			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
-			--manifest-path $$(@D)/Cargo.toml \
+			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
+	cd $$(@D) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
 			--release \
-			--manifest-path $$(@D)/Cargo.toml \
+			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
 endef
@@ -83,13 +85,14 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
+	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
 		cargo install \
 			--target $$(RUSTC_TARGET_NAME) \
 			--offline \
 			--root $$(TARGET_DIR)/usr/ \
 			--bins \
-			--path $$(@D) \
+			--path ./ \
 			--force \
 			--locked \
 			$$($(2)_CARGO_INSTALL_OPTS)
@@ -98,6 +101,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
+	cd $$(@D) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$($(2)_CARGO_ENV) \
@@ -105,7 +109,7 @@ define $(2)_INSTALL_CMDS
 			--offline \
 			--root $$(HOST_DIR) \
 			--bins \
-			--path $$(@D) \
+			--path ./ \
 			--force \
 			--locked \
 			$$($(2)_CARGO_INSTALL_OPTS)
-- 
2.17.1
