Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515F6CCD1BC
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 13:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49D941072;
	Thu, 23 Oct 2025 13:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAGgI4ZKmr78; Thu, 23 Oct 2025 13:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A18641175
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A18641175;
	Thu, 23 Oct 2025 13:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 948FE70A
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 919ED8476B
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_59Gg57zg5F for <buildroot@buildroot.org>;
 Thu, 23 Oct 2025 13:06:22 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 23 Oct 2025 13:06:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E29E484766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29E484766
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.226.251.21;
 helo=cstnet.cn; envelope-from=gongzl.oerv@isrc.iscas.ac.cn;
 receiver=<UNKNOWN> 
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E29E484766
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 13:06:19 +0000 (UTC)
Received: from lapac71h.localdomain (unknown [124.236.175.99])
 by APP-01 (Coremail) with SMTP id qwCowAAnfqCJJvpot7QEFQ--.38691S2;
 Thu, 23 Oct 2025 20:59:03 +0800 (CST)
From: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
To: buildroot@buildroot.org
Cc: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
Date: Thu, 23 Oct 2025 20:58:47 +0800
Message-ID: <20251023125847.7008-1-gongzl.oerv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAnfqCJJvpot7QEFQ--.38691S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw18tF4rtFWkKF1DGF1fXrb_yoWrJw17pF
 n8GFW5KrWkGF4xKa93tr48Xa1Svwn3AryFy34SqrW8WF18Zas7ArZFkFZYyrWDZr10yw1Y
 vF1DWrWkG3s5Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUJVWUGwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-Originating-IP: [124.236.175.99]
X-CM-SenderInfo: pjrqw6noorv2ny6l223fol2u1dvotugofq/
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=isrc.iscas.ac.cn
Subject: [Buildroot] [PATCH] package/libsolv: add upstream patch to fix musl
 build
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

After the introduction of qsort_r in musl, building libsolv with musl fails with
unmatched qsort_r function signature. The commit adds the recently upstreamed
patch to fix it.

Original PR: https://github.com/openSUSE/libsolv/pull/600

Fixes: http://autobuild.buildroot.org/results/ab06e97bef898b2c53b906afb2a4b8ee6841bacb

Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
---
 ..._r-preprocessor-for-musl-and-FreeBSD.patch | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch

diff --git a/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
new file mode 100644
index 00000000..8c1677fc
--- /dev/null
+++ b/package/libsolv/0001-Fix-qsort_r-preprocessor-for-musl-and-FreeBSD.patch
@@ -0,0 +1,79 @@
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
+Signed-off-by: Gong Zhile <gongzl.oerv@isrc.iscas.ac.cn>
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
