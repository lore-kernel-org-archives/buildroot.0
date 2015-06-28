From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 23:00:57 +0200
Subject: [Buildroot] [git commit] nginx: fix nginx.old clean-up
Message-ID: <20150628210113.2383C80E15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6d1d1518c192b4e33b736528a68d4d1f20b10e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
