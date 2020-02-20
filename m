From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Thu, 20 Feb 2020 17:01:12 +0100
Subject: [Buildroot] [PATCH v3 03/10] package/ripgrep: convert to cargo
 infrastructure
In-Reply-To: <20200220160119.3407-1-patrick.havelange@essensium.com>
References: <20200220160119.3407-1-patrick.havelange@essensium.com>
Message-ID: <20200220160119.3407-3-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 package/ripgrep/ripgrep.mk | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 832c076f26..97e9e2ce5f 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -9,25 +9,4 @@ RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
 
-RIPGREP_DEPENDENCIES = host-rustc
-RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
-
-RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
-
-RIPGREP_CARGO_OPTS = \
-	--$(RIPGREP_CARGO_MODE) \
-	--target=$(RUSTC_TARGET_NAME) \
-	--manifest-path=$(@D)/Cargo.toml
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
2.17.1
