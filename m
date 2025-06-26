Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B8FC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A81607A1;
	Thu, 26 Jun 2025 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO3RxKKS3tam; Thu, 26 Jun 2025 19:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC63A607A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC63A607A4;
	Thu, 26 Jun 2025 19:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B381310A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9990180AD0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lL7d8b03ff7z for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.51;
 helo=mail-ed1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CD8D80ACC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD8D80ACC
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CD8D80ACC
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:47:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so2126945a12.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967276; x=1751572076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r9kqxv3CmneyiWWpkJ+WXfgLN8Em5hoPVKlwg7xDawE=;
 b=ZyZlal2L9mTmlXm+Y/F1WE1poX1Tcu7ykw9B+ySUXIiz3dbQl6jZSiICmAqhsZ2G3n
 eo4HoZ5nHpOvox/tAIUhHonhykrYW18kQoPMBb/qfJ26Sj4sPzyuJaUH0sbhETgJze3n
 j0XyZndU+pHdIW897Qb0jo1KLaMg0uQR/3itJ+2K+K4xyYrRYaMFe6edLuO8OKJAGGCZ
 Xm7cKsG0N8qLsptmnV5zyCmr8ntlGbbOXVhEKj+W41fGJWap76PStfHYthXxj48Ku2og
 HvsJydvpE2fPUIVNeLvumj0LfoAAYNUVZ9hGV51SSqz8XNY64c9ELvxMbtgcm1vCvFTV
 f2lg==
X-Gm-Message-State: AOJu0YzxmdmveNAhuhmh1CJDipqP5/6+lfPsfUI6jj+EXI4hV/8Rbt49
 clg2tyJ1BaIcBDYZnIrQj8sDVdEHUMPvT3+iTQE4Bz/gzLLtyH1BZlEvJzZXNA==
X-Gm-Gg: ASbGncvO7kjvIKlXjMo3GZMsjIL0bAKqASCkxfYkinLFWwfKoA9+L8T+xzaNwq9b+Kw
 2HuQFchMCiFIc7l2OwPCAcKKFQqqYBoAZMwSgX8bokGBhxL2NRAkwYBETlSbpPnbYR+HG3oMlFV
 DCX+RQVdUf87RriR7uPwql7Mh586PR01trDNmpwvdlH3K+5Dz27mXsxevd4LcAO60XRuPdU4uOb
 F37snpGDOz/OnYM2sCNWxElUWkLCSZiqSo3FNeIbkrFRWVQtSVURIdh7DZsehhqLYxZZZA7gHJK
 Kwn56VyB1F6jIaC261EyZp5xdKt9Bj0OrFWr+olj482qvL791Aiwo1ZB+HSzE44caKN9ZAPwnaz
 kj08=
X-Google-Smtp-Source: AGHT+IGnQTFQNo71RvxxQsPNk+JbRoSFp/E8rhV+LT6HzmH+A+m6+I/+NcLBjHD/EIRKLGQJs20tUQ==
X-Received: by 2002:a17:907:9612:b0:ae0:dcd5:ea75 with SMTP id
 a640c23a62f3a-ae34fd13e5fmr33343266b.5.1750967276177; 
 Thu, 26 Jun 2025 12:47:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb6f:7900:7e40:8355:b42e:37f5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae218bad82csm44903166b.127.2025.06.26.12.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:47:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu, 26 Jun 2025 21:47:52 +0200
Message-ID: <20250626194752.144160-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422075932.2345-1-thomas@devoogdt.com>
References: <20250422075932.2345-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v4] package/util-linux: bump to 2.41.1
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

News:
- https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41-ReleaseNotes
- https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.1-ReleaseNotes

Dropped patches which are all upstream.
- https://github.com/util-linux/util-linux/pull/3049
- https://github.com/util-linux/util-linux/pull/3383

Synced all license files.

Dropped the AUTORECONF call, since
0001-libmount-ifdef-statx-call.patch is upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
v2:
 - dropped AUTORECONF
 - added two compile patches
   - 0001-misc-never-include-wchar.h.patch
   - 0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
v3:
 - added 0003-namespace.h-fix-compilation-on-Linux-4.10.patch
v4:
 - dropped
   - 0001-misc-never-include-wchar.h.patch
     (Upstream: https://github.com/util-linux/util-linux/commit/778fbe77eff16fb33b222224275fc329e6435cc2)
   - 0002-lsns-fix-undefined-reference-to-add_namespace_for_ns.patch
     (Upstream: https://github.com/util-linux/util-linux/commit/bd36a077e16eca888d843a0c30e77379aedfe350)
   - 0003-namespace.h-fix-compilation-on-Linux-4.10.patch
     (Upstream: https://github.com/util-linux/util-linux/commit/e28ce84b2ebec03082dd9045e9be18785ec4dbd2)
 - changed release notes in comment
---
 ...ch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 ---------
 .../0002-c.h-consolidate-THREAD_LOCAL.patch   | 65 ---------------
 ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 -----------
 .../0004-meson-add-HAVE_LIBPTHREAD.patch      | 27 ------
 ...non-cached-scenarios-when-lpthread-i.patch | 82 -------------------
 package/util-linux/util-linux.hash            | 10 ++-
 package/util-linux/util-linux.mk              | 11 +--
 7 files changed, 13 insertions(+), 268 deletions(-)
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
index 317efebcbf..d1c2986ca6 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,10 +1,14 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
-sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
+sha256  be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57  util-linux-2.41.1.tar.xz
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
index ed30c0b107..3098a81a72 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.40
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.41
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -24,18 +24,19 @@ UTIL_LINUX_LICENSE = \
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
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# 0001-libmount-ifdef-statx-call.patch
-UTIL_LINUX_AUTORECONF = YES
-
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
