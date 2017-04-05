From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Wed,  5 Apr 2017 12:09:47 +0200
Subject: [Buildroot] [PATCH] syslinux: Builds with the target toolchain
Message-ID: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 DEVELOPERS                                             |  1 +
 boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch   | 16 ++++++++++++++++
 boot/syslinux/0004-fix-ld-oformat-32bits.patch         | 15 +++++++++++++++
 .../0005-build-utils-with-host-toolchain.patch         | 18 ++++++++++++++++++
 boot/syslinux/syslinux.mk                              | 10 +++++-----
 5 files changed, 55 insertions(+), 5 deletions(-)
 create mode 100644 boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
 create mode 100644 boot/syslinux/0004-fix-ld-oformat-32bits.patch
 create mode 100644 boot/syslinux/0005-build-utils-with-host-toolchain.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c610e..fbc70e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -150,6 +150,7 @@ N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
 N:	Beno?t Allard <benoit.allard@greenbone.net>
+F:	boot/syslinux/
 F:	package/dc3dd/
 
 N:	Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
new file mode 100644
index 0000000..dacc07c
--- /dev/null
+++ b/boot/syslinux/0003-fix_ftbfs_no_dynamic_linker.patch
@@ -0,0 +1,16 @@
+Fix for https://bugs.debian.org/846679 : syslinux: FTBFS: ld:
+ldlinux.elf: Not enough room for program headers, try linking with -N
+
+Patch from: Steve McIntyre <93sam@debian.org>
+https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=846679;filename=syslinux_6.03%2Bdfsg-14.1.debdiff;msg=10
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
diff --git a/boot/syslinux/0004-fix-ld-oformat-32bits.patch b/boot/syslinux/0004-fix-ld-oformat-32bits.patch
new file mode 100644
index 0000000..2187772
--- /dev/null
+++ b/boot/syslinux/0004-fix-ld-oformat-32bits.patch
@@ -0,0 +1,15 @@
+Force ld to output i386 bytecodes and not x86_64 to be consistent with the
+other .o files.
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+--- a/memdisk/Makefile	2017-04-04 16:45:43.033844618 +0200
++++ b/memdisk/Makefile	2017-04-04 16:45:11.298619204 +0200
+@@ -78,7 +78,7 @@ memdisk16.o: memdisk16.asm
+ 	$(NASM) -f bin $(NASMOPT) $(NFLAGS) $(NINCLUDE) -o $@ -l $*.lst $<
+ 
+ memdisk_%.o: memdisk_%.bin
+-	$(LD) -r -b binary -o $@ $<
++	$(LD) --oformat elf32-i386 -r -b binary -o $@ $<
+ 
+ memdisk16.elf: $(OBJS16)
+ 	$(LD) -Ttext 0 -o $@ $^
diff --git a/boot/syslinux/0005-build-utils-with-host-toolchain.patch b/boot/syslinux/0005-build-utils-with-host-toolchain.patch
new file mode 100644
index 0000000..09778d3
--- /dev/null
+++ b/boot/syslinux/0005-build-utils-with-host-toolchain.patch
@@ -0,0 +1,18 @@
+The utilities are meant to run on the host machine, hence must be built using
+the host toolchain.
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+--- a/utils/Makefile	2017-04-05 11:49:48.156097181 +0200
++++ b/utils/Makefile	2017-04-05 11:50:30.234872515 +0200
+@@ -17,8 +17,9 @@
+ VPATH = $(SRC)
+ include $(MAKEDIR)/syslinux.mk
+ 
+-CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
+-LDFLAGS  = -O2
++CC       = $(HOSTCC)
++CFLAGS   = $(HOST_CFLAGS) $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64 -I$(SRC)
++LDFLAGS  = $(HOST_LDFLAGS) -O2
+ 
+ C_TARGETS	 = isohybrid gethostip memdiskfind
+ SCRIPT_TARGETS	 = mkdiskimage
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 5b7906c..50feea3 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -51,8 +51,10 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+        $(TARGET_MAKE_ENV) $(MAKE1) \
+            CC="$(TARGET_CC)" LD="$(TARGET_LD)" NASM="$(HOST_DIR)/usr/bin/nasm" \
+            HOSTCC="$(HOSTCC)" HOST_CFLAGS="$(HOST_CFLAGS)" HOST_LDFLAGS="$(HOST_LDFLAGS)" \
+            $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -61,9 +63,7 @@ endef
 # Repeat CC and AR, since syslinux really wants to check them at
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
-		-C $(@D) $(SYSLINUX_TARGET) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) -C $(@D) $(SYSLINUX_TARGET) install
 endef
 
 SYSLINUX_IMAGES-$(BR2_TARGET_SYSLINUX_ISOLINUX) += bios/core/isolinux.bin
-- 
2.1.4
