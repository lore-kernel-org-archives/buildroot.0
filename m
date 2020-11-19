From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:54 +0100
Subject: [Buildroot] [PATCH next 09/12] package/ripgrep: convert to cargo
 infrastructure
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-10-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Patrick Havelange <patrick.havelange@essensium.com>

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ripgrep/ripgrep.mk | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 9dd8d58de1..97e9e2ce5f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -9,30 +9,4 @@ RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 
-RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-
-RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
-
-RIPGREP_CARGO_OPTS = \
-	--target=$(RUSTC_TARGET_NAME) \
-	--manifest-path=$(@D)/Cargo.toml
-
-ifeq ($(BR2_ENABLE_DEBUG),y)
-RIPGREP_CARGO_BIN_SUBDIR = debug
-else
-RIPGREP_CARGO_OPTS += --release
-RIPGREP_CARGO_BIN_SUBDIR = release
-endif
-
-define RIPGREP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
-		cargo build $(RIPGREP_CARGO_OPTS)
-endef
-
-define RIPGREP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/$(RIPGREP_BIN_DIR)/rg \
-		$(TARGET_DIR)/usr/bin/rg
-endef
-
-$(eval $(generic-package))
+$(eval $(cargo-package))
-- 
2.28.0
