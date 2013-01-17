From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 17 Jan 2013 01:22:38 +0100
Subject: [Buildroot] [PATCH 1/2] makebootfat: new package
Message-ID: <1358382160-18842-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makebootfat is a host package that allows a normal (non-root) user to
create a FAT file system image.
Similar in operation to genext2fs, except for FAT instead of ext2.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/Config.in.host             |    1 +
 package/makebootfat/Config.in.host |    8 ++++++++
 package/makebootfat/makebootfat.mk |   19 +++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/makebootfat/Config.in.host
 create mode 100644 package/makebootfat/makebootfat.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 79050f2..e5e950b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 source "package/dfu-util/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
+source "package/makebootfat/Config.in.host"
 source "package/omap-u-boot-utils/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
diff --git a/package/makebootfat/Config.in.host b/package/makebootfat/Config.in.host
new file mode 100644
index 0000000..4e39a38
--- /dev/null
+++ b/package/makebootfat/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_MAKEBOOTFAT
+	bool "host makebootfat"
+	help
+	  makebootfat generates a FAT filesystem as a normal (non-root)
+	  user.
+
+	  http://advancemame.sourceforge.net/
+
diff --git a/package/makebootfat/makebootfat.mk b/package/makebootfat/makebootfat.mk
new file mode 100644
index 0000000..2e678c6
--- /dev/null
+++ b/package/makebootfat/makebootfat.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# makebootfat
+#
+#############################################################
+
+MAKEBOOTFAT_VERSION = 1.4
+MAKEBOOTFAT_SOURCE = makebootfat-$(MAKEBOOTFAT_VERSION).tar.gz
+MAKEBOOTFAT_SITE = http://downloads.sourceforge.net/project/advancemame/advanceboot/$(MAKEBOOTFAT_VERSION)
+MAKEBOOTFAT_LICENSE = GPLv2+
+MAKEBOOTFAT_LICENSE_FILES = COPYING
+
+define MAKEBOOTFAT_INSTALL_MBRFATBIN
+	$(INSTALL) -D -m 0644 $(@D)/mbrfat.bin $(HOST_DIR)/usr/lib/makebootfat/mbrfat.bin
+endef
+
+HOST_MAKEBOOTFAT_POST_INSTALL_HOOKS += MAKEBOOTFAT_INSTALL_MBRFATBIN
+
+$(eval $(host-autotools-package))
-- 
1.7.10.4
