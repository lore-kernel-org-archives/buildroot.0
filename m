From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:30:59 +0200
Subject: [Buildroot] [git commit] package/rustc: install cargo config as
 toolchain post-install hook
Message-ID: <20200727112613.0F31888E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16d3d70590ee35e8fd574ceda305fff5f35aabee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cargo config file is much like the cmake and meson configuration
files, something that tells the cargo build system how the
cross-toolchain is configured.

It is currently installed by the cargo package, but this package is
about to be removed as cargo is now built as part of rust
itself. Therefore, install the cargo config file as a toolchain
post-install hook, just like we do for cmake and meson.

However, we don't have a pkg-cargo infrastructure (yet) so we can't
put it there. Therefore, put it in the rustc package - any cargo
package will need rustc.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: David Pierret <david.pierret@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo/cargo.mk                             |  6 ------
 package/{cargo/config.in => rustc/cargo-config.in} |  0
 package/rustc/rustc.mk                             | 12 ++++++++++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index a387281b4c..3f6646d027 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -80,12 +80,6 @@ endef
 
 define HOST_CARGO_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/target/release/cargo $(HOST_DIR)/bin/cargo
-	$(INSTALL) -D package/cargo/config.in \
-		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
-		$(HOST_DIR)/share/cargo/config
-	$(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
-		$(HOST_DIR)/share/cargo/config
 endef
 
 $(eval $(host-generic-package))
diff --git a/package/cargo/config.in b/package/rustc/cargo-config.in
similarity index 100%
rename from package/cargo/config.in
rename to package/rustc/cargo-config.in
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 6eea9b4fc5..35ffc36106 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -20,3 +20,15 @@ endif
 RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
 
 $(eval $(host-virtual-package))
+
+ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
+define RUSTC_INSTALL_CARGO_CONFIG
+	mkdir -p $(HOST_DIR)/share/cargo
+	sed -e 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
+		-e 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
+		package/rustc/cargo-config.in \
+		> $(HOST_DIR)/share/cargo/config
+endef
+# check-package disable TypoInPackageVariable - TOOLCHAIN intended
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += RUSTC_INSTALL_CARGO_CONFIG
+endif
