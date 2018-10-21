From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2018 16:35:31 +0100
Subject: [Buildroot] [git commit] bluez5_utils-headers: new package
Message-ID: <20181021154147.AB0BA88385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9edd1760edcfb8bd5cc49043e79893c60e19c0e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Header files from bluez utils version 5.x.

Separated headers are required to break circular dependencies
when python3 is built with bluetooth support.

This is a blind option, it will be automatically selected by python3
when bluez5_utils is enabled.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Arnout: add comment to keep versions in sync; make it a blind option]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/bluez5_utils-headers/Config.in             |  7 +++++++
 .../bluez5_utils-headers/bluez5_utils-headers.hash |  1 +
 .../bluez5_utils-headers/bluez5_utils-headers.mk   | 23 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk               |  1 +
 6 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index daf7eb8bc8..a3d97eb390 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -890,6 +890,7 @@ F:	package/libwebsock/
 F:	package/sofia-sip/
 
 N:	Grzegorz Blach <grzegorz@blach.pl>
+F:	package/bluez5_utils-headers/
 F:	package/pigpio/
 F:	package/python-falcon/
 F:	package/python-mimeparse/
diff --git a/package/Config.in b/package/Config.in
index 177861e358..6d2a73ff1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1473,6 +1473,7 @@ menu "Networking"
 	source "package/azmq/Config.in"
 	source "package/azure-iot-sdk-c/Config.in"
 	source "package/batman-adv/Config.in"
+	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
diff --git a/package/bluez5_utils-headers/Config.in b/package/bluez5_utils-headers/Config.in
new file mode 100644
index 0000000000..e29e3dfefa
--- /dev/null
+++ b/package/bluez5_utils-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BLUEZ5_UTILS_HEADERS
+	bool
+	help
+	  Header files from bluez utils version 5.x
+
+	  http://www.bluez.org
+	  http://www.kernel.org/pub/linux/bluetooth
diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.hash b/package/bluez5_utils-headers/bluez5_utils-headers.hash
new file mode 120000
index 0000000000..1f489458fe
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.hash
@@ -0,0 +1 @@
+../bluez5_utils/bluez5_utils.hash
\ No newline at end of file
diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
new file mode 100644
index 0000000000..020e8b4d4e
--- /dev/null
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# bluez5_utils-headers
+#
+################################################################################
+
+# Keep the version and patches in sync with bluez5_utils
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
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 0133e1507f..a613def2e2 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Keep the version and patches in sync with bluez5_utils-headers
 BLUEZ5_UTILS_VERSION = 5.50
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
