From: Petr Stetiar <ynezz@true.cz>
Date: Wed, 20 Dec 2006 17:24:59 +0100
Subject: [Buildroot] [PATCH] kexec package
In-Reply-To: <20061219133140.GB16563@aon.at>
References: <20061218190131.GO2778@ibawizard.net>
	<20061219133140.GB16563@aon.at>
Message-ID: <20061220162459.GX2778@ibawizard.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer <rep.nop@aon.at> [2006-12-19 14:31:40]:

> On Mon, Dec 18, 2006 at 08:01:31PM +0100, Petr Stetiar wrote:
> >Attached patch adds kexec package to buildroot. Kexec is a tool to load a
> >kernel for warm reboot and initiate a warm reboot.
> 
> There were a number of shortcomings in your patch
> - The version you used had no s390 support
> - toolchain/patch-kernel.sh $(KEXEC_DIR) package/kexec/ kexec-*.patch
>   forgot to escape the asterisk
> - it had a typo "__" instead of the proper "_" in the .mk
> - it didn't uninstall itself from the target in kexec-clean
> 
> Put short, i rebased that diff to add arm support against the debian
> version and redid/fixed the shortcomings. Please test if it still does
> what it is intended to do (it should ;).

Thanks. It works, although I had to apply attached patch to fix few compile time
errors(bad function arguments) and to replace missing shutdown with busybox's reboot 
in kexec's shutdown function.

-- ynezz
-------------- next part --------------
Index: package/kexec/kexec-tools-arm.patch
===================================================================
--- package/kexec/kexec-tools-arm.patch	(revision 17014)
+++ package/kexec/kexec-tools-arm.patch	(working copy)
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
