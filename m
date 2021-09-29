Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16ECC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:38:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4918A61439
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4918A61439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2B283F35;
	Wed, 29 Sep 2021 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3swbhdBrQxV0; Wed, 29 Sep 2021 19:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F9383F31;
	Wed, 29 Sep 2021 19:38:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E14F1BF388
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A1B04251A
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qw0kzMaLQV5Y for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5249A42513
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:37:50 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2861924pji.2
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HUqkqj7hvAQFmaUipPGuPxD1K9sH6t3CsI2fmwte5IM=;
 b=JYgm3N5t+JzFQL56LtmcaQ6mjr4gdi1kF6J9JO1+qmK6sNTKBkUhQfF8TAAsYXYbZJ
 5bYvbZLGCErFS1WJ8rnp08mEaHqbyNXuqS7rC+O6ttjENmLYPZD+r2fQ0nk7B8AqHnIv
 87GUx3nS+7pwQhyYslAQ5BxDv0dqsElDW+b6zQQP+zR4ys6nNI1bT0KTVQoaUEMnMbN0
 M2nLGULjXMcSMjQcZXH+/n0KDPj/GvXuDMViiMkkW+s9NqW+Hii3XQWIxkMkxnKrqvDU
 2lqhSfRtbcJx8ITdIhaKsRts5+4PwcdpIt2Q3Bq+fMh1w9mRFC85KxyGEH/WmQDZ5dsa
 YUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HUqkqj7hvAQFmaUipPGuPxD1K9sH6t3CsI2fmwte5IM=;
 b=2AkaKIjWMYP+shEX5QGcBLQNaDgqV+Yb86JEcQEKPH6jgwIog5Pj8DptEjM5czVxNp
 POFLok6SqpxYFA3M2alPvyBF64Gn9PBdUUJFYc/nnqad8ALaWhS31R8eGn7L9MnAhAFz
 B7BpkDnOI5/XIFGz5I5od4m/qdGGkrGi9V6pRVJdfydAOuuwHO1FfrSHyKrC14owGJr/
 Ti/g2xz2T1qhA6Farzr37akJFBMxU43TUT4pkVoaoXVm6LD+XQobfUWKKxV92vcpRWYe
 IJpP6eD65DaNC8mkjtFT784II9Ki4P1Vj70Y5Al2bVKXjIWLe+2oiyWM6eXa9XxQ894b
 OlQw==
X-Gm-Message-State: AOAM532ZLyALLo8jD/9zZjBHAbf9m2t98haBm3kEGwFN7jeAzbSol5V2
 0xDcSF78Buku7m0kmxeOnN/Q37Ebhf4=
X-Google-Smtp-Source: ABdhPJyNeoj4faw9/1r8sPuGltqEnvxbkKHQxWykMXJ/Sgpb2YBbk64IHyw4W6voXSm7LMike9/yDA==
X-Received: by 2002:a17:90b:4b0f:: with SMTP id
 lx15mr8316184pjb.126.1632944269642; 
 Wed, 29 Sep 2021 12:37:49 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q12sm440211pgv.26.2021.09.29.12.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:37:49 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 12:37:41 -0700
Message-Id: <20210929193742.1410522-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210929193742.1410522-1-aduskett@gmail.com>
References: <20210929193742.1410522-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/RFC 1/2] package/python3: Add bzip2 option to
 host variant
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bzip2 module is needed to build NodeJS 14.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python3/Config.in.host | 6 ++++++
 package/python3/python3.mk     | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..c1e061596c 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -7,6 +7,12 @@ config BR2_PACKAGE_HOST_PYTHON3
 
 if BR2_PACKAGE_HOST_PYTHON3
 
+config BR2_PACKAGE_HOST_PYTHON3_BZIP2
+       bool "bzip2"
+       select BR2_PACKAGE_HOST_BZIP2
+       help
+         bz2 module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e88bc0ff4..779f6dcb6c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -43,6 +43,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
+HOST_PYTHON3_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
