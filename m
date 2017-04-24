From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 11:48:21 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] syslinux: build with the
	target toolchain
Message-ID: <20170424193336.BC8F2827E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18fc71357b6a05ca769d119c59a790703292d9b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Until now, the host toolchain was used to build syslinux, as it was
not possible to build a 32-bit syslinux with a x86-64 toolchain.

However, syslinux requires gnu-efi, and gnu-efi is built using the
target toolchain. Mixing different toolchains doesn't work well, so
this commit changes the syslinux package to use the target toolchain
for syslinux as well. This is made possible by patches
0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch and
0004-memdisk-Force-ld-output-format-to-32-bits.patch.

Since syslinux also contains some utilities that have to run on the
host, those have to continue being built with the host toolchain,
which requires patch 0005-utils-Use-the-host-toolchain-to-build.patch.

Patch 0006-lzo-Use-the-host-toolchain-for-prepcore.patch is about
building prepcore, another utility with the host toolchain as it is
required at build-time.

This was tested using a Buildroot's built x86_64 toolchain, and
checked that the output binaries are 32-bits. It was tested as well if
they actually boot on hardware.

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6e432d5ecb46959f3c27dbbca48e41512bb40a70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ....elf-Not-enough-room-for-program-headers-.patch | 35 +++++++++++++
 ...memdisk-Force-ld-output-format-to-32-bits.patch | 32 ++++++++++++
 ...005-utils-Use-the-host-toolchain-to-build.patch | 60 ++++++++++++++++++++++
 ...6-lzo-Use-the-host-toolchain-for-prepcore.patch | 44 ++++++++++++++++
 boot/syslinux/Config.in                            |  3 +-
 boot/syslinux/syslinux.mk                          | 29 ++++++++---
 6 files changed, 195 insertions(+), 8 deletions(-)

diff --git a/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch b/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch
new file mode 100644
index 0000000..83a87ee
--- /dev/null
+++ b/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch
@@ -0,0 +1,35 @@
+From 61de7762389d460da7ffdd644f50c60175cce23b Mon Sep 17 00:00:00 2001
+From: Steve McIntyre <93sam@debian.org>
+Date: Wed, 5 Apr 2017 22:09:37 +0200
+Subject: [PATCH] Fix 'ldlinux.elf: Not enough room for program headers, try
+ linking with -N'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix for https://bugs.debian.org/846679: syslinux: FTBFS: ld:
+ldlinux.elf: Not enough room for program headers, try linking with -N
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=846679;filename=syslinux_6.03%2Bdfsg-14.1.debdiff;msg=10
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ core/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/Makefile b/core/Makefile
+index ad0acb5..58a3545 100644
+--- a/core/Makefile
++++ b/core/Makefile
+@@ -165,7 +165,7 @@ LDSCRIPT = $(SRC)/$(ARCH)/syslinux.ld
+ 
+ %.elf: %.o $(LIBDEP) $(LDSCRIPT) $(AUXLIBS)
+ 	$(LD) $(LDFLAGS) -Bsymbolic $(LD_PIE) -E --hash-style=gnu -T $(LDSCRIPT) -M -o $@ $< \
+-		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group \
++		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group --no-dynamic-linker \
+ 		> $(@:.elf=.map)
+ 	$(OBJDUMP) -h $@ > $(@:.elf=.sec)
+ 	$(PERL) $(SRC)/lstadjust.pl $(@:.elf=.lsr) $(@:.elf=.sec) $(@:.elf=.lst)
+-- 
+2.7.4
+
diff --git a/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch b/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
new file mode 100644
index 0000000..4eedf49
--- /dev/null
+++ b/boot/syslinux/0004-memdisk-Force-ld-output-format-to-32-bits.patch
@@ -0,0 +1,32 @@
+From c0287594239d5af2082cac20817f8e8b11a4b1b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Wed, 5 Apr 2017 14:18:09 +0200
+Subject: [PATCH] memdisk: Force ld output format to 32-bits
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On toolchains where the default output is x86_64, we need to be
+consistent with the other .o files
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ memdisk/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memdisk/Makefile b/memdisk/Makefile
+index e6557d8..06613ff 100644
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
+2.7.4
+
diff --git a/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch b/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch
new file mode 100644
index 0000000..e091a3a
--- /dev/null
+++ b/boot/syslinux/0005-utils-Use-the-host-toolchain-to-build.patch
@@ -0,0 +1,60 @@
+From e000251144056c99e390a2a4449d06cbd2a19c0a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Wed, 5 Apr 2017 14:25:02 +0200
+Subject: [PATCH] utils: Use the host toolchain to build.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The utilities are meant to run on the host machine, hence must be built using
+the host toolchain.
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ utils/Makefile | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/utils/Makefile b/utils/Makefile
+index dfe6259..ac91aaa 100644
+--- a/utils/Makefile
++++ b/utils/Makefile
+@@ -17,8 +17,8 @@
+ VPATH = $(SRC)
+ include $(MAKEDIR)/syslinux.mk
+ 
+-CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
+-LDFLAGS  = -O2
++CFLAGS   = $(CFLAGS_FOR_BUILD) $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
++LDFLAGS  = $(LDFLAGS_FOR_BUILD) -O2
+ 
+ C_TARGETS	 = isohybrid gethostip memdiskfind
+ SCRIPT_TARGETS	 = mkdiskimage
+@@ -35,7 +35,7 @@ ISOHDPFX = $(addprefix $(OBJ)/,../mbr/isohdpfx.bin ../mbr/isohdpfx_f.bin \
+ all: $(TARGETS)
+ 
+ %.o: %.c
+-	$(CC) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS) -c -o $@ $<
+ 
+ mkdiskimage: mkdiskimage.in ../mbr/mbr.bin bin2hex.pl
+ 	$(PERL) $(SRC)/bin2hex.pl < $(OBJ)/../mbr/mbr.bin | cat $(SRC)/mkdiskimage.in - > $@
+@@ -51,13 +51,13 @@ isohdpfx.c: $(ISOHDPFX) isohdpfxarray.pl
+ 	$(PERL) $(SRC)/isohdpfxarray.pl $(ISOHDPFX) > $@
+ 
+ isohybrid: isohybrid.o isohdpfx.o
+-	$(CC) $(LDFLAGS) -o $@ $^ -luuid
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^ -luuid
+ 
+ gethostip: gethostip.o
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ memdiskfind: memdiskfind.o
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC_FOR_BUILD) $(LDFLAGS) -o $@ $^
+ 
+ tidy dist:
+ 	rm -f *.o .*.d isohdpfx.c
+-- 
+2.1.4
+
diff --git a/boot/syslinux/0006-lzo-Use-the-host-toolchain-for-prepcore.patch b/boot/syslinux/0006-lzo-Use-the-host-toolchain-for-prepcore.patch
new file mode 100644
index 0000000..c6fa7fe
--- /dev/null
+++ b/boot/syslinux/0006-lzo-Use-the-host-toolchain-for-prepcore.patch
@@ -0,0 +1,44 @@
+From 83e1f00990c25554723609bb549e18b987034317 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
+Date: Thu, 6 Apr 2017 09:43:46 +0200
+Subject: [PATCH] lzo: Use the host toolchain for prepcore
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
+---
+ lzo/Makefile | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/lzo/Makefile b/lzo/Makefile
+index 29f1fa6..c016e5a 100644
+--- a/lzo/Makefile
++++ b/lzo/Makefile
+@@ -11,10 +11,13 @@
+ ## -----------------------------------------------------------------------
+ 
+ VPATH = $(SRC)
+-include $(MAKEDIR)/build.mk
++include $(MAKEDIR)/syslinux.mk
+ 
+ INCLUDES += -I$(SRC)/include
+ 
++%.o: %.c
++	$(CC_FOR_BUILD) $(UMAKEDEPS) $(CFLAGS_FOR_BUILD) $(INCLUDES) -c -o $@ $<
++
+ LIBOBJS = $(patsubst %.c,%.o,$(subst $(SRC)/,,$(wildcard $(SRC)/src/*.c)))
+ LIB     = lzo.a
+ BINS    = prepcore
+@@ -30,7 +33,7 @@ $(LIB) : $(LIBOBJS)
+ 	$(RANLIB) $@
+ 
+ prepcore : prepcore.o $(LIB)
+-	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
++	$(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@ $^ $(LIBS)
+ 
+ tidy dist clean spotless:
+ 	rm -f $(BINS)
+-- 
+2.1.4
+
diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 6067e9c..299a559 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,12 +1,13 @@
 config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
 	# Make sure at least one of the flavors is installed
 	select BR2_TARGET_SYSLINUX_ISOLINUX \
 		if !BR2_TARGET_SYSLINUX_PXELINUX && \
 		   !BR2_TARGET_SYSLINUX_MBR && \
 		   !BR2_TARGET_SYSLINUX_EFI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 82890c5..a88885b 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -13,7 +13,7 @@ SYSLINUX_LICENSE_FILES = COPYING
 
 SYSLINUX_INSTALL_IMAGES = YES
 
-SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
+SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET += bios
@@ -51,21 +51,36 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		NASM="$(HOST_DIR)/usr/bin/nasm" \
+		CC_FOR_BUILD="$(HOSTCC)" \
+		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
+		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
+            $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
 # utilities for installing the bootloader are meant for the host.
 # Repeat the target, otherwise syslinux will try to build everything
-# Repeat CC and AR, since syslinux really wants to check them at
-# install time
+# Repeat LD (and CC) as it happens that some binaries are linked at
+# install-time.
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
 		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
+# That 'syslinux' binary is an installer actually built for the target.
+# However, buildroot makes no usage of it, so better delete it than have it
+# installed@the wrong place
+define SYSLINUX_POST_INSTALL_CLEANUP
+	rm -rf $(HOST_DIR)/usr/bin/syslinux
+endef
+SYSLINUX_POST_INSTALL_TARGET_HOOKS += SYSLINUX_POST_INSTALL_CLEANUP
+
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_PXELINUX) += bios/core/pxelinux.bin
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_MBR) += bios/mbr/mbr.bin
