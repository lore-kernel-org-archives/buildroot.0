From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Sep 2010 09:39:38 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: add 2.6.35.x,
	bump stable versions, get rid of 2.6.27/2.6.28
Message-ID: <20100906074014.2FC358A50A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5acb621e8b81d0e393060ca277ec87f4c69813e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Marcus Osdoba <marcus.osdoba@googlemail.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   23 +++-----
 .../linux-2.6.28.10-cris-eth-driver-netpoll.patch  |   11 ----
 .../linux-2.6.28.10-cris-headers.patch             |   28 ----------
 .../linux-2.6.28.10-cris-objcopy-flags.patch       |   45 ----------------
 .../linux-2.6.28.10-unifdef-getline.patch          |   56 --------------------
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 7 files changed, 9 insertions(+), 154 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch
 rename toolchain/kernel-headers/{linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e60595f..7391d97 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_34
+	default BR2_KERNEL_HEADERS_2_6_35
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -16,14 +16,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_27
-		depends on BR2_DEPRECATED
-		bool "Linux 2.6.27.x kernel headers"
-
-	config BR2_KERNEL_HEADERS_2_6_28
-		bool "Linux 2.6.28.x kernel headers"
-		depends on BR2_DEPRECATED
-
 	config BR2_KERNEL_HEADERS_2_6_29
 		bool "Linux 2.6.29.x kernel headers"
 		depends on BR2_DEPRECATED
@@ -38,6 +30,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_2_6_32
 		bool "Linux 2.6.32.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_33
 		bool "Linux 2.6.33.x kernel headers"
@@ -45,6 +38,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_34
 		bool "Linux 2.6.34.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_35
+		bool "Linux 2.6.35.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -57,17 +53,16 @@ config BR2_DEFAULT_KERNEL_VERSION
 	depends on BR2_KERNEL_HEADERS_VERSION
 	help
 	  Specify the version you want to use.
-	  E.g.: 2.6.31.2
+	  E.G.: 2.6.31.2
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.27.50"	if BR2_KERNEL_HEADERS_2_6_27
-	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.18"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.21"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.3"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.34.6"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.35.4"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
deleted file mode 100644
index 5711767..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.10-cris-eth-driver-netpoll.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/drivers/net/cris/eth_v10.c.org	2009-01-28 09:19:09.000000000 +0100
-+++ b/drivers/net/cris/eth_v10.c	2009-01-28 09:19:16.000000000 +0100
-@@ -1707,7 +1707,7 @@
- static void
- e100_netpoll(struct net_device* netdev)
- {
--	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev, NULL);
-+	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev);
- }
- #endif
- 
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
deleted file mode 100644
index ff2fa49..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.10-cris-headers.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff -urN linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild
---- linux-2.6.28/arch/cris/include/arch-v10/arch/Kbuild	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/include/arch-v10/arch/Kbuild	2009-01-12 12:59:06.000000000 +0100
-@@ -1,3 +1,5 @@
-+header-y += elf.h
-+header-y += ptrace.h
- header-y += user.h
- header-y += svinto.h
- header-y += sv_addr_ag.h
-diff -urN linux-2.6.28/arch/cris/include/asm/Kbuild linux-2.6.28.my/arch/cris/include/asm/Kbuild
---- linux-2.6.28/arch/cris/include/asm/Kbuild	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/include/asm/Kbuild	2009-01-12 13:14:40.000000000 +0100
-@@ -1,11 +1,13 @@
- include include/asm-generic/Kbuild.asm
- 
--header-y += arch-v10/
--header-y += arch-v32/
-+header-y += ../arch-v10/arch/
-+header-y += ../arch-v32/arch/
- 
-+header-y += elf.h
- header-y += ethernet.h
- header-y += rtc.h
- header-y += sync_serial.h
-+header-y += user.h
- 
- unifdef-y += etraxgpio.h
- unifdef-y += rs485.h
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch b/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
deleted file mode 100644
index 32da2f0..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.10-cris-objcopy-flags.patch
+++ /dev/null
@@ -1,45 +0,0 @@
---- linux-2.6.28/arch/cris/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/Makefile	2009-01-12 13:21:44.000000000 +0100
-@@ -40,7 +40,7 @@
- 
- LD = $(CROSS_COMPILE)ld -mcrislinux
- 
--OBJCOPYFLAGS := -O binary -R .note -R .comment -S
-+OBJCOPYFLAGS := -O binary -R .note -R .note.gnu.build-id -R .comment
- 
- CPPFLAGS_vmlinux.lds = -DDRAM_VIRTUAL_BASE=0x$(CONFIG_ETRAX_DRAM_VIRTUAL_BASE)
- 
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/Makefile	2009-01-12 13:28:25.000000000 +0100
-@@ -2,8 +2,6 @@
- # arch/cris/arch-v10/boot/Makefile
- #
- 
--OBJCOPYFLAGS = -O binary --remove-section=.bss
--
- subdir- := compressed rescue
- targets := Image
- 
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/compressed/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/compressed/Makefile	2009-01-12 13:28:33.000000000 +0100
-@@ -6,7 +6,6 @@
- ccflags-y += -O2 $(LINUXINCLUDE)
- ldflags-y += -T $(srctree)/$(src)/decompress.lds
- OBJECTS = $(obj)/head.o $(obj)/misc.o
--OBJCOPYFLAGS = -O binary --remove-section=.bss
- 
- quiet_cmd_image = BUILD   $@
- cmd_image = cat $(obj)/decompress.bin $(obj)/piggy.gz > $@
-diff -urN linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile
---- linux-2.6.28/arch/cris/arch-v10/boot/rescue/Makefile	2008-12-25 00:26:37.000000000 +0100
-+++ linux-2.6.28.my/arch/cris/arch-v10/boot/rescue/Makefile	2009-01-12 13:28:40.000000000 +0100
-@@ -5,7 +5,6 @@
- ccflags-y += -O2 $(LINUXINCLUDE)
- asflags-y += $(LINUXINCLUDE)
- ldflags-y += -T $(srctree)/$(src)/rescue.lds
--OBJCOPYFLAGS = -O binary --remove-section=.bss
- obj-$(CONFIG_ETRAX_AXISFLASHMAP) = head.o
- OBJECT := $(obj)/head.o
- 
diff --git a/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch b/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch
deleted file mode 100644
index f4a4820..0000000
--- a/toolchain/kernel-headers/linux-2.6.28.10-unifdef-getline.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
-From: Justin P. Mattock <justinmattock@gmail.com>
-Date: Sat, 7 Mar 2009 13:31:29 +0100
-Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
-
-This fixes an error when compiling the kernel.
-
-  CHK     include/linux/version.h
-  HOSTCC  scripts/unifdef
-scripts/unifdef.c:209: error: conflicting types for 'getline'
-/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
-make[1]: *** [scripts/unifdef] Error 1
-make: *** [__headers] Error 2
-
-Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
-Cc:  Frederic Weisbecker <fweisbec@gmail.com>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
----
- scripts/unifdef.c |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/unifdef.c b/scripts/unifdef.c
-index 552025e..05a31a6 100644
---- a/scripts/unifdef.c
-+++ b/scripts/unifdef.c
-@@ -206,7 +206,7 @@ static void             done(void);
- static void             error(const char *);
- static int              findsym(const char *);
- static void             flushline(bool);
--static Linetype         getline(void);
-+static Linetype         get_line(void);
- static Linetype         ifeval(const char **);
- static void             ignoreoff(void);
- static void             ignoreon(void);
-@@ -512,7 +512,7 @@ process(void)
- 
- 	for (;;) {
- 		linenum++;
--		lineval = getline();
-+		lineval = get_line();
- 		trans_table[ifstate[depth]][lineval]();
- 		debug("process %s -> %s depth %d",
- 		    linetype_name[lineval],
-@@ -526,7 +526,7 @@ process(void)
-  * help from skipcomment().
-  */
- static Linetype
--getline(void)
-+get_line(void)
- {
- 	const char *cp;
- 	int cursym;
--- 
-1.6.3.3
-
diff --git a/toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.1
