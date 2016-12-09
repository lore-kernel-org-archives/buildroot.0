From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  9 Dec 2016 14:33:15 +1100
Subject: [Buildroot] [PATCH 1/1] package/qemu: separate user and system arch
	on powerpc64le
Message-ID: <25181d88c76029050a2f8535172838dc0a7f53f5.1481254393.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QEMU provides a single system emulator that supports both powerpc64
and powerpc64le with a target called 'ppc64-softmmu', but it provides
a different usermode emulator for each one (with targets
'ppc64le-linux-user' and 'ppc64-linux-user').

Due to this asymmetry it is not possible to support both cases with
the single arch value used in the package file. This patch introduces
an additional value into the package configuration,
HOST_QEMU_SYS_ARCH, so that both cases can be supported.

Fixes commit d2ff457e88ff4106f97e29516d467978827d30c2
and autobuilder failture
http://autobuild.buildroot.net/results/a2d63e21c3e82c36f4a975e90ed56faba18e97a5

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
Hi Buildroot,

I saw that host-QEMU had again failed to build on powerpc64le, so I've
taken a another look at the failure and I think I've fixed it properly
this time. After the patch I'm able to build both the system and
usermode emulators (for the host) on both powerpc64 and powerpc64le.
The commit message should explain what was going on.

Sorry for the churn :-(

Cheers,
Sam.

 package/qemu/qemu.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index bc707cf7e..66efcba34 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -35,7 +35,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-python host-zlib host-libglib2 host-p
 #       mips64el        mips64el
 #       powerpc         ppc
 #       powerpc64       ppc64
-#       powerpc64le     ppc64le
+#       powerpc64le     ppc64 (system) / ppc64le (usermode)
 #       sh2a            not supported
 #       sh4             sh4
 #       sh4eb           sh4eb
@@ -62,6 +62,7 @@ HOST_QEMU_ARCH = ppc64
 endif
 ifeq ($(HOST_QEMU_ARCH),powerpc64le)
 HOST_QEMU_ARCH = ppc64le
+HOST_QEMU_SYS_ARCH = ppc64
 endif
 ifeq ($(HOST_QEMU_ARCH),sh4a)
 HOST_QEMU_ARCH = sh4
@@ -69,9 +70,10 @@ endif
 ifeq ($(HOST_QEMU_ARCH),sh4aeb)
 HOST_QEMU_ARCH = sh4eb
 endif
+HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
 
 ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
-HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu
+HOST_QEMU_TARGETS += $(HOST_QEMU_SYS_ARCH)-softmmu
 HOST_QEMU_OPTS += --enable-system --enable-fdt
 HOST_QEMU_DEPENDENCIES += host-dtc
 else
-- 
2.11.0
