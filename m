From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 14:17:14 -0300
Subject: [Buildroot] [PATCHv2] btrfs-progs: new package
Message-ID: <1398791834-7347-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                  |  1 +
 package/btrfs-progs/Config.in      | 23 +++++++++++++++++++++++
 package/btrfs-progs/btrfs-progs.mk | 22 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/btrfs-progs/Config.in
 create mode 100644 package/btrfs-progs/btrfs-progs.mk

diff --git a/package/Config.in b/package/Config.in
index bc7271f..9e3090b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -130,6 +130,7 @@ source "package/yasm/Config.in"
 endmenu
 
 menu "Filesystem and flash utilities"
+source "package/btrfs-progs/Config.in"
 source "package/cifs-utils/Config.in"
 source "package/cramfs/Config.in"
 source "package/curlftpfs/Config.in"
diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
new file mode 100644
index 0000000..dcd2ec5
--- /dev/null
+++ b/package/btrfs-progs/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_BTRFS_PROGS
+	bool "btrfs-progs"
+	depends on BR2_LARGEFILE # acl, attr
+	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_MMU # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ACL
+	select BR2_PACKAGE_ATTR
+	select BR2_PACKAGE_E2FSPROGS
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_ZLIB
+	help
+	  Btrfs filesystem utilities
+
+	  https://btrfs.wiki.kernel.org/index.php/Main_Page
+
+comment "btrfs-progs needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
new file mode 100644
index 0000000..415ded2
--- /dev/null
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# btrfs-progs
+#
+################################################################################
+
+BTRFS_PROGS_VERSION = 3.14.1
+BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/mason/btrfs-progs
+BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
+BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
+BTRFS_PROGS_LICENSE = GPLv2
+BTRFS_PROGS_LICENSE_FILES = COPYING
+
+define BTRFS_PROGS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define BTRFS_PROGS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
