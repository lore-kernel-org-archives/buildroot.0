From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 10 May 2019 10:35:05 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/murata-cyw-fw: download NVRAM
 and BT_PATCH only when needed
In-Reply-To: <20190510083505.1341-1-m.niestroj@grinn-global.com>
References: <20190510083505.1341-1-m.niestroj@grinn-global.com>
Message-ID: <20190510083505.1341-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not download NVRAM and BT_PATCH repositories when selected modules do
not require files from them. One of the example module is CYW4359, which
has neither NVRAM nor BT_PATCH files.

There is also drawback of this approach: NVRAM and BT_PATCH are not
downloaded when package is being rebuilt with changed set selected
modules, so the whole build fails because of missing files.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v2 -> v3: add this patch

 package/murata-cyw-fw/murata-cyw-fw.mk | 29 ++++++++++++++++----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/package/murata-cyw-fw/murata-cyw-fw.mk b/package/murata-cyw-fw/murata-cyw-fw.mk
index 0196b47821..c0ada217af 100644
--- a/package/murata-cyw-fw/murata-cyw-fw.mk
+++ b/package/murata-cyw-fw/murata-cyw-fw.mk
@@ -8,21 +8,10 @@ MURATA_CYW_FW_VERSION = 8d87950bfad28c65926695b7357bd8995b60016a
 MURATA_CYW_FW_VERSION_NVRAM = d27f1bf105fa1e5b828e355793b88d4b66188411
 MURATA_CYW_FW_VERSION_BT_PATCH = 748462f0b02ec4aeb500bedd60780ac51c37be31
 MURATA_CYW_FW_SITE = $(call github,murata-wireless,cyw-fmac-fw,$(MURATA_CYW_FW_VERSION))
-MURATA_CYW_FW_EXTRA_DOWNLOADS = \
-	$(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_CYW_FW_VERSION_NVRAM))/cyw-fmac-nvram-$(MURATA_CYW_FW_VERSION_NVRAM).tar.gz \
-	$(call github,murata-wireless,cyw-bt-patch,$(MURATA_CYW_FW_VERSION_BT_PATCH))/cyw-bt-patch-$(MURATA_CYW_FW_VERSION_BT_PATCH).tar.gz
 MURATA_CYW_FW_LICENSE = PROPRIETARY
 MURATA_CYW_FW_LICENSE_FILES = LICENCE.cypress
 MURATA_CYW_FW_REDISTRIBUTE = NO
 
-define MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
-	$(foreach tar, $(notdir $(MURATA_CYW_FW_EXTRA_DOWNLOADS)), \
-		$(call suitable-extractor,$(tar)) $(MURATA_CYW_FW_DL_DIR)/$(tar) | \
-		$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -$(sep) \
-	)
-endef
-MURATA_CYW_FW_POST_EXTRACT_HOOKS += MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
-
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43012) += \
 	brcmfmac43012-sdio.bin \
 	brcmfmac43012-sdio.1LV.clm_blob \
@@ -80,6 +69,24 @@ MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4359) += \
 	brcmfmac4359-pcie.bin \
 	brcmfmac4359-pcie.1FD.clm_blob
 
+ifneq ($(findstring .txt,$(MURATA_CYW_FW_FILES_y)),)
+MURATA_CYW_FW_EXTRA_DOWNLOADS += \
+	$(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_CYW_FW_VERSION_NVRAM))/cyw-fmac-nvram-$(MURATA_CYW_FW_VERSION_NVRAM).tar.gz
+endif
+
+ifneq ($(findstring .hcd,$(MURATA_CYW_FW_FILES_y)),)
+MURATA_CYW_FW_EXTRA_DOWNLOADS += \
+	$(call github,murata-wireless,cyw-bt-patch,$(MURATA_CYW_FW_VERSION_BT_PATCH))/cyw-bt-patch-$(MURATA_CYW_FW_VERSION_BT_PATCH).tar.gz
+endif
+
+define MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
+	$(foreach tar, $(notdir $(MURATA_CYW_FW_EXTRA_DOWNLOADS)), \
+		$(call suitable-extractor,$(tar)) $(MURATA_CYW_FW_DL_DIR)/$(tar) | \
+		$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -$(sep) \
+	)
+endef
+MURATA_CYW_FW_POST_EXTRACT_HOOKS += MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
+
 # Helper that assumes filename with model has two dots (CHIP.MODEL.EXT),
 # but filename without model has only single dot (CHIP.EXT).
 murata-cyw-fw-strip-model = $(shell echo -n $(1) | sed 's/\..*\./\./')
-- 
2.21.0
