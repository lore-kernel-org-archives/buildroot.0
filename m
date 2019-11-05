From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  5 Nov 2019 22:12:54 +0100
Subject: [Buildroot] [RFC PATCH 2/7] package/cargo-bin: install if rust-bin
 selected
In-Reply-To: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
References: <20191105211259.27673-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191105211259.27673-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If host-rust-bin, the pre-built Rust compiler, is selected as a rustc
provider, then also install the pre-built cargo binary to be coherent.

Also install configuration file, reusing the one from rust package.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/cargo-bin/cargo-bin.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 3614f7a53d..4a3d52e43b 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -10,4 +10,11 @@ CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
 CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
+ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
+define HOST_CARGO_BIN_INSTALL_CMDS
+       $(@D)/install.sh --prefix=$(HOST_DIR) --disable-ldconfig
+endef
+HOST_CARGO_BIN_POST_INSTALL_HOOKS += HOST_RUST_INSTALL_CARGO_CONFIG
+endif
+
 $(eval $(host-generic-package))
-- 
2.21.0
