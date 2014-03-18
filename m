From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 18 Mar 2014 21:01:39 +0100
Subject: [Buildroot] [PATCH v3 2/2] libuci: new package
In-Reply-To: <1395172899-3799-1-git-send-email-yegorslists@googlemail.com>
References: <1395172899-3799-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1395172899-3799-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v3: add Lua support

 package/Config.in        |  1 +
 package/libuci/Config.in |  9 +++++++++
 package/libuci/libuci.mk | 22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/libuci/Config.in
 create mode 100644 package/libuci/libuci.mk

diff --git a/package/Config.in b/package/Config.in
index a2e859c..bc01d99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -785,6 +785,7 @@ source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libubox/Config.in"
+source "package/libuci/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
new file mode 100644
index 0000000..c1aba16
--- /dev/null
+++ b/package/libuci/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUCI
+	bool "libuci"
+	select BR2_PACKAGE_LIBUBOX
+	help
+	  libuci is intended to centralize the whole configuration
+	  of a device running OpenWrt. This package will also install
+	  CLI tool uci.
+
+	  http://wiki.openwrt.org/doc/techref/uci
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
new file mode 100644
index 0000000..cba001d
--- /dev/null
+++ b/package/libuci/libuci.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libuci
+#
+################################################################################
+
+LIBUCI_VERSION = 262fede3e8c8c08c1eb0d1be9bf102232fb86cb9
+LIBUCI_SITE = git://nbd.name/uci.git
+LIBUCI_LICENSE = LGPLv2.1
+LIBUCI_INSTALL_STAGING = YES
+LIBUCI_DEPENDENCIES = libubox
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+	LIBUCI_DEPENDENCIES += lua
+	LIBUCI_MAKE_ENV = \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+else
+	LIBUCI_CONF_OPT = -DBUILD_LUA:BOOL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
1.8.3.2
