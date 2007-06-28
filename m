From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 05:14:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070628121416.E3D24A45BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 05:14:16 -0700 (Thu, 28 Jun 2007)
New Revision: 18960

Log:
- pull arm mmap fix from trunk


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-06-28 12:14:16 UTC (rev 18960)
@@ -0,0 +1,22 @@
+--- uClibc-0.9.29/libc/sysdeps/linux/arm/mmap.c	2007-03-08 19:00:42.000000000 +0100
++++ uClibc/libc/sysdeps/linux/arm/mmap.c	2007-05-16 12:53:23.000000000 +0200
+@@ -39,9 +39,17 @@
+ {
+   /* check if offset is page aligned */
+     if (offset & ((1 << MMAP2_PAGE_SHIFT) - 1))
++    {
++        __set_errno(EINVAL);
+         return MAP_FAILED;
+-  return (__ptr_t) _mmap (addr, len, prot, flags,
+-						  fd,(off_t) (offset >> MMAP2_PAGE_SHIFT));
++    }
++#ifdef __USE_FILE_OFFSET64
++    return (__ptr_t) _mmap (addr, len, prot, flags,
++                            fd, ((__u_quad_t) offset >> MMAP2_PAGE_SHIFT));
++#else
++    return (__ptr_t) _mmap (addr, len, prot, flags,
++                            fd, ((__u_long) offset >> MMAP2_PAGE_SHIFT));
++#endif
+ }
+ #elif defined (__NR_mmap)
+ # define __NR__mmap __NR_mmap
