Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D6C47073
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 07:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 201F260ECE;
	Mon,  8 Jan 2024 07:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 201F260ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqQCwdkk2nXk; Mon,  8 Jan 2024 07:26:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5555360E86;
	Mon,  8 Jan 2024 07:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5555360E86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2C11BF580
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 664F160E86
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 07:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664F160E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoMxASWje2vc for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 07:26:55 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DC7A60BC8
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 07:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC7A60BC8
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7ba9c26e14aso42873339f.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 23:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704698814; x=1705303614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Liko3pLcp/A2+cR1Jrld74YSHsKqz+bb7UmN6hOIC0=;
 b=VjePs0yEfJmhyTqF/G2wM0pREvp0eoa+Hj+SoNPR/6GKGHDez/m/NcQHeRm6V5qtnj
 DBNDzY/fstalkXEPQ6Dbwd71Mx2SxRo6ciOXkqEGQX/vH2KAYTdXPVM4Q7ZBMcptn4t1
 5la2KjcUmUvCN6zV+56/QZVZO1x1CDASPQYVUYo43dLK+aeaPtZWlwnpDhVG/3v5ZQua
 GehRY6WHaHsr5SDWSfISxgoXulv0R8vKGlfqXM4i0Cs78VV/ndxCSgP1IE+O90ltaOkg
 7AQy2haYB8bq2loVqG7xPDQBhSZvOFrd0lCI0UUKiX7V5Pjk/1S9f8bE9fJcop3Ksn5o
 fO8w==
X-Gm-Message-State: AOJu0YxJMS1tavXUZ/QKyvPjMvVLnTq+TKYcg2AdSukF0FV9V4jraULw
 NL2KCsDQRsGJkJMbi0Wh4LiIALo2+ZMADw==
X-Google-Smtp-Source: AGHT+IFDcE5wO3yO3R18QTPErWzDkuUyYmtu7g6Z85p1/7QWugS7JeLaj4Wgw6MdHRenehSH8lJq+A==
X-Received: by 2002:a6b:6608:0:b0:7bc:2026:18d with SMTP id
 a8-20020a6b6608000000b007bc2026018dmr2609587ioc.16.1704698813738; 
 Sun, 07 Jan 2024 23:26:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 k12-20020a6b6f0c000000b007bbe0bc5081sm2016843ioc.14.2024.01.07.23.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 23:26:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 00:26:52 -0700
Message-Id: <20240108072652.3496708-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704698814; x=1705303614; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Liko3pLcp/A2+cR1Jrld74YSHsKqz+bb7UmN6hOIC0=;
 b=Tg+1m5qa2kRR1+D6HfdYwtYPSeFFxuf+jj+4bhWeCFTNAbB286iTjNBk1SRDDaSwLO
 4/w3PezaEimtEI/8yxVFamKQTGn67R3irrY3aRvsULInZbbI1TS67mElceJ3NGL0XYgi
 wpI12e0/yPua4teYgN4t5wpRBKQaINIYYvdmCH6BFfp0mVD5Uzxr6jv4hZq8aFbR7XEI
 hNEaIqSkUETKyPb6iKIZEDn4TQ9G49zctmcrCzXccmtMfslZ6uRL/LR0ki+99XZSdCSY
 XjfOwXtSpt3zJqGg5zHOglkCa2vP6VhYlEyAqDxkahBrdfW2+E6dQlSY9Qz+d97e8ikL
 3Z8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tg+1m5qa
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.34.14
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index adf6232b24..47fb30f960 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  ee4f82382518e3af25b4ccfab38587d1  botocore-1.31.78.tar.gz
-sha256  320c70bc412157813c2cf60217a592b4b345f8e97e4bf3b1ce49b6be69ed8965  botocore-1.31.78.tar.gz
+md5  6c8ba4112df2c114c71522330deb0f9a  botocore-1.34.14.tar.gz
+sha256  041bed0852649cab7e4dcd4d87f9d1cc084467fb846e5b60015e014761d96414  botocore-1.34.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 850fb79aa1..485e973135 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.31.78
+PYTHON_BOTOCORE_VERSION = 1.34.14
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/84/a9/9c2752aa24c050323c37a9d2af6dec348889825b51db07fb7f1bb792e307
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/6d/a5aaf38f980060d17905398301033e9eb45c2552bf281fa7fd4c8e23ebdd
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
