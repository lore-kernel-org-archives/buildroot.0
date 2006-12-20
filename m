From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 08:50:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kexec
Message-ID: <20061220165004.E3D5D48598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 08:50:04 -0800 (Wed, 20 Dec 2006)
New Revision: 17018

Log:
- Petr Stetiar updated the kexec arm patch. Thanks!


Modified:
   trunk/buildroot/package/kexec/kexec-tools-arm.patch


Changeset:
Modified: trunk/buildroot/package/kexec/kexec-tools-arm.patch
===================================================================
--- trunk/buildroot/package/kexec/kexec-tools-arm.patch	2006-12-20 16:45:47 UTC (rev 17017)
+++ trunk/buildroot/package/kexec/kexec-tools-arm.patch	2006-12-20 16:50:04 UTC (rev 17018)
@@ -389,3 +389,78 @@
 +typedef signed long long   int64_t;
 +
 +#endif /* STDINT_H */
+diff -ur kexec-tools-1.101/kexec/arch/arm/kexec-arm.c kexec-tools-1.101.patched/kexec/arch/arm/kexec-arm.c
+--- kexec-tools-1.101.orig/kexec/arch/arm/kexec-arm.c	2006-12-20 16:41:12.000000000 +0100
++++ kexec-tools-1.101/kexec/arch/arm/kexec-arm.c	2006-12-20 16:40:19.000000000 +0100
+@@ -105,7 +105,7 @@
+ 	return 0;
+ }
+ 
+-int arch_compat_trampoline(struct kexec_info *info, unsigned long *flags)
++int arch_compat_trampoline(struct kexec_info *info)
+ {
+ 	int result;
+ 	struct utsname utsname;
+@@ -115,11 +115,8 @@
+ 			strerror(errno));
+ 		return -1;
+ 	}
+-	if (strncmp(utsname.machine, "arm",3) == 0)
++	if (strncmp(utsname.machine, "arm",3) != 0)
+ 	{
+-		*flags |= KEXEC_ARCH_ARM;
+-	}
+-	else {
+ 		fprintf(stderr, "Unsupported machine type: %s\n",
+ 			utsname.machine);
+ 		return -1;
+diff -ur kexec-tools-1.101/kexec/kexec.c kexec-tools-1.101.patched/kexec/kexec.c
+--- kexec-tools-1.101.orig/kexec/kexec.c	2006-09-20 04:39:38.000000000 +0200
++++ kexec-tools-1.101/kexec/kexec.c	2006-12-20 16:39:10.000000000 +0100
+@@ -532,8 +532,7 @@
+ 		kernel_buf, kernel_size);
+ #endif
+ 
+-	if (get_memory_ranges(&memory_range, &memory_ranges,
+-		info.kexec_flags) < 0) {
++	if (get_memory_ranges(&memory_range, &memory_ranges) < 0) {
+ 		fprintf(stderr, "Could not get memory layout\n");
+ 		return -1;
+ 	}
+diff -ur kexec-tools-1.101/kexec/kexec.h kexec-tools-1.101.patched/kexec/kexec.h
+--- kexec-tools-1.101.orig/kexec/kexec.h	2006-09-20 04:39:38.000000000 +0200
++++ kexec-tools-1.101/kexec/kexec.h	2006-12-20 16:40:47.000000000 +0100
+@@ -119,8 +119,7 @@
+ };
+ 
+ void usage(void);
+-int get_memory_ranges(struct memory_range **range, int *ranges,
+-						unsigned long kexec_flags);
++int get_memory_ranges(struct memory_range **range, int *ranges);
+ int valid_memory_range(unsigned long sstart, unsigned long send);
+ int valid_memory_segment(struct kexec_segment *segment);
+ void print_segments(FILE *file, struct kexec_info *info);
+diff -ur kexec-tools-1.101.orig/kexec/kexec.c kexec-tools-1.101/kexec/kexec.c
+--- kexec-tools-1.101.orig/kexec/kexec.c	2006-12-20 17:04:59.000000000 +0100
++++ kexec-tools-1.101/kexec/kexec.c	2006-12-20 17:05:33.000000000 +0100
+@@ -630,16 +630,11 @@
+ static int my_shutdown(void)
+ {
+ 	char *args[8];
+-	int i = 0;
+ 
+-	args[i++] = "shutdown";
+-	args[i++] = "-r";
+-	args[i++] = "now";
+-	args[i++] = NULL;
+-
+-	execv("/sbin/shutdown", args);
+-	execv("/etc/shutdown", args);
+-	execv("/bin/shutdown", args);
++	args[0] = "reboot";
++	args[1] = NULL;
++
++	execv("/sbin/reboot", args);
+ 
+ 	perror("shutdown");
+ 	return -1;
