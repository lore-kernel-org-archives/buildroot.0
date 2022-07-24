Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A53C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 06:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019D841812;
	Sun, 24 Jul 2022 06:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019D841812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfNaZyGd4xAl; Sun, 24 Jul 2022 06:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D3941752;
	Sun, 24 Jul 2022 06:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D3941752
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9DB1BF588
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECA1583E76
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA1583E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1zIjE7HJ1Wwg for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 06:33:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01F2C83E5D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01F2C83E5D
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 06:33:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4590761wmq.3
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 23:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3jBFMbuRsvZRyEg39GRCervqZk4ZiAFnwVmC93SF68=;
 b=qoEK1sJt4IdOPsTjPLJwaro15qCUdTmKVPeWHDv8u6MoBDCVcO+pILCLdDxkW4TzfE
 R7XSG2XHMJ43L3Qd/I8Q4lN7FX4Hyi6ZcR5eqTfVJCDpTIM9LLYtAb420/GLxeaWrH3w
 CnBkeYNOw74wWHnmo0OKE/j8vGyjieP33Ca1wA3NRI2OmtPTtzZWupPZC5toVUR5u6Ka
 EllP4Pwa/dGB8bOvVUd3d93FXZUjJBlQkebIb4zS8HTJi38NxOhMa4cxeN0lmCeOID3z
 mE95fPFauySwhXGtWUqoFw30xgN7N4jyCZCM5PWbuTUh97ZBk5k1UQVF72jrwp8eydjV
 C0VQ==
X-Gm-Message-State: AJIora8IarxyI3+oM59am7fIZHxvyjHCAEPzZOQusf45x56wr54Lmyj7
 Cg2+Tq8YS8EFFCiziWiLeXTdBb6Fb3w=
X-Google-Smtp-Source: AGRyM1uKLLPMDPbaVt53VbyYTvDBgwA0CcKJvsOFWnNdIpApjUnfPyvBtqBO+K7tmdnKyJ6XXtQCxQ==
X-Received: by 2002:a05:600c:4f05:b0:3a3:18ed:6cda with SMTP id
 l5-20020a05600c4f0500b003a318ed6cdamr17587601wmq.34.1658644400936; 
 Sat, 23 Jul 2022 23:33:20 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b003a3199c243bsm19091475wmq.0.2022.07.23.23.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 23:33:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 24 Jul 2022 08:33:18 +0200
Message-Id: <20220724063318.3305458-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3jBFMbuRsvZRyEg39GRCervqZk4ZiAFnwVmC93SF68=;
 b=OAlL7/h1qPPJsNWfd4RV7Y6ofzU6PQm6BDKHwp3VQGbI8tfpuYIBFPfjV3e4xPFinc
 6uP/D1er6NLiLA18u0XQthmacledFC3RD8c9o60Q+DfzKUxBYOq2QKj9lYJcRv80W+Ap
 H7bUfFGpeOTX1cIGgv8dQGGyLOT/YzhVyQln2Fx9GMta3ZoUom9MgYYVOIQaA0/2oVxZ
 xP5Wx+V4g+tCRChXiT1V4Fb899n7LqPgRwu4KPfN9NuvHhLVW6an4pWrCUehh/comBrv
 BYlho68h9tDxLW2QoKMUrXrsdKn+8f9147KjzmqydKqVzbVk3KrK7yA8OCQwkvUU9+Lm
 AxDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OAlL7/h1
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.2
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
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index c7234fd81..f5402ffdb 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b8f4bf73d50d3dc0e2e7343f03df7cd07ad169ff66056d5c392215662b1f8fc8  open62541-v1.3.1-br1.tar.gz
+sha256  7e2a47ee6c6e5e7b9a9c803ff717670707d040710bb65d2615c0df33a614e629  open62541-v1.3.2-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 5f46703c1..0551c3bca 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.1
+OPEN62541_VERSION = v1.3.2
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
