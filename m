From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 06 Oct 2013 01:39:55 +0200
Subject: [Buildroot] [PATCH 1/1] dbus: pthread static lib
Message-ID: <5250A34B.3060903@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-lpthread is missing when dbus is build with static lib

fix build failure:
http://autobuild.buildroot.net/results/80a317e33afd1d5ba2f7dd9ecd89314b09b4b1fe/
http://autobuild.buildroot.net/results/2c3c040624652547bbeec363d7d6b03f2477ff00/
---
 package/dbus/dbus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d50f630..e241247 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -30,6 +30,10 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--with-system-socket=/var/run/dbus/system_bus_socket \
 		--with-system-pid-file=/var/run/messagebus.pid

+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DBUS_CONF_OPT += LIBS='-lpthread'
+endif
+
 ifeq ($(BR2_microblaze),y)
 # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
 DBUS_CONF_OPT += --disable-inotify
-- 
1.8.4
