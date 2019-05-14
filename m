From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 May 2019 17:45:53 +0200
Subject: [Buildroot] [git commit] boot/optee-os: fix TA files installation
Message-ID: <20190514154132.86BA78A37E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ad03fd403dc596e7d4f2fe03bccca339278bd9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change fixes the TA binary files install sequence that were
previously install in target filesystem though
OPTEE_OS_INSTALL_IMAGES_CMDS instead of expected
OPTEE_OS_INSTALL_TARGET_CMDS.

This change removes useless mkdir prior call to $(INSTALL) that
already handles parent directory creation when needed.

This change conditions the .ta files installation upon their
availability as they may exist or not depending on the exact OPTEE
version/configuration selected.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/optee-os/optee-os.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 6da20a9f3e..b22f560ba7 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -75,10 +75,10 @@ endef
 endif # BR2_TARGET_OPTEE_OS_CORE
 
 ifeq ($(BR2_TARGET_OPTEE_OS_SERVICES),y)
-define OPTEE_OS_INSTALL_IMAGES_SERVICES
-	mkdir -p $(TARGET_DIR)/lib/optee_armtz
-	$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
-		$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta
+define OPTEE_OS_INSTALL_TARGET_CMDS
+	$(if $(wildcard $(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta),
+		$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz \
+			$(@D)/$(OPTEE_OS_BUILDDIR_OUT)/ta/*/*.ta)
 endef
 endif # BR2_TARGET_OPTEE_OS_SERVICES
 
