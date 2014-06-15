From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 15 Jun 2014 15:32:37 +0200
Subject: [Buildroot] [PATCH 1/1 v2] rpcbind : add startup script
Message-ID: <1402839157-10710-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpcbind must be started at boot time.
Without this any nfs mount will fail.

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
v2: reworked using INSTALL_INIT_SYSV hook

 package/rpcbind/rpcbind.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 19bdace..a313030 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -15,4 +15,10 @@ RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
 RPCBIND_DEPENDENCIES += libtirpc
 
+define RPCBIND_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
+		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
+			$(TARGET_DIR)/etc/init.d/S30rpcbind
+endef
+
 $(eval $(autotools-package))
-- 
2.0.0
