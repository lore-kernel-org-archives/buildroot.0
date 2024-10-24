Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C908D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 098FA40633;
	Thu, 24 Oct 2024 05:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86OCPeCcRN1i; Thu, 24 Oct 2024 05:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA71C4065A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA71C4065A;
	Thu, 24 Oct 2024 05:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CB3727ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B7BE8125F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Xz-tboo1ZCI for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A81B80F40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A81B80F40
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A81B80F40
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:03:56 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83ab21c26f1so20667339f.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746235; x=1730351035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5l8lVShyavH46mTmOXA6HgFM0BBlgC68JLjtR4B5/8s=;
 b=pmHyUWUYiNWa6/ycD4FuWKH0x5KQwyHISYSh0orW58naxBnL0z4KoMvrYf755u95rh
 8mP1xI0H+zh+j3zl010i2xafGjFHL9QcqU8Djt7Tiy8xgzbUGOjThXosQcha0s8BPfpQ
 ovtpBHelJ3yxMTe/WYtGHd4Li3KueVlWYy9JvPnPJEsbjrxwJpOuaIviManOzdHFJB0A
 tA03Zacs3iKifVDGvhawJmzzycKjQcIFGRfMV1P2hKbEiJGWvA6VoLB9WSc439rktGZY
 ZHiSUKv76cZelsVHiLDGSrF9a5AavGk/hdexkc1UBlJutMM64ymUtxpEnGl0RgZfYGaU
 /1vA==
X-Gm-Message-State: AOJu0Yzc4bkWOEk24UZyouP/3EX8yrPpUREQUUDrcssNKmUpAbfXyEWg
 74hxs2OOCpGkwx1Dxekyhx6w0OrluMqPULa1QkIN1zxW1EdyXmLat8jETQ==
X-Google-Smtp-Source: AGHT+IFTZ3W6oWJ3TkdtbQtRxM8CQVONN3x8/m87sJpe/d11pk8l/FzEy2oFE8OEXzI4kDEgLWfv5g==
X-Received: by 2002:a05:6602:27d0:b0:83a:97e7:8bcf with SMTP id
 ca18e2360f4ac-83af63f608cmr763776639f.11.1729746234807; 
 Wed, 23 Oct 2024 22:03:54 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83ad1c512e1sm265392039f.21.2024.10.23.22.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:03:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:03:51 -0600
Message-Id: <20241024050351.3385891-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746235; x=1730351035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5l8lVShyavH46mTmOXA6HgFM0BBlgC68JLjtR4B5/8s=;
 b=KJvIXFJjbO6gfRq9r5DMdHNHq4KxaXhN0uVvAMWjQ+QjhIsRrPLiqp5VlbCr823gcr
 M2zDYUGQalw24M8cHq9zeDIoxw6cIkmORQJgSH5MhbbRwBtdgJq2bSagmmf1ogU+QmPp
 sFBACVSD5S/r/6VmxZAX8oAtdZdg36XKcWSorVTwNmcBJIVmy3eeX62IQ71gnrFIllDr
 fCOuktrnO6ZfunL1P6zQDGkQERrZgJ5NVe3zCSADT66BxrimV4i1oBYb/yTn76B217Ez
 O1NRMKkPdXumP/roAYkgOvF7qtOAgGOL5klOS6V5YJUbxPNhxnsmX5UTWJPdBRUAiSiC
 slTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KJvIXFJj
Subject: [Buildroot] [PATCH 1/1] package/python-annotated-types: use hatch
 setup type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-annotated-types/python-annotated-types.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index e7a3b7e64b..b962c1a07d 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -7,9 +7,8 @@
 PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
 PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
-PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_TYPES_SETUP_TYPE = hatch
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
-PYTHON_ANNOTATED_TYPES_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
