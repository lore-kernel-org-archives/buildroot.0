From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:28:46 +0200
Subject: [Buildroot] [git commit] package/redis: add optional support for
 systemd
Message-ID: <20200605222828.57D19811F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac3ab472e0ddfac7ccebd3c232aa1a5355fcfebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use the unit type=notify (Redis contacts systemd when ready)
- Start redis with the supervised option, so it knows it should
  talk to systemd
- USE_SYSTEMD is not documented, but it is used in the src/Makefile

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[yann.morin.1998 at free.fr: add and explain USE_SYSTEMD]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/redis/redis.mk      |  7 +++++++
 package/redis/redis.service | 10 ++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ae823429b3..262f6cd1f4 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -30,6 +30,13 @@ endif
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+REDIS_DEPENDENCIES += systemd
+REDIS_BUILDOPTS += USE_SYSTEMD=yes
+else
+REDIS_BUILDOPTS += USE_SYSTEMD=no
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
