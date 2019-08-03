From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 13:14:48 +0200
Subject: [Buildroot] [git commit] package/mosquitto: extend systemd
 integration
Message-ID: <20190803111211.CFFE0839CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9baca0eea6aa2bc4a02806dec8f6b2641b24f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.5, mosquitto can be built with explicit support for
systemd. If enabled, libmosquitto will link against libsystemd: when
started, the mosquitto broker notifies systemd that it is ready (ie.
initialized and ready to accept connections), so that services that
depend on the mqtt broker can be started only at that point.

To enable this feature, the systemd service config file needs to change
to Type=notify. Upstream now provides such a file, so we can remove
ours.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk      |  7 ++++++-
 package/mosquitto/mosquitto.service | 10 ----------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index eb39f0af6e..6de6fc804f 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -29,6 +29,11 @@ else
 MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=yes
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MOSQUITTO_MAKE_OPTS += WITH_SYSTEMD=yes
+MOSQUITTO_DEPENDENCIES += systemd
+endif
+
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 MOSQUITTO_MAKE_OPTS += WITH_ADNS=yes
@@ -102,7 +107,7 @@ define MOSQUITTO_INSTALL_INIT_SYSV
 endef
 
 define MOSQUITTO_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/mosquitto/mosquitto.service \
+	$(INSTALL) -D -m 644 $(@D)/service/systemd/mosquitto.service.notify \
 		$(TARGET_DIR)/usr/lib/systemd/system/mosquitto.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/mosquitto.service \
diff --git a/package/mosquitto/mosquitto.service b/package/mosquitto/mosquitto.service
deleted file mode 100644
index 2d1939d1c7..0000000000
--- a/package/mosquitto/mosquitto.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Mosquitto MQTT broker
-
-[Service]
-ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
-ExecReload=/bin/kill -HUP $MAINPID
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
