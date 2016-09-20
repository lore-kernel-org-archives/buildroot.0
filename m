From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 20 Sep 2016 23:03:34 +0530
Subject: [Buildroot] [PATCH] uclibc: add upstream patch to fix glog build on
	bfin
Message-ID: <1474392814-20316-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glog has been failing on bfin because of issue in uclibc which is now
fixed in upstream.

Fixes:
  http://autobuild.buildroot.net/results/a10/a10ed48e6eb8411a3d8372f57c05fd11130da0e0/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 ...-dsbt-.h-avoid-void-pointer-s-subtraction.patch | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch

diff --git a/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch b/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch
new file mode 100644
index 0000000..8c1c882
--- /dev/null
+++ b/package/uclibc/0004-elf-fdpic-dsbt-.h-avoid-void-pointer-s-subtraction.patch
@@ -0,0 +1,70 @@
+From 2c242092372e9f7f62b881e81e8e798475e0cbb3 Mon Sep 17 00:00:00 2001
+From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+Date: Sun, 18 Sep 2016 13:15:38 +0530
+Subject: [PATCH] elf-{fdpic, dsbt}.h: avoid void pointer's subtraction
+
+elf-fdpic.h or elf-dsbt.h is included by link.h. When C++ program
+includes <link.h>, we get following build failure.
+
+../usr/include/bits/elf-fdpic.h: In function 'void* __reloc_pointer(void*, const elf32_fdpic_loadmap*)':
+../usr/include/bits/elf-fdpic.h:95: error: invalid use of 'void'
+
+void pointer addition and subtraction is not allowed in C++ as it has
+undetermined size, however in C with language extension it is possible
+because sizeof void is treated as one byte.
+
+Instead of performing subtraction on void pointers, typecast it to char*
+first.
+
+This build failure is detected by Buildroot autobuilder.
+http://autobuild.buildroot.net/results/a10/a10ed48e6eb8411a3d8372f57c05fd11130da0e0/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+---
+ libc/sysdeps/linux/bfin/bits/elf-fdpic.h | 2 +-
+ libc/sysdeps/linux/c6x/bits/elf-dsbt.h   | 2 +-
+ libc/sysdeps/linux/frv/bits/elf-fdpic.h  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libc/sysdeps/linux/bfin/bits/elf-fdpic.h b/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
+index dddf82c..9fcf93f 100644
+--- a/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
++++ b/libc/sysdeps/linux/bfin/bits/elf-fdpic.h
+@@ -91,7 +91,7 @@ __reloc_pointer (void *p,
+       /* This should be computed as part of the pointer comparison
+ 	 above, but we want to use the carry in the comparison, so we
+ 	 can't convert it to an integer type beforehand.  */
+-      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
++      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
+       /* We only check for one-past-the-end for the last segment,
+ 	 assumed to be the data segment, because other cases are
+ 	 ambiguous in the absence of padding between segments, and
+diff --git a/libc/sysdeps/linux/c6x/bits/elf-dsbt.h b/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
+index a4e3e7d..0e82ec7 100644
+--- a/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
++++ b/libc/sysdeps/linux/c6x/bits/elf-dsbt.h
+@@ -94,7 +94,7 @@ __reloc_pointer (void *p,
+ 
+   for (c = 0; c < map->nsegs; c++)
+     {
+-      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
++      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
+       /* We only check for one-past-the-end for the second segment,
+ 	 assumed to be the data segment, because other cases are
+ 	 ambiguous in the absence of padding between segments, and
+diff --git a/libc/sysdeps/linux/frv/bits/elf-fdpic.h b/libc/sysdeps/linux/frv/bits/elf-fdpic.h
+index dddf82c..9fcf93f 100644
+--- a/libc/sysdeps/linux/frv/bits/elf-fdpic.h
++++ b/libc/sysdeps/linux/frv/bits/elf-fdpic.h
+@@ -91,7 +91,7 @@ __reloc_pointer (void *p,
+       /* This should be computed as part of the pointer comparison
+ 	 above, but we want to use the carry in the comparison, so we
+ 	 can't convert it to an integer type beforehand.  */
+-      unsigned long offset = p - (void*)map->segs[c].p_vaddr;
++      unsigned long offset = (char*)p - (char*)map->segs[c].p_vaddr;
+       /* We only check for one-past-the-end for the last segment,
+ 	 assumed to be the data segment, because other cases are
+ 	 ambiguous in the absence of padding between segments, and
+-- 
+2.6.2
+
-- 
2.6.2
