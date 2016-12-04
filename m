From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 4 Dec 2016 12:20:27 +0100
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.20
Message-ID: <20161204112026.GA30258@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test suite is removed from the package and is already a separate
package in buildroot. All patches are upstream, so remove them.
The UCLIBC_HAS_LFS option is removed upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-linuxthreads-add-back-signal.h.patch      | 28 ---------
 ...ne-madvise-related-macros-for-noMMU-targe.patch | 66 ----------------------
 ...003-posix_madvise-not-available-for-noMMU.patch | 30 ----------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           | 30 +---------
 5 files changed, 2 insertions(+), 154 deletions(-)
 delete mode 100644 package/uclibc/0001-linuxthreads-add-back-signal.h.patch
 delete mode 100644 package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch
 delete mode 100644 package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch

diff --git a/package/uclibc/0001-linuxthreads-add-back-signal.h.patch b/package/uclibc/0001-linuxthreads-add-back-signal.h.patch
deleted file mode 100644
index 1a957c5..0000000
--- a/package/uclibc/0001-linuxthreads-add-back-signal.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 543308f6c46cf2edf8a524bc9c631e472570fe72 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Mon, 24 Oct 2016 05:15:07 +0200
-Subject: [PATCH] linuxthreads: add back signal.h
-
-Somehow this got removed with f1d7505e40654a185843bdc8f1cf1fd00ab55c04.
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libpthread/linuxthreads/sysdeps/pthread/pthread.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libpthread/linuxthreads/sysdeps/pthread/pthread.h b/libpthread/linuxthreads/sysdeps/pthread/pthread.h
-index cf043b5..cc13a52 100644
---- a/libpthread/linuxthreads/sysdeps/pthread/pthread.h
-+++ b/libpthread/linuxthreads/sysdeps/pthread/pthread.h
-@@ -20,6 +20,7 @@
- #include <sched.h>
- #include <time.h>
- 
-+#include <signal.h>
- #include <bits/pthreadtypes.h>
- #include <bits/initspin.h>
- 
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch b/package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch
deleted file mode 100644
index 31e763a..0000000
--- a/package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 2ca4e8dcbd35e5c6da41a195550d741ccb2f7978 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sat, 26 Nov 2016 19:47:41 +0100
-Subject: [PATCH] do not define madvise related macros for noMMU targets
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libc/sysdeps/linux/common/bits/mman-common.h | 41 +++++++++++++++-------------
- 1 file changed, 22 insertions(+), 19 deletions(-)
-
-diff --git a/libc/sysdeps/linux/common/bits/mman-common.h b/libc/sysdeps/linux/common/bits/mman-common.h
-index 6cde5da..5b20da4 100644
---- a/libc/sysdeps/linux/common/bits/mman-common.h
-+++ b/libc/sysdeps/linux/common/bits/mman-common.h
-@@ -83,26 +83,29 @@
- # define MREMAP_FIXED	2
- #endif
- 
-+/* only define for MMU targets, no-MMU does not support madvise.  */
-+#ifdef __ARCH_USE_MMU__
- /* Advice to `madvise'.  */
--#ifdef __USE_BSD
--# define MADV_NORMAL	  0	/* No further special treatment.  */
--# define MADV_RANDOM	  1	/* Expect random page references.  */
--# define MADV_SEQUENTIAL  2	/* Expect sequential page references.  */
--# define MADV_WILLNEED	  3	/* Will need these pages.  */
--# define MADV_DONTNEED	  4	/* Don't need these pages.  */
--# define MADV_REMOVE	  9	/* Remove these pages and resources.  */
--# define MADV_DONTFORK	  10	/* Do not inherit across fork.  */
--# define MADV_DOFORK	  11	/* Do inherit across fork.  */
--# define MADV_MERGEABLE	  12	/* KSM may merge identical pages.  */
--# define MADV_UNMERGEABLE 13	/* KSM may not merge identical pages.  */
--# define MADV_HWPOISON	  100	/* Poison a page for testing.  */
--#endif
-+# ifdef __USE_BSD
-+#  define MADV_NORMAL	  0	/* No further special treatment.  */
-+#  define MADV_RANDOM	  1	/* Expect random page references.  */
-+#  define MADV_SEQUENTIAL 2	/* Expect sequential page references.  */
-+#  define MADV_WILLNEED	  3	/* Will need these pages.  */
-+#  define MADV_DONTNEED	  4	/* Don't need these pages.  */
-+#  define MADV_REMOVE	  9	/* Remove these pages and resources.  */
-+#  define MADV_DONTFORK	  10	/* Do not inherit across fork.  */
-+#  define MADV_DOFORK	  11	/* Do inherit across fork.  */
-+#  define MADV_MERGEABLE  12	/* KSM may merge identical pages.  */
-+#  define MADV_UNMERGEABLE 13	/* KSM may not merge identical pages.  */
-+#  define MADV_HWPOISON	  100	/* Poison a page for testing.  */
-+# endif
- 
- /* The POSIX people had to invent similar names for the same things.  */
--#ifdef __USE_XOPEN2K
--# define POSIX_MADV_NORMAL	0 /* No further special treatment.  */
--# define POSIX_MADV_RANDOM	1 /* Expect random page references.  */
--# define POSIX_MADV_SEQUENTIAL	2 /* Expect sequential page references.  */
--# define POSIX_MADV_WILLNEED	3 /* Will need these pages.  */
--# define POSIX_MADV_DONTNEED	4 /* Don't need these pages.  */
-+# ifdef __USE_XOPEN2K
-+#  define POSIX_MADV_NORMAL	0 /* No further special treatment.  */
-+#  define POSIX_MADV_RANDOM	1 /* Expect random page references.  */
-+#  define POSIX_MADV_SEQUENTIAL	2 /* Expect sequential page references.  */
-+#  define POSIX_MADV_WILLNEED	3 /* Will need these pages.  */
-+#  define POSIX_MADV_DONTNEED	4 /* Don't need these pages.  */
-+# endif
- #endif
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch b/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch
deleted file mode 100644
index 008aac7..0000000
--- a/package/uclibc/0003-posix_madvise-not-available-for-noMMU.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9945c6d21797553e78cbef8034f6dd16b3824df5 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Mon, 28 Nov 2016 07:31:00 +0100
-Subject: [PATCH] posix_madvise not available for noMMU
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libc/sysdeps/linux/common/posix_madvise.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libc/sysdeps/linux/common/posix_madvise.c b/libc/sysdeps/linux/common/posix_madvise.c
-index 2f95bcb..541dabe 100644
---- a/libc/sysdeps/linux/common/posix_madvise.c
-+++ b/libc/sysdeps/linux/common/posix_madvise.c
-@@ -4,6 +4,7 @@
- #include <sys/mman.h>
- #include <sys/syscall.h>
- 
-+#ifdef __ARCH_USE_MMU__
- #if defined __NR_madvise && defined __USE_XOPEN2K && defined __UCLIBC_HAS_ADVANCED_REALTIME__
- int posix_madvise(void *addr, size_t len, int advice)
- {
-@@ -23,3 +24,4 @@ int posix_madvise(void *addr, size_t len, int advice)
- 	return INTERNAL_SYSCALL_ERRNO (result, err);
- }
- #endif
-+#endif
--- 
-2.1.4
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 227c783..9d2a5ec 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  b3f94d67e9afcefb158a37011584e0d41ef3bd55ad72255a26abb25ad49b77a1        uClibc-ng-1.0.19.tar.xz
+sha256  1c817672a65cf9132c98f84e1b8445650de1c18eca258f49c0050b420a25e946        uClibc-ng-1.0.20.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3f383a8..aa67a1e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.19
+UCLIBC_VERSION = 1.0.20
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
@@ -248,14 +248,6 @@ endef
 endif
 
 #
-# Largefile
-#
-
-define UCLIBC_LARGEFILE_CONFIG
-	$(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_LFS,$(@D)/.config)
-endef
-
-#
 # MMU
 #
 
@@ -445,16 +437,6 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
-ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-define UCLIBC_BUILD_TEST_SUITE
-	$(MAKE) -C $(@D) \
-		$(UCLIBC_MAKE_FLAGS) \
-		TEST_INSTALLED_UCLIBC=1 \
-		UCLIBC_ONLY=1 \
-		test_compile test_gen
-endef
-endif
-
 define UCLIBC_BUILD_CMDS
 	$(MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS) headers
 	$(MAKE) -C $(@D) $(UCLIBC_MAKE_FLAGS)
@@ -463,14 +445,6 @@ define UCLIBC_BUILD_CMDS
 		HOSTCC="$(HOSTCC)" hostutils
 endef
 
-ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-define UCLIBC_INSTALL_TEST_SUITE
-	mkdir -p $(TARGET_DIR)/root/uClibc
-	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
-	find $(TARGET_DIR)/root/uClibc -name \*.o -exec rm {} \;
-endef
-endif
-
 ifeq ($(BR2_UCLIBC_INSTALL_UTILS),y)
 define UCLIBC_INSTALL_UTILS_TARGET
 	$(MAKE1) -C $(@D) \
@@ -489,8 +463,6 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
-	$(UCLIBC_BUILD_TEST_SUITE)
-	$(UCLIBC_INSTALL_TEST_SUITE)
 	$(UCLIBC_INSTALL_LDSO_SYMLINKS)
 endef
 
-- 
2.1.4
