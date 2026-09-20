Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781F1C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 08:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1473660653;
	Sun, 20 Sep 2026 08:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnSWTzkfH2Lf; Sun, 20 Sep 2026 08:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F32F660657
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789891679;
	b=pWJeDgQjBnct5ZvIzZ7Zec9MQ+Pyrm13cv0543RcFqdbNVVYGme1Rw07tbuxnJ7v1mkv
	 3ScD6za3Zv6uzBd/yeTDu+dns7Axx56l0+q40h51yX4P8w7lnCWfNiclFP6rsJu1Ffi7R
	 hYqRA9GXRplYqEfOtfJ73KFIqm2Mcflv2hzw36MrVHsFtOMZsIqJmkfNEf/lOo0dGt9IT
	 xcEs+sF6fGVxJ3Hrjc/yArwY/aNd9LCRaYGitgLs+PbDJaMg50kJIrZdB7tKtp0oVELKj
	 72he3dHUM95V/7XpW3gsR19nu/9FkTE/w7xgi/r3DlUsxoShZ4XwE0aZgYeRRFXziww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789891679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V0WYhvxnbHJkm8XgSgJA69o8b0+LnC5qMyuwd31yF6Y=;
	b=SZvLLmcSVgN31CiT/bXaCnTy7Ezf1VbS22FfMr8ow4Vx4gz94V3pohPjC1dg26UgPcCx
	 AcxMj2rd8uxFzqhy4v/7KHkq2+RMMVRtACfJUUj3Gtgti64v0rN41OODdC3WbtWD1hDlF
	 wFRod7Yqfs2XboYBHt/ov9zl5DuAgrzxSHcoqOwp8WelJzXpCv+0FmPDEUhqVJgM1gFPW
	 cAdEG0OBQ/V32Cfu0Sd42jjHzpK/KsjOpePS3YHJaEoHKPQ3auOpE2Tvep+8a+4/6RW+v
	 fz6jmSOBlxLsmJbn/csGcCmnpHhFvWAq6ZkRB4PPd+psFfhFAY4apAOWFaPYm1Tsb0w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rmpSBDdE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789891679;
	bh=V0WYhvxnbHJkm8XgSgJA69o8b0+LnC5qMyuwd31yF6Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cnUJRxW8Lel0hWTzfyuqFmjHjT9DDn+bvtU4DoRz/rkf0Zjh5Nt7AkeyDij9T9XzW
	 AYaJYdsVEaZg/rUZfugT+m721dOfJ7ylDw7yQO5mutg5YmQnb3le74KpzST9fANE61
	 2tVuueb5mp9gtcBQ0fXxqpkdBDEBZPRW28ijJaYYUQ7nq5GP7HqSr/s/mZL4cBnY8g
	 K23a+yAC3UjuhRoIZy1f6OKzcCYbB1p9iYdWmRApl1lU7MfnKVV0tRd/nQwGa+0FfL
	 n6YBKgsWwABTg5qKJwWv/Y9cHEbIUKVmvdsZuDUaEcsSqkrvyxUnOmsSaVTRQtfqU3
	 X8peAzZ0ZsgsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F32F660657;
	Sun, 20 Sep 2026 08:07:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40D6D13D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 08:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2659D60658
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 08:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTe_vKvh3uy2 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 08:07:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CDC7060653
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789891676;
 b=VOwYCqC+F3AyAKpzuURsgyI99gPnrcYDKLsMvckbPE11hYF4H7+CosC66IRhSElZIRmI
 SZoF/Dc72OA5tsZ9QYtxeS0gD9s7KNHWoqyxTM0DApNiWt0C33OcCCCha6bm3ZO59Lqdg
 GaKr56wtW1jriUn2tCQ0XjyI+jfb77IRuQPttHIx2Nw4gSB9Lg9Aft+yg4dGLAx/LbGJL
 n/EUhTiJUpiL+BEo1Ebl8XZJdfB/oD0kdnb2qADeeGhR1pKM3SIKxKKDypN7Qwa90Dqdh
 2bmJvWREaTV47BBmSagMIvi5HjwJ53f4AxwFf1hg1NiG0Y1z5m4Yg5NOi/TblbHoSIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789891676;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4rkrPYLgwGjWxBCGqsG8Ur2Ffl/5xfDmJFkMMg4cvnY=;
 b=GuV8FeQnuSQetuzhPvFCK+4R2O79CahZfnNGkYixzwxxfHxZlgUrDHQjvhWgnK5GHSUe
 tu58whEk8a6o6VJlE94KvH+CKMCS1jIBlPz4D8CcNUT68ZSJb2uzrurzlFfF8HskphNVk
 UVsscLXEUnwVUDRk+HlCmTZPrQ0xaAYhsi+tUWJhUJeQuzZIa20v3zo+6JGfwlu/ORnyt
 rJ2AdMFMvv6FEVRPbilSvAJOaieX9MhIoJm0Q9NW8xo+1rFkupLPTca933tSoC0lVThxE
 EDveoWV6sFjbVRSct8gTEgy3lQ5J/T9giJ+eVRh3y6TkWdqvLmbrZ52zGZgTHjTX9ww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rmpSBDdE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rmpSBDdE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDC7060653
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789891669;
 bh=4rkrPYLgwGjWxBCGqsG8Ur2Ffl/5xfDmJFkMMg4cvnY=;
 h=From:To:Cc:Subject:Date:From;
 b=rmpSBDdEzzqnlekko7x0D3hnjJnYFrruAPHWknprEc+zP6r1LgUcfMYLp4IWxKT0F
 TNO3uOXFjsa6oAil1G3SQoqZ9LlrCa43xDnPWLW08BNjtwoT+TUlDYIg8ryIkhuKmh
 q/Zg/gKb8AJG6BKLPZWsYd1io46cjH0ceL9cb3UIqdFlrBEuBJ83j07VSOp+VNbsOi
 W0f9lKT5ST4yMtJjH0HLhCdius3kozDdoVJv/f/WEUrpPDVtwdpCXHVtrWvyIDxw2y
 tgT3FYN56GpSNxNX3Co9TASsXVviruTPlftyNE0t/86P6w3s1XZujP7I1GswoDli4m
 zMt5zH+8VnkCw==
X-KAS-Sym: v3:f51bdf72230551df:aQhC2Unoib+iZSGieYEFiqBR6R3+DdmuIX2L+QVEE23yV6vlBQKaoQpq85uT456DTR4b4Ee/UB3jKjHEIJSmei56peHus2ZCNmIT1Bs60acb4/kMc8Qh+sFJA70uiPtq4iBWp5AJJmRe8hAGlcSdLyGMQyjVsoF1idEh2CiOwTwKEjlmyVCaS4tFdDGielNbZiMTM3QriRRfbDDfk1sbkhPVhZhWLechHO/9k+w1SGnT2fjLqjrI46OPPcncIW//a3q82qBvHLcAOzsdcC+3Qjn6B8NucEfiXAAbGcGcZgk8oJ/PQl6m61p9kz50kK8qt7asT17WSQ6K9wJqmHg1vQ==:Tnnstf1dcIMdZLjuUnDSHb9mWlK7UPpLRvQCh21U1QIx3Yg+7IqZz8fDU34u7jsBIXmXxPw0AsawaoZpAf1Xi6r6RAxnVaSA7prp3tRzlLSR4AUc8jzj//Wzhd5bqXQfE5k3Ev5lxHTGBBUtpJoxZ8nR0prwFmJH/3/nswJBcGGIEwPvzdGk8gRHEx6t4miAkt0HkNsO/XW6s62odlRfXGdjotJdTWD6ZPBuA4OTuxXEpfn4X8E9axASdHhEo1pja6dRy5hLoP9zyW/gmPowx862KbYATqRpdudtKYIekPMCZztQhekoRtQ/GsLH3uj4GPtQQc2aT8cIMw0Q9oUMjK98DvqXG91POT+nTyxjWirDGM6rwt3TRT/5I0bJXy+ErRmnFQihakeYyfjf4StQClZTPyUvo1Hw5JlyZdlD3uC3g5oE3BT+LGYraVZ2vQyUvT9WEuiorrJHNeLSKO/ezedyjqwp3AImbpj4WVjdIj9nhY8G2d7JMoZK1ihk6e2hvb7osjFMFf9Prt7Artde/X5bCi9m+QjfBuUpqEL+QzfmZYR8DFoTRr+UN01qYV2SpS98JUKIbqabE0Stx5oluF9fxutciqhE4TKAW+rSqDr6BM
 rZr+QDVrdbIIi4KHZswdKjxqmpU8oe0Jsea7w9M7VlxZ4VEvIHf0zJmIJCPYY/Pw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E73EA4C479A;
 Sun, 20 Sep 2026 10:07:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54048)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8CaS-000000000xd-2qc8;
 Sun, 20 Sep 2026 08:07:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 20 Sep 2026 10:07:48 +0200
Message-ID: <20260920080748.1833904-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump version to 4.7
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

https://github.com/troglobit/mrouted/blob/4.7/ChangeLog.md

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/fe62c6a16f39493f6124f80daf7ff77eab00e489

 package/mrouted/0001-gcc15.patch | 33 --------------------------------
 package/mrouted/mrouted.hash     |  4 ++--
 package/mrouted/mrouted.mk       |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/mrouted/0001-gcc15.patch

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
deleted file mode 100644
index 781f83f5c7..0000000000
--- a/package/mrouted/0001-gcc15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Wed, 23 Apr 2025 16:04:20 -0700
-Subject: [PATCH] C23 compatibility.
-
-bool is a keyword in C23.
-
-Upstream: https://github.com/troglobit/mrouted/pull/65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/kern.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/kern.c b/src/kern.c
-index 27f8dd4..04f1c36 100644
---- a/src/kern.c
-+++ b/src/kern.c
-@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
-  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
-  * coming with this distribution fixes it.
-  */
--void k_hdr_include(int bool)
-+void k_hdr_include(int flag)
- {
- #ifdef IP_HDRINCL
--    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
--        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
-+    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
-+        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
- #endif
- }
- 
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index aabfd19f33..42c8fb62ad 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.6/mrouted-4.6.tar.gz.sha256
-sha256  49443c47b5b28a5ab65d796f3495d72a94c1c95e54333cb11fe04075006b576b  mrouted-4.6.tar.gz
+# From https://github.com/troglobit/mrouted/releases/tag/4.7
+sha256  24da2782297dad2727c7b467ce232837f3e71a8a42d15e0bd029495da83abc3e  mrouted-4.7.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 077afac2b9..9f27bfc703 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.6
+MROUTED_VERSION = 4.7
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
