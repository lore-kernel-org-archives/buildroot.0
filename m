From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 22:30:50 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191114200219.1568-1-petr.vorel@gmail.com>
References: <20191114200219.1568-1-petr.vorel@gmail.com>
Message-ID: <20191114213050.GF26360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-11-14 21:02 +0100, Petr Vorel spake thusly:
> Backported 3 fixes from upstream (2 of them require calling autoreconf.
> 
> Fixes: http://autobuild.buildroot.net/results/7a29e3b767e3d23dd64c130daa735ca6c062baf8

Sorry, but that does not seem to be enough to properly fix the build
above. I got this when testing locally:

In file included from fanotify13.c:28:
fanotify13.c: In function ?setup_marks?:
fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
 # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
                                         ^~~~~
fanotify13.c:133:7: note: in expansion of macro ?FSID_VAL_MEMBER?
      !FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
       ^~~~~~~~~~~~~~~
fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
 # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
                                         ^~~~~
fanotify13.c:134:7: note: in expansion of macro ?FSID_VAL_MEMBER?
      !FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
       ^~~~~~~~~~~~~~~

If you look carefully, I have the exact inverse problem as reported in
one of the patches, below: confusion between 'val' and '__val'...

Regards,
Yann E. MORIN.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> changes v1->v2
> fixed patch format (spaces problems leaded to rejected patch).
> 
> tested:
> $ ./utils/test-pkg -p -a
> 			 andes-nds32 [ 1/44]: OK
> 			 arm-aarch64 [ 2/44]: OK
> 		br-aarch64-glibc [ 3/44]: OK
> 		   br-arcle-hs38 [ 4/44]: OK
> 			br-arm-basic [ 5/44]: OK
>   br-arm-cortex-a9-glibc [ 6/44]: OK
>    br-arm-cortex-a9-musl [ 7/44]: OK
>    br-arm-cortex-m4-full [ 8/44]: SKIPPED
> 			 br-arm-full [ 9/44]: OK
> 	br-arm-full-nothread [10/44]: SKIPPED
> 	  br-arm-full-static [11/44]: FAILED <= static build failure is on my TODO list.
> br-i386-pentium-mmx-musl [12/44]: OK
> ...
> 
> Kind regards,
> Petr
> 
>  ...x-missing-__kernel_fsid_t-definition.patch |  41 -------
>  ...kernel_fsid_t-definition-to-correct-.patch |  62 ++++++++++
>  ...work-checks-for-fallback-definitions.patch |  92 +++++++++++++++
>  ...val-vs.-__val-fanotify_event_info_fi.patch | 109 ++++++++++++++++++
>  package/ltp-testsuite/ltp-testsuite.mk        |   4 +
>  5 files changed, 267 insertions(+), 41 deletions(-)
>  delete mode 100644 package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
>  create mode 100644 package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch
>  create mode 100644 package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch
>  create mode 100644 package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
> 
> diff --git a/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch b/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
> deleted file mode 100644
> index 7450a0af9c..0000000000
> --- a/package/ltp-testsuite/0004-fanotify-Fix-missing-__kernel_fsid_t-definition.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From b8aebc83523691be2b37e87c62099d700b0473c7 Mon Sep 17 00:00:00 2001
> -From: Petr Vorel <petr.vorel@gmail.com>
> -Date: Mon, 14 Oct 2019 15:35:53 +0200
> -Subject: [PATCH] fanotify: Fix missing __kernel_fsid_t definition
> -
> -which is needed for fallback definition when FAN_REPORT_FID is missing.
> -Instead of including <asm/posix_types.h> where it's defined we just
> -define the missing bit.
> -
> -This fixes build error at least on musl.
> -
> -Acked-by: Cyril Hrubis <chrubis@suse.cz>
> -Acked-by: Jan Stancek <jstancek@redhat.com>
> -Suggested-by: Jan Stancek <jstancek@redhat.com>
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> -[Upstream status: b8aebc83523691be2b37e87c62099d700b0473c7]
> ----
> - testcases/kernel/syscalls/fanotify/fanotify.h | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> -index 1c7623d3b..435f100d8 100644
> ---- a/testcases/kernel/syscalls/fanotify/fanotify.h
> -+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> -@@ -126,6 +126,13 @@ struct fanotify_event_info_header {
> - };
> - 
> - #ifdef HAVE_NAME_TO_HANDLE_AT
> -+#ifndef __kernel_fsid_t
> -+typedef struct {
> -+	int	val[2];
> -+} lapi_fsid_t;
> -+#define __kernel_fsid_t lapi_fsid_t
> -+#endif
> -+
> - struct fanotify_event_info_fid {
> - 	struct fanotify_event_info_header hdr;
> - 	__kernel_fsid_t fsid;
> --- 
> -2.23.0
> -
> diff --git a/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch b/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch
> new file mode 100644
> index 0000000000..f3482269fd
> --- /dev/null
> +++ b/package/ltp-testsuite/0004-fanotify-Move-__kernel_fsid_t-definition-to-correct-.patch
> @@ -0,0 +1,62 @@
> +From 399bb8193f0e09f00d83602bda0c175f2e2b0958 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Mon, 4 Nov 2019 22:14:26 +0100
> +Subject: [PATCH 1/3] fanotify: Move __kernel_fsid_t definition to correct
> + place
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This fixes errors:
> +
> +fanotify.h:149:55: error: unknown type name ?__kernel_fsid_t?
> + static inline void fanotify_get_fid(const char *path, __kernel_fsid_t *fsid,
> +                                                       ^~~~~~~~~~~~~~~
> +fanotify13.c:47:2: error: unknown type name ?__kernel_fsid_t?
> +  __kernel_fsid_t fsid;
> +
> +Remove #ifdef HAVE_NAME_TO_HANDLE_AT wrap of __kernel_fsid_t fallback
> +definition to simplify preprocessor checks.
> +
> +Fixes: b8aebc835 ("fanotify: Fix missing __kernel_fsid_t definition")
> +
> +Acked-by: Cyril Hrubis <chrubis@suse.cz>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +[Upstream status: 399bb8193f0e09f00d83602bda0c175f2e2b0958]
> +---
> + testcases/kernel/syscalls/fanotify/fanotify.h | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> +index 1c7623d3b..573ed5f59 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify.h
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> +@@ -116,6 +116,13 @@ struct fanotify_mark_type {
> + 	const char * name;
> + };
> + 
> ++#ifndef __kernel_fsid_t
> ++typedef struct {
> ++	int	val[2];
> ++} lapi_fsid_t;
> ++#define __kernel_fsid_t lapi_fsid_t
> ++#endif /* __kernel_fsid_t */
> ++
> + #ifndef FAN_REPORT_FID
> + #define FAN_REPORT_FID		0x00000200
> + 
> +@@ -131,8 +138,8 @@ struct fanotify_event_info_fid {
> + 	__kernel_fsid_t fsid;
> + 	unsigned char handle[0];
> + };
> +-#endif
> +-#endif
> ++#endif /* HAVE_NAME_TO_HANDLE_AT */
> ++#endif /* ! FAN_REPORT_FID */
> + 
> + #ifdef HAVE_NAME_TO_HANDLE_AT
> + /*
> +-- 
> +2.24.0
> +
> diff --git a/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch b/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch
> new file mode 100644
> index 0000000000..0e3bc216c6
> --- /dev/null
> +++ b/package/ltp-testsuite/0005-fanotify-Rework-checks-for-fallback-definitions.patch
> @@ -0,0 +1,92 @@
> +From bf02784428c1e61e8b227c0e565992bfae36d301 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Tue, 12 Nov 2019 23:18:32 +0100
> +Subject: [PATCH 2/3] fanotify: Rework checks for fallback definitions
> +
> +Add autoconf checks for struct fanotify_event_info_fid
> +and struct fanotify_event_info_header.
> +
> +Instead of detecting via FAN_REPORT_FID or HAVE_NAME_TO_HANDLE_AT.
> +
> +Acked-by: Cyril Hrubis <chrubis@suse.cz>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +[Upstream status: bf02784428c1e61e8b227c0e565992bfae36d301]
> +---
> + configure.ac                                  |  1 +
> + m4/ltp-fanotify.m4                            |  7 +++++++
> + testcases/kernel/syscalls/fanotify/fanotify.h | 14 ++++++++------
> + 3 files changed, 16 insertions(+), 6 deletions(-)
> + create mode 100644 m4/ltp-fanotify.m4
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3785dff63..b762e83c2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -213,6 +213,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
> + LTP_CHECK_CC_WARN_OLDSTYLE
> + LTP_CHECK_CLONE_SUPPORTS_7_ARGS
> + LTP_CHECK_CRYPTO
> ++LTP_CHECK_FANOTIFY
> + LTP_CHECK_FIDEDUPE
> + LTP_CHECK_FORTIFY_SOURCE
> + LTP_CHECK_FTS_H
> +diff --git a/m4/ltp-fanotify.m4 b/m4/ltp-fanotify.m4
> +new file mode 100644
> +index 000000000..e7b77d8a4
> +--- /dev/null
> ++++ b/m4/ltp-fanotify.m4
> +@@ -0,0 +1,7 @@
> ++dnl SPDX-License-Identifier: GPL-2.0-or-later
> ++dnl Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
> ++
> ++AC_DEFUN([LTP_CHECK_FANOTIFY],[
> ++AC_CHECK_TYPES([struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
> ++AC_CHECK_TYPES([struct fanotify_event_info_fid],,,[#include <sys/fanotify.h>])
> ++])
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> +index 573ed5f59..9d2fded13 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify.h
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> +@@ -101,6 +101,10 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
> + #define FAN_OPEN_EXEC_PERM	0x00040000
> + #endif
> + 
> ++#ifndef FAN_REPORT_FID
> ++#define FAN_REPORT_FID		0x00000200
> ++#endif
> ++
> + /*
> +  * FAN_ALL_PERM_EVENTS has been deprecated, so any new permission events
> +  * are not to be added to it. To cover the instance where a new permission
> +@@ -123,23 +127,21 @@ typedef struct {
> + #define __kernel_fsid_t lapi_fsid_t
> + #endif /* __kernel_fsid_t */
> + 
> +-#ifndef FAN_REPORT_FID
> +-#define FAN_REPORT_FID		0x00000200
> +-
> ++#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER
> + struct fanotify_event_info_header {
> + 	uint8_t info_type;
> + 	uint8_t pad;
> + 	uint16_t len;
> + };
> ++#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER */
> + 
> +-#ifdef HAVE_NAME_TO_HANDLE_AT
> ++#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID
> + struct fanotify_event_info_fid {
> + 	struct fanotify_event_info_header hdr;
> + 	__kernel_fsid_t fsid;
> + 	unsigned char handle[0];
> + };
> +-#endif /* HAVE_NAME_TO_HANDLE_AT */
> +-#endif /* ! FAN_REPORT_FID */
> ++#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
> + 
> + #ifdef HAVE_NAME_TO_HANDLE_AT
> + /*
> +-- 
> +2.24.0
> +
> diff --git a/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch b/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
> new file mode 100644
> index 0000000000..c537b3c1b3
> --- /dev/null
> +++ b/package/ltp-testsuite/0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
> @@ -0,0 +1,109 @@
> +From 0498fc0a812e53040a9527f7343089b8b1aa70a7 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <petr.vorel@gmail.com>
> +Date: Wed, 13 Nov 2019 01:26:06 +0100
> +Subject: [PATCH 3/3] fanotify: Detect val vs. __val
> + fanotify_event_info_fid.fsid member
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +via FSID_VAL_MEMBER() macro and autotools detection.
> +
> +This fixes build on musl, which also defines fanotify_event_info_fid,
> +but uses fsid_t type for fsid instead of __kernel_fsid_t.
> +fsid_t type has __val[2] member (unlike val[2] in __kernel_fsid_t).
> +
> +Fixed error:
> +
> +fanotify13.c: In function ?do_test?:
> +fanotify13.c:278:20: error: ?fsid_t? {aka ?struct __fsid_t?} has no member named ?val?; did you mean ?__val??
> +    event_fid->fsid.val[0],
> +		    ^~~
> +../../../../include/tst_test.h:49:53: note: in definition of macro ?tst_res?
> +  tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__)
> +						     ^~~~~~~~~~~
> +fanotify13.c:279:20: error: ?fsid_t? {aka ?struct __fsid_t?} has no member named ?val?; did you mean ?__val??
> +    event_fid->fsid.val[1],
> +
> +Acked-by: Cyril Hrubis <chrubis@suse.cz>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +[Upstream status: 0498fc0a812e53040a9527f7343089b8b1aa70a7]
> +---
> + m4/ltp-fanotify.m4                              | 1 +
> + testcases/kernel/syscalls/fanotify/fanotify.h   | 6 ++++++
> + testcases/kernel/syscalls/fanotify/fanotify13.c | 8 ++++----
> + testcases/kernel/syscalls/fanotify/fanotify15.c | 4 ++--
> + 4 files changed, 13 insertions(+), 6 deletions(-)
> +
> +diff --git a/m4/ltp-fanotify.m4 b/m4/ltp-fanotify.m4
> +index e7b77d8a4..f2e31eb68 100644
> +--- a/m4/ltp-fanotify.m4
> ++++ b/m4/ltp-fanotify.m4
> +@@ -4,4 +4,5 @@ dnl Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
> + AC_DEFUN([LTP_CHECK_FANOTIFY],[
> + AC_CHECK_TYPES([struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
> + AC_CHECK_TYPES([struct fanotify_event_info_fid],,,[#include <sys/fanotify.h>])
> ++AC_CHECK_MEMBERS([struct fanotify_event_info_fid.fsid.__val],,,[#include <sys/fanotify.h>])
> + ])
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> +index 9d2fded13..5370e30bb 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify.h
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> +@@ -143,6 +143,12 @@ struct fanotify_event_info_fid {
> + };
> + #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
> + 
> ++#ifdef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL
> ++# define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
> ++#else
> ++# define FSID_VAL_MEMBER(fsid, i) (fsid.val[i])
> ++#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL */
> ++
> + #ifdef HAVE_NAME_TO_HANDLE_AT
> + /*
> +  * Helper function used to obtain fsid and file_handle for a given path.
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
> +index 030734285..b0d9fb5b6 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
> +@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
> + 					"kernel");
> + 				return 1;
> + 			} else if (errno == ENODEV &&
> +-					!event_set[i].fsid.val[0] &&
> +-					!event_set[i].fsid.val[1]) {
> ++					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
> ++					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
> + 				tst_res(TCONF,
> + 					"FAN_REPORT_FID not supported on "
> + 					"filesystem type %s",
> +@@ -275,8 +275,8 @@ static void do_test(unsigned int number)
> + 			"and name_to_handle_at(2)",
> + 			metadata->mask,
> + 			getpid(),
> +-			event_fid->fsid.val[0],
> +-			event_fid->fsid.val[1],
> ++			FSID_VAL_MEMBER(event_fid->fsid, 0),
> ++			FSID_VAL_MEMBER(event_fid->fsid, 1),
> + 			*(unsigned long *) event_file_handle->f_handle);
> + 	}
> + out:
> +diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
> +index e9e926078..48ed368ae 100644
> +--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
> ++++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
> +@@ -192,8 +192,8 @@ static void do_test(void)
> + 				"fid=%x.%x.%lx values",
> + 				metadata->mask,
> + 				getpid(),
> +-				event_fid->fsid.val[0],
> +-				event_fid->fsid.val[1],
> ++				FSID_VAL_MEMBER(event_fid->fsid, 0),
> ++				FSID_VAL_MEMBER(event_fid->fsid, 1),
> + 				*(unsigned long *)
> + 				event_file_handle->f_handle);
> + 		}
> +-- 
> +2.24.0
> +
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 2ab2cd726e..ce02cc4e98 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -117,4 +117,8 @@ endef
>  LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_LDD
>  endif
>  
> +# 0005-fanotify-Rework-checks-for-fallback-definitions.patch
> +# 0006-fanotify-Detect-val-vs.-__val-fanotify_event_info_fi.patch
> +LTP_TESTSUITE_AUTORECONF = YES
> +
>  $(eval $(autotools-package))
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
