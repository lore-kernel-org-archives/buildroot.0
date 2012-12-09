From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 10 Dec 2012 00:06:23 +0100
Subject: [Buildroot] [PATCH] ussp-push: new package
In-Reply-To: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
References: <1355094387-22886-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1355094387-22886-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in                                         |  1 +
 package/ussp-push/Config.in                               |  9 +++++++++
 .../ussp-push/ussp-push-fix-build-against-bluez-4.patch   | 15 +++++++++++++++
 package/ussp-push/ussp-push.mk                            | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/ussp-push/Config.in
 create mode 100644 package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
 create mode 100644 package/ussp-push/ussp-push.mk

diff --git a/package/Config.in b/package/Config.in
index 0855684..c530305 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -668,6 +668,7 @@ source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
 source "package/ushare/Config.in"
+source "package/ussp-push/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
new file mode 100644
index 0000000..324280f
--- /dev/null
+++ b/package/ussp-push/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_USSP_PUSH
+	bool "ussp-push"
+	select BR2_PACKAGE_OPENOBEX
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
+	  BlueTooth stack.
+
+	  http://www.xmailserver.org/ussp-push.html
diff --git a/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch b/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
new file mode 100644
index 0000000..0694bfb
--- /dev/null
+++ b/package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
@@ -0,0 +1,15 @@
+Fix build against bluez4.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+--- ussp-push-0.11.orig/src/obex_socket.c	2012-11-01 09:58:51.049538708 +0100
++++ ussp-push-0.11/src/obex_socket.c	2012-11-01 12:10:10.719506951 +0100
+@@ -197,7 +197,7 @@ static int bt_sock_name2bth(int devid, c
+ 	for (i = 0; i < niinf; i++) {
+ 		char devname[128];
+ 
+-		if (hci_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
++		if (hci_read_remote_name(dd, &piinf[i].bdaddr, sizeof(devname) - 1,
+ 				    devname, 100000) >= 0) {
+ 			if (strcasecmp(devname, btname) == 0) {
+ 				*btaddr = piinf[i].bdaddr;
diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
new file mode 100644
index 0000000..6f322ab
--- /dev/null
+++ b/package/ussp-push/ussp-push.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# ussp-push
+#
+#############################################################
+USSP_PUSH_VERSION = 0.11
+USSP_PUSH_SITE = http://www.xmailserver.org
+USSP_PUSH_LICENSE = GPLv2
+USSP_PUSH_LICENSE_FILES = COPYING
+
+USSP_PUSH_DEPENDENCIES = bluez_utils openobex
+
+$(eval $(autotools-package))
-- 
1.8.0.1
