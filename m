From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:23 -0000
Subject: [Buildroot] [git commit branch/next] nginx: fix nginx.old clean-up
Message-ID: <20150808105615.CF2657FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6d1d1518c192b4e33b736528a68d4d1f20b10e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The bin path for nginx is configured for /usr/sbin, so deleting
the nginx.old back-up from /usr/bin never works.  Fix path, and
also use "$(RM)" instead of "-$(RM)", as "rm -f" never fails.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/nginx.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
