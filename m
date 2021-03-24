From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 24 Mar 2021 19:08:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libqrtr-glib: add as a new package
Message-ID: <20210324180849.26918-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

it looks like it depends on uapi from kernel commit da7653f0faab ("net:
qrtr: Add control packet definition to uapi") (v4.15-rc1), that's why it
fails on various setup. I wonder what is the best way to achieve it?

Kind regards,
Petr

                             andes-nds32 [ 1/45]: FAILED
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: FAILED
               bootlin-arcle-hs38-uclibc [ 4/45]: FAILED
                    bootlin-armv5-uclibc [ 5/45]: FAILED
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: FAILED
             bootlin-microblazeel-uclibc [ 9/45]: FAILED
                   bootlin-mipsel-uclibc [10/45]: FAILED
                bootlin-mipsel32r6-glibc [11/45]: FAILED
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: FAILED
                     bootlin-nios2-glibc [14/45]: FAILED
                 bootlin-openrisc-uclibc [15/45]: FAILED
           bootlin-powerpc-e500mc-uclibc [16/45]: FAILED
        bootlin-powerpc64le-power8-glibc [17/45]: FAILED
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: FAILED
                    bootlin-sparc-uclibc [22/45]: FAILED
                   bootlin-sparc64-glibc [23/45]: FAILED
                   bootlin-xtensa-uclibc [24/45]: FAILED
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: FAILED
                   bootlin-x86-64-uclibc [27/45]: FAILED
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: FAILED
                br-i386-pentium-mmx-musl [31/45]: FAILED
                   br-i386-pentium4-full [32/45]: FAILED
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: FAILED
                          linaro-aarch64 [38/45]: FAILED
                              linaro-arm [39/45]: FAILED
                     sourcery-arm-armv4t [40/45]: FAILED
                            sourcery-arm [41/45]: FAILED
                     sourcery-arm-thumb2 [42/45]: FAILED
                           sourcery-mips [43/45]: FAILED


 package/Config.in                      |  1 +
 package/libqrtr-glib/Config.in         | 15 +++++++++++++++
 package/libqrtr-glib/libqrtr-glib.hash |  3 +++
 package/libqrtr-glib/libqrtr-glib.mk   | 15 +++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/libqrtr-glib/Config.in
 create mode 100644 package/libqrtr-glib/libqrtr-glib.hash
 create mode 100644 package/libqrtr-glib/libqrtr-glib.mk

diff --git a/package/Config.in b/package/Config.in
index d278e78b68..05b95630eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1559,6 +1559,7 @@ menu "Hardware handling"
 	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
+	source "package/libqrtr-glib/Config.in"
 	source "package/libraw1394/Config.in"
 	source "package/librtas/Config.in"
 	source "package/librtlsdr/Config.in"
diff --git a/package/libqrtr-glib/Config.in b/package/libqrtr-glib/Config.in
new file mode 100644
index 0000000000..b9045e659d
--- /dev/null
+++ b/package/libqrtr-glib/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBQRTR_GLIB
+	bool "libqrtr-glib"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Qualcomm IPC Router protocol helper library.
+	  Optional dependency for libqmi >= 1.28.0.
+
+	  https://www.freedesktop.org/software/libqmi/libqrtr-glib/latest/
+
+comment "json-glib needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000000..b93acf8317
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
+LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
+LIBQRTR_GLIB_INSTALL_STAGING = YES
+
+LIBQRTR_GLIB_DEPENDENCIES = libglib2
+
+$(eval $(autotools-package))
-- 
2.30.2
