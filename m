From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed,  5 Sep 2018 13:39:30 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils-headers: new package
Message-ID: <20180905113931.6703-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Header files from bluez utils version 5.x.

Separated headers are required to break circular dependencies
when python3 is build with bluetooth support.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/bluez5_utils-headers/Config.in        |  7 +++++++
 .../bluez5_utils_headers.hash                 |  4 ++++
 .../bluez5_utils_headers.mk                   | 21 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/bluez5_utils-headers/Config.in
 create mode 100644 package/bluez5_utils-headers/bluez5_utils_headers.hash
 create mode 100644 package/bluez5_utils-headers/bluez5_utils_headers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bd8095bd20..8ea433e930 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/bluez5_utils-headers/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 
diff --git a/package/Config.in b/package/Config.in
index 66f303ec58..a1b9300f8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1427,6 +1427,7 @@ menu "Networking"
 	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
+	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
diff --git a/package/bluez5_utils-headers/Config.in b/package/bluez5_utils-headers/Config.in
new file mode 100644
index 0000000000..7ae42af930
--- /dev/null
+++ b/package/bluez5_utils-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BLUEZ5_UTILS_HEADERS
+	bool "bluez5_utils-headers 5.x"
+	help
+	  Header files from bluez utils version 5.x
+
+	  http://www.bluez.org
+	  http://www.kernel.org/pub/linux/bluetooth
diff --git a/package/bluez5_utils-headers/bluez5_utils_headers.hash b/package/bluez5_utils-headers/bluez5_utils_headers.hash
new file mode 100644
index 0000000000..b965708559
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils_headers.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
+sha256  5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911  bluez-5.50.tar.xz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils-headers/bluez5_utils_headers.mk b/package/bluez5_utils-headers/bluez5_utils_headers.mk
new file mode 100644
index 0000000000..9bc463432c
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils_headers.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bluez5_utils-headers
+#
+################################################################################
+
+BLUEZ5_UTILS_HEADERS_VERSION = 5.50
+BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
+BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+BLUEZ5_UTILS_HEADERS_LICENSE = GPL-2.0+, LGPL-2.1+
+BLUEZ5_UTILS_HEADERS_LICENSE_FILES = COPYING COPYING.LIB
+
+BLUEZ5_UTILS_HEADERS_INSTALL_STAGING = YES
+BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO
+
+define BLUEZ5_UTILS_HEADERS_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/bluetooth/
+	$(INSTALL) -m 644 $(@D)/lib/*.h $(STAGING_DIR)/usr/include/bluetooth/
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
