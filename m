From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Thu, 24 Mar 2016 12:02:30 +0530
Subject: [Buildroot] [PATCH 2/3] aufs-util: new package
Message-ID: <1458801150-24657-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christian Stewart <christian@paral.in>

Adding the aufs-util utilities. Uses the linux header version settings
to guess the correct version of aufs-util but ultimately relies on the
user to enter the correct version of aufs-util to use.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
---
 package/Config.in              |  1 +
 package/aufs-util/Config.in    | 36 ++++++++++++++++++++++++++++++++++++
 package/aufs-util/aufs-util.mk | 31 +++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk

diff --git a/package/Config.in b/package/Config.in
index 54166b1..b43a46d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -161,6 +161,7 @@ endmenu
 
 menu "Filesystem and flash utilities"
 	source "package/aufs/Config.in"
+	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
new file mode 100644
index 0000000..8d4bae0
--- /dev/null
+++ b/package/aufs-util/Config.in
@@ -0,0 +1,36 @@
+comment "aufs-util needs a linux kernel"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL
+
+comment "aufs-util needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_AUFS
+	help
+	  Aufs command line utilities.
+	  Needs a kernel with aufs support. A kernel
+	  extension package is available.
+
+	  http://sourceforge.net/p/aufs/aufs-util/
+
+if BR2_PACKAGE_AUFS_UTIL
+
+config BR2_PACKAGE_AUFS_UTIL_VERSION
+	string "aufs-util branch"
+	default "see_help_to define_this"
+	help
+	  Aufs-util repository branch must be selected and
+	  match the current kernel version.  Review the
+	  following page to determine what branch number
+	  is valid.
+
+	  https://sourceforge.net/p/aufs/aufs-util/ci/master/tree/
+
+endif
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
new file mode 100644
index 0000000..e181548
--- /dev/null
+++ b/package/aufs-util/aufs-util.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# aufs-util
+#
+################################################################################
+
+# linux-headers
+AUFS_UTIL_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
+AUFS_UTIL_SITE = http://git.code.sf.net/p/aufs/aufs-util
+AUFS_UTIL_SITE_METHOD = git
+AUFS_UTIL_DEPENDENCIES = linux
+AUFS_UTIL_LICENSE = GNU
+AUFS_UTIL_LICENSE_FILES = COPYING
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
2.5.0
