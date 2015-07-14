From: Christian Stewart <christian@paral.in>
Date: Tue, 14 Jul 2015 11:42:01 -0700
Subject: [Buildroot] [PATCH 2/3] aufs-util: new package
In-Reply-To: <1436899322-19731-1-git-send-email-christian@paral.in>
References: <1436899322-19731-1-git-send-email-christian@paral.in>
Message-ID: <1436899322-19731-2-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This compiles aufs-util, built for recent kernels.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in              |  1 +
 package/aufs-util/Config.in    |  6 ++++++
 package/aufs-util/aufs-util.mk | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk

diff --git a/package/Config.in b/package/Config.in
index b49c94f..5500564 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -149,6 +149,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs-util/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cramfs/Config.in"
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
new file mode 100644
index 0000000..1afb79b
--- /dev/null
+++ b/package/aufs-util/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util"
+	help
+	  Aufs command line utilities.
+
+	  http://sourceforge.net/p/aufs/aufs-util/
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
new file mode 100644
index 0000000..81e7efb
--- /dev/null
+++ b/package/aufs-util/aufs-util.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# aufs-util
+#
+################################################################################
+
+
+# Version depends on the kernel version.
+# todo: find an effective way of detecting the right version to use
+AUFS_UTIL_VERSION = a25c0d434889cab53df62fc0a6f9e9d679470990
+AUFS_UTIL_DEPENDENCIES = linux linux-headers
+AUFS_UTIL_SITE = $(call github,morfoh,aufs-util,$(AUFS_UTIL_VERSION))
+AUFS_UTIL_LICENSE = GNU
+AUFS_UTIL_INSTALL_STAGING = NO
+AUFS_UTIL_INSTALL_TARGET = YES
+
+# Slight hack for a bug with aufsmvdown
+# Remove user setting from install command
+define AUFS_UTIL_CONFIGURE_CMDS
+	$(SED) 's/\.a\[/\.stbr\[/g' $(@D)/aumvdown.c
+	$(SED) 's/\-o root \-g root //g' $(@D)/Makefile
+endef
+
+define AUFS_UTIL_BUILD_CMDS
+	$(MAKE) -C $(LINUX_BUILDDIR) headers_install
+	$(MAKE) -C $(@D) CPPFLAGS="-I $(LINUX_BUILDDIR)/usr/include/" HOSTCC="$(CC)" HOSTLD="$(LD)" INSTALL="$(INSTALL)" all
+endef
+
+define AUFS_UTIL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" DESTDIR="$(TARGET_DIR)" install
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
