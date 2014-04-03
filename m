From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:35:08 +0200
Subject: [Buildroot] [git commit] uclibc: add missing .literal_position
	directives
Message-ID: <20140403193845.1186B9B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b1b8fbca7469faef3d42d662b090722ae1c98bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows building uclibc with -mtext-section-literals flag.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-add-missing-.literal_position-directives.patch |   62 ++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch
new file mode 100644
index 0000000..f5577c6
--- /dev/null
+++ b/package/uclibc/7bf35c8b7d4a1f97174eb49f47f33946b282114c/uclibc-0001-xtensa-add-missing-.literal_position-directives.patch
@@ -0,0 +1,62 @@
+From 04d7bd868b300c8150231d7a37e62150eaf810d0 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Mon, 24 Mar 2014 01:06:35 +0400
+Subject: [PATCH] xtensa: add missing .literal_position directives
+
+This addition allows building uClibc with -mtext-section-literals
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ ldso/ldso/xtensa/dl-startup.h | 1 +
+ ldso/ldso/xtensa/resolve.S    | 1 +
+ libc/string/xtensa/strcmp.S   | 5 +++--
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/ldso/ldso/xtensa/dl-startup.h b/ldso/ldso/xtensa/dl-startup.h
+index 45af82d..b135a4c 100644
+--- a/ldso/ldso/xtensa/dl-startup.h
++++ b/ldso/ldso/xtensa/dl-startup.h
+@@ -11,6 +11,7 @@
+ __asm__ (
+     "	.text\n"
+     "	.align  4\n"
++    "	.literal_position\n"
+     "	.global _start\n"
+     "	.type   _start, @function\n"
+     "	.hidden _start\n"
+diff --git a/ldso/ldso/xtensa/resolve.S b/ldso/ldso/xtensa/resolve.S
+index 61c2c5d..d1ae8aa 100644
+--- a/ldso/ldso/xtensa/resolve.S
++++ b/ldso/ldso/xtensa/resolve.S
+@@ -27,6 +27,7 @@
+ 
+ 	.text
+ 	.align	4
++	.literal_position
+ 	.global	_dl_linux_resolve
+ 	.type	_dl_linux_resolve, @function
+ _dl_linux_resolve:
+diff --git a/libc/string/xtensa/strcmp.S b/libc/string/xtensa/strcmp.S
+index d3d72e0..8ed1ed0 100644
+--- a/libc/string/xtensa/strcmp.S
++++ b/libc/string/xtensa/strcmp.S
+@@ -34,13 +34,14 @@
+ 
+ #define MASK4 0x40404040
+ 
++	.text
++	.align 4
++	.literal_position
+ 	.literal .Lmask0, MASK0
+ 	.literal .Lmask1, MASK1
+ 	.literal .Lmask2, MASK2
+ 	.literal .Lmask3, MASK3
+ 	.literal .Lmask4, MASK4
+-
+-	.text
+ ENTRY (strcmp)
+ 	/* a2 = s1, a3 = s2 */
+ 
+-- 
+1.8.1.4
+
