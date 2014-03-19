From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 19 Mar 2014 22:54:55 +0100
Subject: [Buildroot] [PATCH v4 1/2] libubox: new package
Message-ID: <1395266096-7649-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v4: remove unneeded pkg-config macros
        v3: add Lua support
        v2: make package description more informative and fix license information

 package/Config.in          |  1 +
 package/libubox/Config.in  |  7 +++++++
 package/libubox/libubox.mk | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libubox/Config.in
 create mode 100644 package/libubox/libubox.mk

diff --git a/package/Config.in b/package/Config.in
index f9c1b0b..a2e859c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -784,6 +784,7 @@ source "package/libsigc/Config.in"
 source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
+source "package/libubox/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libubox/Config.in b/package/libubox/Config.in
new file mode 100644
index 0000000..3fa78cf
--- /dev/null
+++ b/package/libubox/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBUBOX
+	bool "libubox"
+	help
+	  Small utility library for OpenWrt. It is a dependency of
+	  libuci, that manages configuration files infrastructure.
+
+	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
new file mode 100644
index 0000000..fe3f420
--- /dev/null
+++ b/package/libubox/libubox.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libubox
+#
+################################################################################
+
+LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
+LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
+LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
+LIBUBOX_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+	LIBUBOX_DEPENDENCIES = lua
+else
+	LIBUBOX_CONF_OPT = -DBUILD_LUA:BOOL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
1.8.3.2
