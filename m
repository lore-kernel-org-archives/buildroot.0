From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:13:27 +0200
Subject: [Buildroot] [git commit] netcat-openbsd: new package
Message-ID: <20141005211539.0F95FB09CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1218ab64d09c715ce985d2c957e24ed4ad1ca5f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenBSD implementations of netcat.  The main difference from
netcat is the support for IPv6, proxies, and Unix sockets.

[Thomas: use tabs in the command applying Debian patches, add
dependency on Busybox when enabled so that we override the 'nc'
command installed by Busybox.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/netcat-openbsd/Config.in         |   24 ++++++++++++++++++++
 package/netcat-openbsd/netcat-openbsd.mk |   35 ++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 0 deletions(-)

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
index 0000000..64fb7f0
--- /dev/null
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -0,0 +1,35 @@
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
+# Ensure Busybox gets built/installed before, so that this package
+# overrides Busybox nc.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+NETCAT_OPENBSD_DEPENDENCIES += busybox
+endif
+
+define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
+	fi
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
