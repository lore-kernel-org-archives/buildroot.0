From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jan 2020 22:46:45 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump to version
 20200120
Message-ID: <20200120214202.6F50183468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f932ca608f4cc65697e9ba01b548d48a8e541a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop all patches. All but
0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch were
backported from this release, this one is not needed any more due
upstream commit f7199c464 ("rpc-tirpc: Remove authdes related tests")

Thus remove also LTP_TESTSUITE_AUTORECONF.

Update also list of unsupported tests on musl (broken rpc-tirpc tests
were fixed in this release).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-disable-tirpc_auth_authdes_-create-tests.patch |  36 ---
 ...clibc-build-caused-by-conflicting-signatu.patch | 135 --------
 ...3-define-_GNU_SOURCE-to-fix-build-on-musl.patch |  27 --
 ...ve-__kernel_fsid_t-definition-to-correct-.patch |  61 ----
 ...fy-Rework-checks-for-fallback-definitions.patch |  91 ------
 ...tect-val-vs.-__val-fanotify_event_info_fi.patch | 108 -------
 .../0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch  |  55 ----
 ...tils-compat_16-Always-include-sys-fsuid.h.patch |  52 ---
 ...v4-acl-Remove-unneeded-malloc-sizeof-FILE.patch |  37 ---
 .../0010-Replace-bzero-with-memset.patch           | 351 ---------------------
 .../0011-Fix-static-linking-with-musl-fts.patch    |  50 ---
 package/ltp-testsuite/ltp-testsuite.hash           |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  18 +-
 13 files changed, 3 insertions(+), 1022 deletions(-)

diff --git a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
deleted file mode 100644
index 6fe2d6e72b..0000000000
--- a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9bbadb7ece1b068465279e7248b3439d443054a6 Mon Sep 17 00:00:00 2001
-From: Erico Nunes <nunes.erico@gmail.com>
-Date: Fri, 30 Sep 2016 17:43:08 +0200
-Subject: [PATCH] rpc-tirpc: disable tirpc_auth_authdes_*create tests
-
-Due to Buildroot patch 0005-Disable-DES-authentification-support.patch on
-libtirpc, this library is built without method authdes_create. Any code
-that uses this library, like the rpc-tirpc testsuite, thus fails to link.
-
-In the context of Buildroot, instead of disabling ltp-testsuite entirely,
-just disable the problematic tests.
-
-Upstream-status: not applicable
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-[Erico: Rebase for ltp 20160920]
-Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
----
- testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-index 45bc8a6..c04a088 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/Makefile
-@@ -19,4 +19,8 @@
- top_srcdir		?= ../../../../../../..
- 
- include	$(top_srcdir)/include/mk/env_pre.mk
-+
-+FILTER_OUT_DIRS += tirpc_auth_authdes_seccreate \
-+		   tirpc_auth_authdes_create
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
--- 
-2.7.4
-
diff --git a/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch b/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch
deleted file mode 100644
index 39c7c5ac5d..0000000000
--- a/package/ltp-testsuite/0002-pkeys-Fix-uclibc-build-caused-by-conflicting-signatu.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 5c3f08d31a4619454ef4db3501dbf2679867ba7f Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Tue, 1 Oct 2019 14:46:22 +0200
-Subject: [PATCH] pkeys: Fix uclibc build caused by conflicting signature
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-uClibc defines pkey_{alloc,free,mprotect} signatures in
-<bits/mman-shared.h>, which is included by <bits/mman-linux.h>. Because
-it does not implement them, our implementation signature conflicts, as
-it uses static. Add 'ltp_' prefix to our helper functions (suggested by Jan).
-
-Fixed build error:
-In file included from pkey01.c:32:0:
-pkey.h:18:19: error: static declaration of ???pkey_mprotect??? follows non-static declaration
- static inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
-                   ^
-In file included from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman-linux.h:115:0,
-                 from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman.h:40,
-                 from /opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/mman.h:41,
-                 from pkey01.c:29:
-/opt/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/mman-shared.h:73:5: note: previous declaration of ???pkey_mprotect??? was here
- int pkey_mprotect (void *__addr, size_t __len, int __prot, int __pkey) __THROW;
-     ^
-In file included from pkey01.c:32:0:
-
-Found with test-pkg tool from Buildroot distribution.
-
-Fixes: 90c2dc89f ("pkey: add test for memory protection keys")
-
-Reported-by: Petr Vorel <petr.vorel@gmail.com>
-Suggested-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-[Upstream status: 5c3f08d31a4619454ef4db3501dbf2679867ba7f]
----
- testcases/kernel/syscalls/pkeys/pkey.h   | 15 ++++++++++-----
- testcases/kernel/syscalls/pkeys/pkey01.c |  8 ++++----
- 2 files changed, 14 insertions(+), 9 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/pkeys/pkey.h b/testcases/kernel/syscalls/pkeys/pkey.h
-index d623244eb..3c1204978 100644
---- a/testcases/kernel/syscalls/pkeys/pkey.h
-+++ b/testcases/kernel/syscalls/pkeys/pkey.h
-@@ -1,6 +1,7 @@
- // SPDX-License-Identifier: GPL-2.0-or-later
- /*
-  * Copyright (c) 2019 Red Hat, Inc.
-+ * Copyright (c) Linux Test Project, 2019
-  */
- 
- #ifndef PKEYS_H
-@@ -15,25 +16,29 @@
- #endif
- 
- #ifndef HAVE_PKEY_MPROTECT
--static inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
-+inline int ltp_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
- {
- 	return tst_syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
- }
- 
--static inline int pkey_alloc(unsigned int flags, unsigned int access_rights)
-+inline int ltp_pkey_alloc(unsigned int flags, unsigned int access_rights)
- {
- 	return tst_syscall(__NR_pkey_alloc, flags, access_rights);
- }
- 
--static inline int pkey_free(int pkey)
-+inline int ltp_pkey_free(int pkey)
- {
- 	return tst_syscall(__NR_pkey_free, pkey);
- }
-+#else
-+#define ltp_pkey_alloc pkey_alloc
-+#define ltp_pkey_free pkey_free
-+#define ltp_pkey_mprotect pkey_mprotect
- #endif /* HAVE_PKEY_MPROTECT */
- 
- static inline void check_pkey_support(void)
- {
--	int pkey = pkey_alloc(0, 0);
-+	int pkey = ltp_pkey_alloc(0, 0);
- 
- 	if (pkey == -1) {
- 		if (errno == ENOSYS)
-@@ -44,7 +49,7 @@ static inline void check_pkey_support(void)
- 			tst_brk(TCONF, "pkeys are not available for test");
- 	}
- 
--	pkey_free(pkey);
-+	ltp_pkey_free(pkey);
- }
- 
- #endif /* PKEYS_H */
-diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c b/testcases/kernel/syscalls/pkeys/pkey01.c
-index b6b7e5cba..fa84e71f3 100644
---- a/testcases/kernel/syscalls/pkeys/pkey01.c
-+++ b/testcases/kernel/syscalls/pkeys/pkey01.c
-@@ -157,12 +157,12 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
- 
- 	buffer = SAFE_MMAP(NULL, size, mpa->prot, mpa->flags, fd, 0);
- 
--	pkey = pkey_alloc(tc->flags, tc->access_rights);
-+	pkey = ltp_pkey_alloc(tc->flags, tc->access_rights);
- 	if (pkey == -1)
- 		tst_brk(TBROK | TERRNO, "pkey_alloc failed");
- 
- 	tst_res(TINFO, "Set %s on (%s) buffer", tc->name, flag_to_str(mpa->flags));
--	if (pkey_mprotect(buffer, size, mpa->prot, pkey) == -1)
-+	if (ltp_pkey_mprotect(buffer, size, mpa->prot, pkey) == -1)
- 		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
- 
- 	pid = SAFE_FORK();
-@@ -189,7 +189,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
-                 tst_res(TFAIL, "Child: %s", tst_strstatus(status));
- 
- 	tst_res(TINFO, "Remove %s from the buffer", tc->name);
--	if (pkey_mprotect(buffer, size, mpa->prot, 0x0) == -1)
-+	if (ltp_pkey_mprotect(buffer, size, mpa->prot, 0x0) == -1)
- 		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
- 
- 	switch (mpa->prot) {
-@@ -211,7 +211,7 @@ static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
- 
- 	SAFE_MUNMAP(buffer, size);
- 
--	if (pkey_free(pkey) == -1)
-+	if (ltp_pkey_free(pkey) == -1)
- 		tst_brk(TBROK | TERRNO, "pkey_free failed");
- }
- 
--- 
-2.23.0
-
diff --git a/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch b/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
deleted file mode 100644
index 6b76926a39..0000000000
--- a/package/ltp-testsuite/0003-setxattr03-define-_GNU_SOURCE-to-fix-build-on-musl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a712a3930d98336f4a0931ae06da691b7fa0ecd7 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 14 Oct 2019 13:02:55 +0200
-Subject: [PATCH] setxattr03: define _GNU_SOURCE to fix build on musl
-
-musl defines loff_t in <fcntl.h> and guard it under _GNU_SOURCE.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: 3d2b9ef91f32a0a1794a8a05b825b18c6f956b0c]
----
- testcases/kernel/syscalls/setxattr/setxattr03.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
-index bb511d5ba..58ee0f880 100644
---- a/testcases/kernel/syscalls/setxattr/setxattr03.c
-+++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
-@@ -13,6 +13,7 @@
-  *    -1 and set errno to EPERM
-  */
-
-+#define _GNU_SOURCE
- #include "config.h"
- #include <sys/ioctl.h>
- #include <sys/types.h>
---
-2.23.0
diff --git a/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch b/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch
deleted file mode 100644
index a3d4d944f0..0000000000
--- a/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 399bb8193f0e09f00d83602bda0c175f2e2b0958 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Mon, 4 Nov 2019 22:14:26 +0100
-Subject: [PATCH 1/3] fanotify: Move __kernel_fsid_t definition to correct
- place
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This fixes errors:
-
-fanotify.h:149:55: error: unknown type name ???__kernel_fsid_t???
- static inline void fanotify_get_fid(const char *path, __kernel_fsid_t *fsid,
-                                                       ^~~~~~~~~~~~~~~
-fanotify13.c:47:2: error: unknown type name ???__kernel_fsid_t???
-  __kernel_fsid_t fsid;
-
-Remove #ifdef HAVE_NAME_TO_HANDLE_AT wrap of __kernel_fsid_t fallback
-definition to simplify preprocessor checks.
-
-Fixes: b8aebc835 ("fanotify: Fix missing __kernel_fsid_t definition")
-
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: 399bb8193f0e09f00d83602bda0c175f2e2b0958]
----
- testcases/kernel/syscalls/fanotify/fanotify.h | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
-index 1c7623d3b..573ed5f59 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify.h
-+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
-@@ -116,6 +116,13 @@ struct fanotify_mark_type {
-	const char * name;
- };
-
-+#ifndef __kernel_fsid_t
-+typedef struct {
-+	int	val[2];
-+} lapi_fsid_t;
-+#define __kernel_fsid_t lapi_fsid_t
-+#endif /* __kernel_fsid_t */
-+
- #ifndef FAN_REPORT_FID
- #define FAN_REPORT_FID		0x00000200
-
-@@ -131,8 +138,8 @@ struct fanotify_event_info_fid {
-	__kernel_fsid_t fsid;
-	unsigned char handle[0];
- };
--#endif
--#endif
-+#endif /* HAVE_NAME_TO_HANDLE_AT */
-+#endif /* ! FAN_REPORT_FID */
-
- #ifdef HAVE_NAME_TO_HANDLE_AT
- /*
---
-2.24.0
diff --git a/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch b/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch
deleted file mode 100644
index 47c56996fa..0000000000
--- a/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From bf02784428c1e61e8b227c0e565992bfae36d301 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Tue, 12 Nov 2019 23:18:32 +0100
-Subject: [PATCH 2/3] fanotify: Rework checks for fallback definitions
-
-Add autoconf checks for struct fanotify_event_info_fid
-and struct fanotify_event_info_header.
-
-Instead of detecting via FAN_REPORT_FID or HAVE_NAME_TO_HANDLE_AT.
-
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: bf02784428c1e61e8b227c0e565992bfae36d301]
----
- configure.ac                                  |  1 +
- m4/ltp-fanotify.m4                            |  7 +++++++
- testcases/kernel/syscalls/fanotify/fanotify.h | 14 ++++++++------
- 3 files changed, 16 insertions(+), 6 deletions(-)
- create mode 100644 m4/ltp-fanotify.m4
-
-diff --git a/configure.ac b/configure.ac
-index 3785dff63..b762e83c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -213,6 +213,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
- LTP_CHECK_CC_WARN_OLDSTYLE
- LTP_CHECK_CLONE_SUPPORTS_7_ARGS
- LTP_CHECK_CRYPTO
-+LTP_CHECK_FANOTIFY
- LTP_CHECK_FIDEDUPE
- LTP_CHECK_FORTIFY_SOURCE
- LTP_CHECK_FTS_H
-diff --git a/m4/ltp-fanotify.m4 b/m4/ltp-fanotify.m4
-new file mode 100644
-index 000000000..e7b77d8a4
---- /dev/null
-+++ b/m4/ltp-fanotify.m4
-@@ -0,0 +1,7 @@
-+dnl SPDX-License-Identifier: GPL-2.0-or-later
-+dnl Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
-+
-+AC_DEFUN([LTP_CHECK_FANOTIFY],[
-+AC_CHECK_TYPES([struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
-+AC_CHECK_TYPES([struct fanotify_event_info_fid],,,[#include <sys/fanotify.h>])
-+])
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
-index 573ed5f59..9d2fded13 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify.h
-+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
-@@ -101,6 +101,10 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
- #define FAN_OPEN_EXEC_PERM	0x00040000
- #endif
-
-+#ifndef FAN_REPORT_FID
-+#define FAN_REPORT_FID		0x00000200
-+#endif
-+
- /*
-  * FAN_ALL_PERM_EVENTS has been deprecated, so any new permission events
-  * are not to be added to it. To cover the instance where a new permission
-@@ -123,23 +127,21 @@ typedef struct {
- #define __kernel_fsid_t lapi_fsid_t
- #endif /* __kernel_fsid_t */
-
--#ifndef FAN_REPORT_FID
--#define FAN_REPORT_FID		0x00000200
--
-+#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER
- struct fanotify_event_info_header {
-	uint8_t info_type;
-	uint8_t pad;
-	uint16_t len;
- };
-+#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER */
-
--#ifdef HAVE_NAME_TO_HANDLE_AT
-+#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID
- struct fanotify_event_info_fid {
-	struct fanotify_event_info_header hdr;
-	__kernel_fsid_t fsid;
-	unsigned char handle[0];
- };
--#endif /* HAVE_NAME_TO_HANDLE_AT */
--#endif /* ! FAN_REPORT_FID */
-+#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
-
- #ifdef HAVE_NAME_TO_HANDLE_AT
- /*
---
-2.24.0
diff --git a/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch b/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
deleted file mode 100644
index 31e605a30a..0000000000
--- a/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 0498fc0a812e53040a9527f7343089b8b1aa70a7 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Wed, 13 Nov 2019 01:26:06 +0100
-Subject: [PATCH 3/3] fanotify: Detect val vs. __val
- fanotify_event_info_fid.fsid member
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-via FSID_VAL_MEMBER() macro and autotools detection.
-
-This fixes build on musl, which also defines fanotify_event_info_fid,
-but uses fsid_t type for fsid instead of __kernel_fsid_t.
-fsid_t type has __val[2] member (unlike val[2] in __kernel_fsid_t).
-
-Fixed error:
-
-fanotify13.c: In function ???do_test???:
-fanotify13.c:278:20: error: ???fsid_t??? {aka ???struct __fsid_t???} has no member named ???val???; did you mean ???__val????
-    event_fid->fsid.val[0],
-		    ^~~
-../../../../include/tst_test.h:49:53: note: in definition of macro ???tst_res???
-  tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__)
-						     ^~~~~~~~~~~
-fanotify13.c:279:20: error: ???fsid_t??? {aka ???struct __fsid_t???} has no member named ???val???; did you mean ???__val????
-    event_fid->fsid.val[1],
-
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: 0498fc0a812e53040a9527f7343089b8b1aa70a7]
----
- m4/ltp-fanotify.m4                              | 1 +
- testcases/kernel/syscalls/fanotify/fanotify.h   | 6 ++++++
- testcases/kernel/syscalls/fanotify/fanotify13.c | 8 ++++----
- testcases/kernel/syscalls/fanotify/fanotify15.c | 4 ++--
- 4 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/m4/ltp-fanotify.m4 b/m4/ltp-fanotify.m4
-index e7b77d8a4..f2e31eb68 100644
---- a/m4/ltp-fanotify.m4
-+++ b/m4/ltp-fanotify.m4
-@@ -4,4 +4,5 @@ dnl Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
- AC_DEFUN([LTP_CHECK_FANOTIFY],[
- AC_CHECK_TYPES([struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
- AC_CHECK_TYPES([struct fanotify_event_info_fid],,,[#include <sys/fanotify.h>])
-+AC_CHECK_MEMBERS([struct fanotify_event_info_fid.fsid.__val],,,[#include <sys/fanotify.h>])
- ])
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
-index 9d2fded13..5370e30bb 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify.h
-+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
-@@ -143,6 +143,12 @@ struct fanotify_event_info_fid {
- };
- #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
-
-+#ifdef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL
-+# define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
-+#else
-+# define FSID_VAL_MEMBER(fsid, i) (fsid.val[i])
-+#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL */
-+
- #ifdef HAVE_NAME_TO_HANDLE_AT
- /*
-  * Helper function used to obtain fsid and file_handle for a given path.
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
-index 030734285..b0d9fb5b6 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify13.c
-+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
-@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
-					"kernel");
-				return 1;
-			} else if (errno == ENODEV &&
--					!event_set[i].fsid.val[0] &&
--					!event_set[i].fsid.val[1]) {
-+					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
-+					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
-				tst_res(TCONF,
-					"FAN_REPORT_FID not supported on "
-					"filesystem type %s",
-@@ -275,8 +275,8 @@ static void do_test(unsigned int number)
-			"and name_to_handle_at(2)",
-			metadata->mask,
-			getpid(),
--			event_fid->fsid.val[0],
--			event_fid->fsid.val[1],
-+			FSID_VAL_MEMBER(event_fid->fsid, 0),
-+			FSID_VAL_MEMBER(event_fid->fsid, 1),
-			*(unsigned long *) event_file_handle->f_handle);
-	}
- out:
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
-index e9e926078..48ed368ae 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify15.c
-+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
-@@ -192,8 +192,8 @@ static void do_test(void)
-				"fid=%x.%x.%lx values",
-				metadata->mask,
-				getpid(),
--				event_fid->fsid.val[0],
--				event_fid->fsid.val[1],
-+				FSID_VAL_MEMBER(event_fid->fsid, 0),
-+				FSID_VAL_MEMBER(event_fid->fsid, 1),
-				*(unsigned long *)
-				event_file_handle->f_handle);
-		}
---
-2.24.0
diff --git a/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch b/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch
deleted file mode 100644
index 2e80c5820f..0000000000
--- a/package/ltp-testsuite/0007-fanotify-Fix-FSID_VAL_MEMBER-usage.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From f37704d6cf69c9616dfd2aee5647b7941aa2bbaa Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sat, 16 Nov 2019 00:14:42 +0100
-Subject: [PATCH] fanotify: Fix FSID_VAL_MEMBER() usage
-
-This basically reverts part of 0498fc0a8.
-
-FSID_VAL_MEMBER() wrapper was meant to be only for struct
-fanotify_event_info_fid, it was used also for struct event_t
-(which has also __kernel_fsid_t fsid, but shouldn't be redefined).
-
-This caused error on recent musl v1.1.23 (with f67b3c17),
-which has struct fanotify_event_info_fid.
-
-Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val
-fanotify_event_info_fid.fsid member")
-
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: f37704d6cf69c9616dfd2aee5647b7941aa2bbaa]
----
- testcases/kernel/syscalls/fanotify/fanotify.h   | 1 +
- testcases/kernel/syscalls/fanotify/fanotify13.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
-index 5370e30bb..9c98aaa1d 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify.h
-+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
-@@ -143,6 +143,7 @@ struct fanotify_event_info_fid {
- };
- #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
- 
-+/* NOTE: only for struct fanotify_event_info_fid */
- #ifdef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL
- # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
- #else
-diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
-index 26212ab62..3d8de6009 100644
---- a/testcases/kernel/syscalls/fanotify/fanotify13.c
-+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
-@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
- 					"kernel");
- 				return 1;
- 			} else if (errno == ENODEV &&
--					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
--					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
-+					!event_set[i].fsid.val[0] &&
-+					!event_set[i].fsid.val[1]) {
- 				tst_res(TCONF,
- 					"FAN_REPORT_FID not supported on "
- 					"filesystem type %s",
--- 
-2.23.0
-
diff --git a/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch b/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch
deleted file mode 100644
index 04d47709e9..0000000000
--- a/package/ltp-testsuite/0008-utils-compat_16-Always-include-sys-fsuid.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 7b614a0c352fdaae883b0409a94c68bf06bfe914 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sun, 17 Nov 2019 11:40:26 +0100
-Subject: [PATCH] utils/compat_16: Always include <sys/fsuid.h>
-
-All major implementations have setfsuid() declaration in <sys/fsuid.h>.
-This fixes build on musl and (probably) on uclibc).
-
-NOTE: maybe we should guard presence of <sys/fsuid.h> with autotools,
-but we're not doing that for other it's uses.
-
-Fixes: 0e7a99b53 ("setfsgid, setfsuid: clean up and 16-bit version
-fixes")
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: 7b614a0c352fdaae883b0409a94c68bf06bfe914]
----
- testcases/kernel/syscalls/utils/compat_16.h     | 2 --
- testcases/kernel/syscalls/utils/compat_tst_16.h | 2 --
- 2 files changed, 4 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/utils/compat_16.h b/testcases/kernel/syscalls/utils/compat_16.h
-index 5b0338d38..75d5d2d28 100644
---- a/testcases/kernel/syscalls/utils/compat_16.h
-+++ b/testcases/kernel/syscalls/utils/compat_16.h
-@@ -24,9 +24,7 @@
- 
- #include <errno.h>
- #include <grp.h>
--#if defined(__GLIBC__) || defined(__ANDROID__)
- #include <sys/fsuid.h>
--#endif
- #include <sys/types.h>
- #include <unistd.h>
- 
-diff --git a/testcases/kernel/syscalls/utils/compat_tst_16.h b/testcases/kernel/syscalls/utils/compat_tst_16.h
-index 3b86ef3e3..09fa8b0d8 100644
---- a/testcases/kernel/syscalls/utils/compat_tst_16.h
-+++ b/testcases/kernel/syscalls/utils/compat_tst_16.h
-@@ -21,9 +21,7 @@
- 
- #include <errno.h>
- #include <grp.h>
--#if defined(__GLIBC__) || defined(__ANDROID__)
- #include <sys/fsuid.h>
--#endif
- #include <sys/types.h>
- #include <unistd.h>
- 
--- 
-2.23.0
-
diff --git a/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch b/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch
deleted file mode 100644
index 045fb814c8..0000000000
--- a/package/ltp-testsuite/0009-nfsv4-acl-Remove-unneeded-malloc-sizeof-FILE.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7eae073fda17a94a36893337b5a5d639024d571c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sun, 17 Nov 2019 12:53:22 +0100
-Subject: [PATCH] nfsv4/acl: Remove unneeded malloc(sizeof(FILE))
-
-FILE incomplete type under musl (comply C11 [1]).
-malloc(sizeof(FILE)) is not needed anyway, thus remove.
-
-This fixes build on musl (at least):
-acl1.c:51:23: error: invalid application of 'sizeof' to incomplete type 'FILE' {aka 'struct _IO_FILE'}
-  fptr = malloc(sizeof(FILE));
-
-Fixes: 618fd23eb ("Initial add of acl testsuite from Bull")
-
-[1] https://www.openwall.com/lists/musl/2019/01/16/1
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: 7eae073fda17a94a36893337b5a5d639024d571c]
----
- testcases/network/nfsv4/acl/acl1.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
-index bdf0180da..aae9484e5 100644
---- a/testcases/network/nfsv4/acl/acl1.c
-+++ b/testcases/network/nfsv4/acl/acl1.c
-@@ -48,7 +48,6 @@ int do_file_op(char *filename)
- 	result = 0;
- 	FILE *fptr;
- 	char str[256] = "./";
--	fptr = malloc(sizeof(FILE));
- 
- 	uid = geteuid();
- 	strcat(str, filename);
--- 
-2.23.0
-
diff --git a/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch b/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch
deleted file mode 100644
index 90e30e293e..0000000000
--- a/package/ltp-testsuite/0010-Replace-bzero-with-memset.patch
+++ /dev/null
@@ -1,351 +0,0 @@
-From cceadfb997513fa71c2ae35fb5e09073175c077f Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sun, 17 Nov 2019 13:52:30 +0100
-Subject: [PATCH] Replace bzero() with memset()
-
-bzero() is deprecated.
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-[Upstream status: cceadfb997513fa71c2ae35fb5e09073175c077f]
----
- lib/tlibio.c                                    |  2 +-
- testcases/kernel/fs/read_all/read_all.c         |  3 ++-
- .../kernel/hotplug/memory_hotplug/memtoy.c      |  2 +-
- .../kernel/syscalls/epoll_ctl/epoll_ctl01.c     |  4 ++--
- .../kernel/syscalls/epoll_wait/epoll_wait01.c   |  3 +--
- .../tirpc_simple_rpc_call/tirpc_rpc_call.c      |  1 +
- .../tirpc_rpc_call_performance.c                |  1 +
- .../tirpc_rpc_call_stress.c                     |  1 +
- .../rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c  |  1 +
- .../tests_pack/tirpc_svc_11/tirpc_svc_11.c      |  1 +
- .../tests_pack/tirpc_svc_3/tirpc_svc_3.c        |  1 +
- .../tests_pack/tirpc_svc_4/tirpc_svc_4.c        |  1 +
- .../tests_pack/tirpc_svc_5/tirpc_svc_5.c        |  1 +
- .../tests_pack/tirpc_svc_6/tirpc_svc_6.c        |  1 +
- .../tests_pack/tirpc_svc_7/tirpc_svc_7.c        |  1 +
- .../tests_pack/tirpc_svc_8/tirpc_svc_8.c        |  1 +
- .../tests_pack/tirpc_svc_9/tirpc_svc_9.c        |  1 +
- utils/sctp/func_tests/test_getname.c            | 17 ++++++++---------
- 18 files changed, 27 insertions(+), 16 deletions(-)
-
-diff --git a/lib/tlibio.c b/lib/tlibio.c
-index 8b30d591d..cc110d1c9 100644
---- a/lib/tlibio.c
-+++ b/lib/tlibio.c
-@@ -105,7 +105,7 @@
- #else
- /* for linux or sgi */
- #include <sys/uio.h>		/* readv(2)/writev(2) */
--#include <string.h>		/* bzero */
-+#include <string.h>
- #endif
- #if defined(__linux__) || defined(__sun) || defined(__hpux) || defined(_AIX)
- #if !defined(UCLINUX) && !defined(__UCLIBC__)
-diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
-index 68fc7d031..47f853223 100644
---- a/testcases/kernel/fs/read_all/read_all.c
-+++ b/testcases/kernel/fs/read_all/read_all.c
-@@ -31,6 +31,7 @@
- #include <lapi/fnmatch.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <dirent.h>
- #include <errno.h>
- #include <unistd.h>
-@@ -287,7 +288,7 @@ static void spawn_workers(void)
- 	int i;
- 	struct worker *wa = workers;
- 
--	bzero(workers, worker_count * sizeof(*workers));
-+	memset(workers, 0, worker_count * sizeof(*workers));
- 
- 	for (i = 0; i < worker_count; i++) {
- 		wa[i].q = queue_init();
-diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
-index 0707a9c8c..8ac9600de 100644
---- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
-+++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
-@@ -367,7 +367,7 @@ void touch_memory(bool rw, unsigned long *memp, size_t memlen)
- void init_glctx(glctx_t * gcp)
- {
- 
--	bzero(gcp, sizeof(glctx_t));
-+	memset(gcp, 0, sizeof(glctx_t));
- 
- 	gcp->pagesize = (size_t) sysconf(_SC_PAGESIZE);
- 
-diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
-index 1f81c3a26..e199ac6ac 100644
---- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
-+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
-@@ -21,7 +21,7 @@
- 
- #include <sys/epoll.h>
- #include <poll.h>
--#include <strings.h>
-+#include <string.h>
- #include <errno.h>
- #include "tst_test.h"
- 
-@@ -88,7 +88,7 @@ static void check_epoll_ctl(int opt, int exp_num)
- 
- 	while (events) {
- 		int events_matched = 0;
--		bzero(res_evs, sizeof(res_evs));
-+		memset(res_evs, 0, sizeof(res_evs));
- 
- 		res = epoll_wait(epfd, res_evs, 2, -1);
- 		if (res <= 0) {
-diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
-index 9c13e2e5c..ad9126aaf 100644
---- a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
-+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
-@@ -14,7 +14,6 @@
- #include <sys/epoll.h>
- #include <poll.h>
- #include <string.h>
--#include <strings.h>
- #include <errno.h>
- 
- #include "tst_test.h"
-@@ -181,7 +180,7 @@ static void verify_epollio(void)
- 	while (events) {
- 		int events_matched = 0;
- 
--		bzero(ret_evs, sizeof(ret_evs));
-+		memset(ret_evs, 0, sizeof(ret_evs));
- 		TEST(epoll_wait(epfd, ret_evs, 2, -1));
- 
- 		if (TST_RET <= 0) {
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
-index 257b108cc..1dc533d0c 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
-@@ -27,6 +27,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <time.h>
- #include <errno.h>
- #include "lapi/rpc.h"
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
-index 357d9d18d..1a609751a 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
-@@ -27,6 +27,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <sys/time.h>
- #include "lapi/rpc.h"
- 
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
-index 56b5ddb57..264e24c45 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
-@@ -27,6 +27,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <time.h>
- #include <errno.h>
- #include "lapi/rpc.h"
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
-index 877db2af9..a2d18cc43 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <rpc/rpc.h>
- #include <utmp.h>
- 
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
-index a93e831d0..121ae97e8 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <netinet/in.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
-index e20b9b4bb..c28f412fc 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include "lapi/rpc.h"
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
-index 02d745c6a..566b6fcf6 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include "lapi/rpc.h"
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
-index 36003cb4f..ebf577717 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
-@@ -27,6 +27,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <netinet/in.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
-index 71a475373..1dd421e1c 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <pthread.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
-index ea141f4ef..559ef7f97 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <sys/socket.h>
- #include <errno.h>
- #include <netinet/in.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
-index 6c1c37bac..fd516e4dd 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <pthread.h>
- #include <sys/socket.h>
- #include <errno.h>
-diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
-index a000ba265..2fd9b4fc9 100644
---- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
-+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
-@@ -26,6 +26,7 @@
- */
- 
- #include <stdio.h>
-+#include <string.h>
- #include <pthread.h>
- #include <sys/socket.h>
- #include <errno.h>
-diff --git a/utils/sctp/func_tests/test_getname.c b/utils/sctp/func_tests/test_getname.c
-index ffc47357c..f7070a34a 100644
---- a/utils/sctp/func_tests/test_getname.c
-+++ b/utils/sctp/func_tests/test_getname.c
-@@ -41,7 +41,6 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <string.h>
--#include <strings.h>
- #include <fcntl.h>
- #include <sys/types.h>
- #include <sys/socket.h>
-@@ -92,7 +91,7 @@ main(int argc, char *argv[])
-         svr_sk = test_socket(pf_class, SOCK_STREAM, IPPROTO_SCTP);
- 	test_bind(svr_sk, &svr_loop.sa, sizeof(svr_loop));
- 
--	bzero(&svr_local_addr, sizeof(svr_local_addr));
-+	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
- 	len = sizeof(svr_local_addr);
- 	/* Verify that getsockname() on an unconnected socket works fine. */
- 	error = getsockname(svr_sk, (struct sockaddr *)&svr_local_addr, &len);
-@@ -101,7 +100,7 @@ main(int argc, char *argv[])
- 
- 	tst_resm(TPASS, "getsockname on an unconnected socket");
- 
--	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
-+	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
- 	len = sizeof(svr_peer_addr);
- 	/* Verify that getpeername() on an unconnected socket fails. */
- 	error = getpeername(svr_sk, (struct sockaddr *)&svr_peer_addr, &len);
-@@ -125,7 +124,7 @@ main(int argc, char *argv[])
- #endif
- 	test_connect(clt_sk, &svr_loop.sa, sizeof(svr_loop));
- 
--	bzero(&clt_local_addr, sizeof(clt_local_addr));
-+	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
- 	len = sizeof(clt_local_addr);
- 	/* Get the client's local address. */
- 	error = getsockname(clt_sk, (struct sockaddr *)&clt_local_addr, &len);
-@@ -135,7 +134,7 @@ main(int argc, char *argv[])
- 
- 	tst_resm(TPASS, "getsockname on a connected client socket");
- 
--	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
-+	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
- 	len = sizeof(clt_peer_addr);
- 	/* Get the client's peer address. */
- 	error = getpeername(clt_sk, (struct sockaddr *)&clt_peer_addr, &len);
-@@ -149,7 +148,7 @@ main(int argc, char *argv[])
- 	len = sizeof(accept_loop);
- 	accept_sk = test_accept(svr_sk, &accept_loop.sa, &len); 
- 
--	bzero(&svr_local_addr, sizeof(svr_local_addr));
-+	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
- 	len = sizeof(svr_local_addr);
- 	/* Get the server's local address. */
- 	error = getsockname(accept_sk, (struct sockaddr *)&svr_local_addr,
-@@ -160,7 +159,7 @@ main(int argc, char *argv[])
- 
- 	tst_resm(TPASS, "getsockname on a connected server socket");
- 
--	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
-+	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
- 	len = sizeof(svr_peer_addr);
- 	/* Get the server's peer address. */
- 	error = getpeername(accept_sk, (struct sockaddr *)&svr_peer_addr,
-@@ -200,7 +199,7 @@ main(int argc, char *argv[])
- #endif
- 	tst_resm(TPASS, "getsockname/getpeername server/client match");
- 
--	bzero(&clt_local_addr, sizeof(clt_local_addr));
-+	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
- 	len = sizeof(clt_local_addr);
- 	/*getsockname():  Bad socket descriptor, EBADF expected error*/
- 	error = getsockname(-1, (struct sockaddr *)&clt_local_addr, &len);
-@@ -235,7 +234,7 @@ main(int argc, char *argv[])
- 
- 	tst_resm(TPASS, "getsockname with invalid buffer - EFAULT");
-  
--	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
-+	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
- 	len = sizeof(clt_peer_addr);
- 	/*getpeername():  Bad socket descriptor, EBADF expected error*/
- 	error = getpeername(-1, (struct sockaddr *)&clt_local_addr, &len);
--- 
-2.23.0
-
diff --git a/package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch b/package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch
deleted file mode 100644
index 161a65ecb0..0000000000
--- a/package/ltp-testsuite/0011-Fix-static-linking-with-musl-fts.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9bf80b5781fc62e0dd821413a6d21f2689ee4ef1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 14 Oct 2019 11:47:49 +0200
-Subject: [PATCH] Fix static linking with musl-fts
-
-Don't append libraries to LDLIBS but prepend them in cpuset_lib/Makefile
-and cpuset/Makefile.inc to allow the user to provide its FTS library
-such as -lfts for musl/uclibc through LDLIBS
-
-This will fix static build of ltp with musl-fts on uclibc
-
-Fixes:
- - http://autobuild.buildroot.org/results/9155326e1ff7c2bb2218122c453872c2fc76f65e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: 22f510de8072c5cacce5b2a4ca2ff97d1a6fa3ca]
----
- testcases/kernel/controllers/cpuset/Makefile.inc        | 2 +-
- testcases/kernel/controllers/cpuset/cpuset_lib/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
-index db6a84305..c03dd77d7 100644
---- a/testcases/kernel/controllers/cpuset/Makefile.inc
-+++ b/testcases/kernel/controllers/cpuset/Makefile.inc
-@@ -41,7 +41,7 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
- 
- LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
- 
--LDLIBS			+= -lcpu_set -lcontrollers -lltp
-+LDLIBS			:= -lcpu_set -lcontrollers -lltp $(LDLIBS)
- 
- INSTALL_TARGETS		?= *.sh
- 
-diff --git a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
-index 322d03cac..069ebc38c 100644
---- a/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
-+++ b/testcases/kernel/controllers/cpuset/cpuset_lib/Makefile
-@@ -25,7 +25,7 @@ top_srcdir 		?= ../../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
--LDLIBS			+= -lm -lcontrollers -lltp
-+LDLIBS			:= -lm -lcontrollers -lltp $(LDLIBS)
- 
- LIB			:= libcpu_set.a
- 
--- 
-2.24.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 4725f7b5b6..777f06ea56 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20190930/ltp-full-20190930.tar.xz.sha1
-sha1 9b58720b33d17d1c635d5d8b5abd9fc6eec07374  ltp-full-20190930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20200120/ltp-full-20200120.tar.xz.sha1
+sha1 8f622383907e2e64e60b69fd305fecb34311d6b6  ltp-full-20200120.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ce02cc4e98..88b2e88293 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20190930
+LTP_TESTSUITE_VERSION = 20200120
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
@@ -86,18 +86,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c \
 	testcases/misc/crash/crash01.c \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcraw_create/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svctcp_create/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_bufcreate/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svcudp_create/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_registerrpc/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_register/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_svc_unregister/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_register/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_regunreg_xprt_unregister/ \
-	testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_auth_authdes_seccreate/ \
 	utils/benchmark/ebizzy-0.3
 endif
 
@@ -117,8 +105,4 @@ endef
 LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
 endif
 
-# 0005-fanotify-Rework-checks-for-fallback-definitions.patch
-# 0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
-LTP_TESTSUITE_AUTORECONF = YES
-
 $(eval $(autotools-package))
