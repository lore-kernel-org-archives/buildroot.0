Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811EC35FFC
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 10:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524FD60AD9;
	Tue, 25 Mar 2025 10:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If9YvY0pU9DK; Tue, 25 Mar 2025 10:16:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C42D60B6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C42D60B6B;
	Tue, 25 Mar 2025 10:16:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAA31E0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76D24068B
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOYaw-3Ys1S4 for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 10:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 807E74064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807E74064F
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 807E74064F
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 10:16:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so326793f8f.3
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742897808; x=1743502608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aAtDqG5EbVtfu23/0xJvBn/lNPMbyqK4ExRprJ+2wu8=;
 b=HQmFI5YXOy1pPwQpStri5mnTdErBOEYZ8jp75axCUNI85y1OW6z9njeKyG/uTdpZNf
 DaZ4CFmNF6RPuK/VvMXISKqOwgeQrPp2QSfk/UY/3hB6coCCrY54iITPCIV5Xss7iwpm
 J4VIH/81PKdIeZuQqBZlRKO1bdi4qvsnEw1WBi+xpswzph6hpNie2Cmd+129uIxAYgGH
 xXRNck4pDqOft7a3iAFhE8FAJJ7J9V3+Vm0vHCA7EH21XWKAZ9Lj9YIku5RtnQh6Xj6n
 HfYMWzoOAyjyGysb5s/YXqOlgcsptnHIHPZO3XBSfG3Kl6wnH8Eu/8FjeCVrgZ/Pm/KZ
 uwpA==
X-Gm-Message-State: AOJu0YxfK5LBP/no5/uUY91LKAv0+o5s0dXtEyQ1wLGWYWOkGB/osM80
 N8Yqhx7qlL2GGD1ZQtieHIa6xpnlftRu7dxsoRhKnNB/5fN+F6vbtQ0uo0Jh
X-Gm-Gg: ASbGncvgdWblEnhbqXnUly+Bu5neL7TyEm1Ca5bGD6TKEDsKBB6AhjSZAGlcP8674WM
 YQ9FQ07W+fW26OKivMfZWtMvcGP1lzO/Z1ofmBEReTjpRb9oAIMKlzjh66Mlug22/P3vg8tGk70
 mHHdLLkiEIL0VrCNwPWWEle4KEqIkbISj1OJKrrNvofE1OQ+OT8nQKGkkAgfCbpoSsXqFaO885d
 2qIdmnD8F0ryim+5ZI4ifK31/xHFyWbPx8tzNAW7TUKasLdz4J2BO7T7ftlUplyTBH7tWwDROuM
 MANsCk+aSX/sPgQcN923YJjw2UEPV79vTjVGOV/E5bWi3FkL6n6JwmnHr+dX+VocPYOdy01GPvD
 ZR6vU2y1fHjwd5YVTGHqQzA==
X-Google-Smtp-Source: AGHT+IGS+TU/sG/XyzOlyzBbDimC5FN41gI1CEk/EmlyONjukyzrs5z9K1CYBgPZFZYcwUw0pOCQOw==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id
 ffacd0b85a97d-3997f8f9d54mr12525969f8f.4.1742897807957; 
 Tue, 25 Mar 2025 03:16:47 -0700 (PDT)
Received: from thomas-Precision-7670.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3c7fsm13518390f8f.34.2025.03.25.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 03:16:47 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 25 Mar 2025 11:16:45 +0100
Message-ID: <20250325101646.920286-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/util-linux: bump to 2.41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

News: https://lore.kernel.org/util-linux/2cifsg7vkdiivfsmmximhbzybrsopn7zfqgwz2f6hyflh35pjr@ecyicq2cbsro/

- Dropped patches which are all upstream.
- Synced all license files.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 ---------
 .../0002-c.h-consolidate-THREAD_LOCAL.patch   | 65 ---------------
 ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 -----------
 .../0004-meson-add-HAVE_LIBPTHREAD.patch      | 27 ------
 ...non-cached-scenarios-when-lpthread-i.patch | 82 -------------------
 package/util-linux/util-linux.hash            | 10 ++-
 package/util-linux/util-linux.mk              |  8 +-
 7 files changed, 13 insertions(+), 265 deletions(-)
 delete mode 100644 package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
 delete mode 100644 package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
 delete mode 100644 package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
 delete mode 100644 package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
 delete mode 100644 package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch

diff --git a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
deleted file mode 100644
index 12dd119ef3..0000000000
--- a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 May 2024 18:22:11 +0200
-Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng < 1.0.39
-
-Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
-https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
-raised since version 2.39 and
-https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:
-
-sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
-  106 |     X(PER_LINUX32_3GB) \
-      |       ^~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/util-linux/util-linux/commit/4647fc6afbf7e99c49531600425df60f1243fcd2
----
- sys-utils/setarch.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
-index 227bc6b5de..4bcb5e69e6 100644
---- a/sys-utils/setarch.c
-+++ b/sys-utils/setarch.c
-@@ -89,6 +89,11 @@
- # define PER_LINUX_FDPIC	(PER_LINUX | FDPIC_FUNCPTRS)
- #endif
- 
-+/* fallback for old uclibc-headers < 1.0.39 */
-+#ifndef PER_LINUX32_3GB
-+# define PER_LINUX32_3GB	(PER_LINUX32 | ADDR_LIMIT_3GB)
-+#endif
-+
- #define ALL_PERSONALITIES \
-     X(PER_LINUX) \
-     X(PER_LINUX_32BIT) \
diff --git a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
deleted file mode 100644
index bb1a63ecc2..0000000000
--- a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 7b3db914fa9073c667ea482c8b6b4e07fe6202cc Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 13:40:23 +0100
-Subject: [PATCH] c.h: consolidate THREAD_LOCAL.
-
-Let's define this macro in one place only.
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- include/c.h            | 9 +++++++++
- lib/randutils.c        | 5 -----
- libuuid/src/gen_uuid.c | 1 -
- 3 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/include/c.h b/include/c.h
-index 61b95ab2d..848c48536 100644
---- a/include/c.h
-+++ b/include/c.h
-@@ -595,4 +595,13 @@ static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
- }
- #endif
- 
-+/*
-+ * thread-local storage
-+ */
-+#ifdef HAVE_TLS
-+# define THREAD_LOCAL static __thread
-+#else
-+# define THREAD_LOCAL static
-+#endif
-+
- #endif /* UTIL_LINUX_C_H */
-diff --git a/lib/randutils.c b/lib/randutils.c
-index 15c2f7834..4c806e682 100644
---- a/lib/randutils.c
-+++ b/lib/randutils.c
-@@ -20,11 +20,6 @@
- #include "randutils.h"
- #include "nls.h"
- 
--#ifdef HAVE_TLS
--#define THREAD_LOCAL static __thread
--#else
--#define THREAD_LOCAL static
--#endif
- 
- #ifdef HAVE_GETRANDOM
- # include <sys/random.h>
-diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
-index 3b76ddc9a..69712267f 100644
---- a/libuuid/src/gen_uuid.c
-+++ b/libuuid/src/gen_uuid.c
-@@ -92,7 +92,6 @@
- #include "md5.h"
- #include "sha1.h"
- 
--#define THREAD_LOCAL static __thread
- 
- #ifdef _WIN32
- static void gettimeofday (struct timeval *tv, void *dummy)
--- 
-2.48.1
-
diff --git a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch b/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
deleted file mode 100644
index 843253a56a..0000000000
--- a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0735eb8bc0ed4bc9820ea7e4e600fed246457b18 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:01:38 +0100
-Subject: [PATCH] autotools: define HAVE_LIBPTHREAD and PTHREAD_LIBS
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- configure.ac              | 7 +++++++
- libuuid/src/Makemodule.am | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 82d0e4bf9..9a7f260c5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -738,6 +738,13 @@ AS_IF([test x"$have_timer" = xno], [
- ])
- 
- 
-+AC_CHECK_LIB([pthread], [pthread_atfork], [
-+	PTHREAD_LIBS="-lpthread"
-+	AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libpthred exist])
-+])
-+AC_SUBST([PTHREAD_LIBS])
-+
-+
- AC_CHECK_LIB([rtas], [rtas_get_sysparm], [
- 	RTAS_LIBS="-lrtas"
- 	AC_DEFINE([HAVE_LIBRTAS], [1], [Define if librtas exists])
-diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
-index 867ad7be5..58b64fe9b 100644
---- a/libuuid/src/Makemodule.am
-+++ b/libuuid/src/Makemodule.am
-@@ -31,7 +31,7 @@ libuuid_la_SOURCES = \
- EXTRA_libuuid_la_DEPENDENCIES = \
- 	libuuid/src/libuuid.sym
- 
--libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) -lpthread
-+libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) $(PTHREAD_LIBS)
- 
- libuuid_la_CFLAGS = \
- 	$(AM_CFLAGS) \
--- 
-2.48.1
-
diff --git a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
deleted file mode 100644
index 19e0697769..0000000000
--- a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f540cc6fed7224fb9ca162cb2f33c338260ae1d2 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:11:35 +0100
-Subject: [PATCH] meson: add HAVE_LIBPTHREAD
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 6d1f986af..ac5fdd799 100644
---- a/meson.build
-+++ b/meson.build
-@@ -748,6 +748,7 @@ endif
- conf.set('HAVE_CLOCK_GETTIME', have ? 1 : false)
- 
- thread_libs = dependency('threads')
-+conf.set('HAVE_LIBPTHREAD', thread_libs.found() ? 1 : false)
- 
- have = cc.has_function('timer_create')
- if not have
--- 
-2.48.1
-
diff --git a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch b/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
deleted file mode 100644
index 0d90f8aec9..0000000000
--- a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From eecaa2c0dda817eba2d493f6ddb42c39cf789fc2 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:28:36 +0100
-Subject: [PATCH] libuuid: support non-cached scenarios (when -lpthread is
- unavailable)
-
-This patch makes the dependence on pthread optional for libuuid. In
-certain cases, such as Buildroot Linux, uClibc-ng, and very low
-resource systems, libpthread may be unavailable.
-
-If libuuid is compiled without pthread, it will not use a local cache
-and will instead request a UUID from uuidd for each call. This may
-result in less efficient performance, but the UUIDs generated will
-still be unique and reliable.
-
-On minimalistic systems, it is highly likely that uuidd will not be
-installed, making this change important for portability and robust
-code.
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Addresses: https://github.com/util-linux/util-linux/pull/3375
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- libuuid/src/gen_uuid.c | 18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
-index 69712267f..1ed82b46b 100644
---- a/libuuid/src/gen_uuid.c
-+++ b/libuuid/src/gen_uuid.c
-@@ -80,7 +80,10 @@
- #if defined(__linux__) && defined(HAVE_SYS_SYSCALL_H)
- #include <sys/syscall.h>
- #endif
--#include <pthread.h>
-+#ifdef HAVE_LIBPTHREAD
-+# include <pthread.h>
-+#endif
-+
- #include <signal.h>
- 
- #include "all-io.h"
-@@ -580,8 +583,7 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
-  * If neither of these is possible (e.g. because of insufficient permissions), it generates
-  * the UUID anyway, but returns -1. Otherwise, returns 0.
-  */
--
--/* thread local cache for uuidd based requests */
-+#ifdef HAVE_LIBPTHREAD
- THREAD_LOCAL struct {
- 	int		num;
- 	int		cache_size;
-@@ -597,8 +599,10 @@ static void reset_uuidd_cache(void)
- 	memset(&uuidd_cache, 0, sizeof(uuidd_cache));
- 	uuidd_cache.cache_size = CS_MIN;
- }
-+#endif /* HAVE_LIBPTHREAD */
- 
- static int uuid_generate_time_generic(uuid_t out) {
-+#ifdef HAVE_LIBPTHREAD
- 	static volatile sig_atomic_t atfork_registered;
- 	time_t	now;
- 
-@@ -651,6 +655,14 @@ static int uuid_generate_time_generic(uuid_t out) {
- 		return 0;
- 	}
- 
-+#else /* !HAVE_LIBPTHREAD */
-+	{
-+		int num = 1;
-+		if (get_uuid_via_daemon(UUIDD_OP_TIME_UUID, out, &num) == 0)
-+			return 0;
-+	}
-+#endif /* HAVE_LIBPTHREAD */
-+
- 	return __uuid_generate_time(out, NULL);
- }
- 
--- 
-2.48.1
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 317efebcbf..e74aa17c94 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,10 +1,14 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
-sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
+sha256  81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6  util-linux-2.41.tar.xz
 # License files, locally calculated
-sha256  27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164  README.licensing
+sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
+sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
 sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
+sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  Documentation/licenses/COPYING.EUPL-1.2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-only
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  Documentation/licenses/COPYING.GPL-3.0-or-later
 sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
 sha256  8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348  Documentation/licenses/COPYING.MIT
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed30c0b107..b097d42b7b 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.40
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.41
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -24,9 +24,13 @@ UTIL_LINUX_LICENSE = \
 	ISC (rfkill) \
 	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-2-Clause \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
+	Documentation/licenses/COPYING.EUPL-1.2 \
+	Documentation/licenses/COPYING.GPL-2.0-only \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
+	Documentation/licenses/COPYING.GPL-3.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later \
 	Documentation/licenses/COPYING.MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
