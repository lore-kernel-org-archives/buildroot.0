From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:29:53 +0100
Subject: [Buildroot] [PATCH 1/2] dropbear: install start script only if it
	doesn't already exists
Message-ID: <1421753394-32029-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That way, we can use a different start script in a custom skeleton.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/dropbear/dropbear.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 696095dc4f40..ab2456dae0bd 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -54,8 +54,9 @@ endef
 
 ifeq ($(BR2_USE_MMU),y)
 define DROPBEAR_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
-		$(TARGET_DIR)/etc/init.d/S50dropbear
+	[ -f $(TARGET_DIR)/etc/init.d/S50dropbear ] || \
+		$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
+			$(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
-- 
2.0.0
