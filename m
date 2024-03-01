Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02BBC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5194841FB4;
	Fri,  1 Mar 2024 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxPLJ9Rbx4I3; Fri,  1 Mar 2024 22:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4966F41FAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4966F41FAE;
	Fri,  1 Mar 2024 22:03:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDCFF1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DB683BC5
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbOwddGid27h for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 22:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3C0083A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C0083A67
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C0083A67
 for <buildroot@busybox.net>; Fri,  1 Mar 2024 22:03:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513235b5975so3522361e87.2
 for <buildroot@busybox.net>; Fri, 01 Mar 2024 14:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330607; x=1709935407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVciY2NUMgqqh6Sw0NAiBPiOmqF9mtUeNo9aAFp5Rxk=;
 b=a+fuUnpy81mpIxVdO7wUaDkSHnRRD+6oH3EETL+iq9eVRuGOEAOGiXwqP8GqIU+Vqf
 5s/zl581wQ2OznqA0B6BmzYPt31ilbk5SoRLUYzko43RS2ixAe83DtS384fHSA5ygOwS
 f/zBa7zWJv5dJton5vYGyEA2Ara/+ZiSk15vd73/3HTVKGS5yE7502m5GR7jvSBRNEzu
 IazHomm1DPMmcJjtAAAGu0qIdViRpnmCNwBc3A0O8y6YBdjGC0RkuQDxzvrou56Lhv6y
 uZao04KuZF7VPNvzkxB/Kj9DwXh8bKZ1cRFGrSGHC84vlw/qSNimo7ysfDLkOc6xV/qY
 tbqg==
X-Gm-Message-State: AOJu0YzVefdE0P2a5fsnwipNTmpdgQueLJ59XaXsXNKlHlDmsGP8Vyb5
 QtqH5Wq+UAhXy84VnjiWR51fPURmXjwKn/MaP0Ygtnzs6nlX7VLoJ+VbN0Ek
X-Google-Smtp-Source: AGHT+IHKzo1MKBUc1YteI68FEdEfV1eAtP7aYV3pfwtPKWCGnVRndVq27p8a1RHjA/r6+/3ZLe4xvQ==
X-Received: by 2002:a05:6512:1597:b0:512:bdd3:153c with SMTP id
 bp23-20020a056512159700b00512bdd3153cmr1984759lfb.18.1709330607322; 
 Fri, 01 Mar 2024 14:03:27 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 jn13-20020a05600c6b0d00b00412b236f145sm6491657wmb.26.2024.03.01.14.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 14:03:27 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  1 Mar 2024 23:03:23 +0100
Message-Id: <20240301220323.315072-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709330607; x=1709935407; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nVciY2NUMgqqh6Sw0NAiBPiOmqF9mtUeNo9aAFp5Rxk=;
 b=VpRNEoKIDCooKAY+3UJJx9Qt7OOm0rRQ6QrMGzRSb/cHw/vKPWl7GWB8jLzawQIC6z
 GVIEB5+3wGj1pYkkHcv0ugz+wg23oM0xCr6Tl36qu1m4RSkfZ+CnxN6Emv7Vrw5KFTaA
 1IS9zWL8F9qbK/f+zfJzz0Eaic56OCAphoGNIRKdt7qa3EibOM4i5hyHZ0YLuGrXQ4lm
 qX0k7JRxr4C+xxgfUtc6L7zYkIExqXciEf/B8upbIvcXKJ+dCzgsn7sqV3MwLAMF7XMa
 cV/zfp1BN6ClXz9Ct21IP8dYUFQbc9XQWpNT1KnMqa+cJ4+OcmpIHxrI+S0MONbRQ2hP
 gAFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VpRNEoKI
Subject: [Buildroot] [PATCH] package/expat: bump to version 2.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/expat/expat.hash | 6 +++---
 package/expat/expat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 043501378..980a9ab6a 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.6.0/
-md5  bd169cb11f4b9bdfddadf9e88a5c4d4b  expat-2.6.0.tar.xz
-sha1  d87e8ab2a3c1deb858c6b22e5ade9d5673086004  expat-2.6.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.6.1/
+md5  84d0ee1c554212dc8f068e538de5b823  expat-2.6.1.tar.xz
+sha1  1a1804b7c565a8b21abbd3433ef67ed8a4476960  expat-2.6.1.tar.xz
 
 # Locally calculated
 sha256  cb5f5a8ea211e1cabd59be0a933a52e3c02cc326e86a4d387d8d218e7ee47a3e  expat-2.6.0.tar.xz
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5f4016e0d..e09fcc673 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.6.0
+EXPAT_VERSION = 2.6.1
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
