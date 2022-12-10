Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CDC4040B;
	Sat, 10 Dec 2022 18:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CDC4040B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81xZuyznZ5rp; Sat, 10 Dec 2022 18:05:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BCEF403C8;
	Sat, 10 Dec 2022 18:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BCEF403C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC2621BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A760E81445
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A760E81445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTie9-qk6LCw for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:05:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F81681444
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F81681444
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:05:30 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d14so1452935ilq.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3gouA1RyF1iDPVtn35deSLbAWW49uJ5a6qcgY8hfgI=;
 b=ZQ4EiDGjcS43dra7YwQRtMhCPj8pHlr5Ye0MXUUPvqI2a3cSEVpHQXO7HcI0HR6TjJ
 qFwnLL4N1V90aTyiRsKNHaV4QjWgqh74uHOsQ7bke9ye9R0GKsyLqZEVqlkn/AtbQ84k
 iSYX7RQdYv0Um6Sey0aLaaUXau4mNzO1b+y3iV2KbgoS18zseuN1FwpRr62YjknqHbS4
 UoyVdd/5HMfVqwKM8bXaWTm2aOM4BVcefDIpG5MS+6KAz/A/Kwzmzjp7ZS0DXyvVzuxG
 jg3ir5x9PPYzHu34of0WI/jq+NCjm6OrzRxiBG+SBrDf/03XS7RfH5XsGLGvvSCu8G3x
 caWA==
X-Gm-Message-State: ANoB5pmAMGp95CByCM1B2yRqwM6xrxQMLYbBiVFoQyuiD5Z2FKtZmGL/
 R3/EJX1dT4En3uYrkkQ9HoUC8GOD/r5WDw==
X-Google-Smtp-Source: AA0mqf6AtcFh063wpVmz2hQMcKHspND6vreexIFQk530vDHCOp7KAY8f+JHGl4VlH54CFaecHJekKQ==
X-Received: by 2002:a92:da49:0:b0:303:2d1e:f28c with SMTP id
 p9-20020a92da49000000b003032d1ef28cmr5978334ilq.24.1670695529341; 
 Sat, 10 Dec 2022 10:05:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 184-20020a0211c1000000b0038a525cb97esm1589392jaf.87.2022.12.10.10.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:05:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:05:27 -0700
Message-Id: <20221210180527.2836511-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3gouA1RyF1iDPVtn35deSLbAWW49uJ5a6qcgY8hfgI=;
 b=ZbkTUUssskCHJRPcCuUU++O6Oz7YKg0CpNWMiMXXE0/j6WGKciO0xg4pHvMXoeWLmg
 lgVWFqVBuikrIxDEr4GzVhbxir6ulw5xpmd/89Kc6gmCczofA7g/xjOv1zaVXhKltHWv
 YPloIZ2gW9iGR3CDw9C4AAl2daFkOZPJ1wjXRtK0IbplsybiUcgYYwc3E3BeLlBN5ofv
 0hI3fu1BpsaCXIbhnlvp9sE/BnUU2qY5tKUZjAAytI0Uf711p7R2rbYGhF4VCt2mDtLV
 PnpC9ekfIhxxQVrelttxBzu2p+IKgg1Rbyb5QLVRG4/8IBt2GvCHIDRtubD8ZKw2aWLs
 6K7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZbkTUUss
Subject: [Buildroot] [PATCH 1/1] package/python-influxdb: bump to version
 5.3.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-influxdb/python-influxdb.hash | 4 ++--
 package/python-influxdb/python-influxdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-influxdb/python-influxdb.hash b/package/python-influxdb/python-influxdb.hash
index 7b43091eca..e86bd8c2ca 100644
--- a/package/python-influxdb/python-influxdb.hash
+++ b/package/python-influxdb/python-influxdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/influxdb/json
-md5  d528c8ccd8ab40bc608ad1e507e7788a  influxdb-5.3.0.tar.gz
-sha256  9bcaafd57ac152b9824ab12ed19f204206ef5df8af68404770554c5b55b475f6  influxdb-5.3.0.tar.gz
+md5  e5888a7023e9a49d8a372538b625f908  influxdb-5.3.1.tar.gz
+sha256  46f85e7b04ee4b3dee894672be6a295c94709003a7ddea8820deec2ac4d8b27a  influxdb-5.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b654917e2c25a69d2bd56e72dddbc6eb29bf7e40384d7c46bb291d5c5185213b  LICENSE
diff --git a/package/python-influxdb/python-influxdb.mk b/package/python-influxdb/python-influxdb.mk
index e5b1aea70f..d77cb89d2d 100644
--- a/package/python-influxdb/python-influxdb.mk
+++ b/package/python-influxdb/python-influxdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INFLUXDB_VERSION = 5.3.0
+PYTHON_INFLUXDB_VERSION = 5.3.1
 PYTHON_INFLUXDB_SOURCE = influxdb-$(PYTHON_INFLUXDB_VERSION).tar.gz
-PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/be/8d/85ec8f11299a6dfc115244db71fd8f13e9a69f5e9eb77dc3392f4f959e9a
+PYTHON_INFLUXDB_SITE = https://files.pythonhosted.org/packages/86/4f/a9c524576677c1694b149e09d4fd6342e4a1d9a5f409e437168a14d6d150
 PYTHON_INFLUXDB_SETUP_TYPE = setuptools
 PYTHON_INFLUXDB_LICENSE = MIT
 PYTHON_INFLUXDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
