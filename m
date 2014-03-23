From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 22:33:09 +0100
Subject: [Buildroot] [git commit] libuci: new package
Message-ID: <20140323221921.DF2B69C1A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0a3fa2d0753507864cf8212ec6fa7045c1ccd3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs !static, use += for _CONF_OPT]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/libuci/Config.in |   16 ++++++++++++++++
 package/libuci/libuci.mk |   19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66ded0b..cfa53d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -792,6 +792,7 @@ source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
 source "package/libubox/Config.in"
+source "package/libuci/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
new file mode 100644
index 0000000..761ae6e
--- /dev/null
+++ b/package/libuci/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBUCI
+	bool "libuci"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_LIBUBOX
+	help
+	  This library originates from the OpenWrt project to
+	  handle the configuration file infrastructure, but can
+	  also be used for the same purposes in projects other
+	  than OpenWrt.
+
+	  This package will also install CLI tool uci.
+
+	  http://wiki.openwrt.org/doc/techref/uci
+
+comment "libuci needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
new file mode 100644
index 0000000..736b946
--- /dev/null
+++ b/package/libuci/libuci.mk
@@ -0,0 +1,19 @@
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
+else
+	LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+endif
+
+$(eval $(cmake-package))
