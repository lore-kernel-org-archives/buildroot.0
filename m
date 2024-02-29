Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A817C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7DBF41A88;
	Thu, 29 Feb 2024 15:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvsX1za6Slz8; Thu, 29 Feb 2024 15:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A99FD41BED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A99FD41BED;
	Thu, 29 Feb 2024 15:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E952A1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6166418FB
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oO7e00SYnuKw for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF66B418F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF66B418F1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B7787D42; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:09:01 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 29f2034b2c6d2aa1b2060b5198644e637ae604d3
X-Git-Newrev: d6fc939b85cd25dedec544edc050dce75815d4eb
X-Patchwork-Hint: ignore
Message-Id: <20240229153159.97B7787D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libressl: don't
 export arc4random
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6fc939b85cd25dedec544edc050dce75815d4eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Don't export arc4random to fix the following libcurl build failure
raised since bump of libcurl to version 8.5.0 in commit
aaa9438b96f88b1ecbf5eb9a1aebef8010835b8d and
https://github.com/curl/curl/commit/7925ba431b9a099daee1fa21d36c21887f787ad5:

rand.c: In function 'randit':
rand.c:146:26: error: implicit declaration of function 'arc4random'; did you mean 'srandom'? [-Werror=implicit-function-declaration]
  146 |     *rnd = (unsigned int)arc4random();
      |                          ^~~~~~~~~~
      |                          srandom
cc1: some warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/8b7988629f1887be15c97b8c511d25443ba110d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 7f1e3841f5c2da36e1833068ba948c52a58c07ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch   | 133 +++++++++++++++++++++
 ...Prefix-some-compat-symbols-with-libressl_.patch | 130 ++++++++++++++++++++
 2 files changed, 263 insertions(+)

diff --git a/package/libressl/0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch b/package/libressl/0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch
new file mode 100644
index 0000000000..411132ff20
--- /dev/null
+++ b/package/libressl/0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch
@@ -0,0 +1,133 @@
+From c54bd8ba318dec4b4fbf4df1d92acbe2c032f3fd Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Mon, 11 Dec 2023 17:56:33 +0100
+Subject: [PATCH] Fix a few symbols in EXTRA_EXPORT
+
+I thought we stopped doing this, but that's for a separate thread.
+
+Upstream: https://github.com/libressl/portable/commit/c54bd8ba318dec4b4fbf4df1d92acbe2c032f3fd
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ crypto/CMakeLists.txt | 37 +++++++++++++++++++------------------
+ 1 file changed, 19 insertions(+), 18 deletions(-)
+
+diff --git a/crypto/CMakeLists.txt b/crypto/CMakeLists.txt
+index 605647151..8046efe87 100644
+--- a/crypto/CMakeLists.txt
++++ b/crypto/CMakeLists.txt
+@@ -767,13 +767,13 @@ endif()
+ 
+ if(NOT HAVE_ASPRINTF)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/bsd-asprintf.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} asprintf)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} vasprintf)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_asprintf)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_vasprintf)
+ endif()
+ 
+ if(NOT HAVE_FREEZERO)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/freezero.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} freezero)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_freezero)
+ endif()
+ 
+ if(NOT HAVE_GETOPT)
+@@ -799,46 +799,46 @@ endif()
+ 
+ if(NOT HAVE_REALLOCARRAY)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/reallocarray.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} reallocarray)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_reallocarray)
+ endif()
+ 
+ if(NOT HAVE_RECALLOCARRAY)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/recallocarray.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} recallocarray)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_recallocarray)
+ endif()
+ 
+ if(NOT HAVE_STRCASECMP)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strcasecmp.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strcasecmp)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strcasecmp)
+ endif()
+ 
+ if(NOT HAVE_STRLCAT)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strlcat.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strlcat)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strlcat)
+ endif()
+ 
+ if(NOT HAVE_STRLCPY)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strlcpy.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strlcpy)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strlcpy)
+ endif()
+ 
+ if(NOT HAVE_STRNDUP)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strndup.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strndup)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strndup)
+ 	if(NOT HAVE_STRNLEN)
+ 		set(CRYPTO_SRC ${CRYPTO_SRC} compat/strnlen.c)
+-		set(EXTRA_EXPORT ${EXTRA_EXPORT} strnlen)
++		set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strnlen)
+ 	endif()
+ endif()
+ 
+ if(NOT HAVE_STRSEP)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strsep.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strsep)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strsep)
+ endif()
+ 
+ if(NOT HAVE_STRTONUM)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/strtonum.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} strtonum)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_strtonum)
+ endif()
+ 
+ if(NOT HAVE_SYSLOG_R)
+@@ -857,15 +857,15 @@ if(NOT HAVE_EXPLICIT_BZERO)
+ 		set(CRYPTO_SRC ${CRYPTO_SRC} compat/explicit_bzero.c)
+ 		set_source_files_properties(compat/explicit_bzero.c PROPERTIES COMPILE_FLAGS -O0)
+ 	endif()
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} explicit_bzero)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_explicit_bzero)
+ endif()
+ 
+ if(NOT HAVE_ARC4RANDOM_BUF)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/arc4random.c)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/arc4random_uniform.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} arc4random)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} arc4random_buf)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} arc4random_uniform)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_arc4random)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_arc4random_buf)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_arc4random_uniform)
+ 
+ 	if(NOT HAVE_GETENTROPY)
+ 		if(WIN32)
+@@ -891,12 +891,12 @@ endif()
+ 
+ if(NOT HAVE_TIMINGSAFE_BCMP)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/timingsafe_bcmp.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} timingsafe_bcmp)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_timingsafe_bcmp)
+ endif()
+ 
+ if(NOT HAVE_TIMINGSAFE_MEMCMP)
+ 	set(CRYPTO_SRC ${CRYPTO_SRC} compat/timingsafe_memcmp.c)
+-	set(EXTRA_EXPORT ${EXTRA_EXPORT} timingsafe_memcmp)
++	set(EXTRA_EXPORT ${EXTRA_EXPORT} libressl_timingsafe_memcmp)
+ endif()
+ 
+ if(NOT ENABLE_ASM)
+@@ -919,6 +919,7 @@ foreach(SYM IN LISTS CRYPTO_UNEXPORT)
+ 	string(REPLACE "${SYM}\n" "" SYMS ${SYMS})
+ endforeach()
+ file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/crypto_p.sym ${SYMS})
++# XXX should we still be doing this?
+ if(EXTRA_EXPORT)
+ 	list(SORT EXTRA_EXPORT)
+ 	foreach(SYM IN LISTS EXTRA_EXPORT)
diff --git a/package/libressl/0003-Prefix-some-compat-symbols-with-libressl_.patch b/package/libressl/0003-Prefix-some-compat-symbols-with-libressl_.patch
new file mode 100644
index 0000000000..42fbbe9069
--- /dev/null
+++ b/package/libressl/0003-Prefix-some-compat-symbols-with-libressl_.patch
@@ -0,0 +1,130 @@
+From 0a446e81ed77c20aa87563d45ef0ef8f5fa283d8 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 18 Nov 2023 10:53:09 +0100
+Subject: [PATCH] Prefix some compat symbols with libressl_
+
+See #928. This isn't a full fix, but should remove much of the friction
+already.
+
+Upstream: https://github.com/libressl/portable/pull/961/commits/0a446e81ed77c20aa87563d45ef0ef8f5fa283d8
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/compat/stdio.h  |  2 ++
+ include/compat/stdlib.h | 10 ++++++++++
+ include/compat/string.h | 11 +++++++++++
+ 3 files changed, 23 insertions(+)
+
+diff --git a/include/compat/stdio.h b/include/compat/stdio.h
+index d5725c9ac9..4ddd63aee1 100644
+--- a/include/compat/stdio.h
++++ b/include/compat/stdio.h
+@@ -20,7 +20,9 @@
+ 
+ #ifndef HAVE_ASPRINTF
+ #include <stdarg.h>
++#define vasprintf libressl_vasprintf
+ int vasprintf(char **str, const char *fmt, va_list ap);
++#define asprintf libressl_asprintf
+ int asprintf(char **str, const char *fmt, ...);
+ #endif
+ 
+diff --git a/include/compat/stdlib.h b/include/compat/stdlib.h
+index 2eaea244c0..76dc07c35a 100644
+--- a/include/compat/stdlib.h
++++ b/include/compat/stdlib.h
+@@ -20,26 +20,36 @@
+ #include <stdint.h>
+ 
+ #ifndef HAVE_ARC4RANDOM_BUF
++#define arc4random libressl_arc4random
+ uint32_t arc4random(void);
++#define arc4random_buf libressl_arc4random_buf
+ void arc4random_buf(void *_buf, size_t n);
++#define arc4random_uniform libressl_arc4random_uniform
+ uint32_t arc4random_uniform(uint32_t upper_bound);
+ #endif
+ 
+ #ifndef HAVE_FREEZERO
++#define freezero libressl_freezero
+ void freezero(void *ptr, size_t sz);
+ #endif
+ 
+ #ifndef HAVE_GETPROGNAME
++#define getprogname libressl_getprogname
+ const char * getprogname(void);
+ #endif
+ 
++#ifndef HAVE_REALLOCARRAY
++#define reallocarray libressl_reallocarray
+ void *reallocarray(void *, size_t, size_t);
++#endif
+ 
+ #ifndef HAVE_RECALLOCARRAY
++#define recallocarray libressl_recallocarray
+ void *recallocarray(void *, size_t, size_t, size_t);
+ #endif
+ 
+ #ifndef HAVE_STRTONUM
++#define strtonum libressl_strtonum
+ long long strtonum(const char *nptr, long long minval,
+ 		long long maxval, const char **errstr);
+ #endif
+diff --git a/include/compat/string.h b/include/compat/string.h
+index 4bf7519b5b..6a82793f62 100644
+--- a/include/compat/string.h
++++ b/include/compat/string.h
+@@ -27,43 +27,54 @@
+ #endif
+ 
+ #ifndef HAVE_STRCASECMP
++#define strcasecmp libressl_strcasecmp
+ int strcasecmp(const char *s1, const char *s2);
++#define strncasecmp libressl_strncasecmp
+ int strncasecmp(const char *s1, const char *s2, size_t len);
+ #endif
+ 
+ #ifndef HAVE_STRLCPY
++#define strlcpy libressl_strlcpy
+ size_t strlcpy(char *dst, const char *src, size_t siz);
+ #endif
+ 
+ #ifndef HAVE_STRLCAT
++#define strlcat libressl_strlcat
+ size_t strlcat(char *dst, const char *src, size_t siz);
+ #endif
+ 
+ #ifndef HAVE_STRNDUP
++#define strndup libressl_strndup
+ char * strndup(const char *str, size_t maxlen);
+ /* the only user of strnlen is strndup, so only build it if needed */
+ #ifndef HAVE_STRNLEN
++#define strnlen libressl_strnlen
+ size_t strnlen(const char *str, size_t maxlen);
+ #endif
+ #endif
+ 
+ #ifndef HAVE_STRSEP
++#define strsep libressl_strsep
+ char *strsep(char **stringp, const char *delim);
+ #endif
+ 
+ #ifndef HAVE_EXPLICIT_BZERO
++#define explicit_bzero libressl_explicit_bzero
+ void explicit_bzero(void *, size_t);
+ #endif
+ 
+ #ifndef HAVE_TIMINGSAFE_BCMP
++#define timingsafe_bcmp libressl_timingsafe_bcmp
+ int timingsafe_bcmp(const void *b1, const void *b2, size_t n);
+ #endif
+ 
+ #ifndef HAVE_TIMINGSAFE_MEMCMP
++#define timingsafe_memcmp libressl_timingsafe_memcmp
+ int timingsafe_memcmp(const void *b1, const void *b2, size_t len);
+ #endif
+ 
+ #ifndef HAVE_MEMMEM
++#define memmem libressl_memmem
+ void * memmem(const void *big, size_t big_len, const void *little,
+ 	size_t little_len);
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
