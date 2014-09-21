From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:43:09 +0200
Subject: [Buildroot] [git commit] bcache-tools: Adding package.
Message-ID: <20140921204327.AA5A59D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6273204bcfa4a46f1de5c158accfdc40e15d148
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the bcache tools, required to setup the linux bcache
feature of the Linux kernel.

[Thomas: use only one hook to create the missing directories, as
suggested by Yann.]

Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/bcache-tools/Config.in       |   22 ++++++++++++++++++++++
 package/bcache-tools/bcache-tools.mk |   33 +++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 39a5c6f..2eefc3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -281,6 +281,7 @@ endmenu
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
index 0000000..666a02f
--- /dev/null
+++ b/package/bcache-tools/bcache-tools.mk
@@ -0,0 +1,33 @@
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
+BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux
+
+# We pass $(TARGET_CONFIGURE_OPTS) as environment variable to allow
+# the bcache-tools Makefile to alter CFLAGS
+define BCACHE_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+# The bcache-tools Makefile expects the man8 directory to exist
+# expects the /lib/udev/rules.d directory to exist.
+define BCACHE_TOOLS_CREATE_MISSING_DIRS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/lib/udev/rules.d
+endef
+
+BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_CREATE_MISSING_DIRS
+
+define BCACHE_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
