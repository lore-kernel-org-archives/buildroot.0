From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 17:24:18 -0300
Subject: [Buildroot] [PATCH] libuv: new package
Message-ID: <1405715058-4629-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/libuv/Config.in | 14 ++++++++++++++
 package/libuv/libuv.mk  | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/libuv/Config.in
 create mode 100644 package/libuv/libuv.mk

diff --git a/package/Config.in b/package/Config.in
index 0828172..ae3dd0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -849,6 +849,7 @@ menu "Other"
 	source "package/libuci/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
+	source "package/libuv/Config.in"
 	source "package/linux-pam/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/libuv/Config.in b/package/libuv/Config.in
new file mode 100644
index 0000000..6083837
--- /dev/null
+++ b/package/libuv/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBUV
+	bool "libuv"
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  libuv is a multi-platform support library with a focus
+	  on asynchronous I/O.
+
+	  https://github.com/joyent/libuv
+
+comment "libuv needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
new file mode 100644
index 0000000..6074e9c
--- /dev/null
+++ b/package/libuv/libuv.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# libuv
+#
+################################################################################
+
+LIBUV_VERSION = v0.11.26
+LIBUV_SITE = $(call github,joyent,libuv,$(LIBUV_VERSION))
+LIBUV_DEPENDENCIES = host-pkgconf
+LIBUV_INSTALL_STAGING = YES
+LIBUV_AUTORECONF = YES
+LIBUV_LICENSE = BSD-2c, BSD-3c, ISC, MIT
+LIBUV_LICENSE_FILES = LICENSE
+
+# Tweaked autogen.sh
+define LIBUV_FIXUP_AUTOGEN
+	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
+	        >$(@D)/m4/libuv-extra-automake-flags.m4
+endef
+LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
+
+$(eval $(autotools-package))
-- 
1.8.5.5
