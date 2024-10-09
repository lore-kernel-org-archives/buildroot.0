Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D38CEE32F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 265F340E27;
	Wed,  9 Oct 2024 16:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOotS64gE51G; Wed,  9 Oct 2024 16:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D52640E18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D52640E18;
	Wed,  9 Oct 2024 16:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 603451BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CF5581456
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFn0f8ufX0W0 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7977E80838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7977E80838
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7977E80838
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:25:42 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-82cf3286261so262998839f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728491141; x=1729095941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGzenHwDN3zEdJXgYo4f2Siq7J6jcvoNWQD4WrPXLK0=;
 b=Byl2r5IIrr5UwnNIqlt1yp5mPr0j1gojcW6lQzSVCOv0llvNKXsYj/0DvGraM9+AJZ
 UIzTsK8fyTyQ3VShxYZMlY1sTDsRsd4svJMzZ/oMb3Nq6SRNrKfPVWJ3ajLewAyZDzFw
 f7B4EIP9a7Y74Ylsm7ts61uGeY5gqDhl8BAUlGSC1Y36lq9LOTAXidKEW7F4sQpPtT4k
 eCqRzh8uNldICU3td2QHqCvMaVjToJ6s5hjyM7/sHKtacwnnA7r/THiDPrFazP+Wz83J
 413MQUSBlBp0u1YFu7HRHPFlhI84bimyflC3gAdjXRtdzfASmIW4JwaTjjRn3vTQtptc
 vRzQ==
X-Gm-Message-State: AOJu0Yxc1GP28TIZidZoNW8nwJifjVx6gEDMiFifcmLg64oiVqK6/e3Z
 7wWQDBKhhAb3KcDbaHQ1+yTWe0QVQjFTc4mKXHl97KNNh93798J1zA0PV8/E
X-Google-Smtp-Source: AGHT+IEmLnQNOCna1D7p2A2/KSr3Hgyue6miT7s+UZ+5elyA/viv69fVM51cBngF2DwaUZsNNbOD9g==
X-Received: by 2002:a05:6602:6089:b0:835:3884:77a3 with SMTP id
 ca18e2360f4ac-8353d5183fdmr341623539f.13.1728491140912; 
 Wed, 09 Oct 2024 09:25:40 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db82c0d45fsm1544572173.99.2024.10.09.09.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:25:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:25:39 -0600
Message-Id: <20241009162539.3820226-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728491141; x=1729095941; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UGzenHwDN3zEdJXgYo4f2Siq7J6jcvoNWQD4WrPXLK0=;
 b=J3mMRFJ2X+QR1AvWIEoyKqGFuckWMXn/jXhLN/Nq0O7rNK9ARFF5tkViLGJK1X058x
 PGYieCuY9cCSnZdAYJbrTeSnMq2aGmx85h2m8WOQEpNzKPE1bHmqZbWtmz7a3BK2TsC6
 a1z4B+3cFFSEiFrMLeEcP8UKckJ4aWbxBdXKWUcd8ueAw223ptffdk5lKdC6bw6B21sM
 Y0IwPU31IG1EEWxLmrtR8zw+j5KqRr3dSb7xe29cc0beXzuLwpQOPH/Ol3vlOgrLkJVD
 Bm/iCnwM4VH5BoNuQj2bK+Qp1ZTTsjT8z2ggMh5cmj3/YV/xd77NPHLVCUMGXvN+diCQ
 JYFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J3mMRFJ2
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.66.2
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
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index a408802bce..c470f97e78 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  cb4fd6dd6b104708bd00348c69f34066  grpcio-1.66.1.tar.gz
-sha256  35334f9c9745add3e357e3372756fd32d925bd52c41da97f4dfdafbde0bf0ee2  grpcio-1.66.1.tar.gz
+md5  e8adaa7345b99791542c7ca4245f30c0  grpcio-1.66.2.tar.gz
+sha256  563588c587b75c34b928bc428548e5b00ea38c46972181a4d8b75ba7e3f24231  grpcio-1.66.2.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 51fb7e39e3..70af9b5c3a 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.66.1
+PYTHON_GRPCIO_VERSION = 1.66.2
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/e7/42/94293200e40480d79fc876b2330e7dffb20f959b390afa77c0dbaa0c8372
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/71/d1/49a96df4eb1d805cf546247df40636515416d2d5c66665e5129c8b4162a8
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
