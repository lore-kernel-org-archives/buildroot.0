From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun,  7 Sep 2014 09:28:06 +0200
Subject: [Buildroot] [PATCH v7] bcache-tools: Adding package.
Message-ID: <1410074886-28617-1-git-send-email-jcd@tribudubois.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the bcache tools, required to setup the linux bcache
feature of the Linux kernel.

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
---
Changes v1 to v2
 * Remove 'support' word from comment statement in Config.in.
 * Use github helper to get the project site instead of hardcoded URL.
Changes v2 to v3
 * Added bcache-tools description in Config help.
 * Added bcache-tools URL in Config help.
 * Added BR2_LARGEFILE BR2_USE_WCHAR and BR2_USE_MMU dependencies in Config.
 * Added BR2_PACKAGE_UTIL_LINUX selection in Config.
 * Added new requirements in Config comment.
 * Use POST_EXTRACT_HOOKS to modify Makefile.
 * Pass $(TARGET_CONFIGURE_OPTS) in env variables to $(MAKE).
 * Create man8 dir as part of PRE_INSTALL_TARGET_HOOKS.
Changes v3 to v4
 * Move from .zip file to .tar.gz as download file in .mk file.
 * Use complete git tag as version in .mk file.
 * Remove explicit extract rule from .mk file (use implicite rule).
Changes v4 to v5
 * Remove explicit package name in .mk (rely on default behavior).
Changes v5 to v6
 * Switch spaces to tabs in Config.in
 * Don't patch Makefile for pkg-config in .mk file.
Changes v6 to v7
 * change eudev dependency to udev dependency in Makefile.
---
 package/Config.in                    |  1 +
 package/bcache-tools/Config.in       | 22 ++++++++++++++++++++++
 package/bcache-tools/bcache-tools.mk | 31 +++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/bcache-tools/Config.in
 create mode 100644 package/bcache-tools/bcache-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 883dd66..ef0a22a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpid/Config.in"
 	source "package/avrdude/Config.in"
+	source "package/bcache-tools/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
new file mode 100644
index 0000000..a3f7897
--- /dev/null
+++ b/package/bcache-tools/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BCACHE_TOOLS
+	bool "bcache tools"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_USE_MMU # util-linux (libblkid)
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	help
+	  Bcache is a Linux kernel block layer cache. It allows one or
+	  more fast disk drives such as flash-based solid state drives (SSDs)
+	  to act as a cache for one or more slower hard disk drives.
+
+	  http://bcache.evilpiepirate.org/
+
+	  This is the user space bcache tools, required to setup the linux
+	  bcache feature of the Linux kernel.
+
+comment "bcache-tools needs udev /dev management and a toolchain w/ largefile, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_LARGEFILE || !BR2_USE_WCHAR
diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
new file mode 100644
index 0000000..4a26efd
--- /dev/null
+++ b/package/bcache-tools/bcache-tools.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# bcache-tools
+#
+################################################################################
+
+BCACHE_TOOLS_VERSION = v1.0.7
+BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
+BCACHE_TOOLS_LICENSE = GPLv2
+BCACHE_TOOLS_LICENSE_FILES = COPYING
+BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux udev
+
+# We pass $(TARGET_CONFIGURE_OPTS) as environment variable to allow
+# the bcache-tools Makefile to alter CFLAGS
+define BCACHE_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# The bcache-tools Makefile expects the man8 directory to exist.
+define BCACHE_TOOLS_INSTALL_MAN8
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
+endef
+
+BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_INSTALL_MAN8
+
+define BCACHE_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
