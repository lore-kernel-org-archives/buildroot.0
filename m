Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10590C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A9861506;
	Sat, 25 Nov 2023 05:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A9861506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8zRcZV1zFzg3; Sat, 25 Nov 2023 05:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5A2614F3;
	Sat, 25 Nov 2023 05:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F5A2614F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 443E41BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4DE614F3
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4DE614F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4KRpvafJxZj for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:29:53 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D1DF60D51
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D1DF60D51
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35942cb9ef4so8405815ab.3
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700890192; x=1701494992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cEmCuIxGSe20waSQyjHdqD14O31ZIIt/m1fTCgsPT/Q=;
 b=lUf08RUvLnWbNf5ePI5RsCEOF5hrYjtGrpn+Q36lGhrF2q1X+5h6r05B7OCnVDfRZ+
 nkuzbeiRDkUoGVC1TOAEBjEc1b2+t2aGD2H+3Mw8/uE/trXtjPpkA3CM4q2gVidWvSw4
 jr0/18bIHpjqHi33eelVykNZdDfSoi7yMqmgosgKuAScv+rhCGZlxdvwqrj4pIw1DBCr
 xd+tF3NaIdg6rfPIP2WTTa8uvj/UsynaDLDL4ZgbXAaWHKgMRJOwvpRDkWdxnHebi8Cp
 xPjc3TwdQrROWwj+P3z54XbTA3vM9+6kMxK0X9MTpuaGWQUdkMd6ajLE1EdroyDVF8oJ
 jEGw==
X-Gm-Message-State: AOJu0Yz01UhBIWJiiCeruMsgCe6nhzTI6z2Ba6x5zh9qrefOwgfKKpFw
 iqbsrYigtu5rvfeput8U41Ljyyo2cPE=
X-Google-Smtp-Source: AGHT+IEprFubx82VmBvFgK+UCQiLOtXUl3MSPDGnyeVPPH92e8jfjOtgZtz3kYurliEOce7uI1wsJw==
X-Received: by 2002:a05:6e02:170a:b0:359:42cd:1417 with SMTP id
 u10-20020a056e02170a00b0035942cd1417mr7741200ill.17.1700890191920; 
 Fri, 24 Nov 2023 21:29:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 o17-20020a92c051000000b0035aa4b0d786sm1411259ilf.25.2023.11.24.21.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:29:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:29:49 -0700
Message-Id: <20231125052949.300404-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700890192; x=1701494992; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cEmCuIxGSe20waSQyjHdqD14O31ZIIt/m1fTCgsPT/Q=;
 b=IIMtDR6qd1Ih2Zmyk8IGC+ju5Fsd1DArr/bEDLLAkOEQlujKLOtd3y+16wDof/OhXy
 OH+K5Q6DIyesQHHeCyfa+hiaEt9V9yn3wL7Z8uZJhJP9aMyBr3DjmY+tEZluraTyl++Y
 luTQlZ03XV/74lV5IH2Jk2CvyEiiw0rYQ4qHhN9b5E9K1KfIDHE1Ed0hK5aFKEK51rrV
 hmVc/9rD6vnmT7zdwBYhNCkLtPqGSZdEMCT1KLr6uov2nqSrlZDJ6ifnXPL9hLvf7Q5b
 RX5mEkBcA1Z4WoDPJyacoQzt7z4krB4xvr7kjOWyBn6KhVTcZ01gEpyeJBgMFZgAMrDz
 NBgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IIMtDR6q
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 10.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index c2c5125678..92258a6712 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  93a0585ab0ee9717a7576129bdabdf93  Pillow-10.0.1.tar.gz
-sha256  d72967b06be9300fed5cfbc8b5bafceec48bf7cdc7dab66b1d2549035287191d  Pillow-10.0.1.tar.gz
+md5  a55618c5d2fd64048dd3ea41bc39f7cd  Pillow-10.1.0.tar.gz
+sha256  e6bf8de6c36ed96c86ea3b6e1d5273c53f46ef518a062464cd7ef5dd2cf92e38  Pillow-10.1.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index d9f6fba861..bc94062da8 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.0.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/64/9e/7e638579cce7dc346632f020914141a164a872be813481f058883ee8d421
+PYTHON_PILLOW_VERSION = 10.1.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/80/d7/c4b258c9098b469c4a4e77b0a99b5f4fd21e359c2e486c977d231f52fc71
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
