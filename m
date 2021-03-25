From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 25 Mar 2021 18:58:32 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/libqmi: bump version to 1.28.2
In-Reply-To: <20210325175832.12322-1-petr.vorel@gmail.com>
References: <20210325175832.12322-1-petr.vorel@gmail.com>
Message-ID: <20210325175832.12322-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libqrtr-glib is now optional dependency (since libqmi >= 1.28.0)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* new commit

Tested:
                             andes-nds32 [ 1/45]: FAILED
configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
=> not a problem of this patchset

                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
           bootlin-powerpc-e500mc-uclibc [16/45]: OK
        bootlin-powerpc64le-power8-glibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc-uclibc [22/45]: OK
                   bootlin-sparc64-glibc [23/45]: OK
                   bootlin-xtensa-uclibc [24/45]: OK
                    bootlin-x86-64-glibc [25/45]: OK
                     bootlin-x86-64-musl [26/45]: OK
                   bootlin-x86-64-uclibc [27/45]: OK
                            br-arm-basic [28/45]: SKIPPED
                    br-arm-full-nothread [29/45]: SKIPPED
                      br-arm-full-static [30/45]: OK
                br-i386-pentium-mmx-musl [31/45]: OK
                   br-i386-pentium4-full [32/45]: OK
                      br-mips64-n64-full [33/45]: FAILED
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: SKIPPED
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 5 skipped, 2 build failed, 0 legal-info failed

 package/libqmi/libqmi.hash |  2 +-
 package/libqmi/libqmi.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 1304a072e2..8cf25f486a 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9  libqmi-1.26.6.tar.xz
+sha256  8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783  libqmi-1.28.2.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6b5ccfcdea..b02312d702 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.26.6
+LIBQMI_VERSION = 1.28.2
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
@@ -33,6 +33,14 @@ else
 LIBQMI_CONF_OPTS += --disable-mbim-qmux
 endif
 
+# if libqrtr-glib available, enable support for QMI over QRTR
+ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
+LIBQMI_DEPENDENCIES += libqrtr-glib
+LIBQMI_CONF_OPTS += --enable-qrtr
+else
+LIBQMI_CONF_OPTS += --disable-qrtr
+endif
+
 # if ModemManager available, enable MM runtime check in
 # qmi-firmware-update (note that we don't need to build-depend on
 # anything else)
-- 
2.30.2
