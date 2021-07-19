From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:04:27 +0200
Subject: [Buildroot] [git commit] package/s390-tools: bump to version 2.17.0
Message-ID: <20210719203514.3A4AC88429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=eab9110afbef9c39569c4cc988aed15c48f7ce44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
- https://release-monitoring.org/project/10714/

https://github.com/ibm-s390-linux/s390-tools/blob/v2.17.0/CHANGELOG.md

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-Fix-compile-errors-due-to-use-of-non-sta.patch | 135 +++++++++++++++++++++
 ...1-osasnmpd-Makefile-fix-cross-compilation.patch |  41 -------
 ...-Fix-compile-errors-due-to-use-of-non-sta.patch |  49 ++++++++
 ...or-when-the-compiler-flags-are-overridden.patch |  54 ---------
 package/s390-tools/s390-tools.hash                 |   2 +-
 package/s390-tools/s390-tools.mk                   |   2 +-
 6 files changed, 186 insertions(+), 97 deletions(-)

diff --git a/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch b/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
new file mode 100644
index 0000000000..725a7f51f1
--- /dev/null
+++ b/package/s390-tools/0001-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
@@ -0,0 +1,135 @@
+From cf6d54b333a3495244ab7bf4939b933fa9fc2108 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Mon, 19 Jul 2021 11:49:31 +0200
+Subject: [PATCH] cpumf/lshwc: Fix compile errors due to use of
+ non-standard 32/64 bit types
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use standard 32- and 64-bit C types.
+
+Fixes the following compile errors with buildroot:
+In file included from lshwc.c:41:
+lshwc.h:61:2: error: unknown type name ???__u64???
+   61 |  __u64 version;   /* Version of interface */
+      |  ^~~~~
+lshwc.h:62:2: error: unknown type name ???__u64???
+   62 |  __u64 data_bytes;  /* # of bytes required */
+      |  ^~~~~
+lshwc.h:63:2: error: unknown type name ???__u64???
+   63 |  __u64 cpumask_len;  /* Length of CPU mask in bytes */
+      |  ^~~~~
+lshwc.h:64:2: error: unknown type name ???__u64???
+   64 |  __u64 *cpumask;   /* Pointer to CPU mask */
+      |  ^~~~~
+lshwc.h:65:2: error: unknown type name ???__u64???
+   65 |  __u64 counter_sets;  /* Bit mask of counter set to get */
+      |  ^~~~~
+lshwc.h:69:2: error: unknown type name ???__u32???
+   69 |  __u32 set;   /* Counter set number */
+      |  ^~~~~
+
+Fixes: 27a562da ("cpumf/lshwc: Program to extract complete counter sets")
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ cpumf/lshwc.c | 10 +++++-----
+ cpumf/lshwc.h | 23 ++++++++++++-----------
+ 2 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/cpumf/lshwc.c b/cpumf/lshwc.c
+index 39c9fbe2..c7755123 100644
+--- a/cpumf/lshwc.c
++++ b/cpumf/lshwc.c
+@@ -240,7 +240,7 @@ static char *show_ctrset(unsigned long set)
+ /* Parse CPU list and counter sets */
+ static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
+ {
+-	__u64 *words = start->cpumask;
++	uint64_t *words = start->cpumask;
+ 	unsigned long i, no_a, no_b;
+ 	char *cp, *tokens[16];		/* Used to parse command line params */
+ 	char cpubuf[256];
+@@ -300,7 +300,7 @@ static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
+ 	/* no_b is highest used index, swap array */
+ 	start->cpumask_len = (no_b + 1) * 8;
+ 	for (no_a = 0; no_a < no_b; ++no_a, --no_b) {
+-		__u64 tmp =  words[no_a];
++		uint64_t tmp =  words[no_a];
+ 
+ 		words[no_a] = words[no_b];
+ 		words[no_b] = tmp;
+@@ -525,7 +525,7 @@ static int test_read(struct s390_hwctr_read *read)
+ 			}
+ 			/* Iterate over all counters in each set */
+ 			for (unsigned int k = 0; k < sp->no_cnts; ++k) {
+-				__u64 value;
++				uint64_t value;
+ 				void *addr = base + offset;
+ 				size_t idx = ctrset_offset(sp->set) + k;
+ 
+@@ -608,8 +608,8 @@ static int do_it(char *s)
+ 	int rc;
+ 
+ 	memset(&start, 0, sizeof(start));
+-	rc = max_possible_cpus / sizeof(__u64);
+-	start.cpumask = alloca(max_possible_cpus / sizeof(__u64));
++	rc = max_possible_cpus / sizeof(uint64_t);
++	start.cpumask = alloca(max_possible_cpus / sizeof(uint64_t));
+ 	memset(start.cpumask, 0, rc);
+ 	parse_cpulist(s, &start);
+ 	errno = 0;
+diff --git a/cpumf/lshwc.h b/cpumf/lshwc.h
+index d8044dc7..2f6c51b8 100644
+--- a/cpumf/lshwc.h
++++ b/cpumf/lshwc.h
+@@ -13,6 +13,7 @@
+ #ifndef LSHWC_H
+ #define LSHWC_H
+ 
++#include <stdint.h>
+ #include <sys/ioctl.h>
+ 
+ enum {
+@@ -58,27 +59,27 @@ enum {
+  */
+ 
+ struct s390_hwctr_start {		/* Set CPUs to operate on */
+-	__u64 version;			/* Version of interface */
+-	__u64 data_bytes;		/* # of bytes required */
+-	__u64 cpumask_len;		/* Length of CPU mask in bytes */
+-	__u64 *cpumask;			/* Pointer to CPU mask */
+-	__u64 counter_sets;		/* Bit mask of counter set to get */
++	uint64_t version;		/* Version of interface */
++	uint64_t data_bytes;		/* # of bytes required */
++	uint64_t cpumask_len;		/* Length of CPU mask in bytes */
++	uint64_t *cpumask;		/* Pointer to CPU mask */
++	uint64_t counter_sets;		/* Bit mask of counter set to get */
+ };
+ 
+ struct s390_hwctr_setdata {		/* Counter set data */
+-	__u32 set;			/* Counter set number */
+-	__u32 no_cnts;			/* # of counters stored in cv[] */
+-	__u64 cv[0];			/* Counter values (variable length) */
++	uint32_t set;			/* Counter set number */
++	uint32_t no_cnts;		/* # of counters stored in cv[] */
++	uint64_t cv[0];			/* Counter values (variable length) */
+ };
+ 
+ struct s390_hwctr_cpudata {		/* Counter set data per CPU */
+-	__u32 cpu_nr;			/* Counter set number */
+-	__u32 no_sets;			/* # of counters sets in data[] */
++	uint32_t cpu_nr;		/* Counter set number */
++	uint32_t no_sets;		/* # of counters sets in data[] */
+ 	struct s390_hwctr_setdata data[0];
+ };
+ 
+ struct s390_hwctr_read {		/* Structure to get all ctr sets */
+-	__u64 no_cpus;			/* Total # of CPUs data taken from */
++	uint64_t no_cpus;		/* Total # of CPUs data taken from */
+ 	struct s390_hwctr_cpudata data[0];
+ };
+ 
+-- 
+2.31.1
+
diff --git a/package/s390-tools/0001-osasnmpd-Makefile-fix-cross-compilation.patch b/package/s390-tools/0001-osasnmpd-Makefile-fix-cross-compilation.patch
deleted file mode 100644
index 8e3d1399f2..0000000000
--- a/package/s390-tools/0001-osasnmpd-Makefile-fix-cross-compilation.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d7faa31a871d14ab02b290bdf2b2fa085766d2ac Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 Nov 2020 23:43:15 +0100
-Subject: [PATCH] osasnmpd/Makefile: fix cross-compilation
-
-Fix the following build failure by allowing the user to provide
-NET_SNMP_CONFIG:
-
-/bin/sh: net-snmp-config: command not found
-/home/buildroot/autobuild/run/instance-2/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/9.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: osasnmpd.o: in function `main':
-osasnmpd.c:(.text.startup+0xcc): undefined reference to `snmp_log_perror'
-
-Fixes:
- - http://autobuild.buildroot.org/results/00796f2ebd5fb0e08ac7a05a9ee566f2bc4bd1c3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ibm-s390-tools/s390-tools/pull/99]
----
- osasnmpd/Makefile | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/osasnmpd/Makefile b/osasnmpd/Makefile
-index 15496b2..8ce0932 100644
---- a/osasnmpd/Makefile
-+++ b/osasnmpd/Makefile
-@@ -1,9 +1,10 @@
- include ../common.mak
--LDLIBS = `net-snmp-config --agent-libs`
-+NET_SNMP_CONFIG = net-snmp-config
-+LDLIBS = `$(NET_SNMP_CONFIG) --agent-libs`
- # On some Linux systems `net-snmp-config --agent-libs` introduces -pie,
- # therefore add -fPIC to prevent link failures.
- ALL_CFLAGS += -fPIC
--ALL_CFLAGS += `net-snmp-config --cflags`
-+ALL_CFLAGS += `$(NET_SNMP_CONFIG) --cflags`
- 
- OBJS = ibmOSAMib.o ibmOSAMibUtil.o osasnmpd.o
- 
--- 
-2.29.2
-
diff --git a/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch b/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
new file mode 100644
index 0000000000..d1af82180e
--- /dev/null
+++ b/package/s390-tools/0002-cpumf-lshwc-Fix-compile-errors-due-to-use-of-non-sta.patch
@@ -0,0 +1,49 @@
+From 727e882d77804f687179df49d96a01b10a0cf56a Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Mon, 19 Jul 2021 12:10:19 +0200
+Subject: [PATCH] cpumf/lshwc: Fix compile errors due to use of
+ non-standard __BITS_PER_LONG
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use LONG_BIT provided by C standard in <limits.h>.
+
+Fixes the following compile errors with buildroot:
+lshwc.c: In function ???parse_cpulist???:
+lshwc.c:295:15: error: ???__BITS_PER_LONG??? undeclared (first use in this function)
+  295 |    no_a = i % __BITS_PER_LONG;
+      |               ^~~~~~~~~~~~~~~
+
+Fixes: 27a562da ("cpumf/lshwc: Program to extract complete counter sets")
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ cpumf/lshwc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/cpumf/lshwc.c b/cpumf/lshwc.c
+index c7755123..13f63c4d 100644
+--- a/cpumf/lshwc.c
++++ b/cpumf/lshwc.c
+@@ -17,6 +17,7 @@
+ #include <err.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <linux/limits.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+@@ -292,8 +293,8 @@ static void parse_cpulist(char *parm, struct s390_hwctr_start *start)
+ 	/* Convert the CPU list to a bitmask for kernel cpumask_t */
+ 	for (i = 0, no_b = 0; i < max_possible_cpus; ++i) {
+ 		if (check[i].cpu_req) {
+-			no_a = i % __BITS_PER_LONG;
+-			no_b = i / __BITS_PER_LONG;
++			no_a = i % LONG_BIT;
++			no_b = i / LONG_BIT;
+ 			words[no_b] |= 1ULL << no_a;
+ 		}
+ 	}
+-- 
+2.31.1
+
diff --git a/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch b/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch
deleted file mode 100644
index ee725d396e..0000000000
--- a/package/s390-tools/0002-zkey-Fix-build-error-when-the-compiler-flags-are-overridden.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 3f3f063c98278f53ad3b34e68b70fca62eaea8fb Mon Sep 17 00:00:00 2001
-From: Ingo Franzki <ifranzki@linux.ibm.com>
-Date: Tue, 23 Feb 2021 08:52:26 +0100
-Subject: [PATCH] zkey: Fix build error when the compiler flags are overridden
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When the compiler flags are overridden, the build of zkey may fail with:
-
-kms.c:44:2: error: #error KMS_PLUGIN_LOCATION must be defined
-   44 | #error KMS_PLUGIN_LOCATION must be defined
-      |  ^~~~~
-
-The Makefile uses CFLAGS variable for defining the KMS_PLUGIN_LOCATION,
-but it should rather use ALL_CFLAGS.
-
-Also use ALL_CPPFLAGS for defining HAVE_LUKS2_SUPPORT.
-
-Fixes: https://github.com/ibm-s390-linux/s390-tools/issues/108
-
-Signed-off-by: Ingo Franzki <ifranzki@linux.ibm.com>
-Reviewed-by: Jan Hoeppner <hoeppner@linux.ibm.com>
-Signed-off-by: Jan H??ppner <hoeppner@linux.ibm.com>
-
-[Retrieved from:
-https://github.com/ibm-s390-linux/s390-tools/commit/3f3f063c98278f53ad3b34e68b70fca62eaea8fb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zkey/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/zkey/Makefile b/zkey/Makefile
-index 41129bcf..f74e2091 100644
---- a/zkey/Makefile
-+++ b/zkey/Makefile
-@@ -18,7 +18,7 @@ ifneq (${HAVE_CRYPTSETUP2},0)
- 		ifneq (${HAVE_OPENSSL},0)
- 			BUILD_TARGETS += zkey-cryptsetup
- 			INSTALL_TARGETS += install-zkey-cryptsetup
--			CPPFLAGS += -DHAVE_LUKS2_SUPPORT
-+			ALL_CPPFLAGS += -DHAVE_LUKS2_SUPPORT
- 		else
- 			BUILD_TARGETS += zkey-cryptsetup-skip-openssl
- 			INSTALL_TARGETS += zkey-cryptsetup-skip-openssl
-@@ -34,7 +34,7 @@ endif
- 
- libs = $(rootdir)/libutil/libutil.a
- 
--CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
-+ALL_CFLAGS += -DKMS_PLUGIN_LOCATION=\"$(ZKEYKMSPLUGINDIR)\"
- 
- detect-libcryptsetup.dep:
- 	echo "#include <libcryptsetup.h>" > detect-libcryptsetup.dep
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index bf007286b4..fef6d1e73d 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b789d5c9d8587b288e1fd9b1c1c4512bb3439e1f389519cb257f1c7c302da58f  s390-tools-2.16.0.tar.gz
+sha256  c983151fe92432db0de24bb69e01194983f5cd63da2d14bea1c0123155cd49c9  s390-tools-2.17.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 326262b475..3b35b70dc1 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.16.0
+S390_TOOLS_VERSION = 2.17.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
