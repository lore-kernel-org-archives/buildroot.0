From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed,  4 Nov 2020 18:08:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump to version
 1.14.6
Message-ID: <20201104170820.11054-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: this version requires mbim: >= 1.24.0, qmi: >= 1.26.0.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Versions are already satisfied in master, but added as warning if
somebody backport this patch.

Tested:
                             andes-nds32 [ 1/45]: FAILED
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: OK
                            br-arm-basic [ 6/45]: SKIPPED
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: OK
                    br-arm-full-nothread [11/45]: SKIPPED
                      br-arm-full-static [12/45]: OK
                br-i386-pentium-mmx-musl [13/45]: OK
                   br-i386-pentium4-full [14/45]: OK
                    br-microblazeel-full [15/45]: OK
                      br-mipsel-o32-full [16/45]: OK
                 br-mips32r6-el-hf-glibc [17/45]: OK
                      br-mips64-n64-full [18/45]: OK
                 br-mips64r6-el-hf-glibc [19/45]: OK
                       br-m68k-5208-full [20/45]: SKIPPED
                      br-m68k-68040-full [21/45]: OK
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
                  br-powerpc-e500mc-full [24/45]: OK
               br-powerpc-603e-basic-cpp [25/45]: SKIPPED
             br-powerpc64le-power8-glibc [26/45]: OK
               br-powerpc64-power7-glibc [27/45]: OK
                              br-riscv32 [28/45]: FAILED
                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: OK
                         br-sparc-uclibc [32/45]: OK
                        br-sparc64-glibc [33/45]: OK
                          br-xtensa-full [34/45]: OK
                    br-x86-64-core2-full [35/45]: OK
                          br-x86-64-musl [36/45]: OK
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

the failures are not related to this upgrade:
* andes-nds32: libffi has not been ported to nds32le-buildroot-linux-gnu
(the usual one)
* br-riscv32: RPC support not available in C library, please disable
BR2_TOOLCHAIN_EXTERNAL_INET_RPC (problem with Bootlin, which uses
glibc >= 2.32, which has removed SUN-RPC implementation. This is being
discussed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20201101180154.14307-1-petr.vorel at gmail.com/#2566327)

Kind regards,
Petr

 package/modem-manager/Config.in          | 1 +
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index c4c723776d..062826fd0a 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_MODEM_MANAGER
 	select BR2_PACKAGE_DBUS # runtime dependency
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBXSLT
 	help
 	  ModemManager is a DBus-activated daemon which controls mobile
 	  broadband (2G/3G/4G) devices and connections.
diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index bf8f965812..30c4c6988d 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa  ModemManager-1.12.10.tar.xz
+sha256  783d5da925b2ca69f6233fcead691dd0f5cba06aa479d71495efdc07053fc0fd  ModemManager-1.14.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index e69f6f0f3d..53cd0aff9a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.12.10
+MODEM_MANAGER_VERSION = 1.14.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
-MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 libxslt $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
-- 
2.29.1
