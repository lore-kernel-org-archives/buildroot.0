Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AB9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7622061A8E
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7622061A8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DCD60759;
	Fri,  1 Oct 2021 22:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahi2jz9yMhro; Fri,  1 Oct 2021 22:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 634A46071D;
	Fri,  1 Oct 2021 22:18:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF30F1BF3EF
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC20A42651
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VfZuVg6mJU7q for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 22:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB79D4263F
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 22:18:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so17584151wrv.9
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xH4b7gmkzZhOaO9IY6fxrKkyqJw9eSKpB8yufDwdayw=;
 b=BPVeKNJPCB5+katOV8f3RaE3Ta8E8F3kAt64JJXRR7zLRSrEjETHeqHU5bSVxx57R3
 /fU5Q2vn8LRM9bVPEfjX3XfrnGgGioe5OJ32WtkLEAbv1JoPXN8oy5i5HRpGw9t6kaX4
 lcbVAi1ALADRaGDrY0Jvzbu+ZZCa2eJZk/3sbsQ2xmvMNwOhXsALOADzty12/x7MuJI1
 qWeMtIxzi1Iqu9eIK1XlIfItxj/2Fe2slmp9JlCa9bzUu6xOtXc+OnXvOy+axjYpRIzp
 LtRiseO8PjF66fnJC4W7itSvT1mDYqGHE1y+SpAeBtTbrve77kYbVwXd616FYx2QGC2k
 9pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xH4b7gmkzZhOaO9IY6fxrKkyqJw9eSKpB8yufDwdayw=;
 b=kIcJ7jM2C8p82Mtp2dIzn42RbOgJW/W3xRuJaJjtXYdQbSlBK2k7psnPrpaSqB98Gy
 Q9eVcht020Cdlo4jX6yU4QMvZI5/IV6jPJn6tNrACRkkUzc4QoDM5k4BTb8xoRV+b35C
 wjVT+m99eSqxGS+J8ucax0gURWpg4tkfN7mdZr/CConG4K+SSufRcSo5d0UQ6iR7VZOi
 X1jPP4m5KrckyZK/kG04ZOWjsfvCmxMVAy/g7RPq9H6T8hzJ6399ZyNC9sAIbKGTYQ8h
 5mRAAuzH2vvesV4Br3PLBFC9xyfTzTZ+7/Ai3oJvYTeR/vVLuWgwQAkyoE4Kv+1mh7Uk
 /c4w==
X-Gm-Message-State: AOAM533OAyVBX8AVuieXlXILLYHiYApo+za0cPFS1jkstCdXQgFIrOpM
 +UNCjsD64djCvF6vC2ztO7dcL504Iy8=
X-Google-Smtp-Source: ABdhPJzxwR0+M69dSXmTPoKohSW9wpQ1ndUqA8rKFGYoMxRgRjl9BN9M5SOBm36E7fFjQBLL9QfXSA==
X-Received: by 2002:adf:a2d4:: with SMTP id t20mr347676wra.229.1633126700745; 
 Fri, 01 Oct 2021 15:18:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id a8sm7031630wrp.61.2021.10.01.15.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 15:18:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Oct 2021 00:16:54 +0200
Message-Id: <20211001221654.3087199-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/supervisor: bump to version 4.2.2
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

Update indentation in hash file (two spaces)

https://github.com/Supervisor/supervisor/blob/4.2.2/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/supervisor/supervisor.hash | 6 +++---
 package/supervisor/supervisor.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 98a03aa1be..f6e9cf97b1 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383  supervisor-4.1.0.tar.gz
-sha256 7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
-sha256 4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
+sha256  5b2b8882ec8a3c3733cce6965cc098b6d80b417f21229ab90b18fe551d619f90  supervisor-4.2.2.tar.gz
+sha256  7b8dbd54ab1543b07b2fc5f6f5ab50d89d26c1c4952af93a579d8c52c56b8de4  COPYRIGHT.txt
+sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 92e8323080..ad34c031e4 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.1.0
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
+SUPERVISOR_VERSION = 4.2.2
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/d3/7f/c780b7471ba0ff4548967a9f7a8b0bfce222c3a496c3dfad0164172222b0
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
