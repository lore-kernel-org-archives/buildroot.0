From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 09:46:27 +0200
Subject: [Buildroot] [PATCH] package/ebtables: fix runtime in case of
 BR2_KERNEL_64_USERLAND_32
Message-ID: <20210518074628.24811-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

ebtables 2.0.11 no longer works correctly when userland is 32-bit and the
kernel is 64-bit. This used to work correctly in version 2.0.10-4.

Problem is twofold:
- ebtables itself was broken and needs to be patched
- buildroot needs to pass the correct flag again to indicate when we are in
  this situation

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...estore-KERNEL_64_USERSPACE_32-checks.patch | 104 ++++++++++++++++++
 ...-option-enable-kernel-64-userland-32.patch |  50 +++++++++
 package/ebtables/ebtables.mk                  |   6 +
 3 files changed, 160 insertions(+)
 create mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
 create mode 100644 package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch

diff --git a/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
new file mode 100644
index 0000000000..61e5b63b12
--- /dev/null
+++ b/package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
@@ -0,0 +1,104 @@
+From 7297a8ef3cab3b0faf1426622ee902a2144e2e89 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 24 Mar 2021 11:27:14 +0100
+Subject: [PATCH] ebtables.h: restore KERNEL_64_USERSPACE_32 checks
+
+Commit e6359eedfbf497e52d52451072aea4713ed80a88 replaced the file ebtables.h
+but removed the usage of KERNEL_64_USERSPACE_32. This breaks boards where
+such flag is relevant, with following messages:
+
+[ 6364.971346] kernel msg: ebtables bug: please report to author: Standard target size too big
+
+Unable to update the kernel. Two possible causes:
+1. Multiple ebtables programs were executing simultaneously. The ebtables
+   userspace tool doesn't by default support multiple ebtables programs running
+   concurrently. The ebtables option --concurrent or a tool like flock can be
+   used to support concurrent scripts that update the ebtables kernel tables.
+2. The kernel doesn't support a certain ebtables extension, consider
+   recompiling your kernel or insmod the extension.
+
+Analysis shows that the structure 'ebt_replace' passed from userspace
+ebtables to the kernel, is too small, i.e 80 bytes instead of 120 in case of
+64-bit kernel.
+
+Note that the ebtables build system seems to assume that 'sparc64' is the
+only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
+This situation can happen on many architectures, especially in embedded
+systems. For example, an Aarch64 processor with kernel in 64-bit but
+userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
+userland running in the 'n32' ABI.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ include/linux/netfilter_bridge/ebtables.h | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/include/linux/netfilter_bridge/ebtables.h b/include/linux/netfilter_bridge/ebtables.h
+index 5be75f2..3c2b61e 100644
+--- a/include/linux/netfilter_bridge/ebtables.h
++++ b/include/linux/netfilter_bridge/ebtables.h
+@@ -49,12 +49,21 @@ struct ebt_replace {
+ 	/* total size of the entries */
+ 	unsigned int entries_size;
+ 	/* start of the chains */
++#ifdef KERNEL_64_USERSPACE_32
++	uint64_t hook_entry[NF_BR_NUMHOOKS];
++#else
+ 	struct ebt_entries *hook_entry[NF_BR_NUMHOOKS];
++#endif
+ 	/* nr of counters userspace expects back */
+ 	unsigned int num_counters;
+ 	/* where the kernel will put the old counters */
++#ifdef KERNEL_64_USERSPACE_32
++	uint64_t counters;
++	uint64_t entries;
++#else
+ 	struct ebt_counter *counters;
+ 	char *entries;
++#endif
+ };
+ 
+ struct ebt_replace_kernel {
+@@ -129,6 +138,9 @@ struct ebt_entry_match {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int match_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -142,6 +154,9 @@ struct ebt_entry_watcher {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int watcher_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -155,6 +170,9 @@ struct ebt_entry_target {
+ 	} u;
+ 	/* size of data */
+ 	unsigned int target_size;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ 	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+ };
+ 
+@@ -162,6 +180,9 @@ struct ebt_entry_target {
+ struct ebt_standard_target {
+ 	struct ebt_entry_target target;
+ 	int verdict;
++#ifdef KERNEL_64_USERSPACE_32
++	unsigned int pad;
++#endif
+ };
+ 
+ /* one entry */
+-- 
+2.26.2
+
diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
new file mode 100644
index 0000000000..56e0cf2ef4
--- /dev/null
+++ b/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
@@ -0,0 +1,50 @@
+From ebf0236270b977a62c522bc32810bc9f8edc72d1 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 24 Mar 2021 13:40:14 +0100
+Subject: [PATCH] configure.ac: add option --enable-kernel-64-userland-32
+
+The ebtables build system seems to assume that 'sparc64' is the
+only case where KERNEL_64_USERSPACE_32 is relevant, but this is not true.
+This situation can happen on many architectures, especially in embedded
+systems. For example, an Aarch64 processor with kernel in 64-bit but
+userland build for 32-bit Arm. Or a 64-bit MIPS Octeon III processor, with
+userland running in the 'n32' ABI.
+
+While it is possible to set CFLAGS in the environment when calling the
+configure script, the caller would need to know to not only specify
+KERNEL_64_USERSPACE_32 but also the EBT_MIN_ALIGN value.
+
+Instead, add a configure option. All internal details can then be handled by
+the configure script.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c24ede3..3e89c0c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -15,10 +15,17 @@ AS_IF([test "x$LOCKFILE" = x], [LOCKFILE="/var/lib/ebtables/lock"])
+ 
+ regular_CFLAGS="-Wall -Wunused"
+ regular_CPPFLAGS=""
++
+ case "$host" in
+ 	sparc64-*)
+-		regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32";;
++		enable_kernel_64_userland_32=yes ;;
+ esac
++AC_ARG_ENABLE([kernel-64-userland-32],
++    AC_HELP_STRING([--enable-kernel-64-userland-32], [indicate that ebtables will be built as a 32-bit application but run under a 64-bit kernel])
++)
++AS_IF([test "x$enable_kernel_64_userland_32" = xyes],
++    [regular_CPPFLAGS="$regular_CPPFLAGS -DEBT_MIN_ALIGN=8 -DKERNEL_64_USERSPACE_32"]
++)
+ 
+ AC_SUBST([regular_CFLAGS])
+ AC_SUBST([regular_CPPFLAGS])
+-- 
+2.26.2
+
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index 54932334c2..2f9dd5ac4b 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -11,6 +11,12 @@ EBTABLES_LICENSE_FILES = COPYING
 EBTABLES_CPE_ID_VENDOR = netfilter
 EBTABLES_SELINUX_MODULES = iptables
 
+# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
+EBTABLES_AUTORECONF = YES
+ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
+EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
+endif
+
 ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
 define EBTABLES_INSTALL_TARGET_UTILS_SAVE
 	$(INSTALL) -m 0755 -D $(@D)/ebtables-save.sh $(TARGET_DIR)/usr/sbin/ebtables-legacy-save
-- 
2.26.3
