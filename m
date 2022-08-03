Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04945C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 12:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF378127C;
	Wed,  3 Aug 2022 12:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF378127C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZR206g5Y1pL; Wed,  3 Aug 2022 12:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1D281266;
	Wed,  3 Aug 2022 12:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C1D281266
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5B631BF2B7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 12:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0DC181263
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 12:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0DC181263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD_bg-mKppFM for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 12:34:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00558125E
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C00558125E
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 12:34:39 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id tl27so13362343ejc.1
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 05:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BnrpS1h6xlyBsy05nyDslmOilAO5uMMVRBhOATZfRK0=;
 b=aag0W7Oy3secSBq4F4xF1ut1HYd+bFEbJu/Pa84wZZlbCPUx8Ed5+4/h1ylT2ThevC
 /Qaf6nE0w0W3xf7uN2bp6WTxcMLlFftUlidIcm2MsV2wJblyW/NaM9CmPqALOPJoJ2cu
 IMF01d0qQa1V0VpSWtxl6Os38D9+/EapHMie+uVPvxya4gWQfN6i942VjP3qaky4/waE
 SADVwCc/HkPhQqn21THz1Jls1HttQex5VR8AJp/joN6L6uiVooir632hqMG8RB9092n+
 q9HseSDr1SXCea3FicBb0Phx4x7k7iRzPhhPR65/TZ/wr/P7zrBSZSoJfX7zyKSqTp8R
 rqYw==
X-Gm-Message-State: ACgBeo2ALk698hCKXn/Yatnv/ahyJrUcN2YxapSgVyXsNG1Sq8/MELJ0
 TXogl/wIoy5a8cKcEaCO4WL79TViwAg=
X-Google-Smtp-Source: AA6agR5j3CMVAKdwp1bYitPQmQ3N3qA2suhQE5aaO9x90Jus7FVkVHuf/chNHPMw4jTrO/0ycz0UXA==
X-Received: by 2002:a17:906:8a73:b0:730:9af8:b335 with SMTP id
 hy19-20020a1709068a7300b007309af8b335mr8244232ejc.14.1659530077583; 
 Wed, 03 Aug 2022 05:34:37 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906318600b0072ed72072aesm7229830ejy.192.2022.08.03.05.34.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Aug 2022 05:34:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 14:34:31 +0200
Message-Id: <20220803123431.2343-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=BnrpS1h6xlyBsy05nyDslmOilAO5uMMVRBhOATZfRK0=;
 b=hmoKmj4f5YryR6ZE4TAozr3iMxTvcTDjMEsfNvq9gkU/NC0N5xEMKSk7fW/ETWsmfg
 D0eTSTOokdy7XrM+yJj2TaIGWxN/3ZSJIj1+UPtIedlABEEiEL7iOOTRxYFI80vZNMT7
 qgI2w6x9MzueSkusrihJjcrJySCWS9MPVDQekukDTeV+wFKlr+Nz4losT6BpB3krg2Qg
 vNO8AfxDqDr0zfNJeQlILinuzzq0XUi76xBy9jcHRUbiwRlgj0dTpn5nnQtnHyUJ1N7X
 zXNeEnbDjvaGe+wks4IPVlVwlWkuVsEDwJUFPmw7IfrzZM9EAwmBqWWSmQ0a7RkBZJl+
 RUgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hmoKmj4f
Subject: [Buildroot] [PATCH] package/python-jsonschema: add missing runtime
 dependency
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-attrs package is required since version 2.6.0.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-jsonschema/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
index 7b30d46fc6..d9508c3705 100644
--- a/package/python-jsonschema/Config.in
+++ b/package/python-jsonschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONSCHEMA
 	bool "python-jsonschema"
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_PYRSISTENT # runtime
 	help
 	  An implementation of JSON Schema validation for Python.
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
