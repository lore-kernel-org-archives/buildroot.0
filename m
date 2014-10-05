From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 21:48:02 +0200
Subject: [Buildroot] [PATCH v4] netcat-openbsd: new package
Message-ID: <1412538482-5116-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenBSD implementations of netcat.
The main difference from netcat is the support for IPv6, proxies, and
Unix sockets.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v3 -> v4:
    - Propagage libbsd dependencies
    - Add host-pkgconf as dependencies
v2 -> v3:
    - Use the debian git tree
    - Remove the patch and uses a hook to apply them
    - Set the license_file
v1 -> v2:
    - Add missing license
---
 package/Config.in                        |  1 +
 package/netcat-openbsd/Config.in         | 24 ++++++++++++++++++++++++
 package/netcat-openbsd/netcat-openbsd.mk | 29 +++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/netcat-openbsd/Config.in
 create mode 100644 package/netcat-openbsd/netcat-openbsd.mk

diff --git a/package/Config.in b/package/Config.in
index f488728..de10d4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1025,6 +1025,7 @@ endif
 	source "package/netatalk/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/netcat/Config.in"
+	source "package/netcat-openbsd/Config.in"
 endif
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
new file mode 100644
index 0000000..16be610
--- /dev/null
+++ b/package/netcat-openbsd/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_NETCAT_OPENBSD
+	bool "netcat-openbsd"
+	select BR2_PACKAGE_LIBBSD
+	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+          A simple Unix utility which reads and writes data across network
+          connections using TCP or UDP protocol. It is designed to be a
+          reliable "back-end" tool that can be used directly or easily driven
+          by other programs and scripts. At the same time it is a feature-rich
+          network debugging and exploration tool, since it can create almost
+          any kind of connection you would need and has several interesting
+          built-in capabilities.
+
+          This package contains the OpenBSD rewrite of netcat, including
+          support for IPv6, proxies, and Unix sockets.
+
+          https://packages.debian.org/sid/netcat-openbsd
+
+comment "netcat-openbsd needs an (e)glibc toolchain w/ threads"
+    depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
+    depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+~
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
new file mode 100644
index 0000000..fc60b13
--- /dev/null
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# netcat-openbsd
+#
+################################################################################
+
+NETCAT_OPENBSD_VERSION = debian/1.105-7
+NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
+NETCAT_OPENBSD_LICENSE = BSD-3c
+NETCAT_OPENBSD_LICENSE_FILE = debian/copyright
+NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
+
+define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
+    if [ -d $(@D)/debian/patches ]; then \
+        support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
+    fi
+endef
+
+NETCAT_OPENBSD_POST_PATCH_HOOKS += NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
+
+define NETCAT_OPENBSD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NETCAT_OPENBSD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/nc $(TARGET_DIR)/usr/bin/nc
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
