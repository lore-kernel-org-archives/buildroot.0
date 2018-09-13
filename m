From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 13 Sep 2018 13:56:55 +0200
Subject: [Buildroot] [PATCH 1/2] bluez5_utils-headers: new package
Message-ID: <20180913115656.11794-1-grzegorz@blach.pl>
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
 package/bluez5_utils-headers/Config.in        |  7 ++++++
 .../bluez5_utils_headers.hash                 |  1 +
 .../bluez5_utils_headers.mk                   | 22 +++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/bluez5_utils-headers/Config.in
 create mode 120000 package/bluez5_utils-headers/bluez5_utils_headers.hash
 create mode 100644 package/bluez5_utils-headers/bluez5_utils_headers.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e4f30e1981..8a3e934763 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -893,6 +893,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/bluez5_utils-headers/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
 
diff --git a/package/Config.in b/package/Config.in
index 2810d0497f..5a62cfa03d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1438,6 +1438,7 @@ menu "Networking"
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
new file mode 120000
index 0000000000..1f489458fe
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils_headers.hash
@@ -0,0 +1 @@
+../bluez5_utils/bluez5_utils.hash
\ No newline at end of file
diff --git a/package/bluez5_utils-headers/bluez5_utils_headers.mk b/package/bluez5_utils-headers/bluez5_utils_headers.mk
new file mode 100644
index 0000000000..dbab848930
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils_headers.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# bluez5_utils-headers
+#
+################################################################################
+
+BLUEZ5_UTILS_HEADERS_VERSION = 5.50
+BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
+BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
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
