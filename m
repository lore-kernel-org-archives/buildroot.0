Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD192E7D0A8
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAC442109;
	Thu, 21 Sep 2023 20:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CAC442109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9d1XrOGJaIZ; Thu, 21 Sep 2023 20:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9CA4210A;
	Thu, 21 Sep 2023 20:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9CA4210A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E60F21BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE3624210A
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3624210A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NyD0mIpG_zq6 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:16:39 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6337442107
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6337442107
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32157c8e4c7so1393967f8f.1
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 13:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695327397; x=1695932197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YWrVICUwe1T+bJ67lT3uoPsb6PxlCpiNW6KD7SCpMiE=;
 b=RJre3ECsdIkVEzbIv4aSBqDMOjje7uls6zCYk7v319Z/BCfdbHdstAAVAIfWrk/rks
 khkb03w2PIZgyXM09ogWZYtSkLK/yxBI3z2q72s9C1QDAPw96uQNaFd3Fj6aqald5rUu
 Ix8dUbzPSgTnzlulMuwXPxhORNnWmxntKHq4S+bOwre+5z4g2S5/f9K6kx7vpdLGA1gB
 LVbHjbhgl4Qc/+DGm6RWiXQhnGFiBz3uTQGu3tKxbHCoU8NCn7Df9cHhuz+dfys/iass
 EwEbx5mGpjiPw9JeZj1/DGqgrjMOlD2nPWWaeIuU1GRiTHIkf4cRNZv5MSXDaGZO7OPs
 gT2Q==
X-Gm-Message-State: AOJu0Yx3MRETyiY94TCswo9sWBPjCop/ooNQz3A9C0Z12vVB7pbbt9gO
 3kKoD/keqIlr5ZCNZ8K384mr7yczy9g=
X-Google-Smtp-Source: AGHT+IFDOw+RBQieXw7Wik3GTITSDeGrToWI+BRPrkN1e3ledGx+c7bQG7MOUZ25yw20aZwsPqV16w==
X-Received: by 2002:a05:6000:1003:b0:31f:f1f4:ca8b with SMTP id
 a3-20020a056000100300b0031ff1f4ca8bmr5853625wrx.40.1695327396796; 
 Thu, 21 Sep 2023 13:16:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b0031c52e81490sm2619780wrx.72.2023.09.21.13.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 13:16:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 22:16:33 +0200
Message-Id: <20230921201633.635673-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695327397; x=1695932197; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YWrVICUwe1T+bJ67lT3uoPsb6PxlCpiNW6KD7SCpMiE=;
 b=H3Yoq2OwiY4QIeZ8fAeYKVb+8U3C9PHgBdI/D8GWAGvEbH5/ClM+SZpacchthqgf8p
 1nXeVdcwi+CG6Wi/3tatrbixx4ocs3J67JlbXvnzp8Umaj5aAwOEG1FbHJKRuBU/q1Qs
 bUvxNXB63X5BPrFAzUUX699dX/FfXJjHaxMrZ7ackKYWAk409NINxJ3M/2xYfc1U0mOf
 BuJmnCKE4Y9I3Qrz0hjSrG488cJFbvpWeg0B95p/4lq+NqkhD4D+g7gJ1e0fE1Mt13Fm
 7y5tWkbTWwI+rXDRXb/fZrCvZ9rlvfu9ld5H2aVHiRw98I9ctCqx0u73LXNoOSQSPxro
 B2Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H3Yoq2Ow
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: drop LDFLAGS_EXTRA
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop LDFLAGS_EXTRA to fix the following build failure raised since
commit 42f25180233df459cd2bfbc5b9ebf8b95c6b60cb:

/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: stress-crypt.o: in function `$L17':
stress-crypt.c:(.text+0x2dc): undefined reference to `crypt_r'

Fixes:
 - http://autobuild.buildroot.org/results/0c1d2ef59b88ebb3ae10bf8cb986280b4c1283eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress-ng/stress-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index a7b57459f1..24ec4cb515 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -21,7 +21,7 @@ STRESS_NG_DEPENDENCIES += keyutils
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-STRESS_NG_MAKE_FLAGS += LDFLAGS_EXTRA=-latomic
+STRESS_NG_MAKE_FLAGS += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
 endif
 
 define STRESS_NG_BUILD_CMDS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
