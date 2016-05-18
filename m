From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:27 -0500
Subject: [Buildroot] [PATCH 3/6] Makefile: Support nested config directories
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-4-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Elizabeth Liner <eliner@us.ibm.com>

Extend the BR2_DEFCONFIG_PATH to support nested config directories.
This allows us to place config files in both .../config and
.../config/<arch>.

Both $(TOPDIR) and $(BR2_EXTERNAL) are supported.

Signed-off-by: Elizabeth Liner <eliner@us.ibm.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 47e0d8a..c9b6030 100644
--- a/Makefile
+++ b/Makefile
@@ -851,7 +851,8 @@ define CREATE_DEFCONFIG_RECIPES
 		$$< --defconfig=$$(CONFIG_DIR)/.config $$(CONFIG_CONFIG_IN)
 endef
 
-BR2_DEFCONFIG_PATHS=$(TOPDIR)/configs $(BR2_EXTERNAL)/configs
+BR2_DEFCONFIG_PATHS=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/))) \
+		$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
 $(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-- 
2.6.3
