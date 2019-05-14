From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 10:20:35 +0200
Subject: [Buildroot] [PATCH v3 1/7] boot/optee-os: correct TA files install
Message-ID: <20190514082041.3487-1-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change corrects TA binary files install sequence that
were previously install in target filesystem though
OPTEE_OS_INSTALL_IMAGES_CMDS instead of expected
OPTEE_OS_INSTALL_TARGET_CMDS.

This change removes useless mkdir prior call to $(INSTALL)
that already handles parent directory creation when needed.

This change conditions .ta files install upon their
generation as a custom package repository may not generate
any .ta files.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
- No change
Changes v1 -> v2:
- Patch introduced in v2
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
 
-- 
2.17.1
