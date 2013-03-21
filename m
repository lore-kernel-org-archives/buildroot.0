From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 21 Mar 2013 20:03:17 +0100
Subject: [Buildroot] [PATCH v2] oprofile 0.9.8: fix compilation on powerpc
Message-ID: <925a76f808cf62f15265.1363892597@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The oprofile build was broken on powerpc since version 0.9.8.
This was detected in several autobuilds, like
http://autobuild.buildroot.net/results/6f6c02d18495907d50fcdfc6003ac20d493c55fe/

Thomas Petazzoni had some fixes pending in his own tree, and this patch is
partially based on this work (credits to him). Here is an overview:
- I took over (and fixed) the oprofile.mk changes, except for the powerpc-
  specific part. For powerpc, there is a new dependency to libpfm4.
- I reimported those Yocto patches that were specific to the ppc build
  issues, but left out the other ones. Those can be added in separate
  commits.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: - Only add libpfm4 dependency for powerpc (or when explicitly selected)
      (thanks Reuben Dowle)
    - Line up with the work of ThomasP, and use Yocto patches where
      possible.


 package/oprofile/Config.in                                                               |    1 +
 package/oprofile/oprofile-003-oprofile-ppc32-build-fix.patch                             |   32 +++++++++++++
 package/oprofile/oprofile-004-fix-ppc64-specific-libpfm-usage.patch                      |  105 ++++++++++++++++++++++++++++++++++++++++++
 package/oprofile/oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch |  154 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/oprofile/oprofile.mk                                                             |   18 ++++++-
 5 files changed, 308 insertions(+), 2 deletions(-)

Note: this is compile-tested on x86 and powerpc, but I was not able to test
it on target.

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 # binutils
 	help
diff --git a/package/oprofile/oprofile-003-oprofile-ppc32-build-fix.patch b/package/oprofile/oprofile-003-oprofile-ppc32-build-fix.patch
new file mode 100644
--- /dev/null
+++ b/package/oprofile/oprofile-003-oprofile-ppc32-build-fix.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Backport
+
+From fa889ea74b6b931e241a8cd57e90edc23cd7ab03 Mon Sep 17 00:00:00 2001
+From: William Cohen <wcohen@redhat.com>
+Date: Mon, 15 Oct 2012 15:09:55 -0500
+Subject: [PATCH] OProfile doesn't build for 32-bit ppc; the operf_utils.cpp
+ compile fails. Need to be able to build the 32-bit ppc
+ version of oprofile to provide the 32-bit ppc java support
+ libraries. The configure only handles the case of ppc64
+ with perf support.
+
+Signed-off-by: William Cohen <wcohen@redhat.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b739133..7449854 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -104,7 +104,7 @@ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+ 	arch="`uname -m`"
+-	if test "$arch" = "ppc64"; then
++	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
+ 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
+ 		AC_CHECK_LIB(pfm,pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1', [
+ 			AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1',
+-- 
+1.7.9.7
+
diff --git a/package/oprofile/oprofile-004-fix-ppc64-specific-libpfm-usage.patch b/package/oprofile/oprofile-004-fix-ppc64-specific-libpfm-usage.patch
new file mode 100644
--- /dev/null
+++ b/package/oprofile/oprofile-004-fix-ppc64-specific-libpfm-usage.patch
@@ -0,0 +1,105 @@
+From 8e36ad01ceb1257d05773b684dbe9358aecd3f71 Mon Sep 17 00:00:00 2001
+From: Maynard Johnson <maynardj@us.ibm.com>
+Date: Tue, 26 Feb 2013 13:41:27 -0600
+Subject: [PATCH] Fix PPC64-specific libpfm usage so it doesn't break ppc32
+ architecture
+
+The configure check to determine whether we should use libpfm or not
+is intended only for the ppc64 architecture, but was incorrectly
+hitting on the ppc32 architecture, too.  Not only that, but it was using
+'uname' which is not a good idea in cross-compile situtations.
+
+Then, aside from that, we had several instances in the source code
+of the following:
+   #if (defined(__powerpc__) || defined(__powerpc64__))
+which incorrectly included ppc32 architecutre also, when it was intended
+for use as PPC64 architecture.
+
+This patch fixes both errors.
+
+Signed-off-by: Maynard Johnson <maynardj@us.ibm.com
+---
+ configure.ac                   |    5 ++---
+ libperf_events/operf_utils.cpp |    4 ++--
+ libperf_events/operf_utils.h   |    6 ++++++
+ pe_profiling/operf.cpp         |   10 +++++-----
+ 4 files changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,11 +100,10 @@ else
+ 	HAVE_PERF_EVENTS='0'
+ fi
+ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf_events exists])
+-
++AC_CANONICAL_HOST
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+-	arch="`uname -m`"
+-	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
++	if test "$host_cpu" = "powerpc64"; then
+ 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
+ 		AC_CHECK_LIB(pfm,pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1', [
+ 			AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1',
+diff --git a/libperf_events/operf_utils.cpp b/libperf_events/operf_utils.cpp
+--- a/libperf_events/operf_utils.cpp
++++ b/libperf_events/operf_utils.cpp
+@@ -82,7 +82,7 @@ static event_t comm_event;
+  * the following method is to map the operf-record event value to a value that
+  * opreport can understand.
+  */
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ #define NIL_CODE ~0U
+ 
+ #if HAVE_LIBPFM3
+@@ -708,7 +708,7 @@ static void __handle_sample_event(event_
+ 	} else if (event->header.misc == PERF_RECORD_MISC_USER) {
+ 		in_kernel = false;
+ 	}
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	else if (event->header.misc == PERF_RECORD_MISC_HYPERVISOR) {
+ #define MAX_HYPERVISOR_ADDRESS 0xfffffffULL
+ 		if (data.ip > MAX_HYPERVISOR_ADDRESS) {
+diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.h
+--- a/libperf_events/operf_utils.h
++++ b/libperf_events/operf_utils.h
+@@ -45,6 +45,12 @@ extern bool throttled;
+ #define MMAP_WINDOW_SZ (32 * 1024 * 1024ULL)
+ #endif
+ 
++/* A macro to be used for ppc64 architecture-specific code.  The '__powerpc__' macro
++ * is defined for both ppc64 and ppc32 architectures, so we must further qualify by
++ * including the 'HAVE_LIBPFM' macro, since that macro will be defined only for ppc64.
++ */
++#define PPC64_ARCH (HAVE_LIBPFM) && ((defined(__powerpc__) || defined(__powerpc64__)))
++
+ extern unsigned int op_nr_counters;
+ 
+ static inline size_t align_64bit(u64 x)
+diff --git a/pe_profiling/operf.cpp b/pe_profiling/operf.cpp
+--- a/pe_profiling/operf.cpp
++++ b/pe_profiling/operf.cpp
+@@ -1197,9 +1197,9 @@ static void _process_events_list(void)
+ 		_get_event_code(&event);
+ 		events.push_back(event);
+ 	}
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	{
+-		/* This section of code is for architectures such as ppc[64] for which
++		/* This section of code is soley for the ppc64 architecture for which
+ 		 * the oprofile event code needs to be converted to the appropriate event
+ 		 * code to pass to the perf_event_open syscall.
+ 		 */
+@@ -1244,7 +1244,7 @@ static void get_default_event(void)
+ 	_get_event_code(&dft_evt);
+ 	events.push_back(dft_evt);
+ 
+-#if (defined(__powerpc__) || defined(__powerpc64__))
++#if PPC64_ARCH
+ 	{
+ 		/* This section of code is for architectures such as ppc[64] for which
+ 		 * the oprofile event code needs to be converted to the appropriate event
diff --git a/package/oprofile/oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch b/package/oprofile/oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch
new file mode 100644
--- /dev/null
+++ b/package/oprofile/oprofile-005-fix-up-configure-to-handle-architectures-that-do-not.patch
@@ -0,0 +1,154 @@
+Upstream-Status: Backport
+
+From ca6d916a6f8f0f8abbb4c9b6a97dd1a1615bb124 Mon Sep 17 00:00:00 2001
+From: Maynard Johnson <maynardj@us.ibm.com>
+Date: Wed, 5 Dec 2012 10:16:35 -0600
+Subject: [PATCH] Fix up configure to handle architectures that do not
+ implement perf_event_open
+
+This patch fixes the following problems:
+
+1) The configure script allows the user to pass a location to kernel
+headers (via --with-kernel option) such that, even if the running
+kernel does not have perf_events support, it may be possible to
+build operf (e.g., in cross-compile environments).  But the message
+'This kernel does not have perf_events support; falling back to legacy
+oprofile' was being displayed inappropriately in such cases.  This
+patch changes the configure script so that the "falling back to
+legacy oprofile" message will only be displayed if we're running
+on a kernel that does not have perf_events support AND the user
+did not pass specify the "--with-kernel" option.
+
+2) Some architectures don't even implement the perf_event_open syscall, so the
+configure script must do more than checking kernel version and whether or not
+perf_event.h is present in order to decide if perf_events is supported.
+This patch provides that extra capability.
+
+These problems were reported by Tony Jones <tonyj@suse.com>.
+
+Signed-off-by:  Maynard Johnson <maynardj@us.ibm.com>
+---
+ configure.ac                   |   74 +++++++++++++++++++++++++++++-----------
+ utils/op_perf_events_checker.c |    6 ++--
+ 2 files changed, 58 insertions(+), 22 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,35 +70,70 @@ KERNELDIR=$withval)
+ 
+ 
+ dnl Check kernel version for perf_events supported
+-AC_MSG_CHECKING([kernel version supports perf_events])
+ if test "$KERNELDIR" != ""; then
+ 	KINC="$KERNELDIR/include"
++	PERF_EVENT_FLAGS=" -I$KERNELDIR/include"
++	AC_SUBST(PERF_EVENT_FLAGS)
++	PERF_EVENT_H="$KERNELDIR/include/linux/perf_event.h"
++else
++	PERF_EVENT_H="/usr/include/linux/perf_event.h"
+ fi
+-AX_KERNEL_VERSION(2, 6, 31, <=, kernel_has_perf_events_support="yes",
++
++PERF_EVENT_H_EXISTS="no"
++kernel_may_have_perf_events_support="no"
++AX_KERNEL_VERSION(2, 6, 31, <=, kernel_may_have_perf_events_support="yes",
+ kernel_has_perf_events_support="no")
+ 
+-if test "$kernel_has_perf_events_support" = "no"; then
+-	AC_MSG_RESULT([This kernel does not have perf_events support; falling back to legacy oprofile])
++dnl The AX_KERNEL_VERSION macro may return kernel_may_have_perf_events_support="yes",
++dnl indicating a partial answer.  Some architectures do not implement the Performance
++dnl Events Kernel Subsystem even with kernel versions > 2.6.31 -- i.e., not even
++dnl implementing the perf_event_open syscall to return ENOSYS.  So the check below
++dnl will identify and handle such situations.
++
++if test "$kernel_may_have_perf_events_support" = "yes"; then
++	AC_CHECK_HEADER($PERF_EVENT_H,PERF_EVENT_H_EXISTS="yes")
++	AC_MSG_CHECKING([kernel supports perf_events])
++	if test "$PERF_EVENT_H_EXISTS" = "yes"; then
++		rm -f test-for-PERF_EVENT_OPEN
++		AC_LANG_CONFTEST(
++			[AC_LANG_PROGRAM([[#include <linux/perf_event.h>
++				#include <asm/unistd.h>
++				#include <sys/types.h>
++				#include <string.h>
++			]],
++			[[struct perf_event_attr attr;
++				pid_t pid;
++				memset(&attr, 0, sizeof(attr));
++				attr.size = sizeof(attr);
++				attr.sample_type = PERF_SAMPLE_IP;
++				pid = getpid();
++				syscall(__NR_perf_event_open, &attr, pid, 0, -1, 0);
++				]])
++		])
++		$CC conftest.$ac_ext $CFLAGS $LDFLAGS $LIBS $PERF_EVENT_FLAGS -o test-for-PERF_EVENT_OPEN  > /dev/null 2>&1
++		if test -f test-for-PERF_EVENT_OPEN; then
++			kernel_has_perf_events_support="yes"
++			AC_MSG_RESULT(yes)
++		else
++			AC_MSG_RESULT(no)
++			kernel_has_perf_events_support="no"
++		fi
++	else
++		AC_MSG_RESULT(unknown -- perf_event.h not found)
++	fi
+ else
+-	AC_MSG_RESULT([This kernel has perf_events support])
++	AC_MSG_RESULT(kernel supports perf_events... no)
++	kernel_has_perf_events_support="no"
++fi
++AM_CONDITIONAL(BUILD_FOR_PERF_EVENT, test "$kernel_has_perf_events_support" = "yes")
++
++if test "$kernel_has_perf_events_support" = "yes"; then
++	HAVE_PERF_EVENTS='1'
++else
++	HAVE_PERF_EVENTS='0'
++	AC_MSG_RESULT([No perf_events support available; falling back to legacy oprofile])
+ fi
+ 
+-if test "$KERNELDIR" == ""; then
+-	PERF_EVENT_H="/usr/include/linux/perf_event.h"
+-else
+-	PERF_EVENT_H="$KERNELDIR/include/linux/perf_event.h"
+-fi
+-AC_CHECK_HEADER($PERF_EVENT_H,PERF_EVENT_H_EXISTS="yes")
+-AM_CONDITIONAL(BUILD_FOR_PERF_EVENT, test -n "$PERF_EVENT_H_EXISTS")
+-if test "$PERF_EVENT_H_EXISTS" = "yes"; then
+-	HAVE_PERF_EVENTS='1'
+-	if test "$KERNELDIR" != ""; then
+-		PERF_EVENT_FLAGS=" -I$KERNELDIR/include"
+-		AC_SUBST(PERF_EVENT_FLAGS)
+-	fi
+-else
+-	HAVE_PERF_EVENTS='0'
+-fi
+ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf_events exists])
+ AC_CANONICAL_HOST
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+@@ -414,7 +449,7 @@ elif test "`getent passwd oprofile 2>/de
+ 	fi
+ fi
+ 
+-if  test "$PERF_EVENT_H_EXISTS" != "yes" && test "$kernel_has_perf_events_support" = "yes"; then
++if  test "$PERF_EVENT_H_EXISTS" != "yes" && test "$kernel_may_have_perf_events_support" = "yes"; then
+ 	echo "Warning: perf_event.h not found.  Please install the kernel headers package if you"
+ 	echo "         want non-root support built into OProfile."
+ fi
+diff --git a/utils/op_perf_events_checker.c b/utils/op_perf_events_checker.c
+--- a/utils/op_perf_events_checker.c
++++ b/utils/op_perf_events_checker.c
+@@ -49,8 +49,10 @@ int main(int argc, char **argv)
+ 	}
+ 
+ #if HAVE_PERF_EVENTS
+-	/* If perf_events syscall is not implemented, the syscall below will fail
+-	 * with ENOSYS (38).  If implemented, but the processor type on which this
++	/* Even if the perf_event_open syscall is implemented, the architecture may still
++	 * not provide a full implementation of the perf_events subsystem, in which case,
++	 * the syscall below will fail with ENOSYS (38).  If the perf_events subsystem is
++	 * implemented for the architecture, but the processor type on which this
+ 	 * program is running is not supported by perf_events, the syscall returns
+ 	 * ENOENT (2).
+ 	 */
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -8,7 +8,12 @@ OPROFILE_VERSION = 0.9.8
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
-OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
+OPROFILE_CONF_OPT = \
+	--localstatedir=/var \
+	--disable-account-check \
+	--enable-gui=no \
+	--with-kernel=$(STAGING_DIR)/usr
+OPROFILE_AUTORECONF = YES
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
 OPROFILE_BINARIES += utils/op-check-perfevents pe_profiling/operf libabi/opimport
@@ -29,7 +34,16 @@ ifeq ($(OPROFILE_ARCH),)
 OPROFILE_ARCH = $(BR2_ARCH)
 endif
 
-OPROFILE_DEPENDENCIES = popt binutils
+OPROFILE_DEPENDENCIES = popt binutils host-pkgconf
+ifneq ($(BR2_powerpc)$(BR2_PACKAGE_LIBPFM4),) # powerpc OR libpfm4 selected
+OPROFILE_DEPENDENCIES += libpfm4
+endif
+
+define OPROFILE_CREATE_FILES
+	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog
+endef
+
+OPROFILE_POST_PATCH_HOOKS += OPROFILE_CREATE_FILES
 
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
