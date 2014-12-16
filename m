From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 15 Dec 2014 21:54:15 -0600
Subject: [Buildroot] [PATCH 23/30] dbus: selinux file context support
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1418702062-61039-24-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/dbus/S30dbus |  4 ++++
 package/dbus/dbus.mk | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
 mode change 100755 => 100644 package/dbus/S30dbus

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
old mode 100755
new mode 100644
index 0d15c73..be51807
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -17,6 +17,10 @@
 [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
 [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
 [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
+[ -d /var/lib/dbus ] || mkdir -p /var/lib/dbus
+if [ -e /sbin/restorecon ]; then
+   restorecon -R /var/run/dbus /var/lock/subsys /tmp/dbus /var/lib/dbus
+fi
 
 RETVAL=0
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2d5d2c8..5fb2c3e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -43,6 +43,20 @@ ifeq ($(BR2_microblaze),y)
 DBUS_CONF_OPTS += --disable-inotify
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUS_CONF_OPTS += --enable-selinux
+DBUS_DEPENDENCIES += libselinux
+else
+DBUS_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+DBUS_CONF_OPTS += --enable-libaudit
+DBUS_DEPENDENCIES += audit libcap-ng
+else
+DBUS_CONF_OPTS += --disable-libaudit
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 DBUS_CONF_OPTS += --with-x
 DBUS_DEPENDENCIES += xlib_libX11
-- 
1.9.1
