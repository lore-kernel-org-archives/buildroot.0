From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 12 Jan 2013 16:29:32 -0800
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <y>
References: <y>
Message-ID: <1358036972-10406-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Httping is like 'ping' but for http-requests.

Fixed commit following review

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/Config.in          |    1 +
 package/httping/Config.in  |   24 ++++++++++++++++++++++++
 package/httping/httping.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 package/httping/Config.in
 create mode 100644 package/httping/httping.mk

diff --git a/package/Config.in b/package/Config.in
index fcc2480..7c96095 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ source "package/ethtool/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
+source "package/httping/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
 endif
diff --git a/package/httping/Config.in b/package/httping/Config.in
new file mode 100644
index 0000000..46e21f5
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
+	  So it measures the latency of the webserver + network.
+
+	  http://www.vanheusden.com/httping/
+
+if BR2_PACKAGE_HTTPING
+
+config BR2_PACKAGE_HTTPING_OPENSSL
+	bool "OpenSSL support"
+	depends on BR2_PACKAGE_OPENSSL
+	default y
+	help
+	  Adds openSSL support to httping
+
+config BR2_PACKAGE_HTTPING_TFO
+	bool "TCP Fast Open (TFO) support"
+
+endif
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
new file mode 100644
index 0000000..6783b79
--- /dev/null
+++ b/package/httping/httping.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# httping
+#
+#############################################################
+HTTPING_VERSION = 1.5.6
+HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
+HTTPING_SITE = http://www.vanheusden.com/httping
+HTTPING_LICENSE = GPLv3
+HTTPING_LICENSE_FILES = license.txt
+
+ifeq ($(BR2_PACKAGE_HTTPING_OPENSSL),y)
+	HTTPING_DEPENDENCIES = openssl
+else
+	HTTPING_SSL = no
+endif
+
+ifeq ($(BR2_PACKAGE_HTTPING_TFO),y)
+	HTTPING_TFO = yes
+endif
+
+define HTTPING_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		STRIP="$(TARGET_STRIP)" \
+		SSL=$(HTTPING_SSL) \
+		DEBUG=no \
+		TFO=$(HTTPING_TFO) -C $(@D)
+endef
+
+define HTTPING_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/httping $(TARGET_DIR)/usr/bin/httping
+endef
+
+define HTTPING_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.7.4.1
