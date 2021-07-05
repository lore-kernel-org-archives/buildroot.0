From: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Date: Mon,  5 Jul 2021 14:19:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: concat files before
 passing to env image tool
In-Reply-To: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
References: <20210625091900.811972-1-mirza.kapetanovic@gmail.com>
Message-ID: <20210705121933.1055057-1-mirza.kapetanovic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
as described in the help text.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
---
 package/uboot-tools/uboot-tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 8963d6182e..4d1fc46e25 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -156,11 +156,12 @@ endif #BR_BUILDING
 
 define HOST_UBOOT_TOOLS_GENERATE_ENVIMAGE
 	$(HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS)
-	$(@D)/tools/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
+	cat $(UBOOT_TOOLS_GENERATE_ENV_FILE) | \
+		$(@D)/tools/mkenvimage -s $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE) \
 		$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT),-r) \
 		$(if $(filter "BIG",$(BR2_ENDIAN)),-b) \
 		-o $(@D)/tools/uboot-env.bin \
-		$(UBOOT_TOOLS_GENERATE_ENV_FILE)
+		-
 endef
 define HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/uboot-env.bin $(BINARIES_DIR)/uboot-env.bin
-- 
2.30.1 (Apple Git-130)
