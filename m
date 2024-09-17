Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE07CAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D84EA610DE;
	Tue, 17 Sep 2024 18:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSSJfzev4z2O; Tue, 17 Sep 2024 18:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF85A60B59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF85A60B59;
	Tue, 17 Sep 2024 18:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 361E41BF295
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 311014130F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DzbCxWOJ8Tf for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1977C41304
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1977C41304
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1977C41304
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:43:09 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82aab679b7bso191473139f.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726598588; x=1727203388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nnOvNLa5TNoQxW+DEYAkQ6t/8XenBl3KusAOTqBNrKo=;
 b=xPesIr+0DY6ExDZ50JzGQXfbKAuRtajxHt+5dqCamqwpxAp1RRvHmebmfBLNj3Oj78
 JoeU/uZ+guY8IDRSQsuXrQ1jjnmeqQ6Duw9r5Cl+pcq4m3uFqoBCr1bLFbJUOCe88+x0
 IQlMpnBv3vrwAxx3KsCyBCCYUCNunNuf4ZCxnjRoWa9ju+u07mVGefu1KR0OZpCAokOG
 ho/nYoDSbE9j4SoKC5SWA4a4hL65VKAS3of78F3zR17IoGMw5q1ShnWa3qRJ2CbD4NJZ
 WhaY8YLuwVfZWq6MP5vhogvYKp12rLEa+rlS9MnE7qWPp0e6sdIs9x5X7mO5xmkEDpOc
 1T3Q==
X-Gm-Message-State: AOJu0YxpUx29vFYGZUdLAwbtEx/+ump8IcsnFsliz8+uKHbXyVqrseLS
 DB7QhPIwcvpvxiGsP6LBlL4FMdsofXj+JALn5RgytChGPUtSEHzmajyOOA==
X-Google-Smtp-Source: AGHT+IGVOV04rXX3GXOW29OVcNYH8+S9V/Ue0gpAqc0BZgWpoVeFP6onXlp2wggjjDXnZDLG0p+5Lw==
X-Received: by 2002:a05:6602:13c7:b0:82d:3c2:9118 with SMTP id
 ca18e2360f4ac-82d1f97f9e4mr1824995939f.16.1726598588461; 
 Tue, 17 Sep 2024 11:43:08 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed571ecsm2073358173.158.2024.09.17.11.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:43:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:43:06 -0600
Message-Id: <20240917184306.3892415-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726598588; x=1727203388; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nnOvNLa5TNoQxW+DEYAkQ6t/8XenBl3KusAOTqBNrKo=;
 b=K/bInkTHNJa2eS8Xp/agsULK67Q991jJ+BQ+y4/ZC5FP74ieVLRqLmaiXNWwkpCboP
 QqsJT/fLNXrsxiMG7ToVRoiT7BOGNv5A7yRUEFo8avv+s8a6HsZ4MBNvwkMEMx3JdmfM
 cyH9TSATDnNDbdevH3hTEupTnkhd07ILs2sRAo1hf/hjG6ACjOFYMSroLjAu5jOOr/GU
 mphq3RxO10dk4zR4oov5D3D5k9HzuDLToiu9lGC30lXF4fHcNHczr7Nm+ur0hOuU05fn
 JDWb525YrZ5gxRs6k0MR0ixNaupNi1r65KZBVL2ge8uk9VCvj2uHBM8qYSBr9yOz3IdZ
 Bu2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K/bInkTH
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 24.2
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index d2cc649b01..d29765def7 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  38dd5f7ab301167df063405c7fc16c84  pip-23.3.2.tar.gz
-sha256  7fd9972f96db22c8077a1ee2691b172c8089b17a5652a44494a9ecb0d78f9149  pip-23.3.2.tar.gz
+md5  a00c83f8b89decad22d4ad9cd32f1da1  pip-24.2.tar.gz
+sha256  5b5e490b5e9cb275c879595064adce9ebd31b854e3e803740b72f9ccf34a45b8  pip-24.2.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 552b47eb7d..9af3ba22b0 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 23.3.2
+PYTHON_PIP_VERSION = 24.2
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/b7/06/6b1ad0ae8f97d7a0d6f6ad640db10780578999e647a9593512ceb6f06469
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/4d/87/fb90046e096a03aeab235e139436b3fe804cdd447ed2093b0d70eba3f7f8
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
