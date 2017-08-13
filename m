From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Aug 2017 23:32:45 +0200
Subject: [Buildroot] [PATCH] configs/qemu_sparc_ss10: add Linux kernel patch
	to fix build with gcc 7.x
Message-ID: <20170813213245.27199-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a Linux kernel patch that fixes the build of the
qemu_sparc_ss10 defconfig when used with gcc 7.x:

arch/sparc/kernel/pcic.c: In function ?pcibios_fixup_bus?:
arch/sparc/kernel/pcic.c:647:8: error: ?cmd? may be used uninitialized in this function [-Werror=maybe-uninitialized]
    cmd |= PCI_COMMAND_IO;
        ^~

The patch has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
I don't know if we want to merge this patch in Buildroot. Indeed:

 - The defconfig doesn't use gcc 7.x currently, so the problem doesn't
   exist with the defconfig as-is.

 - This problem exists for essentially all SPARC configurations that
   have PCI support enabled.

The reason why I encountered this problem is because I'm testing
bleeding edge toolchains (based on gcc 7.x) with our Qemu defconfigs.
---
 ...l-pcic-silence-gcc-7.x-warning-in-pcibios.patch | 55 ++++++++++++++++++++++
 configs/qemu_sparc_ss10_defconfig                  |  3 ++
 2 files changed, 58 insertions(+)
 create mode 100644 board/qemu/sparc-ss10/patches/linux/0001-sparc-kernel-pcic-silence-gcc-7.x-warning-in-pcibios.patch

diff --git a/board/qemu/sparc-ss10/patches/linux/0001-sparc-kernel-pcic-silence-gcc-7.x-warning-in-pcibios.patch b/board/qemu/sparc-ss10/patches/linux/0001-sparc-kernel-pcic-silence-gcc-7.x-warning-in-pcibios.patch
new file mode 100644
index 0000000..49424bb
--- /dev/null
+++ b/board/qemu/sparc-ss10/patches/linux/0001-sparc-kernel-pcic-silence-gcc-7.x-warning-in-pcibios.patch
@@ -0,0 +1,55 @@
+From 4152ce511663d290bdcd689f983ca45d1cb12c0a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 13 Aug 2017 23:07:43 +0200
+Subject: [PATCH] sparc: kernel/pcic: silence gcc 7.x warning in
+ pcibios_fixup_bus()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When building the kernel for Sparc using gcc 7.x, the build fails
+with:
+
+arch/sparc/kernel/pcic.c: In function ?pcibios_fixup_bus?:
+arch/sparc/kernel/pcic.c:647:8: error: ?cmd? may be used uninitialized in this function [-Werror=maybe-uninitialized]
+    cmd |= PCI_COMMAND_IO;
+        ^~
+
+The simplified code looks like this:
+
+unsigned int cmd;
+[...]
+pcic_read_config(dev->bus, dev->devfn, PCI_COMMAND, 2, &cmd);
+[...]
+cmd |= PCI_COMMAND_IO;
+
+I.e, the code assumes that pcic_read_config() will always initialize
+cmd. But it's not the case. Looking at pcic_read_config(), if
+bus->number is != 0 or if the size is not one of 1, 2 or 4, *val will
+not be initialized.
+
+As a simple fix, we initialize cmd to zero at the beginning of
+pcibios_fixup_bus.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream: https://patchwork.ozlabs.org/patch/801039/
+---
+ arch/sparc/kernel/pcic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
+index a38787b..732af9a 100644
+--- a/arch/sparc/kernel/pcic.c
++++ b/arch/sparc/kernel/pcic.c
+@@ -602,7 +602,7 @@ void pcibios_fixup_bus(struct pci_bus *bus)
+ {
+ 	struct pci_dev *dev;
+ 	int i, has_io, has_mem;
+-	unsigned int cmd;
++	unsigned int cmd = 0;
+ 	struct linux_pcic *pcic;
+ 	/* struct linux_pbm_info* pbm = &pcic->pbm; */
+ 	int node;
+-- 
+2.9.4
+
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 8c6b563..55152ae 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -5,6 +5,9 @@ BR2_sparc_v8=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/qemu/sparc-ss10/patches"
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.9.4
