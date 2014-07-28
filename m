From: steffenhoenig <s.hoenig@openthinclient.com>
Date: Mon, 28 Jul 2014 21:26:43 +0200
Subject: [Buildroot] [PATCH 2/2] aufs: initial release (selects aufs-utils)
In-Reply-To: <1406575604-19545-1-git-send-email-mail@steffenhoenig.com>
References: <1406575604-19545-1-git-send-email-mail@steffenhoenig.com>
Message-ID: <1406575604-19545-2-git-send-email-mail@steffenhoenig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: steffenhoenig <mail@steffenhoenig.com>
---
 package/Config.in      |  1 +
 package/aufs/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/aufs/aufs.mk   | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/aufs/Config.in
 create mode 100644 package/aufs/aufs.mk

diff --git a/package/Config.in b/package/Config.in
index b49908c..0225e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -136,6 +136,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs/Config.in"
 	source "package/aufs-utils/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/aufs/Config.in b/package/aufs/Config.in
new file mode 100644
index 0000000..e7842bd
--- /dev/null
+++ b/package/aufs/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_AUFS
+        bool "aufs"
+        select BR2_PACKAGE_AUFS_UTILS
+        help
+          Aufs3 -- advanced multi layered unification filesystem version 3.x
+
+comment "aufs needs a Linux kernel to be built"
+    depends on !BR2_LINUX_KERNEL
+
+if BR2_PACKAGE_AUFS
+
+choice 
+    prompt "version"
+
+config BR2_PACKAGE_AUFS_LATEST_VERSION
+    bool "aufs3.15"
+
+config BR2_PACKAGE_AUFS_CUSTOM_VERSION
+    bool "custom version"
+    help
+      This option allows to use a specific aufs kernel patch set
+
+      Note: you need to insert the version string like aufs3.12, aufs3.9, ...
+
+endchoice
+
+config BR2_PACKAGE_AUFS_CUSTOM_VERSION_VALUE
+    string ""
+    depends on BR2_PACKAGE_AUFS_CUSTOM_VERSION
+
+config BR2_PACKAGE_AUFS_VERSION
+    string
+    default "aufs3.15" if BR2_PACKAGE_AUFS_LATEST_VERSION
+    default BR2_PACKAGE_AUFS_CUSTOM_VERSION_VALUE \
+        if BR2_PACKAGE_AUFS_CUSTOM_VERSION
+endif
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
new file mode 100644
index 0000000..c1b21c4
--- /dev/null
+++ b/package/aufs/aufs.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# aufs
+#
+################################################################################
+
+AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
+AUFS_LICENCSE = GPLv2
+AUFS_LICENSE_FILES = COPYING
+
+AUFS_SITE = http://git.code.sf.net/p/aufs/aufs3-standalone
+AUFS_SITE_METHOD = git
+
+AUFS_DEPENDENCIES = linux
+AUFS_INSTALL_STAGING = YES
+
+AUFS_PATCHES = kbuild base mmap standalone
+
+define AUFS_BUILD_CMDS
+    $(foreach p,$(AUFS_PATCHES),./support/scripts/apply-patches.sh $(LINUX_DIR) $(@D) *$(p).patch;)
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) aufs.ko
+endef
+
+define AUFS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(LINUX_DIR) $(LINUX_MAKE_FLAGS) -f scripts/Makefile.host \
+		scripts/unifdef
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) usr/include/linux/aufs_type.h
+	$(INSTALL) -p -m 0644 $(@D)/usr/include/linux/aufs_type.h \
+		$(STAGING_DIR)/usr/include/linux
+endef
+
+define AUFS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
