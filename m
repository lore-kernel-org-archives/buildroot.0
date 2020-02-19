From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 20 Feb 2020 00:16:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to 1.38
Message-ID: <20200219231616.19489-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release requires libmnl (WireGuard dependency).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

partly tested:
$ ./utils/test-pkg -p connman -a
                             andes-nds32 [ 1/44]: FAILED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: SKIPPED
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                br-i386-pentium-mmx-musl [12/44]: SKIPPED
                   br-i386-pentium4-full [13/44]: OK
                    br-microblazeel-full [14/44]: OK
                      br-mipsel-o32-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [16/44]: OK
                      br-mips64-n64-full [17/44]: OK
                 br-mips64r6-el-hf-glibc [18/44]: OK
                       br-m68k-5208-full [19/44]: SKIPPED
                      br-m68k-68040-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
                  br-powerpc-e500mc-full [23/44]: OK
               br-powerpc-603e-basic-cpp [24/44]: SKIPPED
             br-powerpc64le-power8-glibc [25/44]: OK
               br-powerpc64-power7-glibc [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK

NOTE: andes-nds32 it's due problems with libffi and it's not caused by this update.
Any idea, how to disable andes-nds32?

configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
make: *** [package/pkg-generic.mk:264: /home/pvorel/br-test-pkg/andes-nds32/build/libffi-3.3/.stamp_configured] Error 1

Kind regards,
Petr

 package/connman/Config.in    | 1 +
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23c96..0c01992ab8 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_CONNMAN
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_IPTABLES
+	select BR2_PACKAGE_LIBMNL
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index ff5b4d48f0..3039105027 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256 6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16  connman-1.37.tar.xz
+sha256 cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b  connman-1.38.tar.xz
 # Locally computed
 sha256 b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 2cbf3fe752..64782e9e27 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.37
+CONNMAN_VERSION = 1.38
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables
@@ -24,6 +24,7 @@ CONNMAN_CONF_OPTS += \
 	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
 
 CONNMAN_DEPENDENCIES += \
+	libmnl \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
 	$(if $(BR2_PACKAGE_CONNMAN_OFONO),ofono) \
 	$(if $(BR2_PACKAGE_CONNMAN_WISPR),gnutls)
-- 
2.25.0
