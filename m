Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F7EE6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2C960727;
	Fri,  6 Sep 2024 18:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwvbpoE7nLP5; Fri,  6 Sep 2024 18:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E4F60747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E4F60747;
	Fri,  6 Sep 2024 18:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8B91BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24149401D5
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcs7Vqu-GHXU for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A580840151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A580840151
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A580840151
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:06:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82a245753bfso96061139f.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725645960; x=1726250760;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V1CEzVsyVsfi2ige+bf1ymnAYUA2AaopLWGxgdsapH8=;
 b=lDOqrmrAbIzWeL495A+jzRfHgVpDNlL897+qhcUnz9+w6D9EOdJdTS4Uk6tsRocY8G
 AUtLHE59h4BuhoC6MjowR9uY61R8cBuvX6lkTx9D76uuD1yhAaGHtOTtdOsX9lqsAktT
 p86LOM18EQNN35/1LpLBwbEdJYhbkfzSVoABaXK0BTLt0Gdc+yXaygSqZpbcgSpnaDG0
 hnk/juA97k7BkzaMQl2is5yV/B6Im+tuAzEZaqGgVX7rPBWfxmNPyg4vq2IkV+QXtgp+
 WrqILqorH7pTyTxtknmhsm3lbj30fDXnFth/M1q1f1VbypXobWmrJy2H7cgwwj9PJOQa
 AMmA==
X-Gm-Message-State: AOJu0YyE0dtLYsB+h1jH8RSSdRwQ2SD66mn1Asx7zFlp8mX0qzlgUI3G
 W4aduTDcrAesdH3bAeJTqqsaFr2dVNHqOHPbQWfF4jHwNEFSpkt1RAzk6g==
X-Google-Smtp-Source: AGHT+IFNrhJ0EBMQPDzGF9v5Dh4ZvPah4WfDvzPb4KAW+pqyfme62DgUoLxpMRnYMzt8ffQ7w+cPxQ==
X-Received: by 2002:a05:6e02:1aaa:b0:3a0:455a:3884 with SMTP id
 e9e14a558f8ab-3a052399c25mr27413065ab.22.1725645959588; 
 Fri, 06 Sep 2024 11:05:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2dcdc53sm4242413173.23.2024.09.06.11.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:05:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:05:57 -0600
Message-Id: <20240906180557.3920418-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725645960; x=1726250760; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V1CEzVsyVsfi2ige+bf1ymnAYUA2AaopLWGxgdsapH8=;
 b=LjQ4FEZ5Cuz4xv8hkp3YmpVk+Zpv/xVB3s5tWeEln6lHLT/yACkzMJFMTkEpHutuyv
 CvDMItF/bjARi5vxYyG3BZ5N706zmSo/JHZFbANpa15ebWL1lo/gOXSucAIMoYon6c+W
 caZecPEFsObPEMRXVKOP/ihZGuUhglaWegujh/Evk0FvCioGJAfUolRofQcThiz7Ob69
 LCNa7LSTM4GmsNbl6Ks/T+O2fCAiZUCahHETslLNsOIN6dSUXagDV+3DxBuTqn1AA9UQ
 l98E9DT6uFvok0ie4CYiYFdFaTYCXNW9b/xxIADSun7flJjcG13NASdE+nNV9GCGO8q0
 wnlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LjQ4FEZ5
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.114.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 2be006a97d..061266cd6d 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  32df7b178fb59e180d34729be33d5024  fastapi-0.111.0.tar.gz
-sha256  b9db9dd147c91cb8b769f7183535773d8741dd46f9dc6676cd82eab510228cd7  fastapi-0.111.0.tar.gz
+md5  02d748d7fbc4a8e474c13471bb441cc1  fastapi-0.114.0.tar.gz
+sha256  9908f2a5cc733004de6ca5e1412698f35085cefcbfd41d539245b9edf87b73c1  fastapi-0.114.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 262b166907..b6332e9de5 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.111.0
+PYTHON_FASTAPI_VERSION = 0.114.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0e/1f/f4a99e92c583780787e04b05aa9d8a8db9ec76d091d81545948a006f5b44
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/20/1b/fb621a3bab915ac1c9ad06943eb5a2b2aa01cd63228d524bd45261278787
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
