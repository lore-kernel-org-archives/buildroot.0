From: Christian Stewart <christian@paral.in>
Date: Fri, 31 Jul 2015 16:56:57 -0700
Subject: [Buildroot] [PATCH v1 3/3] aufs-util: new package
In-Reply-To: <1438387017-10597-1-git-send-email-christian@paral.in>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
Message-ID: <1438387017-10597-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding the aufs-util utilities. Uses the linux header version settings
to guess the correct version of aufs-util but ultimately relies on the
user to enter the correct version of aufs-util to use.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in              |  1 +
 package/aufs-util/Config.in    | 34 ++++++++++++++++++++++++++++++++++
 package/aufs-util/aufs-util.mk | 30 ++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk

diff --git a/package/Config.in b/package/Config.in
index 43c58ca..9bb4993 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -148,6 +148,7 @@ endif
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/aufs-util/Config.in"
 	source "package/btrfs-progs/Config.in"
 	source "package/cifs-utils/Config.in"
 	source "package/cpio/Config.in"
diff --git a/package/aufs-util/Config.in b/package/aufs-util/Config.in
new file mode 100644
index 0000000..2b999aa
--- /dev/null
+++ b/package/aufs-util/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_AUFS_UTIL
+	bool "aufs-util"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LINUX_KERNEL
+	help
+	  Aufs command line utilities.
+	  Needs a kernel with aufs support. A kernel
+	  extension package is available.
+
+	  http://sourceforge.net/p/aufs/aufs-util/
+
+# While we don't build from the kernel headers
+# we can get a default value here
+config BR2_PACKAGE_AUFS_UTIL_VERSION
+	string "aufs-util branch"
+	depends on BR2_PACKAGE_AUFS_UTIL
+	help
+	  Aufs-util repository branch to use. Must match kernel version.
+	default "3.0"  if BR2_KERNEL_HEADERS_3_0
+	default "3.2"  if BR2_KERNEL_HEADERS_3_2
+	default "3.2"  if BR2_KERNEL_HEADERS_3_4
+	default "3.9"  if BR2_KERNEL_HEADERS_3_10 || BR2_KERNEL_HEADERS_3_11 || BR2_KERNEL_HEADERS_3_12 || BR2_KERNEL_HEADERS_3_13
+	default "3.14" if BR2_KERNEL_HEADERS_3_14 || BR2_KERNEL_HEADERS_3_15 || BR2_KERNEL_HEADERS_3_16 || BR2_KERNEL_HEADERS_3_17 || BR2_KERNEL_HEADERS_3_18 || BR2_KERNEL_HEADERS_3_19
+	default "4.0"  if BR2_KERNEL_HEADERS_4_0 || BR2_KERNEL_HEADERS_4_1
+
+comment "aufs-util needs a linux kernel"
+	depends on BR2_USE_MMU
+	depends on !BR2_LINUX_KERNEL
+
+comment "aufs-util needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
new file mode 100644
index 0000000..0733aa9
--- /dev/null
+++ b/package/aufs-util/aufs-util.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# aufs-util
+#
+################################################################################
+
+# linux-headers
+AUFS_UTIL_VERSION = aufs$(call qstrip,$(BR2_PACKAGE_AUFS_UTIL_VERSION))
+AUFS_UTIL_SITE = git://git.code.sf.net/p/aufs/aufs-util
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
2.1.4
