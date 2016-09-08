From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 8 Sep 2016 17:07:30 +0100
Subject: [Buildroot] [PATCH] glibc: fix MIPS and SPARC builds for glibc <
	2.24 with recent binutils
Message-ID: <1473350850-40372-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport two upstream patches to fix a build failure on MIPS and SPARC
architectures when using recent binutils versions. It appears that on
these architectures pt-vfork.S includes vfork.S (through the alpha
version of pt-vfork.S) and that the __vfork aliases are not
conditionalized on IS_IN (libc) like on other architectures. Therefore
the aliases are also wrongly included in libpthread.so.

The build failure looks like this:

/br/output/build/glibc-2.22/build/nptl/libpthread.so:(*IND*+0x0):
multiple definition of `vfork at GLIBC_2.0'
/br/output/build/glibc-2.22/build/nptl/libpthread.so::(.text+0xeea0):
first defined here

This problem was reported in Debian here:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477

Upstream patches here:

https://sourceware.org/git/?p=glibc.git;a=commit;h=43c2948756bb6e144c7b871e827bba37d61ad3a3
https://sourceware.org/git/?p=glibc.git;a=commit;h=b87c1ec3fa398646f042a68f0ce0f7d09c1348c7

I have tweaked them a little bit in order to not patch the ChangeLog
file, otherwise it will fail.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...-fix-wrong-vfork-aliases-in-libpthread.so.patch |  76 +++++++++++++
 ...more-fixes-to-the-vfork-aliases-in-libpth.patch | 122 +++++++++++++++++++++
 ...-fix-wrong-vfork-aliases-in-libpthread.so.patch |  76 +++++++++++++
 ...more-fixes-to-the-vfork-aliases-in-libpth.patch | 122 +++++++++++++++++++++
 4 files changed, 396 insertions(+)
 create mode 100644 package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
 create mode 100644 package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
 create mode 100644 package/glibc/2.23/0003-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
 create mode 100644 package/glibc/2.23/0004-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch

diff --git a/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch b/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
new file mode 100644
index 0000000..740b322
--- /dev/null
+++ b/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
@@ -0,0 +1,76 @@
+From 43c2948756bb6e144c7b871e827bba37d61ad3a3 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sat, 18 Jun 2016 19:11:23 +0200
+Subject: [PATCH] MIPS, SPARC: fix wrong vfork aliases in libpthread.so
+
+With recent binutils versions the GNU libc fails to build on at least
+MISP and SPARC, with this kind of error:
+
+  /home/aurel32/glibc/glibc-build/nptl/libpthread.so:(*IND*+0x0): multiple definition of `vfork at GLIBC_2.0'
+  /home/aurel32/glibc/glibc-build/nptl/libpthread.so::(.text+0xee50): first defined here
+
+It appears that on these architectures pt-vfork.S includes vfork.S
+(through the alpha version of pt-vfork.S) and that the __vfork aliases
+are not conditionalized on IS_IN (libc) like on other architectures.
+Therefore the aliases are also wrongly included in libpthread.so.
+
+Fix this by properly conditionalizing the aliases like on other
+architectures.
+
+Changelog:
+	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Conditionalize
+	hidden_def, weak_alias and strong_alias on [IS_IN (libc)].
+	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
+	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
+
+[Vincent: do not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ sysdeps/unix/sysv/linux/mips/vfork.S          | 2 ++
+ sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S | 2 ++
+ sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
+index 8c66151..c0c0ce6 100644
+--- a/sysdeps/unix/sysv/linux/mips/vfork.S
++++ b/sysdeps/unix/sysv/linux/mips/vfork.S
+@@ -106,6 +106,8 @@ L(error):
+ #endif
+ 	END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def(__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+index dc32e0a..94f2c8d 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+@@ -44,6 +44,8 @@ ENTRY(__vfork)
+ 	 nop
+ END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def (__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+index 05be3c2..a7479e9 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+@@ -44,6 +44,8 @@ ENTRY(__vfork)
+ 	 nop
+ END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def (__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+-- 
+2.7.3
+
diff --git a/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch b/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
new file mode 100644
index 0000000..3c53f6d
--- /dev/null
+++ b/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
@@ -0,0 +1,122 @@
+From b87c1ec3fa398646f042a68f0ce0f7d09c1348c7 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Tue, 21 Jun 2016 23:59:37 +0200
+Subject: [PATCH] MIPS, SPARC: more fixes to the vfork aliases in libpthread.so
+
+Commit 43c29487 tried to fix the vfork aliases in libpthread.so on MIPS
+and SPARC, but failed to do it correctly, introducing an ABI change.
+
+This patch does the remaining changes needed to align the MIPS and SPARC
+vfork implementations with the other architectures. That way the the
+alpha version of pt-vfork.S works correctly for MIPS and SPARC. The
+changes for alpha were done in 82aab97c.
+
+Changelog:
+	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Rename into
+	__libc_vfork.
+	(__vfork) [IS_IN (libc)]: Remove alias.
+	(__libc_vfork) [IS_IN (libc)]: Define as an alias.
+	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
+	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
+
+[Vincent: do not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ sysdeps/unix/sysv/linux/mips/vfork.S          | 12 ++++++------
+ sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S |  8 ++++----
+ sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S |  8 ++++----
+ 3 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
+index c0c0ce6..1867c86 100644
+--- a/sysdeps/unix/sysv/linux/mips/vfork.S
++++ b/sysdeps/unix/sysv/linux/mips/vfork.S
+@@ -31,13 +31,13 @@
+ LOCALSZ= 1
+ FRAMESZ= (((NARGSAVE+LOCALSZ)*SZREG)+ALSZ)&ALMASK
+ GPOFF= FRAMESZ-(1*SZREG)
+-NESTED(__vfork,FRAMESZ,sp)
++NESTED(__libc_vfork,FRAMESZ,sp)
+ #ifdef __PIC__
+ 	SETUP_GP
+ #endif
+ 	PTR_SUBU sp, FRAMESZ
+ 	cfi_adjust_cfa_offset (FRAMESZ)
+-	SETUP_GP64_REG (a5, __vfork)
++	SETUP_GP64_REG (a5, __libc_vfork)
+ #ifdef __PIC__
+ 	SAVE_GP (GPOFF)
+ #endif
+@@ -104,10 +104,10 @@ L(error):
+ 	RESTORE_GP64_REG
+ 	j		__syscall_error
+ #endif
+-	END(__vfork)
++	END(__libc_vfork)
+ 
+ #if IS_IN (libc)
+-libc_hidden_def(__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
++libc_hidden_def (__vfork)
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+index 94f2c8d..0d0a3b5 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+@@ -21,7 +21,7 @@
+ 
+ 	.text
+ 	.globl		__syscall_error
+-ENTRY(__vfork)
++ENTRY(__libc_vfork)
+ 	ld	[%g7 + PID], %o5
+ 	cmp	%o5, 0
+ 	bne	1f
+@@ -42,10 +42,10 @@ ENTRY(__vfork)
+ 	 st	%o5, [%g7 + PID]
+ 1:	retl
+ 	 nop
+-END(__vfork)
++END(__libc_vfork)
+ 
+ #if IS_IN (libc)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
+ libc_hidden_def (__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+index a7479e9..0818eba 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+@@ -21,7 +21,7 @@
+ 
+ 	.text
+ 	.globl	__syscall_error
+-ENTRY(__vfork)
++ENTRY(__libc_vfork)
+ 	ld	[%g7 + PID], %o5
+ 	sethi	%hi(0x80000000), %o3
+ 	cmp	%o5, 0
+@@ -42,10 +42,10 @@ ENTRY(__vfork)
+ 	 st	%o5, [%g7 + PID]
+ 1:	retl
+ 	 nop
+-END(__vfork)
++END(__libc_vfork)
+ 
+ #if IS_IN (libc)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
+ libc_hidden_def (__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
+ #endif
+-- 
+2.7.3
+
diff --git a/package/glibc/2.23/0003-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch b/package/glibc/2.23/0003-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
new file mode 100644
index 0000000..740b322
--- /dev/null
+++ b/package/glibc/2.23/0003-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
@@ -0,0 +1,76 @@
+From 43c2948756bb6e144c7b871e827bba37d61ad3a3 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sat, 18 Jun 2016 19:11:23 +0200
+Subject: [PATCH] MIPS, SPARC: fix wrong vfork aliases in libpthread.so
+
+With recent binutils versions the GNU libc fails to build on at least
+MISP and SPARC, with this kind of error:
+
+  /home/aurel32/glibc/glibc-build/nptl/libpthread.so:(*IND*+0x0): multiple definition of `vfork at GLIBC_2.0'
+  /home/aurel32/glibc/glibc-build/nptl/libpthread.so::(.text+0xee50): first defined here
+
+It appears that on these architectures pt-vfork.S includes vfork.S
+(through the alpha version of pt-vfork.S) and that the __vfork aliases
+are not conditionalized on IS_IN (libc) like on other architectures.
+Therefore the aliases are also wrongly included in libpthread.so.
+
+Fix this by properly conditionalizing the aliases like on other
+architectures.
+
+Changelog:
+	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Conditionalize
+	hidden_def, weak_alias and strong_alias on [IS_IN (libc)].
+	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
+	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
+
+[Vincent: do not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ sysdeps/unix/sysv/linux/mips/vfork.S          | 2 ++
+ sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S | 2 ++
+ sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S | 2 ++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
+index 8c66151..c0c0ce6 100644
+--- a/sysdeps/unix/sysv/linux/mips/vfork.S
++++ b/sysdeps/unix/sysv/linux/mips/vfork.S
+@@ -106,6 +106,8 @@ L(error):
+ #endif
+ 	END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def(__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+index dc32e0a..94f2c8d 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+@@ -44,6 +44,8 @@ ENTRY(__vfork)
+ 	 nop
+ END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def (__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+index 05be3c2..a7479e9 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+@@ -44,6 +44,8 @@ ENTRY(__vfork)
+ 	 nop
+ END(__vfork)
+ 
++#if IS_IN (libc)
+ libc_hidden_def (__vfork)
+ weak_alias (__vfork, vfork)
+ strong_alias (__vfork, __libc_vfork)
++#endif
+-- 
+2.7.3
+
diff --git a/package/glibc/2.23/0004-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch b/package/glibc/2.23/0004-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
new file mode 100644
index 0000000..3c53f6d
--- /dev/null
+++ b/package/glibc/2.23/0004-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
@@ -0,0 +1,122 @@
+From b87c1ec3fa398646f042a68f0ce0f7d09c1348c7 Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Tue, 21 Jun 2016 23:59:37 +0200
+Subject: [PATCH] MIPS, SPARC: more fixes to the vfork aliases in libpthread.so
+
+Commit 43c29487 tried to fix the vfork aliases in libpthread.so on MIPS
+and SPARC, but failed to do it correctly, introducing an ABI change.
+
+This patch does the remaining changes needed to align the MIPS and SPARC
+vfork implementations with the other architectures. That way the the
+alpha version of pt-vfork.S works correctly for MIPS and SPARC. The
+changes for alpha were done in 82aab97c.
+
+Changelog:
+	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Rename into
+	__libc_vfork.
+	(__vfork) [IS_IN (libc)]: Remove alias.
+	(__libc_vfork) [IS_IN (libc)]: Define as an alias.
+	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
+	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
+
+[Vincent: do not patch ChangeLog]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ sysdeps/unix/sysv/linux/mips/vfork.S          | 12 ++++++------
+ sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S |  8 ++++----
+ sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S |  8 ++++----
+ 3 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
+index c0c0ce6..1867c86 100644
+--- a/sysdeps/unix/sysv/linux/mips/vfork.S
++++ b/sysdeps/unix/sysv/linux/mips/vfork.S
+@@ -31,13 +31,13 @@
+ LOCALSZ= 1
+ FRAMESZ= (((NARGSAVE+LOCALSZ)*SZREG)+ALSZ)&ALMASK
+ GPOFF= FRAMESZ-(1*SZREG)
+-NESTED(__vfork,FRAMESZ,sp)
++NESTED(__libc_vfork,FRAMESZ,sp)
+ #ifdef __PIC__
+ 	SETUP_GP
+ #endif
+ 	PTR_SUBU sp, FRAMESZ
+ 	cfi_adjust_cfa_offset (FRAMESZ)
+-	SETUP_GP64_REG (a5, __vfork)
++	SETUP_GP64_REG (a5, __libc_vfork)
+ #ifdef __PIC__
+ 	SAVE_GP (GPOFF)
+ #endif
+@@ -104,10 +104,10 @@ L(error):
+ 	RESTORE_GP64_REG
+ 	j		__syscall_error
+ #endif
+-	END(__vfork)
++	END(__libc_vfork)
+ 
+ #if IS_IN (libc)
+-libc_hidden_def(__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
++libc_hidden_def (__vfork)
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+index 94f2c8d..0d0a3b5 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
+@@ -21,7 +21,7 @@
+ 
+ 	.text
+ 	.globl		__syscall_error
+-ENTRY(__vfork)
++ENTRY(__libc_vfork)
+ 	ld	[%g7 + PID], %o5
+ 	cmp	%o5, 0
+ 	bne	1f
+@@ -42,10 +42,10 @@ ENTRY(__vfork)
+ 	 st	%o5, [%g7 + PID]
+ 1:	retl
+ 	 nop
+-END(__vfork)
++END(__libc_vfork)
+ 
+ #if IS_IN (libc)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
+ libc_hidden_def (__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+index a7479e9..0818eba 100644
+--- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
++++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
+@@ -21,7 +21,7 @@
+ 
+ 	.text
+ 	.globl	__syscall_error
+-ENTRY(__vfork)
++ENTRY(__libc_vfork)
+ 	ld	[%g7 + PID], %o5
+ 	sethi	%hi(0x80000000), %o3
+ 	cmp	%o5, 0
+@@ -42,10 +42,10 @@ ENTRY(__vfork)
+ 	 st	%o5, [%g7 + PID]
+ 1:	retl
+ 	 nop
+-END(__vfork)
++END(__libc_vfork)
+ 
+ #if IS_IN (libc)
++weak_alias (__libc_vfork, vfork)
++strong_alias (__libc_vfork, __vfork)
+ libc_hidden_def (__vfork)
+-weak_alias (__vfork, vfork)
+-strong_alias (__vfork, __libc_vfork)
+ #endif
+-- 
+2.7.3
+
-- 
2.7.3
