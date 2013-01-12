From: gilles.talis at gmail.com <gilles.talis@gmail.com>
Date: Fri, 11 Jan 2013 16:00:46 -0800
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1357948846-3710-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gilles Talis <gilles.talis@gmail.com>

Httping is like 'ping' but for http-requests.
Give it an url, and it'll show you how long it takes to connect,
send a request and retrieve the reply (only the headers).
Be aware that the transmission across the network also takes time!
So it measures the latency of the webserver + network.

http://www.vanheusden.com/httping/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in          |    1 +
 package/httping/Config.in  |   24 ++++++++++++++++++++++++
 package/httping/httping.mk |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 package/httping/Config.in
 create mode 100644 package/httping/httping.mk

diff --git a/package/Config.in b/package/Config.in
index bd1db6b..2ce7de8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ source "package/ethtool/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
+source "package/httping/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
diff --git a/package/httping/Config.in b/package/httping/Config.in
new file mode 100644
index 0000000..578028f
--- /dev/null
+++ b/package/httping/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_HTTPING
+	bool "httping"
+	help
+	  Httping is like 'ping' but for http-requests.
+	  Give it an url, and it'll show you how long it takes to connect, 
+	  send a request and retrieve the reply (only the headers). 
+	  Be aware that the transmission across the network also takes time! 
+          So it measures the latency of the webserver + network.
+
+	  http://www.vanheusden.com/httping/
+
+if BR2_PACKAGE_HTTPING
+
+config BR2_PACKAGE_HTTPING_OPENSSL
+	bool "OpenSSL support"
+	default y
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_HTTPING_TFO
+	bool "TCP Fast Open (TFO) support"
+	default n
+
+endif
+
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
new file mode 100644
index 0000000..7076440
--- /dev/null
+++ b/package/httping/httping.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# httping
+#
+#############################################################
+HTTPING_VERSION = 1.5.6
+HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
+HTTPING_SITE = http://www.vanheusden.com/httping
+HTTPING_LICENSE = GPL
+HTTPING_LICENSE_FILES = license.txt
+
+ifeq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
+HTTPING_DEPENDENCIES = openssl
+endif
+
+
+ifneq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
+     HTTPING_SSL = no
+endif
+
+ifeq ($(BR2_PACKAGE_HTTPING_TFO),y)
+     HTTPING_TFO = yes 
+endif
+
+define HTTPING_BUILD_CMDS
+     $(MAKE) CC="$(TARGET_CC)" \
+     SSL=$(HTTPING_SSL) \
+     DEBUG=no \
+     TFO=$(HTTPING_TFO) \
+     LD="$(TARGET_LD)" \
+     STRIP="$(TARGET_STRIP)" -C $(@D)
+endef
+
+define HTTPING_INSTALL_TARGET_CMDS
+     $(INSTALL) -D -m 0755 $(@D)/httping $(TARGET_DIR)/usr/bin
+endef
+
+define HTTPING_CLEAN_CMDS
+     $(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+
+# http://www.vanheusden.com/httping/httping-1.5.6.tgz
-- 
1.7.4.1
