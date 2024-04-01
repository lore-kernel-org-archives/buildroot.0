Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C288ACD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 09:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5714E81E22;
	Mon,  1 Apr 2024 09:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMLkmZKKHWdZ; Mon,  1 Apr 2024 09:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E60881E24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E60881E24;
	Mon,  1 Apr 2024 09:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93D271BF38A
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BFC64059B
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 09:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSJxm0aEbKyC for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA9F740337
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA9F740337
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 926FC844B7; Mon,  1 Apr 2024 09:31:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 10:47:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cd8fea7cfbfb692e3b0938dce8c41d59147ccf0
X-Git-Newrev: d8910b71bc81b47a074f316e3e83735184ff371c
X-Patchwork-Hint: ignore
Message-Id: <20240401093114.926FC844B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add patches to remove
 crypt()/crypt_r() libsanitizer interceptors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8910b71bc81b47a074f316e3e83735184ff371c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation for the upgrade of glibc to version 2.39, we need to
backport some gcc patches. Indeed glibc 2.39 drops libcrypt, causing a
build failure of libsanitizer (part of gcc) as it has code to
intercept crypt() and crypt_r() calls. This has been fixed in gcc
master, but we need to backport the fix for gcc 11.x, 12.x and 13.x.

gcc 8.x doesn't need to be fixed because (1) its libsanitizer does not
have an interceptor for crypt()/crypt_r() and (2) we only allow gcc
8.x for PowerPC SPE, for which we only support uClibc-ng, so this
issue with crypt/crypt_r going away from glibc is not relevant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...008-Remove-crypt-and-crypt_r-interceptors.patch | 140 ++++++++++++++++++++
 ...004-Remove-crypt-and-crypt_r-interceptors.patch | 140 ++++++++++++++++++++
 ...003-Remove-crypt-and-crypt_r-interceptors.patch | 146 +++++++++++++++++++++
 3 files changed, 426 insertions(+)

diff --git a/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
new file mode 100644
index 0000000000..36db9681cd
--- /dev/null
+++ b/package/gcc/11.4.0/0008-Remove-crypt-and-crypt_r-interceptors.patch
@@ -0,0 +1,140 @@
+From 0ef972d11dda9051941656e5797889b8fbf2dca6 Mon Sep 17 00:00:00 2001
+From: Fangrui Song <i@maskray.me>
+Date: Fri, 28 Apr 2023 09:59:17 -0700
+Subject: [PATCH] Remove crypt and crypt_r interceptors
+
+From Florian Weimer's D144073
+
+> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
+>
+> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
+
+Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
+newer glibc.
+
+For older glibc, msan will not know that an uninstrumented crypt_r call
+initializes `data`, so there is a risk for false positives. However, with some
+codebase survey, I think crypt_r uses are very few and the call sites typically
+have a `memset(&data, 0, sizeof(data));` anyway.
+
+Fix https://github.com/google/sanitizers/issues/1365
+Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
+
+Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
+
+Differential Revision: https://reviews.llvm.org/D149403
+
+[Thomas: taken from Crosstool-NG]
+Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
+Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors.inc         | 37 -------------------
+ .../sanitizer_platform_interceptors.h         |  2 -
+ .../sanitizer_platform_limits_posix.cpp       |  2 -
+ .../sanitizer_platform_limits_posix.h         |  1 -
+ 4 files changed, 42 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+index ff2acfc7c010..6d802bc7159f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+@@ -9814,41 +9814,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
+ #define INIT_GETRANDOM
+ #endif
+ 
+-#if SANITIZER_INTERCEPT_CRYPT
+-INTERCEPTOR(char *, crypt, char *key, char *salt) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt)(key, salt);
+-  if (res != nullptr)
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  return res;
+-}
+-#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
+-#else
+-#define INIT_CRYPT
+-#endif
+-
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt_r)(key, salt, data);
+-  if (res != nullptr) {
+-    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
+-                                   __sanitizer::struct_crypt_data_sz);
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  }
+-  return res;
+-}
+-#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
+-#else
+-#define INIT_CRYPT_R
+-#endif
+-
+ #if SANITIZER_INTERCEPT_GETENTROPY
+ INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
+   void *ctx;
+@@ -10337,8 +10302,6 @@ static void InitializeCommonInterceptors() {
+   INIT_GETUSERSHELL;
+   INIT_SL_INIT;
+   INIT_GETRANDOM;
+-  INIT_CRYPT;
+-  INIT_CRYPT_R;
+   INIT_GETENTROPY;
+   INIT_QSORT;
+   INIT_QSORT_R;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+index 18bab346ce6e..cf329b76836e 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+@@ -572,8 +572,6 @@
+ #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
+ #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
+ #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
+-#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
+-#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
+ 
+ #define SANITIZER_INTERCEPT_GETRANDOM \
+   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index 5743516c0460..980776fc7d78 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -142,7 +142,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ #include <linux/serial.h>
+ #include <sys/msg.h>
+ #include <sys/ipc.h>
+-#include <crypt.h>
+ #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ #if SANITIZER_ANDROID
+@@ -244,7 +243,6 @@ namespace __sanitizer {
+   unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
+   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
+   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
+-  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
+ #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index 83861105a509..7ad11b943157 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -295,7 +295,6 @@ extern unsigned struct_msqid_ds_sz;
+ extern unsigned struct_mq_attr_sz;
+ extern unsigned struct_timex_sz;
+ extern unsigned struct_statvfs_sz;
+-extern unsigned struct_crypt_data_sz;
+ #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ struct __sanitizer_iovec {
+-- 
+2.43.0
+
diff --git a/package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
new file mode 100644
index 0000000000..de3c27c8c7
--- /dev/null
+++ b/package/gcc/12.3.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
@@ -0,0 +1,140 @@
+From bf61483b6a5e32cb397f97a1cd4af2a41d46ade3 Mon Sep 17 00:00:00 2001
+From: Fangrui Song <i@maskray.me>
+Date: Fri, 28 Apr 2023 09:59:17 -0700
+Subject: [PATCH] Remove crypt and crypt_r interceptors
+
+From Florian Weimer's D144073
+
+> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
+>
+> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
+
+Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
+newer glibc.
+
+For older glibc, msan will not know that an uninstrumented crypt_r call
+initializes `data`, so there is a risk for false positives. However, with some
+codebase survey, I think crypt_r uses are very few and the call sites typically
+have a `memset(&data, 0, sizeof(data));` anyway.
+
+Fix https://github.com/google/sanitizers/issues/1365
+Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
+
+Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
+
+Differential Revision: https://reviews.llvm.org/D149403
+
+[Thomas: taken from Crosstool-NG]
+Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
+Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors.inc         | 37 -------------------
+ .../sanitizer_platform_interceptors.h         |  2 -
+ .../sanitizer_platform_limits_posix.cpp       |  2 -
+ .../sanitizer_platform_limits_posix.h         |  1 -
+ 4 files changed, 42 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+index abb38ccfa15d..61250226aa56 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+@@ -9977,41 +9977,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
+ #define INIT_GETRANDOM
+ #endif
+ 
+-#if SANITIZER_INTERCEPT_CRYPT
+-INTERCEPTOR(char *, crypt, char *key, char *salt) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt)(key, salt);
+-  if (res != nullptr)
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  return res;
+-}
+-#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
+-#else
+-#define INIT_CRYPT
+-#endif
+-
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt_r)(key, salt, data);
+-  if (res != nullptr) {
+-    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
+-                                   __sanitizer::struct_crypt_data_sz);
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  }
+-  return res;
+-}
+-#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
+-#else
+-#define INIT_CRYPT_R
+-#endif
+-
+ #if SANITIZER_INTERCEPT_GETENTROPY
+ INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
+   void *ctx;
+@@ -10521,8 +10486,6 @@ static void InitializeCommonInterceptors() {
+   INIT_GETUSERSHELL;
+   INIT_SL_INIT;
+   INIT_GETRANDOM;
+-  INIT_CRYPT;
+-  INIT_CRYPT_R;
+   INIT_GETENTROPY;
+   INIT_QSORT;
+   INIT_QSORT_R;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+index 14610f2df78d..787db66ae2b7 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+@@ -568,8 +568,6 @@
+ #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
+ #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
+ #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
+-#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
+-#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
+ 
+ #define SANITIZER_INTERCEPT_GETRANDOM \
+   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c335f33dda58..bfdccd5df078 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -154,7 +154,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ #include <linux/serial.h>
+ #include <sys/msg.h>
+ #include <sys/ipc.h>
+-#include <crypt.h>
+ #endif  // SANITIZER_ANDROID
+ 
+ #include <link.h>
+@@ -254,7 +253,6 @@ namespace __sanitizer {
+   unsigned struct_ustat_sz = SIZEOF_STRUCT_USTAT;
+   unsigned struct_rlimit64_sz = sizeof(struct rlimit64);
+   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
+-  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
+ #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index da53b5abef27..2605bb849a78 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -298,7 +298,6 @@ extern unsigned struct_msqid_ds_sz;
+ extern unsigned struct_mq_attr_sz;
+ extern unsigned struct_timex_sz;
+ extern unsigned struct_statvfs_sz;
+-extern unsigned struct_crypt_data_sz;
+ #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ struct __sanitizer_iovec {
+-- 
+2.43.0
+
diff --git a/package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
new file mode 100644
index 0000000000..98bfed5949
--- /dev/null
+++ b/package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
@@ -0,0 +1,146 @@
+From 3521d93c552a11640a959ee61d551c225981c448 Mon Sep 17 00:00:00 2001
+From: Fangrui Song <i@maskray.me>
+Date: Fri, 28 Apr 2023 09:59:17 -0700
+Subject: [PATCH] Remove crypt and crypt_r interceptors
+
+From Florian Weimer's D144073
+
+> On GNU/Linux (glibc), the crypt and crypt_r functions are not part of the main shared object (libc.so.6), but libcrypt (with multiple possible sonames). The sanitizer libraries do not depend on libcrypt, so it can happen that during sanitizer library initialization, no real implementation will be found because the crypt, crypt_r functions are not present in the process image (yet). If its interceptors are called nevertheless, this results in a call through a null pointer when the sanitizer library attempts to forward the call to the real implementation.
+>
+> Many distributions have already switched to libxcrypt, a library that is separate from glibc and that can be build with sanitizers directly (avoiding the need for interceptors). This patch disables building the interceptor for glibc targets.
+
+Let's remove crypt and crypt_r interceptors (D68431) to fix issues with
+newer glibc.
+
+For older glibc, msan will not know that an uninstrumented crypt_r call
+initializes `data`, so there is a risk for false positives. However, with some
+codebase survey, I think crypt_r uses are very few and the call sites typically
+have a `memset(&data, 0, sizeof(data));` anyway.
+
+Fix https://github.com/google/sanitizers/issues/1365
+Related: https://bugzilla.redhat.com/show_bug.cgi?id=2169432
+
+Reviewed By: #sanitizers, fweimer, thesamesam, vitalybuka
+
+Differential Revision: https://reviews.llvm.org/D149403
+
+[Thomas: taken from Crosstool-NG]
+Upstream: (llvm) https://github.com/llvm/llvm-project/commit/d7bead833631486e337e541e692d9b4a1ca14edd
+Upstream: (gcc)  https://github.com/gcc-mirror/gcc/commit/d96e14ceb9475f9bccbbc0325d5b11419fad9246
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../sanitizer_common_interceptors.inc         | 37 -------------------
+ .../sanitizer_platform_interceptors.h         |  2 -
+ .../sanitizer_platform_limits_posix.cpp       |  8 ----
+ .../sanitizer_platform_limits_posix.h         |  1 -
+ 4 files changed, 48 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+index ba4b80081f0..662c4199742 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc
+@@ -10187,41 +10187,6 @@ INTERCEPTOR(SSIZE_T, getrandom, void *buf, SIZE_T buflen, unsigned int flags) {
+ #define INIT_GETRANDOM
+ #endif
+ 
+-#if SANITIZER_INTERCEPT_CRYPT
+-INTERCEPTOR(char *, crypt, char *key, char *salt) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt, key, salt);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt)(key, salt);
+-  if (res != nullptr)
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  return res;
+-}
+-#define INIT_CRYPT COMMON_INTERCEPT_FUNCTION(crypt);
+-#else
+-#define INIT_CRYPT
+-#endif
+-
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-INTERCEPTOR(char *, crypt_r, char *key, char *salt, void *data) {
+-  void *ctx;
+-  COMMON_INTERCEPTOR_ENTER(ctx, crypt_r, key, salt, data);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, key, internal_strlen(key) + 1);
+-  COMMON_INTERCEPTOR_READ_RANGE(ctx, salt, internal_strlen(salt) + 1);
+-  char *res = REAL(crypt_r)(key, salt, data);
+-  if (res != nullptr) {
+-    COMMON_INTERCEPTOR_WRITE_RANGE(ctx, data,
+-                                   __sanitizer::struct_crypt_data_sz);
+-    COMMON_INTERCEPTOR_INITIALIZE_RANGE(res, internal_strlen(res) + 1);
+-  }
+-  return res;
+-}
+-#define INIT_CRYPT_R COMMON_INTERCEPT_FUNCTION(crypt_r);
+-#else
+-#define INIT_CRYPT_R
+-#endif
+-
+ #if SANITIZER_INTERCEPT_GETENTROPY
+ INTERCEPTOR(int, getentropy, void *buf, SIZE_T buflen) {
+   void *ctx;
+@@ -10772,8 +10737,6 @@ static void InitializeCommonInterceptors() {
+   INIT_GETUSERSHELL;
+   INIT_SL_INIT;
+   INIT_GETRANDOM;
+-  INIT_CRYPT;
+-  INIT_CRYPT_R;
+   INIT_GETENTROPY;
+   INIT_QSORT;
+   INIT_QSORT_R;
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+index 8307b1ec28b..d50166ee6ce 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_interceptors.h
+@@ -571,8 +571,6 @@
+ #define SANITIZER_INTERCEPT_FDEVNAME SI_FREEBSD
+ #define SANITIZER_INTERCEPT_GETUSERSHELL (SI_POSIX && !SI_ANDROID)
+ #define SANITIZER_INTERCEPT_SL_INIT (SI_FREEBSD || SI_NETBSD)
+-#define SANITIZER_INTERCEPT_CRYPT (SI_POSIX && !SI_ANDROID)
+-#define SANITIZER_INTERCEPT_CRYPT_R (SI_LINUX && !SI_ANDROID)
+ 
+ #define SANITIZER_INTERCEPT_GETRANDOM \
+   ((SI_LINUX && __GLIBC_PREREQ(2, 25)) || SI_FREEBSD)
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c85cf1626a7..bcbd143d19d 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -176,10 +176,6 @@ typedef struct user_fpregs elf_fpregset_t;
+ #  include "sanitizer_platform_interceptors.h"
+ #  include "sanitizer_platform_limits_posix.h"
+ 
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-#include <crypt.h>
+-#endif
+-
+ namespace __sanitizer {
+   unsigned struct_utsname_sz = sizeof(struct utsname);
+   unsigned struct_stat_sz = sizeof(struct stat);
+@@ -283,10 +279,6 @@ namespace __sanitizer {
+   unsigned struct_statvfs64_sz = sizeof(struct statvfs64);
+ #endif // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+-#if SANITIZER_INTERCEPT_CRYPT_R
+-  unsigned struct_crypt_data_sz = sizeof(struct crypt_data);
+-#endif
+-
+ #if SANITIZER_LINUX && !SANITIZER_ANDROID
+   unsigned struct_timex_sz = sizeof(struct timex);
+   unsigned struct_msqid_ds_sz = sizeof(struct msqid_ds);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index 44dd3d9e22d..29ebb304a9b 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -319,7 +319,6 @@ extern unsigned struct_msqid_ds_sz;
+ extern unsigned struct_mq_attr_sz;
+ extern unsigned struct_timex_sz;
+ extern unsigned struct_statvfs_sz;
+-extern unsigned struct_crypt_data_sz;
+ #endif  // SANITIZER_LINUX && !SANITIZER_ANDROID
+ 
+ struct __sanitizer_iovec {
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
