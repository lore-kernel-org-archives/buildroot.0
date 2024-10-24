Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E9CD0BB5B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 04:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC2AE4071F;
	Thu, 24 Oct 2024 04:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogTccwnjtow4; Thu, 24 Oct 2024 04:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3F940729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3F940729;
	Thu, 24 Oct 2024 04:44:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D18F2073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CDF48122C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhtcL7PPR7xE for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 04:44:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 717028122D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 717028122D
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 717028122D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 04:44:23 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so20548539f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729745062; x=1730349862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvAdLOKX8nzvYnYrA9Ov8LSKsdNitEKUfaPUCxzBCs4=;
 b=ITSGWqOVw/NsQE27/YMl2i71zHtFZUQSKS3HecWH7b3C7F8wcZJhqT1RtbBv/9P/LQ
 XWwkx8km10f8masFtUTJbhn8yYPrqmvNEZYuHd6PR6OKhC4Dnm3uQAGNaafRBMQaQoSc
 zw5u38iA1PzNkS2anCgvrtGs0cnQDjtrT2EpfF0XGGlzzga9udm/D95pe/vutWHqWSYf
 tF5VDQkoWk2PXn94OdIL34/fyDvL7VOF9Kd72mdK2uFMYzrhGFlNlExsIygaeEWr/8iI
 b8If8Hem8s2rp4HnezDGvL6cJ1yy2W68pqG8fqVo6VesROpDoEJ3a8zBlq9b1hpSOSpb
 kyPA==
X-Gm-Message-State: AOJu0Yz1raqeQSmjwcnJyMXN0vjusEfWxwK6hOY8hjFrg+6jerMd3n4M
 JmgMRIazPYOgnEd7EvLDuC++usWaRfpYfNpHSnDcHq4rfs85mZqeJo8P5A==
X-Google-Smtp-Source: AGHT+IER/vVihR9DBqQBCnFeelZTszikIVSBUJygEb0BhTVPU507nsSh18WYboFRyEA99zPnsQlBsw==
X-Received: by 2002:a05:6602:1351:b0:838:9b6:46a3 with SMTP id
 ca18e2360f4ac-83b041ac30bmr75702539f.15.1729745062004; 
 Wed, 23 Oct 2024 21:44:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a65f93asm2489416173.166.2024.10.23.21.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 21:44:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:44:12 -0600
Message-Id: <20241024044412.3374697-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729745062; x=1730349862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XvAdLOKX8nzvYnYrA9Ov8LSKsdNitEKUfaPUCxzBCs4=;
 b=f08VnX8YxkmEe0fLmJFhusXr8zkisZ2/OKvmsPhs97eVDK9KFXXVTfhS87X2jc7E2V
 rZEldOkb3Msc1FYeOYuDfrBfA1Hfrzj6UzO8BmY+AoNNpBSEMUFU5jhLO/ElZqd/vjRo
 02yHnoGa1Q1vnfUvJ9xcjQ4TWYdXoP7CvnoBzAYPB9ylPfjtBNw07d4KAQ+Ny7KIuhNJ
 K35M6kfE287llkdRxYrF4yP6ILaD5QvCMDIXPPQt7oiUDSRewwX3jUdDOiuTuEotubmR
 26b2hv4y/RK7azTHksWYbcvNGHf9laQlW80eNROqqyAASJmP7/+4lMJnXVQYimHdFyGJ
 LIjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f08VnX8Y
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-fancy-pypi-readme: use
 hatch setup type
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
 .../python-hatch-fancy-pypi-readme.mk                          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
index 2a26892388..0857864965 100644
--- a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -9,7 +9,6 @@ PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_F
 PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/b4/c2/c9094283a07dd96c5a8f7a5f1910259d40d2e29223b95dd875a6ca13b58f
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
 PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
-PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
-HOST_PYTHON_HATCH_FANCY_PYPI_README_DEPENDENCIES = host-python-hatchling
+PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = hatch
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
