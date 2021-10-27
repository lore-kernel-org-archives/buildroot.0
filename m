Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F7FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:38:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383C8610C7
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 07:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 383C8610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09A2640140;
	Wed, 27 Oct 2021 07:38:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1eFBv4CF11r; Wed, 27 Oct 2021 07:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFF540107;
	Wed, 27 Oct 2021 07:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF0481BF580
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B211D80B76
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 07:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gl7nZfGj0s5r for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 07:38:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14CEB80B6F
 for <buildroot@busybox.net>; Wed, 27 Oct 2021 07:38:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g8so6916429edb.2
 for <buildroot@busybox.net>; Wed, 27 Oct 2021 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MveiQM0eGAPK/gIuGW3ObAJTVAaTIu1H+kIuPRkLgVU=;
 b=ZOtRrd0ey1C2z8AmytbWz/2OLWaSR7hji5oInbxBoxryQInv6XvtC4pdH4VbshKS9p
 suMRqp2UHUUc9C+LFDRzJt1tIPPu9AIdnN81nKLikC3EMR2wD9UOnxAdnrJkXhe14ebC
 17Kck4TCAmwAW7dlVDse9mdkWuDVkoDQFnefeIInNNTrFEwKaneKzNot0F86YpoV1hI4
 dNK+i7l6EqdBKxLbPNB987T+gG6KO5tCqfh/sNB0b54Nbj43W0BJySCL4EdkomkNXgsK
 kfnqHq9/pTfBD2mK+Mu/QkX2iGRNN275UoaxUdEFKXH7zHYmwrGVdhiPDyFMsItLgf8C
 qx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MveiQM0eGAPK/gIuGW3ObAJTVAaTIu1H+kIuPRkLgVU=;
 b=yvmhsR6X7X1X2nC4ywAJu6lM6j813f96o/LIj4tJ9QZ1xyaV/VIEDshnIQ14E7DDDl
 /gOrjSFf9AA01hhWlfdvU8k6FChEERA6xevJdY8ApUSwJPJD7bchtFhQcP0sYYWddcse
 JL2XcjIR2qfGZNoJ5AMnaPE2dmG6nInb9cGKVo5RwuA1oABV6+XN92R1Q6thuPXIhXhb
 rJg+/3Njpo3xImTHlC4g5qmuor9Qgo6lnPVhH8RTdVLKU83siAtefHG8OZ97Yq7cN5gS
 iY+Nzj8LHTy2kTUqk4OmXhXQHphw308q/MIdNd8L4699AFwLtFx3PbXShpgFYrcoxMRA
 QF2w==
X-Gm-Message-State: AOAM5304mxrCGuRkk3vizZeLreVynOtY6hG9GrYmWERhfTEycVRo1YOz
 ENUJv4wb/b/bFbk04HnN4I1GoTin6xs=
X-Google-Smtp-Source: ABdhPJyzNecCue79m06f0qSoDFkcYvqRQEame6oJ22pWGg03rnXZs82NscfBjFCr7CmNh96MxvIiYw==
X-Received: by 2002:a17:907:7b8d:: with SMTP id
 ne13mr36880326ejc.269.1635320321686; 
 Wed, 27 Oct 2021 00:38:41 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id k9sm2495486edo.87.2021.10.27.00.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 00:38:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 27 Oct 2021 09:38:35 +0200
Message-Id: <20211027073835.1345648-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/janet: bump to 1.18.1
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
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 3e48509bc..8e78d9a4d 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ed9350ad7f0270e67f18a78dae4910b9534f19cd3f20f7183b757171e8cc79a5  janet-1.16.1.tar.gz
+sha256  bfc29c11a070cc175666f74eb99ea992276d6e269701ba9558a72cef05ac80b4  janet-1.18.1.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 1d396285d..20917ec8f 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.16.1
+JANET_VERSION = 1.18.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
