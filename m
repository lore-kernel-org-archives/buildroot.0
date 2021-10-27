Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88153C4332F
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:38:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1B5610A4
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D1B5610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D80FF400CC;
	Wed, 27 Oct 2021 07:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HwKVjyHb7GH; Wed, 27 Oct 2021 07:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12856400E6;
	Wed, 27 Oct 2021 07:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B01CB1BF580
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A06CF80BA4
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTSl0Sy_eITq for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 07:38:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0EB180B94
 for <buildroot@busybox.net>; Wed, 27 Oct 2021 07:38:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g8so6918225edb.2
 for <buildroot@busybox.net>; Wed, 27 Oct 2021 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q1uTiqYsV0zgIqSY3N+XfNk3bG9ywUykt59xxe/XSPc=;
 b=VfGdMXXLSJXhNeZu93xQaXP7UzoDFDYqrikfC8NI4PTHxvkB37qX747DcCRefZIUBB
 +rpXnOThVvnb+7Egf6p0qMajG3GR8Ug2FJQOzU0SINos2PSX5ypXHIIgtoR2HXmNSkyz
 y1MMXWOOcdhI52Na2KDTFVDalIVFTAT7PAWR88brnAlAO8/AMK9wlB8Kli2JJkHF49zm
 EU6jikJuWgDWIoWQcv4ymHMec+C89yUpjhjlG4oqPfekmjG4M2vGIzyaYIBhSw1gkzSf
 GjhsWhTW1lsqAu9kRmm0KguxTR3YwVWVozOM5ex1t3Fk9g/PEtfxKY6/NgbzS9Ttyzn8
 Q9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q1uTiqYsV0zgIqSY3N+XfNk3bG9ywUykt59xxe/XSPc=;
 b=ilHlJDgHCej6qbO0tmjNRurJz45C6W8v2W1/PGRxyD4rVa7oi9B9snSWqLPL/thYbw
 KJPxnndlgi+666eb8jNQNVrbkccjqEmw8KXSZDpt4fc2HSjl0dRNVYtX31Vc6GDBWiyc
 GYZYF+Bki96VwUc5SmQxv0rLl5wlnJnMtQ6722x0pryB6wb/8yjkSKLqD5WMYJfeaBZ5
 yJWThGFd/mC+L4HVtSAH520bJiEOdQ/XT6b3egwRwdU04lAzKKEAsG4QhKj5VJa0jGGP
 ua0oJOic8MqOk6BJSb0buG/dDIRoJgiVC6BQqfwBWSVrAfiyuEGg01a0ev+jfXazukAs
 TArg==
X-Gm-Message-State: AOAM532R2+h4Itml8Y5VfMDdfhxIE42Q21CIG6JeeXSZxeq8mccnVjvY
 lm/WWewpu/Pyj7+CduJyPmQ6CAJV5f4=
X-Google-Smtp-Source: ABdhPJwgbsW7aXW3NgY/7aSjBl6lDCXEjnmndkX08nRqAvdmSfYh5OtXkH3USaBLcjGw3IdS/NcOHg==
X-Received: by 2002:a17:906:5017:: with SMTP id
 s23mr8838952ejj.546.1635320331989; 
 Wed, 27 Oct 2021 00:38:51 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id s12sm12091405edj.82.2021.10.27.00.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:38:51 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 27 Oct 2021 09:38:45 +0200
Message-Id: <20211027073845.1345702-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/moarvm: bump to 2021.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 44c54e35b..01e3ee4ae 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2300a921d504c9d33f111cbe08097d0011bfb06000c018b8d4353d97966772a7  MoarVM-2021.06.tar.gz
+sha256  7f3487a70e8b77be0e4e2f12b14c49f6a01d0378e0940c86958c9016c495ad75  MoarVM-2021.10.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 17b2a234e..99e26c73c 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2021.06
+MOARVM_VERSION = 2021.10
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
