From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 May 2020 09:19:32 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] boot/grub2: Fix GRUB i386-pc build with Ubuntu gcc
Message-ID: <20200527071932.2307442-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12946

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Yann E. Morin):
 - Remove autoreconf and rework the patch to update Makefile.in. This
   will avoid to autoreconf and add a dependency on python

Changes v1 -> v2:
 - Add autoreconf

 ...x-GRUB-i386-pc-build-with-Ubuntu-gcc.patch | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch

diff --git a/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
new file mode 100644
index 0000000000..d8340798e2
--- /dev/null
+++ b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
@@ -0,0 +1,111 @@
+build: Fix GRUB i386-pc build with Ubuntu gcc
+
+With recent versions of gcc on Ubuntu a very large lzma_decompress.img file is
+output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage to
+fail with: "error: Decompressor is too big."
+
+This seems to be caused by a section .note.gnu.property that is placed at an
+offset such that objcopy needs to pad the img file with zeros.
+
+This issue is present on:
+Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
+Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
+
+This issue is not present on:
+Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
+RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
+
+The issue can be fixed by removing the section using objcopy as shown in
+this patch.
+
+Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+[Retrieved (and updated to directly patch Makefile.in instead of
+gentpl.py to avoid adding a dependency on python) from:
+http://git.savannah.gnu.org/cgit/grub.git/commit/?id=6643507ce30f775008e093580f0c9499dfb2c485]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -durN grub-2.04.orig/grub-core/Makefile.in grub-2.04/grub-core/Makefile.in
+--- grub-2.04.orig/grub-core/Makefile.in	2020-05-27 08:57:39.524017787 +0200
++++ grub-2.04/grub-core/Makefile.in	2020-05-27 09:03:29.452024699 +0200
+@@ -46531,61 +46531,61 @@
+ @COND_riscv64_efi_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(TARGET_STRIP) -S -x $(kernel_exec) -o $@.bin $<;   $(TARGET_OBJCONV) -f$(TARGET_MODULE_FORMAT) -nr:_grub_mod_init:grub_mod_init -nr:_grub_mod_fini:grub_mod_fini -ed2022 -ed2016 -wd1106 -nu -nd $@.bin $@;   rm -f $@.bin;    elif test ! -z '$(TARGET_OBJ2ELF)'; then      $(TARGET_STRIP) $(kernel_exec_STRIPFLAGS) -o $@.bin $< &&      $(TARGET_OBJ2ELF) $@.bin $@ || (rm -f $@; rm -f $@.bin; exit 1);      rm -f $@.bin; else $(TARGET_STRIP) $(kernel_exec_STRIPFLAGS) -o $@ $<; fi
+ 
+ @COND_i386_pc_TRUE at boot.img: boot.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_qemu_TRUE at boot.img: boot.image$(EXEEXT)
+- at COND_i386_qemu_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_qemu_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_sparc64_ieee1275_TRUE at boot.img: boot.image$(EXEEXT)
+- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at boot_hybrid.img: boot_hybrid.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at cdboot.img: cdboot.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_sparc64_ieee1275_TRUE at cdboot.img: cdboot.image$(EXEEXT)
+- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at pxeboot.img: pxeboot.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at diskboot.img: diskboot.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_sparc64_ieee1275_TRUE at diskboot.img: diskboot.image$(EXEEXT)
+- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at lnxboot.img: lnxboot.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_loongson_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
+- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_arc_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
+- at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_qemu_mips_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
+- at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_loongson_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
+- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_arc_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
+- at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_qemu_mips_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
+- at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_i386_pc_TRUE at lzma_decompress.img: lzma_decompress.image$(EXEEXT)
+- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_loongson_TRUE at fwstart.img: fwstart.image$(EXEEXT)
+- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_mips_loongson_TRUE at fwstart_fuloong2f.img: fwstart_fuloong2f.image$(EXEEXT)
+- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
+ 
+ @COND_MAN_PAGES_TRUE@@COND_emu_TRUE@grub-emu.1: grub-emu 
+ @COND_MAN_PAGES_TRUE@@COND_emu_TRUE@	chmod a+x grub-emu
-- 
2.26.2
