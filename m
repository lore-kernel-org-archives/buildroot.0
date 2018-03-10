From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 23:50:44 +0100
Subject: [Buildroot] [git commit] uboot: fix build when libfdt-devel is
 installed system-wide
Message-ID: <20180310225130.9954E82AE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf733342324b414a1142b57781504111f81c97ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libfdt-devel is installed system-wide, the build of U-Boot host
programs currently fails with lots of:

  HOSTCC  tools/aisimage.o
In file included from tools/../include/../lib/libfdt/libfdt.h:10:0,
                 from tools/../include/libfdt.h:1,
                 from tools/fdt_host.h:11,
                 from tools/imagetool.h:24,
                 from tools/aisimage.c:8:
/usr/include/libfdt_env.h:70:30: error: conflicting types for ???fdt64_t???
 typedef uint64_t FDT_BITWISE fdt64_t;
                              ^~~~~~~
In file included from <command-line>:0:0:
././include/libfdt_env.h:19:16: note: previous declaration of ???fdt64_t??? was here
 typedef __be64 fdt64_t;
                ^~~~~~~
In file included from ././include/libfdt_env.h:12:0,
                 from <command-line>:0:
/usr/include/libfdt_env.h:90:24: error: expected ???)??? before ???x???
 static inline uint32_t fdt32_to_cpu(fdt32_t x)
                        ^

This commit adds a fixup in the U-Boot code to fix this problem. The
fixup is equivalent to applying upstream commit
http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a,
but we can't use a patch for the uboot package, since people are using
arbitrary versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5da339850d..58dd906a27 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -188,6 +188,14 @@ define UBOOT_APPLY_LOCAL_PATCHES
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 
+# This is equivalent to upstream commit
+# http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a. It
+# fixes a build failure when libfdt-devel is installed system-wide.
+define UBOOT_FIXUP_LIBFDT_INCLUDE
+	$(SED) 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' $(@D)/tools/Makefile
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
+
 ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY),y)
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
