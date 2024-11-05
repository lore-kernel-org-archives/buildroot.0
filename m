Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78332D31768
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3780C80EA0;
	Tue,  5 Nov 2024 17:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7D8G6UeQfOq; Tue,  5 Nov 2024 17:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CEF780FF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEF780FF8;
	Tue,  5 Nov 2024 17:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1D03B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33A9C4096D
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1viH7-mfRgIa for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C30040151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C30040151
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C30040151
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:00:38 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83abf71f244so191628939f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730826038; x=1731430838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Y2UGxoqkdFt2RIfAYg+meG7ZGyQ9nU5tm1RV9QBn8A=;
 b=VuHKnPd3+RtVvvE3JsgXwgzi8J8qTQ3rX8hsu8r6T9LIwfB/jfGwIvXLSCBP+XlFPs
 zDyQ2VAzgAjBL0ZLCI421r+mbxJWzkkypw6iqZYTg1WmMgG6Mehn9ypLF7YILHEUH+Ny
 UObHr9Uj3qRlaFrFHrk6jLqcUo6CADIYLkfvjJmrTyNjTB9I+37qb5qrbg8Cez4XQr60
 si02q5aaJf7oskUFCbBed0w/6GGgnB7InbPyB6ocFlmNUSBQTuA4Jo0K+8v5qIQaS/A2
 pMMpSwkaqr3r/8vrb+J1RfTi7Xb5grdrBNOl1vrPAKzydKMCv4eNYeqO1Yv4jfgFKO9T
 beOg==
X-Gm-Message-State: AOJu0YxACREgIH2k7ic4Im/n8P8/GR49YHcEhoVzRDl0GBG1zrnUCTh+
 5EG2kKp9Oep3BtHQ7PsOKJu5m+EvevNtXZv0BqG2CG2pN3pBZhgtAFHkmw==
X-Google-Smtp-Source: AGHT+IHSctweoM21yU7Bp1ST0j60ol+epDDlKBN+r7vBjibBtK527KqqgvQpTxz3JJ6vYUCNAgOSgA==
X-Received: by 2002:a05:6602:1482:b0:82a:545b:113f with SMTP id
 ca18e2360f4ac-83b65039642mr1908095239f.12.1730826037555; 
 Tue, 05 Nov 2024 09:00:37 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048bec61sm2523020173.48.2024.11.05.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:00:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:00:35 -0700
Message-Id: <20241105170035.1385533-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730826038; x=1731430838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Y2UGxoqkdFt2RIfAYg+meG7ZGyQ9nU5tm1RV9QBn8A=;
 b=TVjinwBvh5pb8JMOFedthmolDSkLa+5cXIW8+UfnD4oPTYK1h24UO7IYcIZhr8Ts6/
 bAZlQLtlKLJjDAw8KIHuaGBaLzRNf2nLagtitXJz7gS5Yq53M4Kp+vCOOEK5He2l9aGd
 c9YF2R7EoEYwsxzXsIKY8XOe5vdObcpSC8eLFPQWZH+oOzyikYNlnrjWzmEpawSXvBn+
 2wLCPB7fy4urlGL+RSYFlt0HrowlxnTFqF3K4+C7cb9/SzyArTl8R8kvCF8haXA4UGHj
 7qIETBCvWIz6H51AKdGKQC8oeo/GPusV93oH4ACzCPaWifx9dVvwVdHnBxkzM+VAsLUm
 jaEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TVjinwBv
Subject: [Buildroot] [PATCH 1/1] package/python-simplelogging: use poetry
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplelogging/python-simplelogging.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index d725cccdd8..43f2e0781a 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -7,9 +7,8 @@
 PYTHON_SIMPLELOGGING_VERSION = 0.12.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
 PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/30/71/d6b6513598e6a4300f6142a839d1b0e10a25a4707f1b586d9a6331be91bb
-PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
+PYTHON_SIMPLELOGGING_SETUP_TYPE = poetry
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
-PYTHON_SIMPLELOGGING_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
