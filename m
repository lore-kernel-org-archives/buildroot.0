From: Gary Coulbourne <bear@bears.org>
Date: Wed, 19 Dec 2012 13:43:58 -0500
Subject: [Buildroot] [PATCH 2/2] dbus: fix permissions of the installed
	launch helper
In-Reply-To: <1355942638-27288-1-git-send-email-bear@bears.org>
References: <1355942638-27288-1-git-send-email-bear@bears.org>
Message-ID: <1355942638-27288-3-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DBus uses a suid root launch helper to automatically start and stop services.  This does not
get installed properly, and requires fixup after installation to have the correct permissions.

Signed-off-by: Gary Coulbourne <bear@bears.org>
---
 package/dbus/dbus.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 694cbfe..f7f6d6d 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -87,6 +87,10 @@ HOST_DBUS_CONF_OPT = \
 # dbus for the host
 DBUS_HOST_INTROSPECT=$(HOST_DBUS_DIR)/introspect.xml
 
+define DBUS_PERMISSIONS
+/usr/libexec/dbus-daemon-launch-helper f 4750 0 81 - - - - -
+endef
+
 HOST_DBUS_GEN_INTROSPECT = \
 	$(HOST_DIR)/usr/bin/dbus-daemon --introspect > $(DBUS_HOST_INTROSPECT)
 
-- 
1.7.10.4
