From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 21:25:31 +0100
Subject: [Buildroot] [git commit] uboot: use local libfdt.h
Message-ID: <20171106201938.56CD37FC1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a6573ccee2624de0c604abf2c7df6704a4cf566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use of libfdt.h by u-boot is currently using
the <system-path>.

Jan submitted the following upstream
https://patchwork.ozlabs.org/patch/833760/

Resolves a failure like this one observed on uboot-tools
http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73

[Peter: only sed if file exists]
CC: Jan Kundr??t <jan.kundrat@cesnet.cz>
CC: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index fdacf16..a1fac7d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -183,6 +183,13 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
+# Bug: https://patchwork.ozlabs.org/patch/833760/
+define UBOOT_FIX_LIBFDT_SYSTEM_PATH
+	[ ! -e $(@D)/tools/fdtgrep.c ] || \
+	$(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_FIX_LIBFDT_SYSTEM_PATH
+
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
