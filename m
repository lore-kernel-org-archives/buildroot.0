From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  6 Nov 2017 06:13:27 -0600
Subject: [Buildroot] [PATCH 1/2] uboot: use local libfdt.h
Message-ID: <20171106121328.20330-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use of libfdt.h by u-boot is currently using
the <system-path>.

Jan submitted the following upstream
https://patchwork.ozlabs.org/patch/833760/

Resolves a failure like this one observed on uboot-tools
http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73

CC: Jan Kundr?t <jan.kundrat@cesnet.cz>
CC: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 boot/uboot/uboot.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fdacf16856..3350814a82 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -183,6 +183,12 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
+# Bug: https://patchwork.ozlabs.org/patch/833760/
+define UBOOT_FIX_LIBFDT_SYSTEM_PATH
+	$(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c 2> /dev/null
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_FIX_LIBFDT_SYSTEM_PATH
+
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
-- 
2.14.2
