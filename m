From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 18 Jul 2019 12:06:35 +0200
Subject: [Buildroot] [PATCH 2/3] package/mosquitto: Switch systemd unit to
 Type=notify and depend on network
In-Reply-To: <20190718100636.27290-1-titouan.christophe@railnova.eu>
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
Message-ID: <20190718100636.27290-3-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
RFC: Would it be better to use the mosquitto.service file provided upstream ?
https://github.com/eclipse/mosquitto/blob/master/service/systemd/mosquitto.service.notify
---
 package/mosquitto/mosquitto.mk      | 4 ++++
 package/mosquitto/mosquitto.service | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index ed72af754a..333cce35c2 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -23,6 +23,10 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MOSQUITTO_MAKE_OPTS += WITH_SYSTEMD=yes
+endif
+
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
diff --git a/package/mosquitto/mosquitto.service b/package/mosquitto/mosquitto.service
index 2d1939d1c7..24c9d8e948 100644
--- a/package/mosquitto/mosquitto.service
+++ b/package/mosquitto/mosquitto.service
@@ -1,7 +1,10 @@
 [Unit]
 Description=Mosquitto MQTT broker
+After=network-online.target
+Wants=network-online.target
 
 [Service]
+Type=notify
 ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
 ExecReload=/bin/kill -HUP $MAINPID
 Restart=always
-- 
2.21.0
