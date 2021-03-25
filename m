From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Mar 2021 18:58:31 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libqrtr-glib: add as a new
 package
Message-ID: <20210325175832.12322-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* use BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 (suggested by Peter)

Tested:
                             andes-nds32 [ 1/45]: FAILED
configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
=> not a problem of this patchset

                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 4/45]: SKIPPED
                    bootlin-armv5-uclibc [ 5/45]: SKIPPED
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: SKIPPED
             bootlin-microblazeel-uclibc [ 9/45]: SKIPPED
                   bootlin-mipsel-uclibc [10/45]: SKIPPED
                bootlin-mipsel32r6-glibc [11/45]: SKIPPED
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: SKIPPED
                     bootlin-nios2-glibc [14/45]: SKIPPED
                 bootlin-openrisc-uclibc [15/45]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
        bootlin-powerpc64le-power8-glibc [17/45]: SKIPPED
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: SKIPPED
                    bootlin-sparc-uclibc [22/45]: SKIPPED
                   bootlin-sparc64-glibc [23/45]: SKIPPED
                   bootlin-xtensa-uclibc [24/45]: SKIPPED
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: SKIPPED
                   bootlin-x86-64-uclibc [27/45]: SKIPPED
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: SKIPPED
                br-i386-pentium-mmx-musl [31/45]: SKIPPED
                   br-i386-pentium4-full [32/45]: SKIPPED
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: SKIPPED
                          linaro-aarch64 [38/45]: SKIPPED
                              linaro-arm [39/45]: SKIPPED
                     sourcery-arm-armv4t [40/45]: SKIPPED
                            sourcery-arm [41/45]: SKIPPED
                     sourcery-arm-thumb2 [42/45]: SKIPPED
                           sourcery-mips [43/45]: SKIPPED
                         sourcery-mips64 [44/45]: SKIPPED
                          sourcery-nios2 [45/45]: OK
45 builds, 34 skipped, 1 build failed, 0 legal-info failed

 package/Config.in                      |  1 +
 package/libqrtr-glib/Config.in         | 19 +++++++++++++++++++
 package/libqrtr-glib/libqrtr-glib.hash |  3 +++
 package/libqrtr-glib/libqrtr-glib.mk   | 15 +++++++++++++++
 4 files changed, 38 insertions(+)
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
index 0000000000..d0be16d3ab
--- /dev/null
+++ b/package/libqrtr-glib/Config.in
@@ -0,0 +1,19 @@
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
+comment "json-glib needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libqrtr-glib needs a toolchain w/ headers >= 4.15"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
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
