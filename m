From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 00:07:35 +0200
Subject: [Buildroot] [PATCHv4] boot/grub2: Fix GRUB i386-pc build with
 Ubuntu gcc
In-Reply-To: <20200528215015.5018-1-yann.morin.1998@free.fr>
References: <20200528215015.5018-1-yann.morin.1998@free.fr>
Message-ID: <20200604220735.GM13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-05-28 23:50 +0200, Yann E. MORIN spake thusly:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Backport a patch from upstream to fix the build on certain versions of
> gsc, notably:
[--SNIP--]
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=12946
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> [yann.morin.1998 at free.fr:
>   - keep the hunk about patching gentpl.py
>   - make it a git-formatted patch
>   - add the touch
>   - drastically expand the commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v3 -> v4:
>  - changes by Yann as identified in commit log and bundled patch
> 
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Remove autoreconf and rework the patch to update Makefile.in. This
>    will avoid to autoreconf and add a dependency on python
> 
> Changes v1 -> v2:
>  - Add autoreconf
> ---
>  ...x-GRUB-i386-pc-build-with-Ubuntu-gcc.patch | 313 ++++++++++++++++++
>  boot/grub2/grub2.mk                           |   8 +
>  2 files changed, 321 insertions(+)
>  create mode 100644 boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> 
> diff --git a/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> new file mode 100644
> index 0000000000..357c825f3c
> --- /dev/null
> +++ b/boot/grub2/0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> @@ -0,0 +1,313 @@
> +From 6643507ce30f775008e093580f0c9499dfb2c485 Mon Sep 17 00:00:00 2001
> +From: Simon Hardy <simon.hardy@itdev.co.uk>
> +Date: Tue, 24 Mar 2020 13:29:12 +0000
> +Subject: build: Fix GRUB i386-pc build with Ubuntu gcc
> +
> +With recent versions of gcc on Ubuntu a very large lzma_decompress.img file is
> +output. (e.g. 134479600 bytes instead of 2864.) This causes grub-mkimage to
> +fail with: "error: Decompressor is too big."
> +
> +This seems to be caused by a section .note.gnu.property that is placed at an
> +offset such that objcopy needs to pad the img file with zeros.
> +
> +This issue is present on:
> +Ubuntu 19.10 with gcc (Ubuntu 8.3.0-26ubuntu1~19.10) 8.3.0
> +Ubuntu 19.10 with gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008
> +
> +This issue is not present on:
> +Ubuntu 19.10 with gcc (Ubuntu 7.5.0-3ubuntu1~19.10) 7.5.0
> +RHEL 8.0 with gcc 8.3.1 20190507 (Red Hat 8.3.1-4)
> +
> +The issue can be fixed by removing the section using objcopy as shown in
> +this patch.
> +
> +Signed-off-by: Simon Hardy <simon.hardy@itdev.co.uk>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +[Retrieved (and updated to directly patch Makefile.in instead of
> +gentpl.py to avoid adding a dependency on python) from:
> +http://git.savannah.gnu.org/cgit/grub.git/commit/?id=6643507ce30f775008e093580f0c9499dfb2c485]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[yann.morin.1998 at free.fr:
> +  - keep the part patching gentpl.py
> +  - restore it as a git-formatted patch
> +  - introduce the hunk about the generated .am file
> +]
> +Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> +---
> + gentpl.py             |    2     1     1     0 +-
> + grub-core/Makefile.in |   38    19    19     0 +++++++++++++++++++-------------------
> + 2 files changed, 20 insertions(+), 20 deletions(-)
> +
> +diff --git a/gentpl.py b/gentpl.py
> +index 387588c05..c86550d4f 100644
> +--- a/gentpl.py
> ++++ b/gentpl.py
> +@@ -766,7 +766,7 @@ def image(defn, platform):
> + if test x$(TARGET_APPLE_LINKER) = x1; then \
> +   $(MACHO2IMG) $< $@; \
> + else \
> +-  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; \
> ++  $(TARGET_OBJCOPY) $(""" + cname(defn) + """_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; \
> + fi
> + """)
> + 
> +diff --git a/grub-core/Makefile.core.am b/grub-core/Makefile.core.am
> +index 387588c05..c86550d4f 100644
> +--- a/grub-core/Makefile.core.am
> ++++ 2/grub-core/Makefile.core.am
> +@@ -22897,7 +22897,7 @@
> + CLEANFILES += boot.img
> + 
> + boot.img: boot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -22918,7 +22918,7 @@
> + CLEANFILES += boot.img
> + 
> + boot.img: boot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -22939,7 +22939,7 @@
> + CLEANFILES += boot.img
> + 
> + boot.img: boot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -22960,7 +22960,7 @@
> + CLEANFILES += boot_hybrid.img
> + 
> + boot_hybrid.img: boot_hybrid.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -22981,7 +22981,7 @@
> + CLEANFILES += cdboot.img
> + 
> + cdboot.img: cdboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23002,7 +23002,7 @@
> + CLEANFILES += cdboot.img
> + 
> + cdboot.img: cdboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23023,7 +23023,7 @@
> + CLEANFILES += pxeboot.img
> + 
> + pxeboot.img: pxeboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23044,7 +23044,7 @@
> + CLEANFILES += diskboot.img
> + 
> + diskboot.img: diskboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23065,7 +23065,7 @@
> + CLEANFILES += diskboot.img
> + 
> + diskboot.img: diskboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23086,7 +23086,7 @@
> + CLEANFILES += lnxboot.img
> + 
> + lnxboot.img: lnxboot.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23107,7 +23107,7 @@
> + CLEANFILES += xz_decompress.img
> + 
> + xz_decompress.img: xz_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23128,7 +23128,7 @@
> + CLEANFILES += xz_decompress.img
> + 
> + xz_decompress.img: xz_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23149,7 +23149,7 @@
> + CLEANFILES += xz_decompress.img
> + 
> + xz_decompress.img: xz_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23170,7 +23170,7 @@
> + CLEANFILES += none_decompress.img
> + 
> + none_decompress.img: none_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23191,7 +23191,7 @@
> + CLEANFILES += none_decompress.img
> + 
> + none_decompress.img: none_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23212,7 +23212,7 @@
> + CLEANFILES += none_decompress.img
> + 
> + none_decompress.img: none_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23233,7 +23233,7 @@
> + CLEANFILES += lzma_decompress.img
> + 
> + lzma_decompress.img: lzma_decompress.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23254,7 +23254,7 @@
> + CLEANFILES += fwstart.img
> + 
> + fwstart.img: fwstart.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +@@ -23275,7 +23275,7 @@
> + CLEANFILES += fwstart_fuloong2f.img
> + 
> + fwstart_fuloong2f.img: fwstart_fuloong2f.image$(EXEEXT)
> +-	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 	
> + endif
> + 
> +diff --git a/grub-core/Makefile.in b/grub-core/Makefile.in
> +index 387588c05..c86550d4f 100644
> +--- a/grub-core/Makefile.in
> ++++ b/grub-core/Makefile.in
> +@@ -46531,61 +46531,61 @@
> + @COND_riscv64_efi_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(TARGET_STRIP) -S -x $(kernel_exec) -o $@.bin $<;   $(TARGET_OBJCONV) -f$(TARGET_MODULE_FORMAT) -nr:_grub_mod_init:grub_mod_init -nr:_grub_mod_fini:grub_mod_fini -ed2022 -ed2016 -wd1106 -nu -nd $@.bin $@;   rm -f $@.bin;    elif test ! -z '$(TARGET_OBJ2ELF)'; then      $(TARGET_STRIP) $(kernel_exec_STRIPFLAGS) -o $@.bin $< &&      $(TARGET_OBJ2ELF) $@.bin $@ || (rm -f $@; rm -f $@.bin; exit 1);      rm -f $@.bin; else $(TARGET_STRIP) $(kernel_exec_STRIPFLAGS) -o $@ $<; fi
> + 
> + @COND_i386_pc_TRUE at boot.img: boot.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_qemu_TRUE at boot.img: boot.image$(EXEEXT)
> +- at COND_i386_qemu_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_qemu_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_sparc64_ieee1275_TRUE at boot.img: boot.image$(EXEEXT)
> +- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at boot_hybrid.img: boot_hybrid.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(boot_hybrid_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at cdboot.img: cdboot.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_sparc64_ieee1275_TRUE at cdboot.img: cdboot.image$(EXEEXT)
> +- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(cdboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at pxeboot.img: pxeboot.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(pxeboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at diskboot.img: diskboot.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_sparc64_ieee1275_TRUE at diskboot.img: diskboot.image$(EXEEXT)
> +- at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_sparc64_ieee1275_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(diskboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at lnxboot.img: lnxboot.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lnxboot_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_loongson_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
> +- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_arc_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
> +- at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_qemu_mips_TRUE at xz_decompress.img: xz_decompress.image$(EXEEXT)
> +- at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(xz_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_loongson_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
> +- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_arc_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
> +- at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_arc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_qemu_mips_TRUE at none_decompress.img: none_decompress.image$(EXEEXT)
> +- at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_qemu_mips_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(none_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_i386_pc_TRUE at lzma_decompress.img: lzma_decompress.image$(EXEEXT)
> +- at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_i386_pc_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(lzma_decompress_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_loongson_TRUE at fwstart.img: fwstart.image$(EXEEXT)
> +- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_mips_loongson_TRUE at fwstart_fuloong2f.img: fwstart_fuloong2f.image$(EXEEXT)
> +- at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .ARM.exidx $< $@; fi
> ++ at COND_mips_loongson_TRUE@	if test x$(TARGET_APPLE_LINKER) = x1; then   $(MACHO2IMG) $< $@; else   $(TARGET_OBJCOPY) $(fwstart_fuloong2f_image_OBJCOPYFLAGS) --strip-unneeded -R .note -R .comment -R .note.gnu.build-id -R .MIPS.abiflags -R .reginfo -R .rel.dyn -R .note.gnu.gold-version -R .note.gnu.property -R .ARM.exidx $< $@; fi
> + 
> + @COND_MAN_PAGES_TRUE@@COND_emu_TRUE at grub-emu.1: grub-emu 
> + @COND_MAN_PAGES_TRUE@@COND_emu_TRUE@	chmod a+x grub-emu
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index a202525d71..f77dc0f9d7 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -13,6 +13,14 @@ GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
>  HOST_GRUB2_DEPENDENCIES = host-bison host-flex
>  GRUB2_INSTALL_IMAGES = YES
>  
> +# 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch
> +define GRUB2_AVOID_AUTORECONF
> +	$(Q)touch $(@D)/Makefile.util.am
> +	$(Q)touch $(@D)/Makefile.in
> +endef
> +GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
> +HOST_GRUB2_POST_PATCH_HOOKS += GRUB2_AVOID_AUTORECONF
> +
>  ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
>  GRUB2_INSTALL_TARGET = YES
>  else
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
