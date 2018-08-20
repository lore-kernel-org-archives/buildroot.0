From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:05 +0200
Subject: [Buildroot] [[PATCH v2 05/14] package/mender: symlink
 /var/lib/mender -> /data/mender
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-6-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Mender client will use /var/lib/mender to access the persistent data
partition and expect the link to be in place.

By default it points to /data, but this can easily be overriden by
overriding the link in overlay_fs

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index acf50e0092..eb718ebc02 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -28,6 +28,8 @@ define MENDER_INSTALL_CONFIG_FILES
 		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-network
 	$(INSTALL) -D -m 0755 package/mender/mender-inventory-hostinfo \
 		$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-hostinfo
+
+	ln -sf /data/mender $(TARGET_DIR)/var/lib/mender
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
-- 
2.11.0
