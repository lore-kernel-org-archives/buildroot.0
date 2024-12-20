Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB0CE77188
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 18:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7480A612D7;
	Fri, 20 Dec 2024 18:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfdnQJvB3dx9; Fri, 20 Dec 2024 18:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084C46120A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084C46120A;
	Fri, 20 Dec 2024 18:58:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A90DF6C
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F9483B2F
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 18:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2omzOoL-_Eq5 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 18:58:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF87E83B0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF87E83B0F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF87E83B0F
 for <buildroot@busybox.net>; Fri, 20 Dec 2024 18:58:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso15793275e9.0
 for <buildroot@busybox.net>; Fri, 20 Dec 2024 10:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734721114; x=1735325914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oThXMvWkIttZ5DAqPWQKO+M2q5Hybys5NAnM2adp6r0=;
 b=aSCuBsSLug1bZPVn1fJH+jpslc100T5jtjSyJ/fV329w9XdXjYYRYJX8EibJV3Loul
 T7sByDVRPJtLeHSYN+N+8TImFp5g9EjPhWId3gWNyZ5w5gR4/ABN/a+POvGvU4poFGUl
 o4Vv+URa2Pytxsk90hoAoGnrAnEASdbywSgn+ZQ7m7tpkFPnrMyzZHGhOl6vrYLu60J3
 OvLSbqCMcq53WBqEcK/lWUzjbCsbi3Go7TEdnogq/0JT5viUgma+PNIJ+cNNbaZx3slS
 PGAm13pNqxZ25dtocg9MwmoAVck2ZhJjFZs5fgqAnv8OyacDFKyQdIYC6LO5gby/BQCk
 oJzw==
X-Gm-Message-State: AOJu0Yye/CXrztTuYEHRBfddpEmLsEIKPEzXdXzq1U/yUbC6p01qASHh
 4FqRu+H8wgs3bhPaYwh17pyqlnsOSGCc1qVt2qK7orSKV6mA428Jo/rhw56UZWYCFcsIDnS9PSr
 sxA==
X-Gm-Gg: ASbGncvbAtGJC16vOPdGkDYyj4ksGLNf3HKT7O1YaeCDmM7O0j255+rzRahuNpESzfi
 Ffo87bguyWtXYwGA1hZhrcfOo5RdrOqVzWdIbXX37whsNJQtooRmTyYARBmF4Y9NSasfbPS2jY2
 7qbgRUqpJ6+vMM2WLjI8AElzRFOlfs9UgMookYyN51VCIaHZPEiJsLt66jaANO03RvEr+ZXXos2
 roYQTgz9c7R3Kbj7HltkYsNuMmlYNXRzAcZG+kHOWPddp6Soeuh1mcb+/pVQm120FysuQDomTZm
 ia0YFkrzK6b5RJ4=
X-Google-Smtp-Source: AGHT+IEehaWho8LEubeHWzZkapMA0TrKJGFFqpvqYr1wTq2dyUJ3YMeNDYmeqpt6Y5fIcyG+Oy5drw==
X-Received: by 2002:a5d:5f95:0:b0:385:dc45:ea06 with SMTP id
 ffacd0b85a97d-38a221fab2dmr3932607f8f.13.1734721113610; 
 Fri, 20 Dec 2024 10:58:33 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c493sm52433235e9.28.2024.12.20.10.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 10:58:33 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Dec 2024 19:58:29 +0100
Message-ID: <20241220185829.1252883-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1734721114; x=1735325914; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oThXMvWkIttZ5DAqPWQKO+M2q5Hybys5NAnM2adp6r0=;
 b=FUOwjyp4wV6OzD3ke8OqgaXzIjqda4WW+zE6r0Ez5sBqeKcVmFRgJokGXPzTpxwOeV
 TLeW6GYx1TYltk8x0i5rnKKsLWiqwAluE+zpdFcyH5Z+n+qQgatMRuFoBeCJIfeSXNBf
 IDddYtGGXI5mH3szZGhKbAJs1/ve7ze6zubkIp3SwQHsZojgXQ0c7c7sx6IYEmlZyQTi
 4tHJdmHAe2W/IXwW4GjE/ai01B5iaprYdqZcIydsuR0kFZRcP0+gzft8gGxFO7d6roES
 Obu9Y9ODDTCpKWMH8hK8D4XltGwzFLhQFhal/4wuFnJIPWA+nd0grTo4g4lf3QYZdjNE
 ZqPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=FUOwjyp4
Subject: [Buildroot] [PATCH] package/libnpth: bump to version 1.8
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

remove merged patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...EXPOSE_RWLOCK_API-for-musl-C-library.patch | 37 --------------
 ..._rwlock_timedrdlock-is-not-supported.patch | 51 -------------------
 .../libnpth/0003-Fix-previous-commit.patch    | 39 --------------
 package/libnpth/libnpth.hash                  |  4 +-
 package/libnpth/libnpth.mk                    |  4 +-
 5 files changed, 3 insertions(+), 132 deletions(-)
 delete mode 100644 package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
 delete mode 100644 package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
 delete mode 100644 package/libnpth/0003-Fix-previous-commit.patch

diff --git a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch b/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
deleted file mode 100644
index bc5ed70a9..000000000
--- a/package/libnpth/0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 1 Mar 2024 13:53:52 +0900
-Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
-
-* configure.ac: Add a case for musl system.
-
---
-
-GnuPG-bug-id: 5664
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1091b1..576a26e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -381,7 +381,10 @@ fi
- AC_SUBST(INSERT_NO_RWLOCK)
- 
- case "${host}" in
--    *-*-linux*|*-*-gnu*)
-+    *-*-linux-musl*)
-+        INSERT_EXPOSE_RWLOCK_API="1"
-+        ;;
-+    *-*-linux-gnu*|*-*-gnu*)
-         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
-         ;;
-     *)
--- 
-2.30.2
-
diff --git a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
deleted file mode 100644
index 0d9b38e4c..000000000
--- a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 01f03a91c9bd63910995aeef412beb3ca6dc9a67 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Tue, 7 May 2024 13:45:47 +0900
-Subject: [PATCH] Return a run-time error if npth_rwlock_timedrdlock is not
- supported.
-
-* src/npth.c (npth_rwlock_timedrdlock): Return ENOSYS if not
-supported.
-(npth_rwlock_timedwrlock): Use HAVE_PTHREAD_RWLOCK_TRYWRLOCK.
-
---
-
-GnuPG-bug-id: 7109
-Fixed-commit: 363c370bd35dd0bb4e5636b2d4f06ea88c658794
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=01f03a91c9bd63910995aeef412beb3ca6dc9a67
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/npth.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/npth.c b/src/npth.c
-index c0ff8da..f02540c 100644
---- a/src/npth.c
-+++ b/src/npth.c
-@@ -488,9 +488,11 @@ npth_rwlock_timedrdlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
-   ENTER();
- #if HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK
-   err = pthread_rwlock_timedrdlock (rwlock, abstime);
--#else
-+#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-   err = busy_wait_for ((trylock_func_t) pthread_rwlock_tryrdlock, rwlock,
- 		       abstime);
-+#else
-+  err = ENOSYS;
- #endif
-   LEAVE();
-   return err;
-@@ -533,7 +535,7 @@ npth_rwlock_timedwrlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
-   ENTER();
- #if HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK
-   err = pthread_rwlock_timedwrlock (rwlock, abstime);
--#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-+#elif HAVE_PTHREAD_RWLOCK_TRYWRLOCK
-   err = busy_wait_for ((trylock_func_t) pthread_rwlock_trywrlock, rwlock,
- 		       abstime);
- #else
--- 
-2.30.2
-
diff --git a/package/libnpth/0003-Fix-previous-commit.patch b/package/libnpth/0003-Fix-previous-commit.patch
deleted file mode 100644
index 5f3ce06bf..000000000
--- a/package/libnpth/0003-Fix-previous-commit.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 75c68399ef3bbb5d024f2a60474a7214fa479016 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 13 May 2024 11:13:23 +0900
-Subject: [PATCH] Fix previous commit.
-
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-
-Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=75c68399ef3bbb5d024f2a60474a7214fa479016
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/npth.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/npth.c b/src/npth.c
-index f02540c..8dced17 100644
---- a/src/npth.c
-+++ b/src/npth.c
-@@ -178,6 +178,18 @@ static int initialized_or_any_threads;
- typedef int (*trylock_func_t) (void *);
- 
- #ifndef HAVE_PTHREAD_MUTEX_TIMEDLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if !HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK && HAVE_PTHREAD_RWLOCK_TRYRDLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if !HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK && HAVE_PTHREAD_RWLOCK_TRYWRLOCK
-+#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
-+#endif
-+
-+#if REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION
- static int
- busy_wait_for (trylock_func_t trylock, void *lock,
- 	       const struct timespec *abstime)
--- 
-2.30.2
-
diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index a140a23f6..ad541111a 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a9f7adc1b1f6707071d29bfb3338c28b995ca1ce  npth-1.7.tar.bz2
-sha256  8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05  npth-1.7.tar.bz2
+sha1  6f60ce8540453e120d715f269d0c7cfd9e0b0d24  npth-1.8.tar.bz2
+sha256  8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e  npth-1.8.tar.bz2
 
 # Hash for license file:
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 634da6ed3..76abf45fd 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.7
+LIBNPTH_VERSION = 1.8
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
-# 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
-LIBNPTH_AUTORECONF = YES
 LIBNPTH_CONF_OPTS = --disable-tests
 HOST_LIBNPTH_CONF_OPTS = --disable-tests
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
