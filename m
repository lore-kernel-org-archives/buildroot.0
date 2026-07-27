Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E32C53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C1554048A;
	Mon, 27 Jul 2026 09:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6AA7F1Y-soga; Mon, 27 Jul 2026 09:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D7B1404A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785145757;
	bh=gZOhC0vQF8BqgmFGr61CFmnC7WaTopc5J3RSk7XlhR8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmJwXkem8+O/NtZuz0tOpr7fQFQCOjxk3Yw1Nl79X3FMvnHqRyBgIGsUD0Cepy8pa
	 U2T18IXhJUkdsw6JflJ59cT1CPm8cFlwl18+FQknuRVpb7VB1Fu29pV+60AoDaMEMF
	 z8lGM9FdHf5HaPwqrFaZPFWL9FAOKej/Gez5sRmVVgi6pz4zsqh8+baOTI91OeDo+6
	 zUgu/VzATbQR2EE4blYg3Q7MctB3/Skg/S3mS0TQkg1Yi07iEaQw9fI1g5/8BUv7km
	 6cT++wX0njZ2Ai63y8x9RDKyYRtDewjl4CEXRZWhnkHYImcFDziHQa7dmbJDcbER/7
	 eobPfhBpww6sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D7B1404A2;
	Mon, 27 Jul 2026 09:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9862726C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA8580D7C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZEcEHik1aWQ for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 09:49:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC7C880D74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC7C880D74
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC7C880D74
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c15fc4707f5so18636666b.3
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 02:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145752; x=1785750552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=f8MmmSg6AZhjwgDkQhb3i/aW5mrzxSMo318EbfKzkdQ=;
 b=EpltuZIFDFFdaMSseX/JnVHc2x4ZtEEbO+YgudXzaIQiZpB9vIMqHxLyU9g7UNnkhn
 zixV/D4urAoEv4EVUqHCCXawtNkVmemO9DNG5b292CFFDIQMGCN3qfEplUQzgOFqcOGs
 aCdzSqRAHZc/UU3uRr37n4jLWTM7ey7qFCWCrkQsf+mgBtz0NAASktHWOlkeGxYkUD9Q
 wu5pyMX4l1xD9l9T8d0UqwEA98zZmrwFDuJb3lF5uBIvqRJXP7V3004D+Xx77AQ0GwoH
 pwFmCU9mSYNj9UkgMO0alKtrgaDkv9NYNfASMjWCs3V3Pb9IpC/lKi4AnAqCxF816Vh0
 TYuw==
X-Gm-Message-State: AOJu0Yz0BXnwAr8yUVmCdt/7xvrJAo2EAnHJFF/fk/1mZygcwKfq4Msa
 9V7UFinnR0cTSBU1pHJ1YINtmRcdtW87cfxzYoAGPFJW2pj/IoEam4ArpXkAURgYZPywBNfriVW
 UgzMP
X-Gm-Gg: AR+sD10FAlVl+nSsrSDyK2qBUfv7jAqN/BMlGA/oLtcUmdaYSWK2AOGYS+jHt0Zyl/+
 HiAfkDn7x5mdFpQylSPQAh9E8JGo5cQQ9hxiN3usNYzISuzxYjZ+lyGaPPOJ4SImkc99av1XVDQ
 Mm1/fXn56NqCuMnYmZz8/ZLqs4rkdRyLBnkvtaGYUxjpU60DQiJpGoB9CAE2BJ1LSQWo+VW2lzn
 7CLr3HwTwnv/paQd9iaZv9iMzUDy7pIP1LvoCAWJxbSaG3wPVbfj7696OCIp1wNyEfBAo5Qi4qM
 zPgh5kGncysgUoLDWEih7TbGEZYF6rQMC2+8tjt3rKyek/PEJOx1q3OCgi7qe2r/eo+cBvCuyHR
 C4ERieiRyzUear82xetUZcJ1bXpMsHnaDY7Ow6JEKb7nMCEskyobg/SrJBIZnEtnU+L9h8mdokJ
 nR92Vzb+ZYPBfXu7sfwD21RF0M4H0UGEBP8Ok25oyZdKNlx6B5vbuJpbBrPTl2gc1CNNFQYwLkl
 +H6kfd9E/JOUZI6kjhn83/Nq1MU7GPAUcZ75ImKQPTgQkqDiX1l6bEixNCJg1d0Y9Aq2xv8f6Bm
 Wwdv1g==
X-Received: by 2002:a17:906:f598:b0:c15:c651:f28f with SMTP id
 a640c23a62f3a-c1f1f027239mr193134266b.3.1785145752417; 
 Mon, 27 Jul 2026 02:49:12 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32c90b42sm617448566b.38.2026.07.27.02.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 02:49:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 27 Jul 2026 11:49:06 +0200
Message-ID: <20260727094909.1701843-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
References: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785145752; x=1785750552;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=f8MmmSg6AZhjwgDkQhb3i/aW5mrzxSMo318EbfKzkdQ=;
 b=DG1bgtFTcPPvpUXTh14BFaCoMSKDeu8yiiw/5xw+8MozNV/E/xlVcySZhclb4+kFGG
 +d9B3tnAW+yhcU5Hf00Lmv9tKNKI+9jf0aWeE0Kd/FvNtflBmM4Psd5wVdle9R6u7/9V
 OgrWAfbcHtK8RShDVaLeQTzYYOTHDIm26WQPg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DG1bgtFT
Subject: [Buildroot] [PATCH 2/4] package/mender-connect: bump version to
 3.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  - Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/mender-connect.hash | 6 +++---
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 4b18a540cf..2872bb467c 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,13 +1,13 @@
 # Locally computed:
-sha256  c90a5f5e2d7ab4396e04d1914e2cbb2a16cb11c1d6e038b889ba7ff941f1e02a  mender-connect-2.3.0-go2.tar.gz
-sha256  c57e1178f932015d7f08b4d76c4b18e4a55083a6fbc97629cd25ef426bf1db30  LIC_FILES_CHKSUM.sha256
+sha256  b04331f447b9d21c5962d5aef2670f1de861e3065522a1b298af0904a8ee6400  mender-connect-3.0.0-go2.tar.gz
+sha256  420fd444caf5a39bc2db0ae2202c71451a8ea3900011547bd0fb22678aaa4ef6  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 #
 # Apache-2.0
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
 sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 9e6fb87ed5..98fdfe16df 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.3.0
+MENDER_CONNECT_VERSION = 3.0.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
