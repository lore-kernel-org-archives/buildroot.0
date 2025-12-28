Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80759D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FB814028B;
	Sun, 28 Dec 2025 22:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZC3ya4LKmD3; Sun, 28 Dec 2025 22:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 836E6402B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960449;
	bh=cbhIJyrT8hKOFpxaqYzyFtiQW9ZaIxmM8xHcTVaVBjw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZAgNLzT6Rn3P5RFFHwjR8IuXgapt0JemAnv0w4jc4Q1UY9AvTjOTYKqvy4y48OEkf
	 OfmimNOZa6NTM5tShuQgTQ99H7yQOdEsHQB49Q946i1Ymi/nug43oQJVIDHhIBpd3V
	 HXaL6k5LWZmosTyeMwasRHuhQWf6j1kcmUgXxiORAD+yRf5WSxZ41rSezlu9hciqQB
	 T/hSxKGcgC4m8/QgXg+2b7B6OjczE6hzImX79xOZ9n76AaTnEo6Yv/oEoKIxuQRSiQ
	 /xtAJFOxbIgBdSJJWvFjNUz4SdKPJJ7Es+QfMeyf2GFpSRu/x7iZAvTQJVNRzMaBpX
	 x6iPgFEJn1FWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836E6402B0;
	Sun, 28 Dec 2025 22:20:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C89DB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E82440342
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnvaeTmAanxr for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A9D14028B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9D14028B
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A9D14028B
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:20:46 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7c750b10e14so3428370a34.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766960445; x=1767565245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIaWVXh5tAEEKpIGBwaiOsecEAZVD66xeQqPkqtMnbY=;
 b=t8c+WcCGAZNooonNGCrDq101S8JJfqtH9K3SE25Kr6sJAR+iP5bRNMoUvHJwEdSecm
 XsA3lV1cmIk1AevQHvZkDwdyoAQJ95+OcsjiP8uz5sZUvIHHrCFJNklY4iAoFSZQ4axo
 JmWfNjT563Xb6WMfN8e74d9URppTG9kF8+vFB37CbJsoxA8ZrxV7N7+4WSJwDEK8e6Gj
 BoGn7HH7XxaoDTYELSS+jLmPAl1Cpm2Dld5WAeYSp+nBcmAGquQX4oCVHqX8miMHtiSQ
 YcGsAvTRwUbbn+girsdpTKX/tRDqOIlDFbtp6zy424UBtwWluk7fEGPIz8IljUIIi9Hv
 3zJA==
X-Gm-Message-State: AOJu0Yz2Pdb4vxP/XCKfaC6h6wYbdywoAa3RddB0i+D3cxv0RIM1hhb8
 1V21xq/CUWlbm2MyBdxCvG6MXM10OjNOMHJNCRcpCCZXjTDE9ohleegWiOJ5hh8t4dE=
X-Gm-Gg: AY/fxX7dAILp4UZ7saY8LnSEB+510Ty1DNzxQPIMFccUqzvCb0B0ktaaVQ9CQ9UDk4s
 7O2myypBwp/gS2VL1Mzfd8+a/cFSBQRIH0ot4PTNe0F1+Revs1JoGcIitxgFpYY27IisbW78eu2
 Vgb6QVkxUeEafrdGJ21+ZoKd4dH1CQI+TfDUzJkthrexI27y5HCpY4v7pefmtFJ8kHIdbZVGAQ/
 WIyF7q5wCnqItRmn5BE2r9mQ4qGUCTCZgLL7MH3mQue0XU+EI/theM/+dIZxVW8Uf10LaUUEigF
 tXABMdMXkao+R0wzlq8c7jzTshrNFowO1cJP5FZZo/NOV0k6g3qZTSG7ll1FTOf0R6yWCLwaviU
 PcosFW3M7BmiKSL2QlDEu8Eli6M1fVm6qauhuoN1zO50kyoIM1ZYwVArnqG+cVe2l5zIJvlvUo0
 wWB2mrhyzjj61BJOs+sGicyAHeoG3iqxrHN+PELEh0jhuqNSKhj+51iKC6xJ3yDYKhtgUnMlD0H
 oLiWaAy4Xje4qlnIi8M7JLoea++al8iHdycSeU+DwIA4HrGMNaLmDM=
X-Google-Smtp-Source: AGHT+IF7N7IUlqWG5eOQ747DFOAce2Q/AvaktHWRBRs4sO04ouX54yj3DBPJUv2tgq417HZqP6Qo8A==
X-Received: by 2002:a05:6808:8c6:b0:459:b48b:d50d with SMTP id
 5614622812f47-459b48c8ecfmr3110186b6e.23.1766960445130; 
 Sun, 28 Dec 2025 14:20:45 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab65749sm17638556fac.11.2025.12.28.14.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 14:20:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:20:27 -0700
Message-ID: <20251228222027.2768711-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766960445; x=1767565245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eIaWVXh5tAEEKpIGBwaiOsecEAZVD66xeQqPkqtMnbY=;
 b=I/pwpV9fIeDst2rV5KJD8QHIuPQ0JNPpQK9uMM+HOUnH37fWJ8Tv3Ib3mE+fVBC1nz
 TEzMPkhD4/fyWOdY9HpyWGU99M9B893FtosmDzdKFLxJSwS5KY7Sd3YHrzs+UastoKNi
 t9rCT1ZE0WA6rrtqRCrNcs8/0eqjwE/+CnnzQ58B3fxrVPPLW6Jj/LD3jmebLXmCAqLE
 hBlfqniyCtJRz9wCjx7CQIhSeEaYs/vhSFFex9sYgRfeHCZH21wztlOrpFgI/jEYwJ6+
 n7isW/7AmjnrTEYcCYXYhD5/lc4edBDKi1FwO7Z3CHDTdaos1daLlMS+WVZCQlxBte9e
 q58w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I/pwpV9f
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.25.3
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

Migrate from poetry to pdm pep517 build backend.

Add new python-anyio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/Config.in                | 1 +
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tortoise-orm/Config.in b/package/python-tortoise-orm/Config.in
index 62b1a5a86e..57cebc6489 100644
--- a/package/python-tortoise-orm/Config.in
+++ b/package/python-tortoise-orm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TORTOISE_ORM
 	bool "python-tortoise-orm"
 	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_PYPIKA_TORTOISE # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 8e99e815df..6e1f46dd6f 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  ef8df163a207f40230c618efa18ca32b  tortoise_orm-0.25.1.tar.gz
-sha256  4d5bfd13d5750935ffe636a6b25597c5c8f51c47e5b72d7509d712eda1a239fe  tortoise_orm-0.25.1.tar.gz
+md5  b3dab10562c6574232334e954666f3eb  tortoise_orm-0.25.3.tar.gz
+sha256  b6dedd388393624628ec46228c93df361533ceb3925986fa2d1d22debc838a7d  tortoise_orm-0.25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 32327bae38..3a380710a0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.25.1
+PYTHON_TORTOISE_ORM_VERSION = 0.25.3
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/d7/9b/de966810021fa773fead258efd8deea2bb73bb12479e27f288bd8ceb8763
-PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/dd/be/0fdfcd8295f4f02a280f33bdda99c3edba450f9a212149232f2fbb6afa96
+PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
+PYTHON_TORTOISE_ORM_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
