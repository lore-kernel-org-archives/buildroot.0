Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87992D0BB62
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 378124066A;
	Thu, 24 Oct 2024 05:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ocp1aBvRftqG; Thu, 24 Oct 2024 05:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40524071F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F40524071F;
	Thu, 24 Oct 2024 05:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAB7127ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93ACC4071F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyl065hWOETA for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C6A44066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C6A44066A
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C6A44066A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:11:13 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83ab694ebe5so20336539f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729746672; x=1730351472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxgZ1guScxsNE5MyBSPTek8yAeTBB+Q5WNPsXXnsRy0=;
 b=DONw/euBBdMUP34V8zrPouUBu7uYO71mTSvGFq4bSJxtlL8SsntgvULY1M7BdBndfk
 F3sRi8FtRqMU3Z6XcP75umNRE76djQmdsxrjaba61qKSy2Otu+vgkQNwD7QsafU2+3K4
 NEf7I0SNJFGc5aBkGck8B3poh3vBNWNSboXsdqQUlxUkCmnenHakxPTCDSuLderneTtn
 E1hoRITY1bTIM7c5icBAn0jBzTGg311eYwUhm7F5GRR0PsoEueTkVNy0gopnSyKvDX7L
 LZWtyYfJOvCkt5AQFrSPTh1kWmkxAn6oMziLLOh+QYk7s+Eorbplaet71hDazaXnU16L
 JK+w==
X-Gm-Message-State: AOJu0Yy9sLnSv0ci9FnZxsC3SYLpVlFxd4Z9e25SPQs0mfAD78EMVJr/
 Ge/VyW3e/OdGnLfOrMLrO+/v8SCx0m2wHOMjBlUQmHi8xLrnBf/O7MFlgw==
X-Google-Smtp-Source: AGHT+IG01iMoK6h/HLu+a6JVHFwksVDYpb4PQHeqeqxMaWIx+W1zWUm1q/sJZyOQbDPpgad+OSUzPA==
X-Received: by 2002:a05:6602:15ca:b0:837:7d54:acf1 with SMTP id
 ca18e2360f4ac-83b03ff3867mr97413639f.2.1729746671793; 
 Wed, 23 Oct 2024 22:11:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a62f760sm2553343173.121.2024.10.23.22.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:11:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:11:09 -0600
Message-Id: <20241024051109.3390994-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729746672; x=1730351472; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oxgZ1guScxsNE5MyBSPTek8yAeTBB+Q5WNPsXXnsRy0=;
 b=RhycbHPS7zm31Dg6fAh1mTupit/v8OeOsbSTQurvCZdYLVewpwoKXMImxGm8NLJA81
 HD4CWvmIZqXXjBev3frwoYeK3/k1V1AJ/Pk+6jaqEqSNtmp7aYOEP98jm74ECiyWWcq6
 v4KAOgS6Ouf83+csKVT2w/6YCWT7C1bP6dlQvJuSTzg9XMZPcTUzYDmbqcI2+3I9H5ZU
 b/sxB2JWDlJK+Ml0iX19HMbNXNLrp5yyBB9jK3Iz7ozHyK8Bvm+XuECtMNbNUP4rxL+w
 xAdZysb7l+XKEVw2xqTFegHUzJgArhj7s1dqtWbFoLSpRqEJE4iDWQHGfAu6EDP+CPSy
 38Pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RhycbHPS
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: use hatch setup
 type
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 084e164c1b..d3e6624ad4 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -11,7 +11,6 @@ PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
 PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
-PYTHON_PYGMENTS_SETUP_TYPE = pep517
-PYTHON_PYGMENTS_DEPENDENCIES = host-python-hatchling
+PYTHON_PYGMENTS_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
