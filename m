Return-Path: <SRS0=WOAM=PR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EFFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 07:00:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1317360ED5
	for <buildroot@archiver.kernel.org>; Fri, 29 Oct 2021 07:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1317360ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA94F406CB;
	Fri, 29 Oct 2021 07:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkaMgqs68932; Fri, 29 Oct 2021 07:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DC8405A5;
	Fri, 29 Oct 2021 07:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8811C1148
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 07:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 823794024A
 for <buildroot@lists.busybox.net>; Fri, 29 Oct 2021 07:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThstlY5K2Uy9 for <buildroot@lists.busybox.net>;
 Fri, 29 Oct 2021 07:00:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F451400A6
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 07:00:01 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id g125so12045595oif.9
 for <buildroot@buildroot.org>; Fri, 29 Oct 2021 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUWSIKfIbsrhh7+C9ZvAhDMvzwwbgT4l3dNUuiPsjFk=;
 b=RPBBkVfNMEVG2GGLkEosraXLoxsp8j+Mf+Wu3RoqpPgH5fS8XLnmqzwKwUMoUrAIN8
 VRA6wDJYEUtWEWH6WGHLykiYshEJdcA01VobHPNOmIo7q2Bn3O2voA3O6V5TAMpPvUTv
 NfmvObcBj07JGQ6mLoQdtnrXpO85//9h/C4oFYy9d09TzD5r6iXnj2sPO4FkyAChiPF5
 JjU7vF8XFRoxaGRAdMk+J2XMLFBBwERcmDjTQgX0+IFxbez96r0xS20wTLfGQV6Tbov5
 379NqzDKxYA+dLGAw8Ld+z80e3gPr+jQ/5oBm0WWCiJGt+Lmxs/3hyJ6Z/o614inQssh
 113w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CUWSIKfIbsrhh7+C9ZvAhDMvzwwbgT4l3dNUuiPsjFk=;
 b=yWHvoKHfzz30qb7LWQDagC3Bryp/WDRPBaVRD/V6IUyWpkrhDETwxFUERJhQ2oE33x
 Dsa7G7hhowD9NhBtPOf4/4byhgSpcPzJHh4iMr8Xzlu2aK1Nnpt9++nKPl98g0yBGrz6
 3Nistgd+ViZqBm1Wd4g4uNaifokwf2PhNhHlJgAwd1/cW0EjcywyVWEUJSVWuPYFru+v
 wANvH5rbkDRPzEWz8DDsAhHt+gPdmzSKPBP80zdE0HKa2B8azebmRP8HPArAPwf5guQr
 wbiq+c4kt85E73X3g1ANOcp5FN31LvumvX99e1Xh5ZcKguTa4DFp8RefsnChlf6Jy4Eh
 ftyQ==
X-Gm-Message-State: AOAM531/D4xftvxqkG4zkPDZdTigNY5oykdplI3qUu2ewFym9gDF/nJI
 ktxa1ipfeNzlNdf28+fXkjHKdw4P9Ac=
X-Google-Smtp-Source: ABdhPJxfNIXKboaHlwd3Z3CDcIOAT7D0Y8LFGPct3+akFQe4fT3ydjY31/aQUROJ7cGvB6B7k9ypjw==
X-Received: by 2002:a54:4d89:: with SMTP id y9mr6603601oix.22.1635490800092;
 Fri, 29 Oct 2021 00:00:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id j15sm1761658ots.58.2021.10.28.23.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 23:59:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Oct 2021 00:59:57 -0600
Message-Id: <20211029065957.3084528-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This dependency wasn't added during the removal of
python3-cryptography.

Fixes:
 - http://autobuild.buildroot.net/results/971/9711ccebb9c3e2fa8f17d969d8b431d4301677e3/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..081dfc06a0 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,10 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python3-cffi \
+	host-python3-six \
+	host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
