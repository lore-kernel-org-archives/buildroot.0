From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 27 Apr 2016 12:18:48 +0200
Subject: [Buildroot] [PATCH 1/1] libusbgx: new package
Message-ID: <1461752328-28760-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

libusbgx is a C library encapsulating the kernel USB gadget-configfs
userspace API functionality.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/Config.in              |  1 +
 package/libusbgx/Config.in     | 12 ++++++++++++
 package/libusbgx/libusbgx.hash |  2 ++
 package/libusbgx/libusbgx.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/libusbgx/Config.in
 create mode 100644 package/libusbgx/libusbgx.hash
 create mode 100644 package/libusbgx/libusbgx.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf..de23ad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -987,6 +987,7 @@ menu "Hardware handling"
 	source "package/libsoc/Config.in"
 	source "package/libusb/Config.in"
 	source "package/libusb-compat/Config.in"
+	source "package/libusbgx/Config.in"
 	source "package/libv4l/Config.in"
 	source "package/libxkbcommon/Config.in"
 	source "package/mraa/Config.in"
diff --git a/package/libusbgx/Config.in b/package/libusbgx/Config.in
new file mode 100644
index 0000000..fcebf3c
--- /dev/null
+++ b/package/libusbgx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBUSBGX
+	bool "libusbgx"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBCONFIG
+	help
+	  libusbgx is a C library encapsulating the kernel USB
+	  gadget-configfs userspace API functionality.
+
+	  https://github.com/libusbgx/libusbgx
+
+comment "libusbgx needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
new file mode 100644
index 0000000..c185c58
--- /dev/null
+++ b/package/libusbgx/libusbgx.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  1e258205dcde99d0eeb52404ee7ff1bc9a39eb3878e8455fb72bad7cf90c7357  libusbgx-2e3d43ee098ed928d1baa61ce791ce9ff4788c5a.tar.gz
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
new file mode 100644
index 0000000..9d22e0b
--- /dev/null
+++ b/package/libusbgx/libusbgx.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libusbgx
+#
+################################################################################
+
+LIBUSBGX_VERSION = 2e3d43ee098ed928d1baa61ce791ce9ff4788c5a
+LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,$(LIBUSBGX_VERSION))
+LIBUSBGX_LICENSE = LGPLv2.1+
+LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
+LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
+LIBUSBGX_AUTORECONF = YES
+LIBUSBGX_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.3
