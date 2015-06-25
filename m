From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 24 Jun 2015 23:32:49 -0400
Subject: [Buildroot] [PATCH] nginx: fix nginx.old clean-up
Message-ID: <1435203169-3930-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bin path for nginx is configured for /usr/sbin, so deleting
the nginx.old back-up from /usr/bin never works.  Fix path, and
also use "$(RM)" instead of "-$(RM)", as "rm -f" never fails.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 90ebbcc..502bc44 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -222,7 +222,7 @@ endef
 
 define NGINX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-	-$(RM) $(TARGET_DIR)/usr/bin/nginx.old
+	$(RM) $(TARGET_DIR)/usr/sbin/nginx.old
 	$(INSTALL) -D -m 0664 package/nginx/nginx.logrotate \
 		$(TARGET_DIR)/etc/logrotate.d/nginx
 endef
-- 
1.9.1
