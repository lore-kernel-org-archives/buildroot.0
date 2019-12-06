From: Paul Cercueil <paul@crapouillou.net>
Date: Fri,  6 Dec 2019 13:31:54 +0100
Subject: [Buildroot] [PATCH] busybox: Don't overwrite existing inittab
Message-ID: <20191206123154.26102-1-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a inittab file was already provided in the skeleton, don't overwrite
it with the one that comes with the busybox package.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/busybox/busybox.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 301e72bdd2..e5d2f1bd0c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -277,7 +277,9 @@ endif
 
 ifeq ($(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_INITTAB
-	$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab
+	if test ! -r $(TARGET_DIR)/etc/inittab; then \
+		$(INSTALL) -D -m 0644 package/busybox/inittab $(TARGET_DIR)/etc/inittab; \
+	fi
 endef
 endif
 
-- 
2.24.0
