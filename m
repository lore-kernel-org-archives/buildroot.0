Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A30C021A6
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E24F40D1C;
	Sun, 16 Feb 2025 15:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4kbTRkqgHye; Sun, 16 Feb 2025 15:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C052F409F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C052F409F5;
	Sun, 16 Feb 2025 15:35:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F9DEC8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83E5A40D3B
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfYL6JQPVMqm for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B6334095D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6334095D
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B6334095D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:06 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-868f322b8dfso1819833241.0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720104; x=1740324904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYx61NB7PEiisTdu/39iMBOmfV/9KFUZDbgoSh0X6f0=;
 b=pZWuOiGF8VnO8T1rISS6nSlIkC9pEvKkeBFF6TQlxcwLDh0A9PGAIjZHlItCGhJeH8
 WzIqV4pyNOw+hVvTAdyvzXytnAsDPaA7g816Hravj3pmV46SPEM+UkR3zuzN6AT9PQkf
 MB6n9WRzukIe86texmqnYAZAuCrmyQJ/r8Mi3oymdrYW9dFJ1nBlF831ENkr0OaIbdXT
 kR76Bm1gM14KKQ6ePqJ7F9ri1hOlc40vc3B8QB8IALDYmPxxPtW6m9thQjlV2IrFL1D/
 9OXU0OUwi3F4+HI8jbFtSIh4L+8NU1LU+27uzO3pMLEF4o9SyAfozVqXf+UMd4B6wIrx
 q7Xw==
X-Gm-Message-State: AOJu0YwLr2GW5RGHgvDCh8giyk2zwyjO94eB7JHcHxFj6YqZvK79mbta
 Mf47iKj3CNE4GN7gKs1KLv5DMG0+VwFULb+RHHfc+j5o8V1/xYL4XMMJxqzh
X-Gm-Gg: ASbGnctOyVNQkjI9UyR/iv67ZD7oonMSsP3+JNf7mNiKldzfQOjU80rqxcRM8PIm5ox
 U55wKsLLPPzL8J/t4s/yozJyx/pEKD7L8PDEOUgi8XVQ1YUKIN429JQqLNfZ/Uwdc7m75oarnsS
 tTfMGEVsTvUybUGSaeGAGthGQHQK/L4pOJetT507+uoqlCfRwLTodqmVKZiCD7Z//Vdz3e46CEe
 H8OXt0l1wUy9dg6A9cGKCQRBbT5v/grmRPcKqSkGIMCArTWOt3j20GZEaYelRxbFAi5VRk4LWEG
 5ZhFqFL0lZITsHeU9AkBp/friGA1U/3kGBTl
X-Google-Smtp-Source: AGHT+IFlZcK8W2VPAprOdKeEBm2i2hjJikepiTjE0hcNgdxx+eBEWDUOj/BI/9SAEHoAyQtYXpL7xQ==
X-Received: by 2002:a05:6102:3a76:b0:4bd:379c:4037 with SMTP id
 ada2fe7eead31-4bd379c41f6mr3572597137.9.1739720104509; 
 Sun, 16 Feb 2025 07:35:04 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:03 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:37 -0400
Message-ID: <20250216153441.2706067-3-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720104; x=1740324904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYx61NB7PEiisTdu/39iMBOmfV/9KFUZDbgoSh0X6f0=;
 b=YgsmuzRTPhQrbR1aMBNzYOBi5i4WdGIJf4DAfW9nuwsRxn6WrCMMtOPQPwCPb8NVDK
 79WeLvFji8shjgWb8XkbuUOqmm1JYmTqMTA1l1116j75dbdC9U15VqKUPNLTIaq4F7PP
 0kIdAdPONzp96o8FzcZS1T8Tu7Iw0qcm+wg2dq0ObWuMc5qkfzvnVMaRl+yH5XNPDW7x
 VdRsUQylRyg2EK4zISTWH+KRp52PLd2x2xwK86EQFoaQB0cSnZzjPynczUCSvB3Nfj4Q
 RQVJs6i1JCVGlFPbtggrtOWsmKqaX1SW1zt8eaGGZEmnktKHMDilo33g8hG2eDvoi9zm
 yZ0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YgsmuzRT
Subject: [Buildroot] [PATCH] package/httping: bump to version
 ffb9201042813c58d020df41697f6445df96f438
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

Use the latest upstream verified commit.
Also fixes multiple issues like:
https://autobuild.buildroot.org/results/fe33a0d9cfa242cbcda0c5fb759b84efc6662097

that were due to the usage of OpenSSL deprecated routines
(ERR_remove_state and ENGINE_cleanup)

Results from test-pkg:
$ ./utils/test-pkg -a -p httping
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: OK
                    bootlin-armv5-uclibc [ 4/40]: OK
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: OK
                      bootlin-armv7-musl [ 7/40]: OK
                bootlin-m68k-5208-uclibc [ 8/40]: OK
               bootlin-m68k-68040-uclibc [ 9/40]: OK
             bootlin-microblazeel-uclibc [10/40]: OK
                bootlin-mipsel32r6-glibc [11/40]: OK
                   bootlin-mipsel-uclibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: OK
        bootlin-powerpc64le-power8-glibc [14/40]: OK
           bootlin-powerpc-e500mc-uclibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: OK
                   bootlin-sparc64-glibc [21/40]: OK
                    bootlin-sparc-uclibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: OK
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: OK
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: OK
                      br-arm-full-static [30/40]: OK
                   br-i386-pentium4-full [31/40]: OK
                      br-mips64-n64-full [32/40]: OK
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: OK
                          linaro-aarch64 [37/40]: OK
                              linaro-arm [38/40]: OK
                         sourcery-mips64 [39/40]: OK
                           sourcery-mips [40/40]: OK
40 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/httping/httping.hash | 2 +-
 package/httping/httping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index e07f3e32e0..a55febb15f 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bf8641ebc44a6fa52086f82c60a29051e094424996d972263155d267c96d305  httping-0e26c53d5fe504eb7204d64b23513729aa4a5bb0-git4.tar.gz
+sha256  22c794df06a1c680e923891a445a3745fc88e01b24854af1be8457a37be19fe6  httping-ffb9201042813c58d020df41697f6445df96f438-git4.tar.gz
 sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 8cb4f7f2f9..3759f9fb76 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 0e26c53d5fe504eb7204d64b23513729aa4a5bb0
+HTTPING_VERSION = ffb9201042813c58d020df41697f6445df96f438
 HTTPING_SITE = https://github.com/folkertvanheusden/HTTPing
 HTTPING_SITE_METHOD = git
 HTTPING_LICENSE = AGPL-3.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
