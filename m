From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 22:45:01 +0200
Subject: [Buildroot] [git commit] ccid: new package
Message-ID: <20121008204733.037AB997FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42f0a84efd2cf511f331114db9167d00283c1425
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PC/SC driver for USB CCID smart card readers.

http://pcsclite.alioth.debian.org/ccid.html

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/ccid/Config.in |   12 ++++++++++++
 package/ccid/ccid.mk   |   29 +++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c1b4041..c91985c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,6 +383,7 @@ source "package/zxing/Config.in"
 endmenu
 
 menu "Hardware handling"
+source "package/ccid/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
new file mode 100644
index 0000000..c9b77d1
--- /dev/null
+++ b/package/ccid/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CCID
+	bool "ccid"
+	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBUSB
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	help
+	  PC/SC driver for USB CCID smart card readers
+
+	  http://pcsclite.alioth.debian.org/ccid.html
+
+comment "ccid needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
new file mode 100644
index 0000000..677ac02
--- /dev/null
+++ b/package/ccid/ccid.mk
@@ -0,0 +1,29 @@
+##########################################################
+#
+# CCID
+#
+# ########################################################
+CCID_VERSION = 1.4.7
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_SITE = https://alioth.debian.org/frs/download.php/3730
+CCID_INSTALL_STAGING = YES
+CCID_DEPENDENCIES = pcsc-lite host-pkg-config libusb
+
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
+define CCID_INSTALL_UDEV_RULES
+	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
+		cp $(@D)/src/92_pcscd_ccid.rules $(TARGET_DIR)/etc/udev/rules.d/ ; \
+	fi;
+endef
+
+CCID_POST_INSTALL_TARGET_HOOKS += CCID_INSTALL_UDEV_RULES
+endif
+
+define CCID_REMOVE_UDEV_RULES
+	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \
+		rm -f $(TARGET_DIR)/etc/udev/rules.d/92_pcscd_ccid.rules ; \
+	fi;
+endef
+CCID_POST_UNINSTALL_TARGET_HOOKS += CCID_REMOVE_UDEV_RULES
+
+$(eval $(autotools-package))
