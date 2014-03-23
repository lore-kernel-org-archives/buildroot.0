From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 21:19:21 +0100
Subject: [Buildroot] [git commit] libubox: new package
Message-ID: <20140323202228.15EFA9C0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f2becd52210dd4376b7468708c8d63b446b1c23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs !static, use += for _DEPENDENCIES/_CONF_OPT]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/libubox/Config.in  |   13 +++++++++++++
 package/libubox/libubox.mk |   18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8986734..66ded0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -791,6 +791,7 @@ source "package/libsigc/Config.in"
 source "package/libsigsegv/Config.in"
 source "package/libtasn1/Config.in"
 source "package/libtpl/Config.in"
+source "package/libubox/Config.in"
 source "package/libunwind/Config.in"
 source "package/liburcu/Config.in"
 source "package/linux-pam/Config.in"
diff --git a/package/libubox/Config.in b/package/libubox/Config.in
new file mode 100644
index 0000000..d458067
--- /dev/null
+++ b/package/libubox/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBUBOX
+	bool "libubox"
+	depends on !BR2_PREFER_STATIC_LIB
+	help
+	  This library originates from the OpenWrt project to
+	  handle the configuration file infrastructure, but can
+	  also be used for the same purposes in projects other
+	  than OpenWrt.
+
+	  http://nbd.name/gitweb.cgi?p=luci2/libubox.git;a=summary
+
+comment "libubox needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
new file mode 100644
index 0000000..0743acc
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
+	LIBUBOX_DEPENDENCIES += lua
+else
+	LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+endif
+
+$(eval $(cmake-package))
