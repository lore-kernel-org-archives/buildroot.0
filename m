From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Wed,  5 Apr 2017 15:28:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] syslinux: Builds with the target
	toolchain
In-Reply-To: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the host toolchain was used to build syslinux. syslinux does requires gnu-efi, and this is built using the target toolchain. Mixing different toolchains doesn't work well, so let's use the target toolchain for syslinux as well.

Well, almost, as syslinux also contains some utilities that have to run on the host. Those ones need to be built with the host toolchain.

This was tested using a buildroot's built x86_64 toolchain, and checked that some output binaries are 32-bits. It was tested as well if they actually boot on Hardware.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
Changes v1 -> v2:
 - Move the DEVELOPERS note to another patch
 - Add Signed-Off-By to the patch 0003
 - Format the patches using git format-patch
 - Use XX_FOR_BUILD instead of HOSTXX
 - Remove old comment in the syslinuc.mk file

---
 .../0003-fix_ftbfs_no_dynamic_linker.patch         | 19 ++++++++++++
 ...memdisk-Force-ld-output-format-to-32-bits.patch | 32 ++++++++++++++++++++
 ...005-utils-Use-the-host-toolchain-to-build.patch | 35 ++++++++++++++++++++++
 boot/syslinux/syslinux.mk                          | 12 ++++----
 4 files changed, 91 insertions(+), 7 deletions(-)
 create mode 100644 boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
 create mode 100644 boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
 create mode 100644 boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch

diff --git a/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
new file mode 100644
index 0000000..ff8af5b
--- /dev/null
+++ b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
@@ -0,0 +1,19 @@
+Fix for https://bugs.debian.org/846679 : syslinux: FTBFS: ld:
+ldlinux.elf: Not enough room for program headers, try linking with -N
+
+Patch from: Steve McIntyre <93sam@debian.org>
+https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=846679;filename=syslinux_6.03%2Bdfsg-14.1.debdiff;msg=10
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+
+--- a/core/Makefile	2017-01-28 18:33:22.750959519 +0000
++++ b/core/Makefile	2017-01-28 18:27:47.387981830 +0000
+@@ -165,7 +165,7 @@
+ 
+ %.elf: %.o $(LIBDEP) $(LDSCRIPT) $(AUXLIBS)
+ 	$(LD) $(LDFLAGS) -Bsymbolic $(LD_PIE) -E --hash-style=gnu -T $(LDSCRIPT) -M -o $@ $< \
+-		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group \
++		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group --no-dynamic-linker \
+ 		> $(@:.elf=.map)
+ 	$(OBJDUMP) -h $@ > $(@:.elf=.sec)
+ 	$(PERL) $(SRC)/lstadjust.pl $(@:.elf=.lsr) $(@:.elf=.sec) $(@:.elf=.lst)
diff --git a/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch b/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
new file mode 100644
index 0000000..69947e7
--- /dev/null
+++ b/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
@@ -0,0 +1,32 @@
+From 948aec20d1b0233e509f547dba7efb2274359947 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Wed, 5 Apr 2017 14:18:09 +0200
+Subject: [PATCH 1/2] memdisk: Force ld output format to 32-bits
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On toolchains where the default output is x86_64, we need to be
+consistent with the other .o files
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+---
+ memdisk/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memdisk/Makefile b/memdisk/Makefile
+index 42e56e0..ccd5738 100644
+--- a/memdisk/Makefile
++++ b/memdisk/Makefile
+@@ -78,7 +78,7 @@ memdisk16.o: memdisk16.asm
+ 	$(NASM) -f bin $(NASMOPT) $(NFLAGS) $(NINCLUDE) -o $@ -l $*.lst $<
+ 
+ memdisk_%.o: memdisk_%.bin
+-	$(LD) -r -b binary -o $@ $<
++	$(LD) --oformat elf32-i386 -r -b binary -o $@ $<
+ 
+ memdisk16.elf: $(OBJS16)
+ 	$(LD) -Ttext 0 -o $@ $^
+-- 
+2.1.4
+
diff --git a/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch b/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch
new file mode 100644
index 0000000..7774453
--- /dev/null
+++ b/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch
@@ -0,0 +1,35 @@
+From 91777a0a7f693db71b5f77813c188ad6ebe4c9e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Wed, 5 Apr 2017 14:25:02 +0200
+Subject: [PATCH 2/2] utils: Use the host toolchain to build.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The utilities are meant to run on the host machine, hence must be built using
+the host toolchain.
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+---
+ utils/Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index dfe6259..f31f117 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -17,8 +17,9 @@
+ VPATH = $(SRC)
+ include $(MAKEDIR)/syslinux.mk
+ 
+-CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
+-LDFLAGS  = -O2
++CC       = $(CC_FOR_BUILD)
++CFLAGS   = $(CFLAGS_FOR_BUILD) $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
++LDFLAGS  = $(LDFLAGS_FOR_BUILD) -O2
+ 
+ C_TARGETS	 = isohybrid gethostip memdiskfind
+ SCRIPT_TARGETS	 = mkdiskimage
+-- 
+2.1.4
+
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 5b7906c..e0ab2a1 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -51,19 +51,17 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+        $(TARGET_MAKE_ENV) $(MAKE1) \
+            CC="$(TARGET_CC)" LD="$(TARGET_LD)" NASM="$(HOST_DIR)/usr/bin/nasm" \
+            CC_FOR_BUILD="$(HOSTCC)" CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+            $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
 # utilities for installing the bootloader are meant for the host.
 # Repeat the target, otherwise syslinux will try to build everything
-# Repeat CC and AR, since syslinux really wants to check them at
-# install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
-		-C $(@D) $(SYSLINUX_TARGET) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) -C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
-- 
2.1.4
