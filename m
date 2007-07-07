From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 03:39:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070707103914.2D43CA682F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 03:39:13 -0700 (Sat, 07 Jul 2007)
New Revision: 19018

Log:
- pull in missing hunks from the arm-mmap fix.


Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-07-07 10:14:30 UTC (rev 19017)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	2007-07-07 10:39:13 UTC (rev 19018)
@@ -1,22 +1,97 @@
---- uClibc-0.9.29/libc/sysdeps/linux/arm/mmap.c	2007-03-08 19:00:42.000000000 +0100
-+++ uClibc/libc/sysdeps/linux/arm/mmap.c	2007-05-16 12:53:23.000000000 +0200
-@@ -39,9 +39,17 @@
+Index: test/mmap/mmap2.c
+===================================================================
+--- test/mmap/mmap2.c	(revision 0)
++++ test/mmap/mmap2.c	(revision 18616)
+@@ -0,0 +1,41 @@
++/* When trying to map /dev/mem with offset 0xFFFFF000 on the ARM platform, mmap
++ * returns -EOVERFLOW.
++ *
++ * Since off_t is defined as a long int and the sign bit is set in the address,
++ * the shift operation shifts in ones instead of zeroes
++ * from the left. This results the offset sent to the kernel function becomes
++ * 0xFFFFFFFF instead of 0x000FFFFF with MMAP2_PAGE_SHIFT set to 12.
++ */
++
++#include <unistd.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++#include <fcntl.h>
++#include <sys/mman.h>
++
++#define FATAL do { fprintf(stderr, "Error at line %d, file %s (%d) [%s]\n", \
++  __LINE__, __FILE__, errno, strerror(errno)); exit(1); } while(0)
++
++#define MAP_SIZE 4096UL
++#define MAP_MASK (MAP_SIZE - 1)
++
++int main(int argc, char **argv) {
++    void* map_base = 0;
++    int fd;
++    off_t target = 0xfffff000;
++    if((fd = open("/dev/mem", O_RDWR | O_SYNC)) == -1) FATAL;
++    printf("/dev/mem opened.\n");
++    fflush(stdout);
++
++   /* Map one page */
++    map_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
++                        fd, target & ~MAP_MASK);
++    if(map_base == (void *) -1) FATAL;
++    printf("Memory mapped at address %p.\n", map_base);
++    fflush(stdout);
++    if(munmap(map_base, MAP_SIZE) == -1) FATAL;
++    close(fd);
++    return 0;
++}
+Index: libc/sysdeps/linux/arm/mmap.c
+===================================================================
+--- libc/sysdeps/linux/arm/mmap.c	(revision 18615)
++++ libc/sysdeps/linux/arm/mmap.c	(revision 18616)
+@@ -27,7 +27,6 @@ __ptr_t mmap(__ptr_t addr, size_t len, i
+ 
+ #elif defined  (__NR_mmap2)
+ #define __NR__mmap __NR_mmap2
+-
+ #ifndef MMAP2_PAGE_SHIFT
+ # define MMAP2_PAGE_SHIFT 12
+ #endif
+@@ -39,9 +38,17 @@ __ptr_t mmap(__ptr_t addr, size_t len, i
  {
    /* check if offset is page aligned */
      if (offset & ((1 << MMAP2_PAGE_SHIFT) - 1))
 +    {
 +        __set_errno(EINVAL);
          return MAP_FAILED;
--  return (__ptr_t) _mmap (addr, len, prot, flags,
--						  fd,(off_t) (offset >> MMAP2_PAGE_SHIFT));
 +    }
 +#ifdef __USE_FILE_OFFSET64
-+    return (__ptr_t) _mmap (addr, len, prot, flags,
-+                            fd, ((__u_quad_t) offset >> MMAP2_PAGE_SHIFT));
++  return (__ptr_t) _mmap (addr, len, prot, flags,
++						  fd,((__u_quad_t) offset >> MMAP2_PAGE_SHIFT));
 +#else
-+    return (__ptr_t) _mmap (addr, len, prot, flags,
-+                            fd, ((__u_long) offset >> MMAP2_PAGE_SHIFT));
+   return (__ptr_t) _mmap (addr, len, prot, flags,
+-						  fd,(off_t) (offset >> MMAP2_PAGE_SHIFT));
++                          fd,((__u_long) offset >> MMAP2_PAGE_SHIFT));
 +#endif
  }
  #elif defined (__NR_mmap)
  # define __NR__mmap __NR_mmap
+Index: libc/sysdeps/linux/common/mmap64.c
+===================================================================
+--- libc/sysdeps/linux/common/mmap64.c	(revision 18615)
++++ libc/sysdeps/linux/common/mmap64.c	(revision 18616)
+@@ -58,8 +58,13 @@ __ptr_t mmap64(__ptr_t addr, size_t len,
+ 		__set_errno(EINVAL);
+ 		return MAP_FAILED;
+ 	}
+-
+-	return __syscall_mmap2(addr, len, prot, flags, fd, (off_t) (offset >> MMAP2_PAGE_SHIFT));
++#ifdef __USE_FILE_OFFSET64
++  return __syscall_mmap2(addr, len, prot, flags,
++                         fd,((__u_quad_t)offset >> MMAP2_PAGE_SHIFT));
++#else
++   return __syscall_mmap2(addr, len, prot, flags,
++                          fd,((__ulong_t)offset >> MMAP2_PAGE_SHIFT));
++#endif
+ }
+ 
+ # endif

Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-07 10:14:30 UTC (rev 19017)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29.config	2007-07-07 10:39:13 UTC (rev 19018)
@@ -113,7 +113,7 @@
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
 UCLIBC_HAS_CTYPE_CHECKED=y
 # UCLIBC_HAS_CTYPE_ENFORCED is not set
-UCLIBC_HAS_WCHAR=y
+# UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
