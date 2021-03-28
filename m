From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:10:15 +0200
Subject: [Buildroot] [git commit] package/libqrtr-glib: new package
Message-ID: <20210328194905.36E4F8775F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea64e05a1bfbe3b258a69013462f94d7db7a9c0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/libqrtr-glib/Config.in         | 17 +++++++++++++++++
 package/libqrtr-glib/libqrtr-glib.hash |  3 +++
 package/libqrtr-glib/libqrtr-glib.mk   | 15 +++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab05b352e2..44978286b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2127,6 +2127,7 @@ N:	Petr Vorel <petr.vorel@gmail.com>
 F:	package/ima-evm-utils/
 F:	package/iproute2/
 F:	package/iputils/
+F:	package/libqrtr-glib/
 F:	package/libtirpc/
 F:	package/linux-backports/
 F:	package/ltp-testsuite/
diff --git a/package/Config.in b/package/Config.in
index ce8247f0aa..1269bc7b51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1560,6 +1560,7 @@ menu "Hardware handling"
 	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
+	source "package/libqrtr-glib/Config.in"
 	source "package/libraw1394/Config.in"
 	source "package/librtas/Config.in"
 	source "package/librtlsdr/Config.in"
diff --git a/package/libqrtr-glib/Config.in b/package/libqrtr-glib/Config.in
new file mode 100644
index 0000000000..ad4fd77687
--- /dev/null
+++ b/package/libqrtr-glib/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBQRTR_GLIB
+	bool "libqrtr-glib"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 # da7653f0faab
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Qualcomm IPC Router protocol helper library.
+	  Optional dependency for libqmi >= 1.28.0.
+
+	  https://www.freedesktop.org/software/libqmi/libqrtr-glib/latest/
+
+comment "libqrtr-glib needs a toolchain w/ wchar, threads, headers >= 4.15"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
diff --git a/package/libqrtr-glib/libqrtr-glib.hash b/package/libqrtr-glib/libqrtr-glib.hash
new file mode 100644
index 0000000000..e00dd0cb94
--- /dev/null
+++ b/package/libqrtr-glib/libqrtr-glib.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  30d879b2ade6f8f461def3a677755db5c0238babf688d5c83c03b3e6abe35cee  libqrtr-glib-1.0.0.tar.xz
diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
new file mode 100644
index 0000000000..b9fc5cf3ba
--- /dev/null
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libqrtr-glib
+#
+################################################################################
+
+LIBQRTR_GLIB_VERSION = 1.0.0
+LIBQRTR_GLIB_SITE = http://www.freedesktop.org/software/libqmi
+LIBQRTR_GLIB_SOURCE = libqrtr-glib-$(LIBQRTR_GLIB_VERSION).tar.xz
+LIBQRTR_GLIB_LICENSE = LGPL-2.1+
+LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
+LIBQRTR_GLIB_INSTALL_STAGING = YES
+LIBQRTR_GLIB_DEPENDENCIES = libglib2
+
+$(eval $(autotools-package))
