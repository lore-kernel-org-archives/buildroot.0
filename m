Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC54C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 17:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B858560E02;
	Sun, 14 Aug 2022 17:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B858560E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kP2TSRr2B8H4; Sun, 14 Aug 2022 17:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8AE660DF6;
	Sun, 14 Aug 2022 17:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8AE660DF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9444F1BF359
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 692518134B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 17:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692518134B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUEn98__9hdq for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 17:38:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D1ED81342
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 17:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1ED81342
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DFA1D8752D; Sun, 14 Aug 2022 17:24:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 19:38:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b717880f1fb7728648a2426dc20c3985fa3c530b
X-Git-Newrev: 62a4aa2379d7052ef1a127273253cca9ced18228
X-Patchwork-Hint: ignore
Message-Id: <20220814172426.DFA1D8752D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntpsec: fix libressl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=62a4aa2379d7052ef1a127273253cca9ced18228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following libressl build failure raised since the addition of
the package in commit 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'

Fixes:
 - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ntpsec/0003-fix-build-with-libressl.patch | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/ntpsec/0003-fix-build-with-libressl.patch b/package/ntpsec/0003-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..a5c9543157
--- /dev/null
+++ b/package/ntpsec/0003-fix-build-with-libressl.patch
@@ -0,0 +1,80 @@
+From 743f16fb3fed9a05e601226f184be236614efe9a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 23:35:52 +0200
+Subject: [PATCH] fix build with libressl
+
+Fix the following build failure with libressl:
+
+/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
+ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1285]
+---
+ attic/cmac-timing.c | 2 ++
+ attic/random.c      | 8 ++++++++
+ libntp/ntp_random.c | 2 +-
+ 3 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/attic/cmac-timing.c b/attic/cmac-timing.c
+index 464daa76b..4f2fd3338 100644
+--- a/attic/cmac-timing.c
++++ b/attic/cmac-timing.c
+@@ -204,7 +204,9 @@ static void DoPKEY(
+ 		printf("## Oops, EVP_MD_CTX_new() failed.\n");
+ 		return;
+ 	}
++#ifdef EVP_MD_CTX_FLAG_FINALISE
+ 	EVP_MD_CTX_set_flags(ctx, EVP_MD_CTX_FLAG_FINALISE);
++#endif
+ 
+ 	clock_gettime(CLOCK_MONOTONIC, &start);
+ 	for (int i = 0; i < SAMPLESIZE; i++) {
+diff --git a/attic/random.c b/attic/random.c
+index 446c68535..8530ecd25 100644
+--- a/attic/random.c
++++ b/attic/random.c
+@@ -127,7 +127,11 @@ static int do_avg_priv(unsigned int bytes) {
+ 
+ 	clock_gettime(CLOCK_REALTIME, &start);
+ 	for (int i = 0; i < BATCHSIZE; i++) {
++#ifdef LIBRESSL_VERSION_NUMBER
++            err += RAND_bytes((unsigned char *)&rnd, bytes);
++#else
+             err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
++#endif
+ 	}
+ 	clock_gettime(CLOCK_REALTIME, &stop);
+ 
+@@ -209,7 +213,11 @@ static int do_fast_priv(unsigned bytes) {
+ 
+ 	for (int i = 0; i < BATCHSIZE; i++) {
+                 clock_gettime(CLOCK_REALTIME, &start);
++#ifdef LIBRESSL_VERSION_NUMBER
++                err += RAND_bytes((unsigned char *)&rnd, bytes);
++#else
+                 err += RAND_priv_bytes((unsigned char *)&rnd, bytes);
++#endif
+ 		clock_gettime(CLOCK_REALTIME, &stop);
+ 		sec = (stop.tv_sec-start.tv_sec);
+ 		nanos = sec*BILLION + (stop.tv_nsec-start.tv_nsec);
+diff --git a/libntp/ntp_random.c b/libntp/ntp_random.c
+index 9304a790d..adb375b24 100644
+--- a/libntp/ntp_random.c
++++ b/libntp/ntp_random.c
+@@ -29,7 +29,7 @@ void ntp_RAND_bytes(unsigned char *buf, int num) {
+ 
+ void ntp_RAND_priv_bytes(unsigned char *buf, int num) {
+ 	int err;
+-#if (OPENSSL_VERSION_NUMBER > 0x1010100fL)
++#if (OPENSSL_VERSION_NUMBER > 0x1010100fL) && !defined(LIBRESSL_VERSION_NUMBER)
+ 	err = RAND_priv_bytes(buf, num);
+ #else
+ 	err = RAND_bytes(buf, num);
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
