Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3ABC32771
	for <buildroot@archiver.kernel.org>; Fri, 19 Aug 2022 15:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAE4D40FDD;
	Fri, 19 Aug 2022 15:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE4D40FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNzwcs8YJiNX; Fri, 19 Aug 2022 15:19:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE1C040558;
	Fri, 19 Aug 2022 15:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE1C040558
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACB8E1BF5DB
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95682842C8
 for <buildroot@lists.busybox.net>; Fri, 19 Aug 2022 15:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95682842C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id se0joEmOnXnv for <buildroot@lists.busybox.net>;
 Fri, 19 Aug 2022 15:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A197842A5
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A197842A5
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 15:18:28 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id c20so3543771qtw.8
 for <buildroot@buildroot.org>; Fri, 19 Aug 2022 08:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=m52bk+rFKCE3TuFqXYYLofh4EPUmQvwrrKUyqOMu0EM=;
 b=fU9hPiXVwpEfZr7aD8yXBaAW1YDFGhzwzIvxr4CjWCpoOwlEZFJgZRFae7uYxUGe1i
 FokuV51F9EZPpYYux0ToUmYKHAP/VSuZpxUcOrG5Sqsi1QKcX9nDmE74As4KE6nbsz/y
 Qit7sEtbHTn1LJa1gnwpRes3W7qbajOu8LYGvVHjYxGCgPJyy8kSfVBCqrW+/2DlfCQv
 0CZsE/+z3N8oGak2sXm8YjpPInlwkLsd0Cx+s5Wcglg4adEFLRDTSMXpijlCSbWxFMtq
 ijBcf26j/nEqyRalI6LwzNgTwO9Cha2IXebl+j1TcVpkGuHMtse0UDikCWXL1kdacc7T
 KADw==
X-Gm-Message-State: ACgBeo2y4W1O9YzlCxW0zldhiIyrI18WdzyuWKJFUDg2v6isrtXxlQiL
 mkWy416rrkrVrkUE6IgFQljpMHxHPPsdLQ==
X-Google-Smtp-Source: AA6agR5UkVUNpoP+kn1oOlGOqGIlKNkIQ7PhAKmgOubrfcmzFPhdvNZpVcaC2PBTltO5b57MKzKwxg==
X-Received: by 2002:ac8:5716:0:b0:344:540b:d118 with SMTP id
 22-20020ac85716000000b00344540bd118mr6956155qtw.68.1660922307754; 
 Fri, 19 Aug 2022 08:18:27 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 br38-20020a05620a462600b006bbc09af9f5sm3368907qkb.101.2022.08.19.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:18:27 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Fri, 19 Aug 2022 11:17:32 -0400
Message-Id: <20220819151734.926106-8-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=m52bk+rFKCE3TuFqXYYLofh4EPUmQvwrrKUyqOMu0EM=;
 b=AOm1e+K+k7cVh2a2w6j7JZk0h0CSUfrDWh/ZNMKDNc7b85bmB8h9Xg8ddhQm8ZsNW/
 Em3D5+gdho27j/mNbwDq4Dfw0turw2ff5A2eeJl7NhdCCLPyIry4RZb7jpSbmHl+UR6d
 lYoA5V3zKJ4HE82wbYbu0rUIB1edS1/YWkiaTYoloXxNlgK2odbE/+/hcxXuLV9+Zes1
 maZsNtT1lw769IkP3qMcPEIJMb8pjyjKBSsFTe8DsOPGYdyVAfQEA3nCNGl9DSHUtPTp
 bTdyR05XJCwiX5wAd8vTHNiCnSeFmXHocg43S4xfQsSP8mJq8hUVn6j6OPMjgW+R9dge
 2oXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AOm1e+K+
Subject: [Buildroot] [PATCH v3 7/8] package/uclibc: enable NPTL on no-MMU
 ARM w/ FDPIC
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NPTL is supported on no-MMU ARM systems if FDPIC binaries are used.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2555487f06..4ac47df579 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -76,7 +76,7 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU || ((BR2_arm || BR2_armeb) && BR2_BINFMT_FDPIC)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
