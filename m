Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B0DC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 20:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17FF60AA0;
	Sun, 21 Jan 2024 20:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17FF60AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBL-HhGf7EaM; Sun, 21 Jan 2024 20:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0132360AA6;
	Sun, 21 Jan 2024 20:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0132360AA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 154721BF37F
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D844146F
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 20:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D844146F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLkPtJtvzD_f for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 20:24:28 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75715413A3
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 20:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75715413A3
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40eac352733so5281075e9.0
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 12:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705868666; x=1706473466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iMrASuaADFeSSxSb5APru0OpE3lx3DqxcyV999NiSkk=;
 b=EdQIPJp4iiW3sX7qDVyVZxrAHRJGrdBXS1ShWk3ZrxIRtD2qCslr4Rp+qXXtnH3Wqv
 eMgRr+l5ipqsuwY/8feNOB044lgUHn+ZRUK4TNhtQw6S5D9Wk2fj03/zzgyqmogzpsq1
 pSNdfnfhtoPO1uXRfjXid+pRXAbLYh+PS3FP3kVhqyNp1x9aNhjL/XyTERA1hvPOJbF+
 dMrMKbbl6BhFbQGsIcClQEZpiQNOYkXs/dMN9xNZOKZQ7XsJJvWSTnxnjaeAGJanxDFp
 3F4i57FCtSCfl594kZkEwXbpFkZPIOjnBNOPNPCNtysEFRETjoI1sjOG9h3KJQgewsbS
 eUxw==
X-Gm-Message-State: AOJu0YxFQcYn8VrKnZmmCO/0XJkDK33AVi0wflVYHmWqujzV1hQIynol
 DQQKpmdMFQwkPuh07z2LcDC4Ok482ObW5UTJUZnbmBbu0UHlu5qUdvBTlEjw
X-Google-Smtp-Source: AGHT+IEDwzPe1sOAzjrA/K7AOn5yH7n+kAchDxiRIiSgQk67sr+ZC801fLaJvQnCLscAJsqxDEmQPQ==
X-Received: by 2002:a05:600c:458a:b0:40e:4e14:45bc with SMTP id
 r10-20020a05600c458a00b0040e4e1445bcmr1944744wmo.13.1705868665420; 
 Sun, 21 Jan 2024 12:24:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b0040e3733a32bsm40168024wmb.41.2024.01.21.12.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 12:24:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 21:24:22 +0100
Message-ID: <20240121202422.1598129-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705868666; x=1706473466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iMrASuaADFeSSxSb5APru0OpE3lx3DqxcyV999NiSkk=;
 b=Uw0D8SrC33y/Wtu/q4IsQC3s58OXnuwyeu1sL1wZ2uZC1c2ao2MlDmlymT+vHzNcfp
 PigSH45WURxXJoHcp4oRPTOwF0i5qLzW1km63Dv7H3/tYWHt5UaX8i02eL4FtLpr6Nhl
 i7RxINSl/k1Rx96sM+pXKa3quxN22XRPuBVJYyUVOqGBUB8CWuvg+U4N7F0FD8+eScKb
 ds2jgHnCac+vqjsMujG4JRpwr4EkKXJuJfZbdKxLp7OKhrkuS5YO6poD0Gu3NYgjaj6p
 KVnO+Q7KESXiNEKKcaNRwQMN/HF15qFsTubuPqwKYnQw5Ryo2hnbGvyrIOHY5w6z/JvO
 EHeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Uw0D8SrC
Subject: [Buildroot] [PATCH 1/1] package/libressl: don't export arc4random
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...02-Fix-a-few-symbols-in-EXTRA_EXPORT.patch | 133 ++++++++++++++++++
 ...x-some-compat-symbols-with-libressl_.patch | 130 +++++++++++++++++
 2 files changed, 263 insertions(+)
 create mode 100644 package/libressl/0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch
 create mode 100644 package/libressl/0003-Prefix-some-compat-symbols-with-libressl_.patch

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
