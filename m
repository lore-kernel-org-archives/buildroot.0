Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB81EC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 17:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E0784148B;
	Tue, 14 May 2024 17:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdxLWYZQL1lP; Tue, 14 May 2024 17:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B20041497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B20041497;
	Tue, 14 May 2024 17:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 38C361BF232
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2480241497
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tC3SffPUIjsp for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 17:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F7DD4148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7DD4148B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F7DD4148B
 for <buildroot@buildroot.org>; Tue, 14 May 2024 17:21:47 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-420180b58c3so16368255e9.2
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707305; x=1716312105;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ld2HdSaTJNWlug4NCuWhVx9Yji++Hb1LcjbxBEL8yss=;
 b=jfWFNGQdc2FYX0mJXa6HUvxKnan3cg/bazHDYKW8PZ3gesVJq36HYsYX4MLWRGxWEP
 8iXgR0DGoqEa76E+HhSqsCxlwsOBcIEUuz7wMmhr/kSDIrA2TlrinGaWEGbmqsZCXHeF
 40NicethVHmeoxkdjWnIPHX8J9jUYUFYtCvz6jrZ01spvBZNw+y50X+Wf6S8Z7jei/hB
 rLjAyWUOR1waOHwBuSqO3vHUnprQ5K358FhHjO6+21WCacF2wN63DB3TcB7XkGfKceAX
 +NjJi8KwoDyvwi5rkZCxB8WQC6DOMaDPFkqwkAv+bsoeA7p1ihcdqigVue9zKGD0gnu3
 S6fQ==
X-Gm-Message-State: AOJu0YxaTPoqzI3oLdO9FAoWECDG57L4DPzFi1ULCvl/GnHl4L8BhtSe
 rd5ZD4xw1jx1yqHThVudYIejDlyA5U9ToIzh1DbuD9pDzSmEq9HfVSJKjA==
X-Google-Smtp-Source: AGHT+IHJPPguDoowk3A3uFayltG7L//uMVf7J6x4IM1MXnNaklOBqIEtYxaumAzh45dp3/QoyTAgQg==
X-Received: by 2002:a05:600c:1c88:b0:41b:855b:5d26 with SMTP id
 5b1f17b1804b1-41fea927e30mr96754365e9.2.1715707305159; 
 Tue, 14 May 2024 10:21:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe36f373fsm180232835e9.20.2024.05.14.10.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:21:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 19:21:42 +0200
Message-ID: <20240514172142.4449-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707305; x=1716312105; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld2HdSaTJNWlug4NCuWhVx9Yji++Hb1LcjbxBEL8yss=;
 b=JJLnLxT27YAAJKVqcwJBvFu4+myy0+x8cHAXuPLLxBKbAvy5t2tBs5na4c/NEWpfZK
 PAjAdz5CfCMD4duE1Pp6gzJ7t8/ghJU/flzjKdwc+z0Co/1J81B6wm4exGpypY3D0Pjo
 RjPIbEhc0pbyoj9Ox+RwXvepKf57VqXIPxYw7IUEDJ8joyzVjhAS3xLbz+yFCd7xsCvj
 XKaeXNziCiUvkEguerv9cuIjkE7FZXG8v6GdITIrYZIA/67TtERgjrWE09c1qRM2mCc9
 3LEEYodZiWEXDRhJ+aeJEFQr2P/oZrVkmc44eIo+dbDzS8dPX9KWkddgnQhijqgj66R6
 sRGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JJLnLxT2
Subject: [Buildroot] [PATCH 1/1] package/libnpth: fix gnupg2 build with
 uclibc
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure of gnupg2 raised since bump to version
1.7 in commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commitdiff;h=02ce6b2d27f91ed6285e4e92d99c21bcc7823c9b:

/home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/13.2.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /home/autobuild/autobuild/instance-2/output-1/host/bin/../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libnpth.so: undefined reference to `busy_wait_for'

Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 - http://autobuild.buildroot.org/results/9a27ffde79598a39b4fd55c716978d32d0beb924

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._rwlock_timedrdlock-is-not-supported.patch | 51 +++++++++++++++++++
 .../libnpth/0003-Fix-previous-commit.patch    | 39 ++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
 create mode 100644 package/libnpth/0003-Fix-previous-commit.patch

diff --git a/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
new file mode 100644
index 0000000000..0d9b38e4ce
--- /dev/null
+++ b/package/libnpth/0002-Return-a-run-time-error-if-npth_rwlock_timedrdlock-is-not-supported.patch
@@ -0,0 +1,51 @@
+From 01f03a91c9bd63910995aeef412beb3ca6dc9a67 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Tue, 7 May 2024 13:45:47 +0900
+Subject: [PATCH] Return a run-time error if npth_rwlock_timedrdlock is not
+ supported.
+
+* src/npth.c (npth_rwlock_timedrdlock): Return ENOSYS if not
+supported.
+(npth_rwlock_timedwrlock): Use HAVE_PTHREAD_RWLOCK_TRYWRLOCK.
+
+--
+
+GnuPG-bug-id: 7109
+Fixed-commit: 363c370bd35dd0bb4e5636b2d4f06ea88c658794
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=01f03a91c9bd63910995aeef412beb3ca6dc9a67
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/npth.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/npth.c b/src/npth.c
+index c0ff8da..f02540c 100644
+--- a/src/npth.c
++++ b/src/npth.c
+@@ -488,9 +488,11 @@ npth_rwlock_timedrdlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
+   ENTER();
+ #if HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK
+   err = pthread_rwlock_timedrdlock (rwlock, abstime);
+-#else
++#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
+   err = busy_wait_for ((trylock_func_t) pthread_rwlock_tryrdlock, rwlock,
+ 		       abstime);
++#else
++  err = ENOSYS;
+ #endif
+   LEAVE();
+   return err;
+@@ -533,7 +535,7 @@ npth_rwlock_timedwrlock (npth_rwlock_t *rwlock, const struct timespec *abstime)
+   ENTER();
+ #if HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK
+   err = pthread_rwlock_timedwrlock (rwlock, abstime);
+-#elif HAVE_PTHREAD_RWLOCK_TRYRDLOCK
++#elif HAVE_PTHREAD_RWLOCK_TRYWRLOCK
+   err = busy_wait_for ((trylock_func_t) pthread_rwlock_trywrlock, rwlock,
+ 		       abstime);
+ #else
+-- 
+2.30.2
+
diff --git a/package/libnpth/0003-Fix-previous-commit.patch b/package/libnpth/0003-Fix-previous-commit.patch
new file mode 100644
index 0000000000..5f3ce06bf6
--- /dev/null
+++ b/package/libnpth/0003-Fix-previous-commit.patch
@@ -0,0 +1,39 @@
+From 75c68399ef3bbb5d024f2a60474a7214fa479016 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 13 May 2024 11:13:23 +0900
+Subject: [PATCH] Fix previous commit.
+
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream: https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=75c68399ef3bbb5d024f2a60474a7214fa479016
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/npth.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/npth.c b/src/npth.c
+index f02540c..8dced17 100644
+--- a/src/npth.c
++++ b/src/npth.c
+@@ -178,6 +178,18 @@ static int initialized_or_any_threads;
+ typedef int (*trylock_func_t) (void *);
+ 
+ #ifndef HAVE_PTHREAD_MUTEX_TIMEDLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if !HAVE_PTHREAD_RWLOCK_TIMEDRDLOCK && HAVE_PTHREAD_RWLOCK_TRYRDLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if !HAVE_PTHREAD_RWLOCK_TIMEDWRLOCK && HAVE_PTHREAD_RWLOCK_TRYWRLOCK
++#define REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION 1
++#endif
++
++#if REQUIRE_THE_BUSY_WAIT_FOR_IMPLEMENTATION
+ static int
+ busy_wait_for (trylock_func_t trylock, void *lock,
+ 	       const struct timespec *abstime)
+-- 
+2.30.2
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
