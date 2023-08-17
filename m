Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04937C2FC20
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 12:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64FFC4186F;
	Thu, 17 Aug 2023 12:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64FFC4186F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1grpjiQrPp9n; Thu, 17 Aug 2023 12:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B374641868;
	Thu, 17 Aug 2023 12:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B374641868
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A278C1BF3D9
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 12:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A65942019
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 12:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A65942019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJEodFee-Dl4 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 12:53:21 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A6D742018
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6D742018
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso992734966b.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 05:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692276799; x=1692881599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bx8BCpTroTWURqbIvnr+E3SgmKzJserz6EWjQK4A+eU=;
 b=fGFmRqpNG8azBol8K1LV8YK5Q6hcBuLFUR2UO7gUgY/I+5efIKH5DEPB0wd8ka0cIe
 G5/7E3me150AugYeOiATO8rs8u3pA7IioGmbGf7mN5vfunXtN8npNIz2h8oXOnbq5sHZ
 3LNHdXbax76VzsmvXrIymDJ8l3wSCf6NYnfBzNK4YG2De8NRu2pqdQ5olu8TS8lB4sxP
 nCgCQRVtkstiz9Uk9dVsUdv/tpisMo3Q6mlXHT6JmXlVgcsPmGtuBKooItOmnpUhy+HC
 uXCNSTYgrbxoJVYQG292tOWZ1Pn1qAlGVIhe97dxbCJLTQITnwoeNlV1xQwGjT51Afq3
 zbNA==
X-Gm-Message-State: AOJu0YyS8CVN3w3b/Cx2ijZI9T9vn5sljSwNtel4zhc+ntlhFZozW77z
 sgmRAmJP31YkLXrEpKseeh2a66ydVm6NU63N
X-Google-Smtp-Source: AGHT+IGqqlKPo1nkqLd0SYVW9Td7k7z4AqCrEj4Dj6vDhMRodXkarOFtsFukAbuF4sK5/F182Zz4hQ==
X-Received: by 2002:a17:906:53c5:b0:99d:b540:d625 with SMTP id
 p5-20020a17090653c500b0099db540d625mr3853248ejo.64.1692276799026; 
 Thu, 17 Aug 2023 05:53:19 -0700 (PDT)
Received: from iamthediyvecomputer.. ([2a02:8440:5140:f23e:8d5:80e:eb61:bbe7])
 by smtp.gmail.com with ESMTPSA id
 gx20-20020a170906f1d400b0099cbe71f3b5sm9991001ejb.0.2023.08.17.05.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 05:53:18 -0700 (PDT)
From: Clement Ramirez <ramirez.clement3@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:52:36 +0200
Message-Id: <20230817125236.985073-1-ramirez.clement3@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692276799; x=1692881599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bx8BCpTroTWURqbIvnr+E3SgmKzJserz6EWjQK4A+eU=;
 b=KkZ/KX8QzCN1bJ7CgIu+9hRl5J/8JW4PK5HikDGUbPcAWJTc5teByEMQTEHBRn2qxQ
 59mhvb69AA7Hba6zMSlLgGZoQxwBeJiRtQ7BEejMZ8vM9sq0QsN2uIO9D1t6UCN7my8N
 Mx3TS6upUfFQSiBhanlm0e+/62khYgzUwncxzKSKNNk7Wkb3kjZ9RnS0STDQ+gU9hYYt
 K3H/C82dCnDKvrtBb1Atn18yWkFEV9p4OlcOqSus8k+33SWuI9YBA8NOjJ+YFITelDKc
 zcg/FHaN3tR7+V5hoTa4VvKG0lq0YTrddYP0QiOEIZ4jlaDx9zX6ySS81mGoK87ydm/0
 UGvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KkZ/KX8Q
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump version to 2.4.6
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Clement Ramirez <ramirez.clement3@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-34241 (see [0] for details)

[0] https://github.com/OpenPrinting/cups/releases/tag/v2.4.6

Signed-off-by: Clement Ramirez <ramirez.clement3@gmail.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index cc6fe25446..501d8c12a6 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  209259e8fe8df9112af49f4e5765f50dad6da1f869296de41d6eaab1b98003cb  cups-2.4.4-source.tar.gz
+sha256  58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262  cups-2.4.6-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 7bbea9a218..a3bb2f8dfc 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.4
+CUPS_VERSION = 2.4.6
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
