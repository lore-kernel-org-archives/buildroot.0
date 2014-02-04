From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  4 Feb 2014 15:12:28 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
Message-ID: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When it is set, BR2_DEFCONFIG is saved like any config variable.
However, at this point it is a completely expanded, absolute path
It is not a good idea to save absolute paths in defconfig files
moreover it makes little sense to save the defconfig location
within the defconfig

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 4a675d4..f63a058 100644
--- a/Makefile
+++ b/Makefile
@@ -772,6 +772,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
+	sed -i '/^BR2_DEFCONFIG=/d' $(DEFCONFIG)
 
 # check if download URLs are outdated
 source-check:
-- 
1.8.5.3
