From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 Sep 2016 22:17:25 -0300
Subject: [Buildroot] [PATCH 2/4] glibc: add FTBFS fix patch for recent
	binutils
In-Reply-To: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1473297447-8804-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../2.22/0004-fix-FTBFS-recent-binutils.patch      | 67 ++++++++++++++++++++++
 .../2.23/0003-fix-FTBFS-recent-binutils.patch      | 67 ++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
 create mode 100644 package/glibc/2.23/0003-fix-FTBFS-recent-binutils.patch

diff --git a/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch b/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
new file mode 100644
index 0000000..598dda8
--- /dev/null
+++ b/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
@@ -0,0 +1,67 @@
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
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+From: https://sourceware.org/ml/libc-alpha/2016-06/msg00660.html
+Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477
+Removed ChangeLog changes to de-debianize the patch.
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
+2.8.1
diff --git a/package/glibc/2.23/0003-fix-FTBFS-recent-binutils.patch b/package/glibc/2.23/0003-fix-FTBFS-recent-binutils.patch
new file mode 100644
index 0000000..598dda8
--- /dev/null
+++ b/package/glibc/2.23/0003-fix-FTBFS-recent-binutils.patch
@@ -0,0 +1,67 @@
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
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+From: https://sourceware.org/ml/libc-alpha/2016-06/msg00660.html
+Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477
+Removed ChangeLog changes to de-debianize the patch.
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
+2.8.1
-- 
2.7.3
