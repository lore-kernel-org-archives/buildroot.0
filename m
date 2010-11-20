From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 20 Nov 2010 05:29:28 -0500
Subject: [Buildroot] [PATCH] do not strip libthread_db.so
Message-ID: <1290248968-16122-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For proper threading debug support, the libthread_db.so library cannot
be stripped on the target.  This is because the target gdbserver will
also load up this library at runtime and poke around its symbols.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 2e4ccba..e351e79 100644
--- a/Makefile
+++ b/Makefile
@@ -424,7 +424,8 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
 	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || :
 endif
-	find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIPCMD) 2>/dev/null || true
+	find $(TARGET_DIR) -type f -perm +111 '!' -name 'libthread_db.so*' | \
+		xargs $(STRIPCMD) 2>/dev/null || true
 	find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
 		xargs -r $(STRIPCMD) -R .comment -R .note -g --strip-unneeded
 
-- 
1.7.3.2
