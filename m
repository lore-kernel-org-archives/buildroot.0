Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB8BCCA479
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302ED60EEE;
	Sat, 16 Jul 2022 14:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302ED60EEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42OYnn7edMYJ; Sat, 16 Jul 2022 14:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C31860AC4;
	Sat, 16 Jul 2022 14:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C31860AC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23D3A1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1AEA42427
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1AEA42427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJurJnfw_vvm for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 14:36:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C79842421
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C79842421
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:36:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f2so10462333wrr.6
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 07:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6VLPrK/sgY8qsbjjdnEq3plWKWLLW4LSz8w8PIQcpgM=;
 b=zhF3y83ixdfUN9nXITpI+92BMQnQ/2jVskD4q/BTwtUSOzyHp5BspJeLNpNHNPaMjJ
 iJrdZ8lHJn3PwFfWobcNWVx9F+XrvB085ofPMT0h80eaAY445O6Kq1uHu+LCEsXhIfgq
 Qwz+DdM7bqEp2bhpyrSqFuRsdq3hIpXkyjizZ4aXZExRSCX020ZqwuGn+f+KR2OOJOK2
 IO1TxeQXuOHekzxwVGCmixm/qNJbeWGZ7Mii8j2FXibfnHSm0L7aK7tHNw69WOXOq4py
 QT3ZMnW/3BlpdOa20Wi3URfA83RN9H4eKTVLumWDMQbJKmoPOdTnPxpTGlAcRc/0sCtg
 e9xw==
X-Gm-Message-State: AJIora9k4ODMiCZpOqsPzq/qfzuiky+Y33TCNVJE0A3jlc8dsIh7tfV8
 PuL0c+6ciIAPwChsT86bfwgqwYWNbJ0=
X-Google-Smtp-Source: AGRyM1s6hswNDjBcN3yPiADCwuCy+sxIElPoJbYa1Oddf4SeZdQhHN7Uc8Kc+tKyOUS7uTYsclFerA==
X-Received: by 2002:a5d:5005:0:b0:21d:7ff7:fd2d with SMTP id
 e5-20020a5d5005000000b0021d7ff7fd2dmr16535669wrt.660.1657982184558; 
 Sat, 16 Jul 2022 07:36:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003a04722d745sm13592682wmq.23.2022.07.16.07.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 07:36:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 16:33:11 +0200
Message-Id: <20220716143311.711343-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220716143311.711343-1-fontaine.fabrice@gmail.com>
References: <20220716143311.711343-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6VLPrK/sgY8qsbjjdnEq3plWKWLLW4LSz8w8PIQcpgM=;
 b=BBBUdhmMaG3Fno7IOzDpTT0OrmgT/GwHQCZWFTRhtXp4hWYp6AZ5u+23R4jvISSzg9
 Qa3AjoaaPJIrr22BoVBaqXE0XhIMeuoNASPCCvbMZUcz5xrbGrFzlay96zLnNMssJ+dg
 4G7QXoM/ipfT0A6e9pxPDXgAN8m9qw1ZXholKqY9Mq0ertaf2XnOtUdNjRnXGu9uswUK
 yhoANje8UJnF10bCnRIHaekjlcVeyg5tN+yj56jcfMQqpNzwM60PK/KScHyZaKK+ZuEc
 +4lcQlobIRs/2pjRQbWnwcYjYTBBc6TwvPd9/STY1eRx3jerNB4xm/e+at+mbgGtUVCB
 PGZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BBBUdhmM
Subject: [Buildroot] [PATCH 2/2] package/gnupg2: security bump to version
 2.3.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-34903: GnuPG through 2.3.6, in unusual situations where an
attacker possesses any secret-key information from a victim's keyring
and other constraints (e.g., use of GPGME) are met, allows signature
forgery via injection into the status line.

https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnupg2/gnupg2.hash | 10 +++++-----
 package/gnupg2/gnupg2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index caf5dcc883..ec2654be7b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2021q2/000460.html
-sha1  81684626720c91060ae9920936c768df9fc8b2f6  gnupg-2.2.32.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html
+sha1  9255a70a984bfbfa5312a9a52a1cf47cb0d1fc84  gnupg-2.3.7.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.32.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  b2571b35f82c63e7d278aa6a1add0d73453dc14d3f0854be490c844fca7e0614  gnupg-2.2.32.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2.sig
+# using key 02F38DFF731FF97CB039A1DA549E695E905BA208
+sha256  ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669  gnupg-2.3.7.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 0a2cebfab3..7d8424c136 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.32
+GNUPG2_VERSION = 2.3.7
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
