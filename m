From: Simon Maes <simonn.maes@gmail.com>
Date: Wed,  4 May 2016 09:47:55 +0200
Subject: [Buildroot] [PATCH 2/6] qemu: make qemu and host-qemu packages'
	version (separately) configurable
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <1462348079-7631-2-git-send-email-simonn.maes@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Maes <simonn.maes@gmail.com>
---
 package/qemu/Config.in      |  8 ++++++++
 package/qemu/Config.in.host |  8 ++++++++
 package/qemu/qemu.mk        | 26 ++++++++++++++++++--------
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index ea6b946..a16a65c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -36,6 +36,14 @@ config BR2_PACKAGE_QEMU
 
 if BR2_PACKAGE_QEMU
 
+config BR2_PACKAGE_QEMU_VERSION
+	string "qemu version"
+	default "2.5.0"
+	help
+	  QEMU version to use target qemu
+	  Sometimes the latest version is broken for some specific
+	  architecture or target machine
+
 comment "Emulators selection"
 
 config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 71f697e..c86768f 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -18,6 +18,14 @@ config BR2_PACKAGE_HOST_QEMU
 
 if BR2_PACKAGE_HOST_QEMU
 
+config BR2_PACKAGE_HOST_QEMU_VERSION
+	string "host qemu version"
+	default "2.5.0"
+	help
+	  QEMU version to use for host qemu
+	  Sometimes the latest version is broken for some specific
+	  architecture or target machine
+
 #
 # Configuration selection
 #
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 0e99138..151060b 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,18 +4,19 @@
 #
 ################################################################################
 
-QEMU_VERSION = 2.5.1
-QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
-QEMU_SITE = http://wiki.qemu.org/download
-QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
-QEMU_LICENSE_FILES = COPYING COPYING.LIB
-#??NOTE: there is no top-level license file for non-(L)GPL licenses;
-#       the non-(L)GPL license texts are specified in the affected
-#       individual source files.
 
 #-------------------------------------------------------------
 # Host-qemu
 
+HOST_QEMU_VERSION = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_VERSION))
+HOST_QEMU_SOURCE = qemu-$(HOST_QEMU_VERSION).tar.bz2
+HOST_QEMU_SITE = http://wiki.qemu.org/download
+HOST_QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
+HOST_QEMU_LICENSE_FILES = COPYING COPYING.LIB
+#??NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
+
 HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-pixman
 HOST_QEMU_SITE = $(QEMU_SITE)
 HOST_QEMU_SOURCE = $(QEMU_SOURCE)
@@ -146,6 +147,15 @@ QEMU_USER = $(HOST_DIR)/usr/bin/qemu-$(HOST_QEMU_ARCH)
 #-------------------------------------------------------------
 # Target-qemu
 
+QEMU_VERSION = $(call qstrip,$(BR2_PACKAGE_QEMU_VERSION))
+QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
+QEMU_SITE = http://wiki.qemu.org/download
+QEMU_LICENSE = GPLv2, LGPLv2.1, MIT, BSD-3c, BSD-2c, Others/BSD-1c
+QEMU_LICENSE_FILES = COPYING COPYING.LIB
+#??NOTE: there is no top-level license file for non-(L)GPL licenses;
+#       the non-(L)GPL license texts are specified in the affected
+#       individual source files.
+
 QEMU_DEPENDENCIES = host-pkgconf host-python libglib2 zlib pixman
 
 # Need the LIBS variable because librt and libm are
-- 
2.6.2
