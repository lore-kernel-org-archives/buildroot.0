From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 12 Mar 2013 05:58:40 +0100
Subject: [Buildroot] [PATCH 2/5] ussp-push: new package
In-Reply-To: <cover.1363063832.git.s.martin49@gmail.com>
References: <cover.1363063832.git.s.martin49@gmail.com>
Message-ID: <ca4550a344c7c447994a6353faa5a161acb27a94.1363063832.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Eric Jarrige <eric.jarrige@armadeus.org>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
Changes since v1:
- fix dependencies in Config.in (Thomas P.)
- fix license (Thomas P.)
---
 package/Config.in                                      |  1 +
 package/ussp-push/Config.in                            | 18 ++++++++++++++++++
 .../ussp-push-fix-build-against-bluez-4.patch          | 15 +++++++++++++++
 package/ussp-push/ussp-push.mk                         | 14 ++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/ussp-push/Config.in
 create mode 100644 package/ussp-push/ussp-push-fix-build-against-bluez-4.patch
 create mode 100644 package/ussp-push/ussp-push.mk

diff --git a/package/Config.in b/package/Config.in
index 560ae9c..b8b1e60 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -729,6 +729,7 @@ source "package/tvheadend/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
 source "package/ushare/Config.in"
+source "package/ussp-push/Config.in"
 source "package/vde2/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
new file mode 100644
index 0000000..716ce34
--- /dev/null
+++ b/package/ussp-push/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_USSP_PUSH
+	bool "ussp-push"
+	depends on BR2_INET_IPV6
+	depends on !BR2_avr32
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
+	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_OPENOBEX
+	select BR2_PACKAGE_OPENOBEX_BLUEZ
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
+	  BlueTooth stack.
+
+	  http://www.xmailserver.org/ussp-push.html
+
+comment "ussp-push require a toolchain with WCHAR, IPV6 and thread support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
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
index 0000000..c109554
--- /dev/null
+++ b/package/ussp-push/ussp-push.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# ussp-push
+#
+#############################################################
+
+USSP_PUSH_VERSION = 0.11
+USSP_PUSH_SITE = http://www.xmailserver.org
+USSP_PUSH_LICENSE = GPLv2+
+USSP_PUSH_LICENSE_FILES = COPYING
+
+USSP_PUSH_DEPENDENCIES = bluez_utils openobex
+
+$(eval $(autotools-package))
-- 
1.8.1.5
