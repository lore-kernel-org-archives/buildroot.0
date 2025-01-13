Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DC8C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8AAA606E3;
	Mon, 13 Jan 2025 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3_WanFuUgKd; Mon, 13 Jan 2025 18:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E75B1607C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E75B1607C7;
	Mon, 13 Jan 2025 18:53:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA6F942
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7896B607C7
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgXVq3t1pH6f for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8769A605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8769A605A5
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8769A605A5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:53:00 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-84cdacbc3dbso376083039f.2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 10:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736794379; x=1737399179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tP8ZBOfuntYVXE4RbYxumonJx0yWFBs3Ac5RmdQ5MlU=;
 b=dTR6+QnwtmGoJ2nJzBVHku3gTF/gkTNv6hITmFH/0uEvC9DGVwMDQTYrqLhx8v0Jcl
 i4M4q8sCg0pmoDuYjG4nb1u3KVnLvDtEPV0aIyyRXQolmnQmtYh8yZVSGXHbiORIUPH3
 b2NsfoHSqQkCmfqamtnVO5rF1beZmXdCYeMSsAl/IIh8Q+2Gv8Vku98KuQGWbcA0r8IM
 8+RVZxOKaPAAXAvhbQM8FtYUHuRtegK2+nhDP6b3Ftr0xwNe5e9YFW6sXbP3ta+t2POC
 0dFtcfH0NL3CYN723vgWwgbXl9V+3EuKQh5sB0Y+ovtJiRZC5hZrXXoaeaAy76o1Ld26
 4ZbQ==
X-Gm-Message-State: AOJu0YwjtLG9YMbQVFfM7YW0k77P1IoAZXyi7+7MSUvd3lJ6HTAKjLdJ
 2VV2PjXS2U6ZaW2hkPdISeseBuv+bUcYsY397Fju/LRCnlPlz/xRQdxXW/3cFws=
X-Gm-Gg: ASbGncvIa23kdMi5hotYHkqNxj7w+CaoLVxu8vX8Nd7FL/CQmeUbvWrHazWq1EN7foS
 2i7TwWZ/R2z+5PYN5sPOWaOOnaLepapzuHBKGAi8TzcEDdpaVytjZl7gv+zcGSBLKeruWCWAj58
 9E6m0HsQ827kDw1o++KpKNRAooxQGDAbzKp1H3cwVjI4hYuRmFZDuBlkUJaHdbHB8A/UaTe4PUU
 MCwyqYjaGm1ycaSXuuGcoH7Q3UOvKvUNGCJuDr0e/uJ1fndU6xcXK1pbysyIi259ORoPrCUZRvU
 Gu45ZZ9ea+GD7MirIgFpUYSsGZrE5y8=
X-Google-Smtp-Source: AGHT+IFI0ULn5Mhq2AO2FhQM8lPldR3gRaU9cTpDRG2WwkZHpup2XkkbfHvWczp8rTJiDB/flKWsCQ==
X-Received: by 2002:a05:6e02:1706:b0:3ce:6975:b668 with SMTP id
 e9e14a558f8ab-3ce6975b7fdmr63465955ab.6.1736794379355; 
 Mon, 13 Jan 2025 10:52:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717d4esm2890960173.98.2025.01.13.10.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 10:52:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 11:52:57 -0700
Message-Id: <20250113185257.3026604-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736794379; x=1737399179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tP8ZBOfuntYVXE4RbYxumonJx0yWFBs3Ac5RmdQ5MlU=;
 b=ZuEvfoEMOgpmPeOXICtadOgRXjyol10ewIbDkLc5sRsvFZsKfNI2HsMo4DMzBnWRRl
 T5Lm/mGVBaSTv+xR3/cvRfeYfQan0VjdTZ4bNmLx1MlzbYm6ytF78olMCuw+3ES0VU2x
 u1mol5CpcUdm2sVAwvhfskFI1iPDeQnJ+im2Bv69hnO+ErvR7m1/TqQAgTPwp7xcnv7R
 p7bu2C+pgtdmr5PMjhOaJVSwBlGwwcusbZNRpjNdRt6IF5+D4MLPsQjfVWEGG4kq/nw0
 wt5oZoDoc0D/QhT6ZzIphWVtkr2n+OaU9TZddB1e62aKanG9liDIoZoQErN364b+2kuo
 J30Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZuEvfoEM
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.69.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index a64fbeae54..afd3e50ab2 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  e9a0f06f8886b5f95da4e599b0960ef5  grpcio_reflection-1.67.1.tar.gz
-sha256  507d9785a72032816e9bb5add4a660c655813a6bc1537b957822c652c88bf458  grpcio_reflection-1.67.1.tar.gz
+md5  f1b2d22885a2a70fbcc499211059e2be  grpcio_reflection-1.69.0.tar.gz
+sha256  3474aaedfb10d8da5503135a2fb9fbb4e1f72044ad7ee2d0bf22090934e80908  grpcio_reflection-1.69.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 4e8c3e8dc3..c209b093b1 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.67.1
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.69.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/17/61/618d56bd1f7069dea5fee8fa6efb5e6548b6edb52000ef1a7b242c0c1b04
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/bd/88/064538adae2e526f4626ad57f53a99fca5ae5013e627214093ef1d47cc35
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
