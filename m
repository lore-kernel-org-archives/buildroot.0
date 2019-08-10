From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Aug 2019 10:00:21 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/dav1d: new package
Message-ID: <20190810080022.3222-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/dav1d/Config.in  | 11 +++++++++++
 package/dav1d/dav1d.hash |  3 +++
 package/dav1d/dav1d.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/dav1d/Config.in
 create mode 100644 package/dav1d/dav1d.hash
 create mode 100644 package/dav1d/dav1d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e8ba6cd985..9ba058e2ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -294,6 +294,7 @@ F:	package/bcg729/
 F:	package/bluez-tools/
 F:	package/boinc/
 F:	package/clamav/
+F:	package/dav1d/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
diff --git a/package/Config.in b/package/Config.in
index 5f2191a554..3f53c20bb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1504,6 +1504,7 @@ endmenu
 
 menu "Multimedia"
 	source "package/bitstream/Config.in"
+	source "package/dav1d/Config.in"
 	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
 	source "package/libamcodec/Config.in"
diff --git a/package/dav1d/Config.in b/package/dav1d/Config.in
new file mode 100644
index 0000000000..00d2fd17f1
--- /dev/null
+++ b/package/dav1d/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DAV1D
+	bool "dav1d"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
+	help
+	  dav1d is a new AV1 cross-platform decoder, open-source, and
+	  focused on speed and correctness.
+
+	  https://code.videolan.org/videolan/dav1d
+
+comment "dav1d needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
new file mode 100644
index 0000000000..594531100c
--- /dev/null
+++ b/package/dav1d/dav1d.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 18bf96c5168b8c704422387620fefaa953e8dbd4eacb0f0796c03d6e741f8924  dav1d-0.4.0.tar.bz2
+sha256 b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
new file mode 100644
index 0000000000..6c08694f15
--- /dev/null
+++ b/package/dav1d/dav1d.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# dav1d
+#
+################################################################################
+
+DAV1D_VERSION = 0.4.0
+DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
+DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
+DAV1D_LICENSE = BSD-2-Clause
+DAV1D_LICENSE_FILES = COPYING
+DAV1D_INSTALL_STAGING = YES
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+DAV1D_DEPENDENCIES += host-nasm
+endif
+
+# ARM assembly requires v6+ ISA
+ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
+DAV1D_CONF_OPTS = -Denable_asm=false
+endif
+
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+DAV1D_LDFLAGS += -latomic
+endif
+
+$(eval $(meson-package))
-- 
2.20.1
