From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 21 Jun 2016 14:56:43 +1000
Subject: [Buildroot] [PATCH v2 3/5] Makefile: Support nested config
	directories
In-Reply-To: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
References: <cover.1466484997.git.sam.bobroff@au1.ibm.com>
Message-ID: <0cb5b869db1fcf2c87e98ad5762dea488ca5a37e.1466484997.git.sam.bobroff@au1.ibm.com>
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
index e78b9e2..fd07f8c 100644
--- a/Makefile
+++ b/Makefile
@@ -848,7 +848,8 @@ define CREATE_DEFCONFIG_RECIPES
 		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
 endef
 
-BR2_DEFCONFIG_PATHS=$(TOPDIR)/configs $(BR2_EXTERNAL)/configs
+BR2_DEFCONFIG_PATHS=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/))) \
+		$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
 $(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-- 
2.1.0
