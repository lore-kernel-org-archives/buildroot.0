From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Feb 2020 19:08:22 +0100
Subject: [Buildroot] [PATCH v3 03/10] package/cargo-bin: install if rust-bin
 selected
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <20200207180829.165689-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

If host-rust-bin, the pre-built Rust compiler, is selected as a rustc
provider, then also install the pre-built cargo binary to be coherent.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Arnout: don't install cargo config, alread moved]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cargo-bin/cargo-bin.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
index 3614f7a53d..3eaf417531 100644
--- a/package/cargo-bin/cargo-bin.mk
+++ b/package/cargo-bin/cargo-bin.mk
@@ -10,4 +10,10 @@ CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 CARGO_BIN_LICENSE = Apache-2.0 or MIT
 CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 
+ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
+define HOST_CARGO_BIN_INSTALL_CMDS
+	$(@D)/install.sh --prefix=$(HOST_DIR) --disable-ldconfig
+endef
+endif
+
 $(eval $(host-generic-package))
-- 
2.24.1
