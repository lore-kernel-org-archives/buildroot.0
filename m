From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 19:52:23 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: concat files before
 passing to env image tool
Message-ID: <20210718171832.517B887FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d8f5a017b83265f96e154ac0e75ecb5a6fbdf8a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE so that files are actually concatenated
as described in the help text.

Signed-off-by: Mirza Kapetanovic <mirza.kapetanovic@gmail.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index b378ab65f4..a87956d028 100644
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
