From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  2 Jun 2020 12:40:11 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/redis: add optional support for
 systemd
In-Reply-To: <20200602104011.837-1-titouan.christophe@railnova.eu>
References: <20200602104011.837-1-titouan.christophe@railnova.eu>
Message-ID: <20200602104011.837-5-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use the unit type=notify (Redis contacts systemd when ready)
- Start redis with the supervised option, so it knows it should talk to systemd

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.mk      |  4 ++++
 package/redis/redis.service | 10 ++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c88e107c2b..1883f2fbaa 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,6 +30,10 @@ endif
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+REDIS_DEPENDENCIES += systemd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 REDIS_DEPENDENCIES += libopenssl
 REDIS_BUILDOPTS += BUILD_TLS=yes
diff --git a/package/redis/redis.service b/package/redis/redis.service
index 0a8162b8ab..2cc82a1980 100644
--- a/package/redis/redis.service
+++ b/package/redis/redis.service
@@ -1,13 +1,15 @@
 [Unit]
-Description=Advanced key-value store
+Description=Redis data structure server
+Documentation=https://redis.io/documentation
 After=network.target
 
 [Service]
-Type=simple
+Type=notify
 User=redis
 Group=redis
-ExecStart=/usr/bin/redis-server /etc/redis.conf
-ExecStop=/usr/bin/redis-cli shutdown
+ExecStart=/usr/bin/redis-server --supervised systemd --daemonize no
+TimeoutStartSec=5
+TimeoutStopSec=5
 CapabilityBoundingSet=
 PrivateTmp=true
 PrivateDevices=true
-- 
2.25.3
