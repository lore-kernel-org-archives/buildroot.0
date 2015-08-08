From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:53 -0000
Subject: [Buildroot] [git commit branch/next] package/redis: Add systemd
	service
Message-ID: <20150808105640.EE2527FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe8e1eba07641fcd9259d422336d29197d06caad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

redis.service originates from the redis package in Arch Linux, at
https://projects.archlinux.org/svntogit/community.git/tree/trunk/redis.service?h=packages/redis&id=b4907d2344855caeadf6c69bc01c403a95f8a4f3.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis.mk      |    8 ++++++++
 package/redis/redis.service |   22 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8537fb2..ef51972 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -35,4 +35,12 @@ define REDIS_INSTALL_INIT_SYSV
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
