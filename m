Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAE7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B2E60EBB
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6B2E60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A99402AC;
	Sun, 24 Oct 2021 23:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjpH5EdVKVT0; Sun, 24 Oct 2021 23:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF14F4023A;
	Sun, 24 Oct 2021 23:52:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA7F1BF3C4
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E7C480D76
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-XFdsCg4AL6 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 23:52:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E196C80D73
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:52:18 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id s3so10991898ild.0
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H4L3PEkhxXs9iH7q+SS1Y6yoeso3XZRl1fs5RdFfaPo=;
 b=bUzPN2JGV95nltTJaEFBuVLr0c5bv2NXAwZzV61WqSwkbnl0s4UyjrhsaDi0Gepa6s
 6EJF2CMbRvnadprFQ95SFq57rUr8bgXTA3rfcTryJqdgCejKUOi2TNDlC+aRDHkPRMCu
 cXXLPTnaFv2P0QUX8m/IaT1NLBMV1GtH9WTRD0DmdKV7PBOOEa63tnJAc9RcQC7Xmqu4
 ZLwRBcIKzCYsFGT8RCzSHjo2cw7vbyyiiNx4b8DnA8Sr5IhmcEM74YN5tIm0V/Kk82hS
 Bynh/KjUyhZdn86FC5wRw6G6zrjT2qbcA72RcgSxlgplLMekBU+fEKY1PmP2Y4TiunXA
 HglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H4L3PEkhxXs9iH7q+SS1Y6yoeso3XZRl1fs5RdFfaPo=;
 b=KjPkaOSFld95jvmjf9dN3GMjvCrSSJpj2i67bAb4NRme0j3WHuq2T+gM7qdvlJ2Dt3
 /H5QM8mUZTcknZuK5I5WEkWrCZOKAi94qbQYCpdzPZ+XEz/kHLBurzSxETKKlJuLmIn+
 aq/UCFogxN+TJRgpAs+Mm6hpp4zkIGEub/xYpnxbsbGzt4VxGq0qDugs+ursylD5K1p6
 ok/MKn3P3m95IAemWmtkh4M1Qeft8Wp74PCpLB1J+JnBPVtMwfvUt3UbroCJhcmF5D64
 5VbT/YfhnJ9hvnGRNZwOeNdJi0UD5/FEqto6iRcpC5ZCn0Hg7MKQDvggjk1F0RNOXtht
 YqgQ==
X-Gm-Message-State: AOAM530PjQyo08hWbKLGXMqZrICEj5UUVnrdAvpV2zNc7dvi//2wpvLf
 BlaxIIZy7BguTGnECnvG5Qz9bNsfbfc=
X-Google-Smtp-Source: ABdhPJxPJIPveLvSe3AYCpeK0/fEcixBXtx5k67F3Ln24sAbsOIvOzyFS8F5mmvTmrhLOZGZa7yZMw==
X-Received: by 2002:a05:6e02:180e:: with SMTP id
 a14mr5158500ilv.313.1635119537912; 
 Sun, 24 Oct 2021 16:52:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id z5sm7566867ile.42.2021.10.24.16.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:52:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 17:52:07 -0600
Message-Id: <20211024235207.2139485-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiozipkin: bump to version
 1.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiozipkin/python-aiozipkin.hash | 4 ++--
 package/python-aiozipkin/python-aiozipkin.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiozipkin/python-aiozipkin.hash b/package/python-aiozipkin/python-aiozipkin.hash
index 356d83786f..d1563b20bc 100644
--- a/package/python-aiozipkin/python-aiozipkin.hash
+++ b/package/python-aiozipkin/python-aiozipkin.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiozipkin/json
-md5  0e98374ea561e4e4e589ffabc0ba6471  aiozipkin-1.1.0.tar.gz
-sha256  bf46a065f87ba51eeb49fed756e285c7faa560f89e0c7ad4bc891d5ae4b5364d  aiozipkin-1.1.0.tar.gz
+md5  0fea8a200ab2a94fe9a2340a8cbf8512  aiozipkin-1.1.1.tar.gz
+sha256  9b82619d9ef309e72627a81ab3fda0c9b83e530844cf59f2e9a011e9a2a1293f  aiozipkin-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiozipkin/python-aiozipkin.mk b/package/python-aiozipkin/python-aiozipkin.mk
index 37812f2752..06ea9ef1a4 100644
--- a/package/python-aiozipkin/python-aiozipkin.mk
+++ b/package/python-aiozipkin/python-aiozipkin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOZIPKIN_VERSION = 1.1.0
+PYTHON_AIOZIPKIN_VERSION = 1.1.1
 PYTHON_AIOZIPKIN_SOURCE = aiozipkin-$(PYTHON_AIOZIPKIN_VERSION).tar.gz
-PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/0a/46/5f328fb8163163f0d4401a1c07585cdf567e56305cb12ce54c9bb62e3f74
+PYTHON_AIOZIPKIN_SITE = https://files.pythonhosted.org/packages/f2/fe/26a60a7c9e91c968eac5dacab2948ed931a676880a6878695ff281c72b8f
 PYTHON_AIOZIPKIN_SETUP_TYPE = setuptools
 PYTHON_AIOZIPKIN_LICENSE = Apache-2.0
 PYTHON_AIOZIPKIN_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
