From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Jun 2010 16:43:41 +0300
Subject: [Buildroot] [PATCH] fix ldconfig at target-finalize
Message-ID: <013c7951a6ee3d95f4eb50842e16b771e4f42619.1276695686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host ldconfig fails when the directory of the aux-cache file
(/var/cache/ldconfig, by default) does not exist. Make sure this directory
exists before calling ldconfig.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 794a298..1415e30 100644
--- a/Makefile
+++ b/Makefile
@@ -402,6 +402,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	$(TARGET_LDCONFIG) -r $(TARGET_DIR) 2>/dev/null
 
 	mkdir -p $(TARGET_DIR)/etc
-- 
1.7.1
