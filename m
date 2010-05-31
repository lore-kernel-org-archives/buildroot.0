From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:30 +0200
Subject: [Buildroot] [PATCH 44/46] at91dataflashboot: add two patches
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dc6cd220a445e73d41a9afe70fb12a32796b4a04.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first patch allows to build with an EABI toolchain. The second
patch disables the install step of at91dataflashboot Makefile since it
tries to copy files to /tftpboot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../at91dataflashboot-1.05-do-not-install.patch    |   22 ++++++++++
 .../at91dataflashboot-1.05-eabi-fixes.patch        |   43 ++++++++++++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch

diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch b/boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
new file mode 100644
index 0000000..41d97ad
--- /dev/null
+++ b/boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
@@ -0,0 +1,22 @@
+Disable the automatic installation of at91dataflashboot since it tries
+to install things to /tftpboot, which is not possible when not
+building as root.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: at91dataflashboot-1.05/Makefile
+===================================================================
+--- at91dataflashboot-1.05.orig/Makefile
++++ at91dataflashboot-1.05/Makefile
+@@ -40,7 +40,7 @@
+ 
+ I=config.h com.h dataflash.h embedded_services.h main.h stdio.h include/AT91RM9200.h include/lib_AT91RM9200.h 
+ 
+-all: 	clean $(BINNAME) $(LSSNAME) install
++all: 	clean $(BINNAME) $(LSSNAME)
+ 	$(SIZE) $(OUTNAME)
+ 
+ # C objects here
diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch b/boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
new file mode 100644
index 0000000..e38905f
--- /dev/null
+++ b/boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
@@ -0,0 +1,43 @@
+Get at91dataflashboot to build with EABI toolchains, by providing the
+__aeabi_uidiv and __aeabi_uidivmod symbols. The code is based on
+U-Boot's code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ _udivsi3.S |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+Index: DataflashBoot-1.05/_udivsi3.S
+===================================================================
+--- DataflashBoot-1.05.orig/_udivsi3.S
++++ DataflashBoot-1.05/_udivsi3.S
+@@ -12,8 +12,11 @@
+ 	.text
+ 	.globl	 __udivsi3
+ 	.type  __udivsi3       ,function
++        .globl  __aeabi_uidiv
++        .type   __aeabi_uidiv ,function
+ 	.align	0
+  __udivsi3      :
++ __aeabi_uidiv:
+ 	cmp	divisor, #0
+ 	beq	Ldiv0
+ 	mov	curbit, #1
+@@ -68,6 +71,17 @@
+ 	mov	r0, #0			@ about as wrong as it could be
+ 	ldmia	sp!, {pc}
+ 	.size  __udivsi3       , . -  __udivsi3
++
++.globl __aeabi_uidivmod
++__aeabi_uidivmod:
++
++        stmfd   sp!, {r0, r1, ip, lr}
++        bl      __aeabi_uidiv
++        ldmfd   sp!, {r1, r2, ip, lr}
++        mul     r3, r0, r2
++        sub     r1, r1, r3
++        mov     pc, lr
++
+ /* # 235 "libgcc1.S" */
+ /* # 320 "libgcc1.S" */
+ /* # 421 "libgcc1.S" */
-- 
1.7.0.4
