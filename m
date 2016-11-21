From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 22 Nov 2016 00:43:39 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: backport upstream patch for sync_8 in
	!glibc
Message-ID: <20161121234340.30463-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 4.7 introduced the sync_8 builtin functions for ARM. For ARM < v7,
this requires calling into the kernel. However, the failure path of
that call reports an error with the __write() function, which is a
glibc internal function. Therefore, it fails to link with uClibc or
musl. This was fixed in gcc 5.2.0, by replacing the __write() with
a plain write().

For sync_8 itself we have solved this with the conditions on
BR2_TOOLCHAIN_ARM_HAS_SYNC_8. However, the same function is also used
for the implementation of atomics.

For the internal toolchain, we can fix this by backporting the patch
to 4.9.4 and 4.8.5.

Fixes:
http://autobuild.buildroot.net/results/1db64b4830f499621e44523e0ef68191505e2ce9

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...et-68059-libgcc-should-not-use-__write-fo.patch | 43 ++++++++++++++++++++++
 ...et-68059-libgcc-should-not-use-__write-fo.patch | 43 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 package/gcc/4.8.5/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
 create mode 100644 package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch

diff --git a/package/gcc/4.8.5/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch b/package/gcc/4.8.5/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
new file mode 100644
index 0000000..d8c6723
--- /dev/null
+++ b/package/gcc/4.8.5/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
@@ -0,0 +1,43 @@
+From edb9057c195c41dd7bcd8603e5fd420359edd520 Mon Sep 17 00:00:00 2001
+From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 23 Nov 2015 15:17:55 +0000
+Subject: [PATCH] [ARM] PR target/68059 libgcc should not use __write for
+ printing fatal error
+
+libgcc/
+	PR target/68059
+	* config/arm/linux-atomic-64bit.c (__write): Rename to...
+	(write): ...this and fix the return type.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 230762 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ libgcc/config/arm/linux-atomic-64bit.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgcc/config/arm/linux-atomic-64bit.c b/libgcc/config/arm/linux-atomic-64bit.c
+index 7aa8dfc..570b4ce 100644
+--- a/libgcc/config/arm/linux-atomic-64bit.c
++++ b/libgcc/config/arm/linux-atomic-64bit.c
+@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+    kernels; we check for that in an init section and bail out rather
+    unceremoneously.  */
+ 
+-extern unsigned int __write (int fd, const void *buf, unsigned int count);
++extern int write (int fd, const void *buf, unsigned int count);
+ extern void abort (void);
+ 
+ /* Kernel helper for compare-and-exchange.  */
+@@ -56,7 +56,7 @@ static void __check_for_sync8_kernelhelper (void)
+ 	 for the user - I'm not sure I can rely on much else being
+ 	 available at this point, so do the same as generic-morestack.c
+ 	 write () and abort ().  */
+-      __write (2 /* stderr.  */, err, sizeof (err));
++      write (2 /* stderr.  */, err, sizeof (err));
+       abort ();
+     }
+ };
+-- 
+2.10.2
+
diff --git a/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch b/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
new file mode 100644
index 0000000..fd2bc69
--- /dev/null
+++ b/package/gcc/4.9.4/0001-ARM-PR-target-68059-libgcc-should-not-use-__write-fo.patch
@@ -0,0 +1,43 @@
+From 80bc14a5249da7054b716229206b453f339b4a5e Mon Sep 17 00:00:00 2001
+From: nsz <nsz@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 23 Nov 2015 15:17:55 +0000
+Subject: [PATCH] [ARM] PR target/68059 libgcc should not use __write for
+ printing fatal error
+
+libgcc/
+	PR target/68059
+	* config/arm/linux-atomic-64bit.c (__write): Rename to...
+	(write): ...this and fix the return type.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 230762 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ libgcc/config/arm/linux-atomic-64bit.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgcc/config/arm/linux-atomic-64bit.c b/libgcc/config/arm/linux-atomic-64bit.c
+index 5b8c6e2..9078673 100644
+--- a/libgcc/config/arm/linux-atomic-64bit.c
++++ b/libgcc/config/arm/linux-atomic-64bit.c
+@@ -33,7 +33,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+    kernels; we check for that in an init section and bail out rather
+    unceremoneously.  */
+ 
+-extern unsigned int __write (int fd, const void *buf, unsigned int count);
++extern int write (int fd, const void *buf, unsigned int count);
+ extern void abort (void);
+ 
+ /* Kernel helper for compare-and-exchange.  */
+@@ -56,7 +56,7 @@ static void __check_for_sync8_kernelhelper (void)
+ 	 for the user - I'm not sure I can rely on much else being
+ 	 available at this point, so do the same as generic-morestack.c
+ 	 write () and abort ().  */
+-      __write (2 /* stderr.  */, err, sizeof (err));
++      write (2 /* stderr.  */, err, sizeof (err));
+       abort ();
+     }
+ };
+-- 
+2.10.2
+
-- 
2.10.2
