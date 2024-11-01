Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC423E6F06E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A394006A;
	Fri,  1 Nov 2024 16:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lDEiyHap_6n; Fri,  1 Nov 2024 16:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E56E42444
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E56E42444;
	Fri,  1 Nov 2024 16:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F78160
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1249440376
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIKrfCb9GwGK for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 16:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3CA5400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3CA5400D7
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3CA5400D7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 16:56:14 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so83552039f.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 09:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730480173; x=1731084973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ciPFzXp8VtZUcRMDBUSBxkRA0fB6FqVsVMhCY8BJg0=;
 b=r+8SBY9iTnVxjLj4m1RmEbFl3bY1KUkLe3BdSKDu0DWjL4NRm6+rvrCF24bcC9oH7e
 fCOo9hBazH0LSNaADyPbF7eXNJMTAW4bUURbHE3MZbkb+xUnfGVT2nNXZ/mdiJ2iO+xR
 qNDRWYCPM0EAFVlfzsyqoXkW5IeVW91aP/tRlqILl5UaDkWZQZX+cbLY39+pEbv2HU/P
 SU8MP8H7GqaiKAtRybR/TP7w/cPKdEKdXVpmBooXmrBS0CnmI8DGks/VnkbkZ7Fg1VIQ
 9AodXaPba08kEwCA/40deW1My7Jt+S3d2cuEWr/sLMPa/FirLiPVAQdLqS7daRkbwYzX
 9bBg==
X-Gm-Message-State: AOJu0Yy1WedNSEVxEthtcxyPFoXieczsL8UxOdZfnScwyHCS93Fo3LMM
 2B+pKkTnorNJhy8N0zMYlGoe5/OYrhilnXmFmhdHOctWATj0qbaWMffvrQ==
X-Google-Smtp-Source: AGHT+IFqXLDJO2dfMOfbzZWT3xxZrh0vzQHRqscMqpWC5qSrkUQFCCW/dLYSfBVrPTQ0rMLcHJDEsw==
X-Received: by 2002:a05:6602:2cce:b0:832:480d:6fe1 with SMTP id
 ca18e2360f4ac-83b1bcfc72fmr2578890739f.0.1730480173401; 
 Fri, 01 Nov 2024 09:56:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de0488830esm811774173.16.2024.11.01.09.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 09:56:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 10:56:11 -0600
Message-Id: <20241101165611.382147-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730480173; x=1731084973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ciPFzXp8VtZUcRMDBUSBxkRA0fB6FqVsVMhCY8BJg0=;
 b=BnZmjiA0V4yvtPEtDq6Z7g4xpAIIEOUVCDJYcAHEaMZWTav4wwRUFl/X7/J+f+bmmA
 cnfvGWsHXjOwWyT3MAl+rI9hVcHdPOMm8Gmh3iTg6h383Odihu9Uy5PPP5RcHO0dm/WX
 DyZ7NI6ltStItJonXCqNgzj3iQ8vQGHKycvB6lEOwACjUbP1D9e7eOXmrx7g0JsYfrjg
 qX7M9RLYEDfjQq7jsTlfeYyZAZjuTg5yztlLGHENc1HN1XDwvfpDH5PjKlr5c1g9S+lp
 XMyZJJ6jLWkhq48/hjPFFynEX/dLN8FAu6WLvd/Ciy6EplLmQ3Il6dLhXq/tFtUQAcYs
 Xgag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BnZmjiA0
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.67.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
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
index 516434e1d1..a64fbeae54 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  ae7a26702153311fc7fa5bd4ee232ac4  grpcio_reflection-1.67.0.tar.gz
-sha256  c47143738b1897b6ce4af5e0e338c85c9aee5fdcbb3355d368a8dcae46d8933c  grpcio_reflection-1.67.0.tar.gz
+md5  e9a0f06f8886b5f95da4e599b0960ef5  grpcio_reflection-1.67.1.tar.gz
+sha256  507d9785a72032816e9bb5add4a660c655813a6bc1537b957822c652c88bf458  grpcio_reflection-1.67.1.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index d211fd18df..4e8c3e8dc3 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.67.0
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.67.1
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/fe/69/08a7c3c3524e3af650d22bd8e0015e35bc284eae919fbb38bc2702809d07
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/17/61/618d56bd1f7069dea5fee8fa6efb5e6548b6edb52000ef1a7b242c0c1b04
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
