Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A06C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 08:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D46460ABE;
	Sun, 14 Aug 2022 08:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D46460ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYZoDMb-NEUo; Sun, 14 Aug 2022 08:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3835607E3;
	Sun, 14 Aug 2022 08:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3835607E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96DF01BF356
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C7C340105
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C7C340105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrOxIrhCYhvU for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 08:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA69400F8
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FA69400F8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 08:43:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so2528486wms.5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MNJ2sMF28hblLEJNzE3bY1T8TU0zaCfE6T/qaXi3VJU=;
 b=hGuJeyRInHQLWSVRbWwKiu6yIMoLNHPV0uhDvaWwYkCHlBzUuIvctWrzRzitov60Jk
 2pfgvOC0GAnaq0xlEmaphld6y3gXgc2eLPiAAQ+FhYOkrWy6fNrSy0HyChWY5Yn/uQ1n
 fv880LREz2ehvUR0g5ISVPFqLabywYmS4UoEg79c6Dmm81hR6uxkzpFXMlzgUMVv35Gj
 TO53MRXmCSIoDL5DnsIrhKw7Ej5JSHPwVudFtfWYDabJvUnjvG75ORlIyN6GVzSRAQK4
 5r+gS3hHimMF++6apvwHCZcYqHizSSCb5rp7ulBDTIB9+VnKf674HAR6q0QLAa+2eG9O
 Xi3w==
X-Gm-Message-State: ACgBeo2GBPqhzoqBX/EZ2fIDRKpUacqO8bdSDkka/IhiRnAxwXWVEX1+
 fhJY8aYXt8A8k9Qk7Lvyj/TepN5EJG0=
X-Google-Smtp-Source: AA6agR6BK/lMguo0K6RM4c/LhueCK7XukObGZHMNdnLpoZ3uvUXs1v/FJmTWasJZjzgY5Tr+ENoKvg==
X-Received: by 2002:a05:600c:3595:b0:3a5:c2a5:c92a with SMTP id
 p21-20020a05600c359500b003a5c2a5c92amr7077685wmq.170.1660466586063; 
 Sun, 14 Aug 2022 01:43:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00623e26afd6274afb.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:623e:26af:d627:4afb])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002185631adf0sm4009598wri.23.2022.08.14.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 01:43:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 10:43:00 +0200
Message-Id: <20220814084300.2782305-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MNJ2sMF28hblLEJNzE3bY1T8TU0zaCfE6T/qaXi3VJU=;
 b=Svs2dkicUmsA2o8SnOdnWR/V7Dp8ySfJmoR04LtSc2YMDSs8rVtr2o3ehzIIjG5y2B
 nDQK7+Fvi05VigbnX5zKAkBCpXkZkM6UoXI+BQ1AqED3OLxH50MCn9kJbkrPw2s6elXp
 VSCaKHdvHuQgP1HNus9eqZYDyHvalH+1H4hv8WcKbHe8Y98p90a4w9Nlf0qoQXyk1KND
 sW2jngyWMPqWM3YWEO7jp7Tappjq4uhVyqM0E9t4GuewQbbaZ1Z3AVqvoCU9OknwOGgS
 4+Sqoyt9/aW7o9wgMrpriPq2U8xeA8dEa4AkCK6dEmoN8BltgyAWLmy0tEC82+gXJAtH
 fvFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Svs2dkic
Subject: [Buildroot] [PATCH 1/1] package/ntpsec: fix libressl build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libressl build failure raised since the addition of
the package in commit 27b8d0ba8c4004819e092fb81c0f64f284b3aa4a:

/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/11.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: libntp/libntp.a(ntp_random.c.1.o): in function `ntp_RAND_priv_bytes':
ntp_random.c:(.text+0xac): undefined reference to `RAND_priv_bytes'

Fixes:
 - http://autobuild.buildroot.org/results/a6a825b7f0efc7c82e8ecf792a1f9951ffb047c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../ntpsec/0003-fix-build-with-libressl.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/ntpsec/0003-fix-build-with-libressl.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
