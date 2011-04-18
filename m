From: kevin.joly at armadeus.com <kevin.joly@armadeus.com>
Date: Mon, 18 Apr 2011 18:52:40 +0200
Subject: [Buildroot] [PATCH] package: add socketcan package
Message-ID: <1303145560-11520-1-git-send-email-kevin.joly@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Kevin JOLY <joly.kevin25@gmail.com>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Kevin Joly <joly.kevin25@gmail.com>
Signed-off-by: Kevin JOLY <joly.kevin25@gmail.com>
---
 package/Config.in              |    1 +
 package/socketcan/Config.in    |   15 +++++++++++++++
 package/socketcan/socketcan.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/socketcan/Config.in
 create mode 100644 package/socketcan/socketcan.mk

diff --git a/package/Config.in b/package/Config.in
index 014c2c0..f41d915 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -427,6 +427,7 @@ source "package/rsync/Config.in"
 source "package/samba/Config.in"
 source "package/ser2net/Config.in"
 source "package/socat/Config.in"
+source "package/socketcan/Config.in"
 source "package/spawn-fcgi/Config.in"
 source "package/squid/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/socketcan/Config.in b/package/socketcan/Config.in
new file mode 100644
index 0000000..e8d7a39
--- /dev/null
+++ b/package/socketcan/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_SOCKETCAN
+	bool "Socket CAN"
+	help
+	  The socketcan package is an implementation of CAN protocols
+	  (Controller Area Network) for Linux. CAN is a networking technology
+	  which has wide-spread use in automation, embedded devices, and
+	  automotive fields.
+
+	  While there have been other CAN implementations for Linux based on
+	  character devices, Socket CAN uses the Berkeley socket API,
+	  the Linux network stack and implements the CAN device drivers as
+	  network interfaces.  The CAN socket API has been designed as similar
+	  as possible to the TCP/IP protocols to allow programmers, familiar
+	  with network programming, to easily learn how to use CAN sockets.
+
diff --git a/package/socketcan/socketcan.mk b/package/socketcan/socketcan.mk
new file mode 100644
index 0000000..ee8efc0
--- /dev/null
+++ b/package/socketcan/socketcan.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# Socket CAN
+#
+#############################################################
+PROGRAMS_ISOTP = isotpdump,isotprecv,isotpsend,isotpsniffer,isotptun,isotpserver
+PROGRAMS_CANGW = cangw
+PROGRAMS_SLCAN = slcan_attach,slcand
+PROGRAMS_CAN_UTILS = can-calc-bit-timing,candump,cansniffer,cansend,canplayer,cangen,canbusload,log2long,log2asc,asc2log,canlogserver,bcmserver,slcanpty,canfdtest
+PROGRAMS = {$(PROGRAMS_ISOTP),$(PROGRAMS_CANGW),$(PROGRAMS_SLCAN),$(PROGRAMS_CAN_UTILS)}
+SOCKETCAN_VERSION = 1235
+SOCKETCAN_SOURCE = socketcan-svn-rev$(SOCKETCAN_VERSION).tar.gz
+SOCKETCAN_SITE = http://svn.berlios.de/svnroot/repos/socketcan/trunk/
+SOCKETCAN_SITE_METHOD = svn
+
+define SOCKETCAN_BUILD_CMDS
+	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils CC="$(TARGET_CC)"
+endef
+
+define SOCKETCAN_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(SOCKETCAN_DIR)/can-utils install
+	$(TARGET_STRIP) $(TARGET_DIR)/usr/local/bin/$(PROGRAMS)
+endef
+
+define SOCKETCAN_CLEAN_CMDS
+	$(MAKE) -C $(SOCKETCAN_DIR)/can-utils clean
+endef
+
+define SOCKETCAN_UNINSTALL_TARGET_CMDS
+	rm -rf $(SOCKETCAN_DIR)
+endef
+
+$(eval $(call GENTARGETS,package,socketcan))
-- 
1.7.1
