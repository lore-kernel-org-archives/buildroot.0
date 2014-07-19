From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:40:15 +0200
Subject: [Buildroot] [git commit] libuv: new package
Message-ID: <20140719094040.3D3069D28A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44584bddd494c4509b795fc63974938205d7751d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add comment suggested by Yann E. Morin.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/libuv/Config.in |   14 ++++++++++++++
 package/libuv/libuv.mk  |   27 +++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index db2d114..f9722f6 100644
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
index 0000000..986acee
--- /dev/null
+++ b/package/libuv/libuv.mk
@@ -0,0 +1,27 @@
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
+# Upstream needs tests to be run sequentially. This is the default in
+# automake 1.11 and before, but not starting in 1.12. To maintain
+# sequentiality in 1.12 and later, the automake option 'serial-tests'
+# must be used, Unfortunately, it is not recognised by 1.11 and
+# before. So upstream only adds it conditionally. We use automake
+# 1.14, so we need it.
+define LIBUV_FIXUP_AUTOGEN
+	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
+	        >$(@D)/m4/libuv-extra-automake-flags.m4
+endef
+LIBUV_POST_PATCH_HOOKS += LIBUV_FIXUP_AUTOGEN
+
+$(eval $(autotools-package))
