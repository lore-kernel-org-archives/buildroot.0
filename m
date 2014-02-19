From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Feb 2014 20:10:18 +0100
Subject: [Buildroot] [PATCH v3 1/5] grub2: add new package
In-Reply-To: <1392837022-15771-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392837022-15771-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392837022-15771-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                     |   1 +
 boot/grub2/Config.in               | 120 +++++++++++++++++++++++++++++++++++++
 boot/grub2/grub.cfg                |   6 ++
 boot/grub2/grub2-remove-gets.patch |  21 +++++++
 boot/grub2/grub2.mk                |  88 +++++++++++++++++++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 boot/grub2/Config.in
 create mode 100644 boot/grub2/grub.cfg
 create mode 100644 boot/grub2/grub2-remove-gets.patch
 create mode 100644 boot/grub2/grub2.mk

diff --git a/boot/Config.in b/boot/Config.in
index d23c761..c410d12 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/at91dataflashboot/Config.in"
 source "boot/barebox/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub/Config.in"
+source "boot/grub2/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
new file mode 100644
index 0000000..e59626a
--- /dev/null
+++ b/boot/grub2/Config.in
@@ -0,0 +1,120 @@
+config BR2_TARGET_GRUB2
+	bool "grub2"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  GNU GRUB is a Multiboot boot loader. It was derived from
+	  GRUB, the GRand Unified Bootloader, which was originally
+	  designed and implemented by Erich Stefan Boleyn. GRUB 2 has
+	  replaced what was formerly known as GRUB (i.e. version
+	  0.9x), which has, in turn, become GRUB Legacy.
+
+	  Amongst others, GRUB2 offers EFI support, which GRUB Legacy
+	  doesn't provide.
+
+	  Notes on using Grub2 for BIOS-based platforms
+	  =============================================
+
+	  1. Create a disk image
+	     dd if=/dev/zero of=disk.img bs=1M count=32
+	  2. Partition it (either legacy or GPT style partitions work)
+	     cfdisk disk.img
+	      - Create one partition, type Linux, for the root
+		filesystem. The only constraint is to make sure there
+		is enough free space *before* the first partition to
+		store Grub2. Leaving 1 MB of free space is safe.
+	  3. Setup loop device and loop partitions
+	     sudo losetup -f disk.img
+	     sudo partx -a disk.img
+	  4. Prepare the root partition
+	     sudo mkfs.ext3 -L root /dev/loop0p1
+	     sudo mount /dev/loop0p1 /mnt
+	     sudo tar -C /mnt -xf output/images/rootfs.tar
+	     sudo umount /mnt
+	  5. Install Grub2
+	     ./output/host/usr/sbin/grub-bios-setup \
+			-b ./output/host/usr/lib/grub/i386-pc/boot.img \
+			-c ./output/images/grub.img -d . /dev/loop0
+	  6. Your disk.img is ready!
+
+	  To test your BIOS image in Qemu:
+
+	  qemu-system-{i386,x86-64} -hda disk.img
+
+	  Notes on using Grub2 for EFI-based platforms
+	  ============================================
+
+	  1. Create a disk image
+	     dd if=/dev/zero of=disk.img bs=1M count=32
+	  2. Partition it with GPT partitions
+	     cgdisk disk.img
+	      - Create a first partition, type EF00, for the
+		bootloader and kernel image
+	      - Create a second partition, type 8300, for the root
+		filesystem.
+	  3. Setup loop device and loop partitions
+	     sudo losetup -f disk.img
+	     sudo partx -a /dev/loop0
+	  4. Prepare the boot partition
+	     sudo mkfs.vfat -n boot /dev/loop0p1
+	     sudo mount /dev/loop0p1 /mnt
+	     sudo cp -a output/images/efi-part/* /mnt/
+	     sudo cp output/images/bzImage /mnt/
+	     sudo umount /mnt
+	  5. Prepare the root partition
+	     sudo mkfs.ext3 -L root /dev/loop0p2
+	     sudo mount /dev/loop0p2 /mnt
+	     sudo tar -C /mnt -xf output/images/rootfs.tar
+	     sudo umount /mnt
+	  6  Cleanup loop device
+	     sudo partx -d /dev/loop0
+	     sudo losetup -d /dev/loop0
+	  7. Your disk.img is ready!
+
+	  To test your EFI image in Qemu:
+
+	  1. Download the EFI BIOS for Qemu
+	     Version IA32 or X64 depending on the chosen Grub2
+	     platform (i386-efi vs. x86-64-efi)
+	     http://sourceforge.net/projects/edk2/files/OVMF/
+	  2. Extract, and rename OVMF.fd to bios.bin and
+	     CirrusLogic5446.rom to vgabios-cirrus.bin.
+	  3. qemu-system-{i386,x86-64} -L ovmf-dir/ -hda disk.img
+          4. Make sure to pass pci=nocrs to the kernel command line,
+             to workaround a bug in the EFI BIOS regarding the
+             EFI framebuffer.
+
+	  http://www.gnu.org/software/grub/
+
+if BR2_TARGET_GRUB2
+
+choice
+	prompt "Platform"
+
+config BR2_TARGET_GRUB2_I386_PC
+	bool "i386-pc"
+	help
+	  Select this option if the platform you're targetting is a
+	  x86 or x86-64 legacy BIOS based platform.
+
+config BR2_TARGET_GRUB2_I386_EFI
+	bool "i386-efi"
+	help
+	  Select this option if the platform you're targetting has a
+	  32 bits EFI BIOS. Note that some x86-64 platforms use a 32
+	  bits EFI BIOS, and this option should be used in this case.
+
+config BR2_TARGET_GRUB2_X86_64_EFI
+	bool "x86-64-efi"
+	help
+	  Select this option if the platform you're targetting has a
+	  64 bits EFI BIOS.
+
+endchoice
+
+config BR2_TARGET_GRUB2_BUILTIN_MODULES
+	string "builtin modules"
+	default "boot linux ext2 fat part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
+	default "boot linux ext2 fat part_msdos part_gpt normal efi_gop" \
+		if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
+
+endif # BR2_TARGET_GRUB2
diff --git a/boot/grub2/grub.cfg b/boot/grub2/grub.cfg
new file mode 100644
index 0000000..9ea5281
--- /dev/null
+++ b/boot/grub2/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /bzImage root=/dev/sda1 console=tty1
+}
diff --git a/boot/grub2/grub2-remove-gets.patch b/boot/grub2/grub2-remove-gets.patch
new file mode 100644
index 0000000..0da71b3
--- /dev/null
+++ b/boot/grub2/grub2-remove-gets.patch
@@ -0,0 +1,21 @@
+ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Upstream-Status: Pending
+Index: grub-1.99/grub-core/gnulib/stdio.in.h
+===================================================================
+--- grub-1.99.orig/grub-core/gnulib/stdio.in.h	2010-12-01 06:45:43.000000000 -0800
++++ grub-1.99/grub-core/gnulib/stdio.in.h	2012-07-04 12:25:02.057099107 -0700
+@@ -140,8 +140,10 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
+ #undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
++#endif
+ 
+ #if @GNULIB_FOPEN@
+ # if @REPLACE_FOPEN@
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
new file mode 100644
index 0000000..5bb8884
--- /dev/null
+++ b/boot/grub2/grub2.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# grub2
+#
+################################################################################
+
+GRUB2_VERSION = 2.00
+GRUB2_SITE = $(BR2_GNU_MIRROR)/grub/
+GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
+GRUB2_LICENSE = GPLv3+
+GRUB2_LICENSE_FILES = COPYING
+GRUB2_DEPENDENCIES = host-bison host-flex
+
+ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
+GRUB2_CFG = $(TARGET_DIR)/boot/grub/grub.cfg
+GRUB2_TUPLE = i386-pc
+GRUB2_TARGET = i386
+GRUB2_PLATFORM = pc
+else ifeq ($(BR2_TARGET_GRUB2_I386_EFI),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootia32.efi
+GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX = /EFI/BOOT
+GRUB2_TUPLE = i386-efi
+GRUB2_TARGET = i386
+GRUB2_PLATFORM = efi
+else ifeq ($(BR2_TARGET_GRUB2_X86_64_EFI),y)
+GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootx64.efi
+GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX = /EFI/BOOT
+GRUB2_TUPLE = x86_64-efi
+GRUB2_TARGET = x86_64
+GRUB2_PLATFORM = efi
+endif
+
+GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
+
+# Grub2 is kind of special: it considers CC, LD and so on to be the
+# tools to build the native tools (i.e to be executed on the build
+# machine), and uses TARGET_CC, TARGET_CFLAGS, TARGET_CPPFLAGS to
+# build the bootloader itself.
+
+GRUB2_CONF_ENV = \
+	$(HOST_CONFIGURE_OPTS) \
+	CPP="$(HOSTCC) -E" \
+	TARGET_CC="$(TARGET_CC)" \
+	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
+	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)"
+
+GRUB2_CONF_OPT = \
+	--target=$(GRUB2_TARGET) \
+	--with-platform=$(GRUB2_PLATFORM) \
+	--disable-grub-mkfont \
+	--enable-efiemu=no \
+	--enable-liblzma=no \
+	--enable-device-mapper=no \
+	--enable-libzfs=no \
+	--disable-werror
+
+# We don't want all the native tools and Grub2 modules to be installed
+# in the target. So we in fact install everything into the host
+# directory, and the image generation process (below) will use the
+# grub-mkimage tool and Grub2 modules from the host directory.
+
+GRUB2_INSTALL_TARGET_OPT = DESTDIR=$(HOST_DIR) install
+
+define GRUB2_IMAGE_INSTALLATION
+	mkdir -p $(dir $(GRUB2_IMAGE))
+	$(HOST_DIR)/usr/bin/grub-mkimage \
+		-d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
+		-O $(GRUB2_TUPLE) \
+		-o $(GRUB2_IMAGE) \
+		$(if $(GRUB2_PREFIX),-p $(GRUB2_PREFIX)) \
+		$(GRUB2_BUILTIN_MODULES)
+	mkdir -p $(dir $(GRUB2_CFG))
+	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
+endef
+GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
+
+ifeq ($(GRUB2_PLATFORM),efi)
+define GRUB2_EFI_STARTUP_NSH
+	echo $(notdir $(GRUB2_IMAGE)) > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+endef
+GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_EFI_STARTUP_NSH
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
