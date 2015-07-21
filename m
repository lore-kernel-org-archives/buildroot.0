From: Martin Bark <martin@barkynet.com>
Date: Tue, 21 Jul 2015 14:02:54 +0100
Subject: [Buildroot] [PATCH 5/5] package/redis: Add systemd service
In-Reply-To: <1437483774-30291-1-git-send-email-martin@barkynet.com>
References: <1437483774-30291-1-git-send-email-martin@barkynet.com>
Message-ID: <1437483774-30291-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

redis.service originates from the redis package in Arch Linux.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
redis.service is copied from the Arch Linux redis package.  See
https://projects.archlinux.org/svntogit/community.git/tree/trunk/redis.service?h=packages/redis&id=b4907d2344855caeadf6c69bc01c403a95f8a4f3

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/redis/redis.mk      |  8 ++++++++
 package/redis/redis.service | 22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 package/redis/redis.service

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fdc4bf5..18e9ae3 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -36,4 +36,12 @@ define REDIS_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50redis
 endef
 
+define REDIS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/redis/redis.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/redis.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/redis.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/redis.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/redis/redis.service b/package/redis/redis.service
new file mode 100644
index 0000000..0a8162b
--- /dev/null
+++ b/package/redis/redis.service
@@ -0,0 +1,22 @@
+[Unit]
+Description=Advanced key-value store
+After=network.target
+
+[Service]
+Type=simple
+User=redis
+Group=redis
+ExecStart=/usr/bin/redis-server /etc/redis.conf
+ExecStop=/usr/bin/redis-cli shutdown
+CapabilityBoundingSet=
+PrivateTmp=true
+PrivateDevices=true
+ProtectSystem=full
+ProtectHome=true
+NoNewPrivileges=true
+RuntimeDirectory=redis
+RuntimeDirectoryMode=755
+LimitNOFILE=10032
+
+[Install]
+WantedBy=multi-user.target
-- 
2.1.4
