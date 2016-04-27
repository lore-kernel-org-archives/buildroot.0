From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:40:13 +0200
Subject: [Buildroot] [git commit] libusbgx: new package
Message-ID: <20160427204046.4A8E781D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=409a00a12d6922e706ef40d8db09223f1cdfe9af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libusbgx is a C library encapsulating the kernel USB gadget-configfs
userspace API functionality.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Thomas: adjust license information, there are included examples that
are installed by default, licensed under GPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/libusbgx/Config.in     | 12 ++++++++++++
 package/libusbgx/libusbgx.hash |  2 ++
 package/libusbgx/libusbgx.mk   | 15 +++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2967244..480569c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,6 +994,7 @@ menu "Hardware handling"
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
index 0000000..1340d2d
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
+LIBUSBGX_LICENSE = GPLv2+ (examples), LGPLv2.1+ (library)
+LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
+LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
+LIBUSBGX_AUTORECONF = YES
+LIBUSBGX_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
