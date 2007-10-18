From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Oct 2007 22:26:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20071018052607.AFA1AA458C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-17 22:26:06 -0700 (Wed, 17 Oct 2007)
New Revision: 20278

Log:
Fix kexec build for ARM

Modified:
   trunk/buildroot/package/kexec/kexec-tools-002-add-arch-arm.patch


Changeset:
Modified: trunk/buildroot/package/kexec/kexec-tools-002-add-arch-arm.patch
===================================================================
--- trunk/buildroot/package/kexec/kexec-tools-002-add-arch-arm.patch	2007-10-17 22:01:58 UTC (rev 20277)
+++ trunk/buildroot/package/kexec/kexec-tools-002-add-arch-arm.patch	2007-10-18 05:26:06 UTC (rev 20278)
@@ -5,7 +5,7 @@
  	i?86 )
  		host_cpu="i386"
  		;;
-+	arm )
++	arm* )
 +		host_cpu="arm"
 +		;;
  	powerpc )
@@ -76,7 +76,7 @@
 +static struct memory_range memory_range[MAX_MEMORY_RANGES];
 +
 +/* Return a sorted list of available memory ranges. */
-+int get_memory_ranges(struct memory_range **range, int *ranges)
++int get_memory_ranges(struct memory_range **range, int *ranges, unsigned long kexec_flags)
 +{
 +	const char iomem[]= "/proc/iomem";
 +	int memory_ranges = 0;
@@ -385,3 +385,14 @@
 +typedef signed long long   int64_t;
 +
 +#endif /* STDINT_H */
+--- kexec-tools-1.101/kexec/kexec-syscall.h.orig	2007-10-18 14:28:44.000000000 +1000
++++ kexec-tools-1.101/kexec/kexec-syscall.h	2007-10-18 14:28:57.000000000 +1000
+@@ -44,7 +44,7 @@
+ #define __NR_kexec_load		277
+ #endif
+ #ifdef __arm__
+-#define __NR_kexec_load		__NR_SYSCALL_BASE + 189  
++#define __NR_kexec_load		__NR_SYSCALL_BASE + 347  
+ #endif
+ #ifndef __NR_kexec_load
+ #error Unknown processor architecture.  Needs a kexec_load syscall number.
