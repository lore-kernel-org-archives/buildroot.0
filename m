Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E713CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2AE340D93;
	Sun, 26 Oct 2025 08:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4qREJt_iAuM; Sun, 26 Oct 2025 08:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF9540E30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DF9540E30;
	Sun, 26 Oct 2025 08:28:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 889DF25B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E8E360F58
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mm6QrgCd2oXq for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 08:28:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6226560F0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6226560F0C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6226560F0C
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 08:28:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0471A4C473C;
 Sun, 26 Oct 2025 09:28:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCw6f-000000000gv-1MSR;
 Sun, 26 Oct 2025 08:28:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
Date: Sun, 26 Oct 2025 09:27:56 +0100
Message-ID: <20251026082757.252631-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761467285;
 bh=OCRBrXWC7GzYaefWG0i76MJF9C7CQiBfVmj38mwuMx0=;
 h=From:To:Cc:Subject:Date:From;
 b=IHqOBXeaJFgO2wrB/ojfWtK0UHGyFUnGb2Jk/17scwEob3RBpw2G4vAri4AFLCZpO
 rMIAYPpTjYZcYuBK42jswK5Hw/ktiO2/tBPLXnz1YO++bGhQHv4evopIgnsWD4nMSv
 kbkX+x+Px/hbgYuYvMRHVT1G6dTmCRX7htUvpmT8QjrsBOA/c8TsWMXmRPDq557lST
 0khYexqkqwuLhmTcgQMfELGzKyil7XiQIWORP5EhxeI951fEYXlmOwRODbNci6H9C+
 CHlA0em2CdrxhkNdC38oQaT9F4DoxwNUKuIk64Ac84v4nyUA2iRpQz7jId0xH85UjJ
 cXh6pJfHNTwHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IHqOBXea
Subject: [Buildroot] [PATCH v2 1/2] package/libsolv: add upstream patch to
 fix musl build
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

From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>

After the introduction of qsort_r in musl, building libsolv with musl fails with
unmatched qsort_r function signature. The commit adds the recently upstreamed
patch to fix it.

Original PR: https://github.com/openSUSE/libsolv/pull/600

Fixes: http://autobuild.buildroot.org/results/ab06e97bef898b2c53b906afb2a4b8ee6841bacb

Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added Upstream: tag in patch file

 ..._r-preprocessor-for-musl-and-FreeBSD.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch

diff --git a/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
new file mode 100644
index 0000000000..04a4312db4
--- /dev/null
+++ b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
@@ -0,0 +1,83 @@
+From 2d0718a4f2001c857d9af24398c68d676a98a3ca Mon Sep 17 00:00:00 2001
+From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
+Date: Wed, 22 Oct 2025 18:14:30 +0800
+Subject: [PATCH] Fix qsort_r preprocessor for musl and FreeBSD
+
+The original mentioned qsort_r signature difference now only exists in DragonFly
+BSD & MacOS. However, the preprocessor also broke the compliation on musl+linux
+and FreeBSD, leading the compilation error on buildroot.
+
+musl: https://git.musl-libc.org/cgit/musl/commit/?id=b76f37fd5625d038141b52184956fb4b7838e9a5
+freebsd, dragonfly, macos: QSORT(3)
+
+FreeBSD and musl use the same GNU-like signature.
+
+Upstream: https://github.com/openSUSE/libsolv/commit/2d0718a4f2001c857d9af24398c68d676a98a3ca
+
+Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
+[Bernd: added Upstream: tag]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util.c | 35 +++++++++++++++++++----------------
+ 1 file changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index 72426e09..a60ed3da 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -154,26 +154,14 @@ solv_setcloexec(int fd, int state)
+   #endif
+ }
+ 
+-/* bsd's qsort_r has different arguments, so we define our
++#if defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R)
++#if (defined(__APPLE__) || defined(__DragonFly__)) && defined(HAVE_QSORT_R)
++
++/* MacOS and DragonFly have qsort_r with different arguments, so we define our
+    own version in case we need to do some clever mapping
+ 
+    see also: http://sources.redhat.com/ml/libc-alpha/2008-12/msg00003.html
+  */
+-#if (defined(__GLIBC__) || defined(__NEWLIB__)) && (defined(HAVE_QSORT_R) || defined(HAVE___QSORT_R))
+-
+-void
+-solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
+-{
+-# if defined(HAVE_QSORT_R)
+-  qsort_r(base, nmemb, size, compar, compard);
+-# else
+-  /* backported for SLE10-SP2 */
+-  __qsort_r(base, nmemb, size, compar, compard);
+-# endif
+-
+-}
+-
+-#elif defined(HAVE_QSORT_R) /* not glibc, but has qsort_r() */
+ 
+ struct solv_sort_data {
+   int (*compar)(const void *, const void *, void *);
+@@ -196,6 +184,21 @@ solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, con
+   qsort_r(base, nmemb, size, &d, solv_sort_helper);
+ }
+ 
++#else
++
++void
++solv_sort(void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *compard)
++{
++# if defined(HAVE_QSORT_R)
++  qsort_r(base, nmemb, size, compar, compard);
++# else
++  /* backported for SLE10-SP2 */
++  __qsort_r(base, nmemb, size, compar, compard);
++# endif
++
++}
++
++#endif
+ #else /* not glibc and no qsort_r() */
+ /* use own version of qsort if none available */
+ #include "qsort_r.c"
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
