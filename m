From: Ralph Siemsen <ralphs@netwinder.org>
Date: Fri, 13 Jul 2007 08:56:07 -0400
Subject: [Buildroot] uClibc-0.9.29-001-fix-mmap.patch broken: __ulong_t
	undefined
Message-ID: <20070713125440.GA8123@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

SVN 19018 appears to have (re-)introduced a bug into the file
toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch

Specifically the issue is use of a cast (__ulong_t) that should
instead be (__u_long).  This was previously reported here:
http://www.busybox.net/lists/uclibc-cvs/2007-May/011362.html

The following patch "works for me":

--- uClibc-0.9.29-001-fix-mmap.patch	2007/07/11 14:49:36	1.1
+++ uClibc-0.9.29-001-fix-mmap.patch	2007/07/11 21:44:18	1.2
@@ -84,7 +84,7 @@
 +                         fd,((__u_quad_t)offset >> MMAP2_PAGE_SHIFT));
 +#else
 +   return __syscall_mmap2(addr, len, prot, flags,
-+                          fd,((__ulong_t)offset >> MMAP2_PAGE_SHIFT));
++                          fd,((__u_long)offset >> MMAP2_PAGE_SHIFT));
 +#endif
  }

Regards,
-R
