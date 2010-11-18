From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 16:25:58 -0500
Subject: [Buildroot] [PATCH] auto remove empty /usr/share dir
Message-ID: <1290115558-8915-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Often times, the only reason /usr/share exists is because of documentation
installed into it.  So once we're done cleaning the docs, attempt to rmdir
/usr/share.  If it's empty, things will work out nicely.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 69e4031..4cc62e9 100644
--- a/Makefile
+++ b/Makefile
@@ -403,6 +403,7 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
 	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
+	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || :
 endif
 	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
-- 
1.7.3.2
