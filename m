Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5F4C04A94
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 21:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E69C409D7;
	Mon, 14 Aug 2023 21:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E69C409D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T_EjCarx2b8k; Mon, 14 Aug 2023 21:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 694BA405DB;
	Mon, 14 Aug 2023 21:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694BA405DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4091BF48B
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21790817AB
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 21:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21790817AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMbkW7pbb_qp for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 21:52:36 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F9488176A
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 21:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F9488176A
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686fc0d3c92so3191100b3a.0
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692049956; x=1692654756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzNfbEm9rgdO/8Hci4wp1wDFdJ4tZxMMnA/UOJAvOm0=;
 b=ewB0ZN6CX3yFbYhkVbhl9ugLjXGrsDYfQTL2j9WSECGmMmEq5VBh3z2UAsRaJYp5No
 8edhma4gfmjov6Q0VZzgt5a/KfeeFSmfFvpIVU9prWLOiaFzpeeRz5+U6VYzTN+z6Kvb
 QBE3WwtuefK8s/Z37O+oDOVY62vJq9J9lza6rdpUVLGfNAYDYtwjou/Rvl+7qQLyv2j/
 JzJet81h90HscGTosgdGCWnHdRWlyhvD4domGqxACFzHZ31RZTJvFMLlVhOsEYLtfp0G
 TAc1ygODZp5xbqVhyjanUNKOIE8EgA1DP3WirbCB7PoCqRZ3CfmTr59DuT/4b7CFqAVZ
 4xng==
X-Gm-Message-State: AOJu0YzYUd0RqzUnxQzT3fWC5zon67fS273ReD/2OkgMHsRXsQH380CI
 XT5HPvd92cZgN7H0ayp+jDKJQgV4naLw+A==
X-Google-Smtp-Source: AGHT+IEEmlaJuq8VE27FIQ8jccw/rImjkvTTIvJElKRJmyViA2wh6m/8zzVMlxMlHGI4SrDTj9vwJw==
X-Received: by 2002:a05:6a00:148e:b0:686:bd88:6062 with SMTP id
 v14-20020a056a00148e00b00686bd886062mr11420916pfu.24.1692049955533; 
 Mon, 14 Aug 2023 14:52:35 -0700 (PDT)
Received: from localhost ([136.27.9.157]) by smtp.gmail.com with UTF8SMTPSA id
 b5-20020aa78705000000b0066e7a540ea5sm8370696pfo.205.2023.08.14.14.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 14:52:35 -0700 (PDT)
From: Gregor Haas <gregorhaas1997@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 14:52:33 -0700
Message-ID: <20230814215233.745573-1-gregorhaas1997@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692049956; x=1692654756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OzNfbEm9rgdO/8Hci4wp1wDFdJ4tZxMMnA/UOJAvOm0=;
 b=A/qeP8OeTGvHPZJOuCM2tLQjuYsyehV6RO073uNxscgJp3T1plMbbVrvy7iugzb/00
 GgQbCUErSfvqSUdx+KYqiyD0oXwiFxAsmwnaq3YUkl/lSt28Nhg9hRSqm1FH96n0UbiX
 iRgezik1DYaNQkPCjpSwBrZsD6ZvYy2B9prGV9+uzlgUecg5Nz2RcKyS32koRfd1QdnT
 Teq8gE7b30Tni8WgSRVHFWelVEhmOyQ0MHNjxqmoEcR5POP9v6sxXJLd87McwTy5uuvn
 59zMFKiM95ba+JiftjQAHsnG+R9+KiDwquLOHmTysvNobQ9PUzl1O1Lgu9GXzqOwDvpK
 MzJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=A/qeP8Oe
Subject: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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
Cc: Gregor Haas <gregorhaas1997@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The core bmaptool program provided by this package depends on python-six to run.
It is normally not an issue to use this program to e.g. finalize target images
since all host dependencies are copied to the same place. However, it seems that
bmaptool is configured (at package install time) to use the current host python
interpreter -- and in the case of per-package builds, this is the interpreter in
the per-package directory. Finally, without the explicit dependency on
python-six, this per-package interpreter will not have the necessary packages.
Therefore, add the required dependencies on python-six to ensure that the
bmaptool program can work correctly

Signed-off-by: Gregor Haas <gregorhaas1997@gmail.com>
---
 package/bmap-tools/bmap-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 32399ca151..350286777c 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -9,6 +9,8 @@ BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
+BMAP_TOOLS_DEPENDENCIES += python-six
+HOST_BMAP_TOOLS_DEPENDENCIES += host-python-six
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
