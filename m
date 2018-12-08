From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Dec 2018 20:46:54 +0100
Subject: [Buildroot] [git commit] boot/afboot-stm32: create destination
 directory during installation
Message-ID: <20181208200042.4149C86C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f546c35ab242919020584514063ad12da1d24c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following d0f4f95e390bcb1c953efa125f5277a8a235396e ("Makefile: rework
main directory creation logic"), BINARIES_DIR is not implicitly
created by the main Makefile at the beginning of the build, leaving
that up to whatever piece of code needs to install something in
$(BINARIES_DIR).

The afboot-stm32 package didn't pay attention to this, which this
commit fixes.

While at it, we move the afboot-stm32 installation into
<pkg>_INSTALL_IMAGES_CMDS, because using <pkg>_INSTALL_TARGET_CMDS to
install only files to BINARIES_DIR is a bit strange.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/131217111

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/afboot-stm32/afboot-stm32.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index 042b21fa55..5e221cf364 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -6,13 +6,15 @@
 
 AFBOOT_STM32_VERSION = v0.1
 AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
+AFBOOT_STM32_INSTALL_IMAGES = YES
+AFBOOT_STM32_INSTALL_TARGET = NO
 
 define AFBOOT_STM32_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
 endef
 
-define AFBOOT_STM32_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 $(@D)/stm32*.bin $(BINARIES_DIR)
+define AFBOOT_STM32_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/stm32*.bin
 endef
 
 $(eval $(generic-package))
