Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C334ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0852360B70;
	Fri, 23 Sep 2022 01:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0852360B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YY3GVrxTXLIZ; Fri, 23 Sep 2022 01:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C084060B2B;
	Fri, 23 Sep 2022 01:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C084060B2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24A011BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0B2440490
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0B2440490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvmeRO6_Zuc9 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:38:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C6B54019E
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C6B54019E
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:38:34 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 l40-20020a4a94eb000000b00472717928b5so1690479ooi.1
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Hp1h+rC7ChpdBfJfO30pfRLfLXzOTLQzzCagX5+lnh4=;
 b=ipxL2pGvoMPv/eX3q72qQB1AdjWxjHj5xmv/cJ+03/7XY5PUdJt1/wurkz38mauAIX
 k+aOxLiU5TrHWbSdmf8Qer9m2lUgJTjQfjgm/JPENprvKaJLCi2Dz5JIc/zbPrS+TJYH
 SpP6sRpHswdUOPk70arf6eJN6c9x6KF7DvpqmvFB0J3qZvR6uLR35VX0NP+lxG38VdeQ
 lkwkaceUsNkp/PsjG0An2WDZ0WCW/4lcpj8GQuyxz4bIfbDvB1RpWhiPMBN++bW0oaF6
 ZjYsgQclBhyWr6qFzVJxx91oLFrIlcz9LFG+1HvpwSCusKRVujK/9JGJhF7+URs74vMi
 cdBA==
X-Gm-Message-State: ACrzQf3kz6WGrdsKMGgZNPX+LzDAvASZ0v6opXyLWx7o6VgNPowD76MB
 QgLv28oWzOAr1xPOrlIs95BmuQ1cqQ+M+g==
X-Google-Smtp-Source: AMsMyM7Rsmd0pAU1n1MAPS9qCYbTfLMnhEIfwOQYymv+lmuf/OkWIv7BRUmVo2LKHIxAJEujysbzfQ==
X-Received: by 2002:a4a:d492:0:b0:46e:63cd:7e9b with SMTP id
 o18-20020a4ad492000000b0046e63cd7e9bmr2551178oos.17.1663897113721; 
 Thu, 22 Sep 2022 18:38:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 cy24-20020a056870b69800b00127dc5bb89esm4080163oab.37.2022.09.22.18.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:38:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:38:31 -0600
Message-Id: <20220923013831.923637-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Hp1h+rC7ChpdBfJfO30pfRLfLXzOTLQzzCagX5+lnh4=;
 b=D9jq8XhEiYqVMPlLCvijWsyUg38xdz/9hHepSey2AD30Cl/iyhYrdBaH9KLdwqp3iL
 NPSP9x0ot7mMcDIOzgisbie1fgtI64Q0VHJht5VSK+qiytv6gBevGWkcqGL5YmxM02Jd
 Tq+gGPIEuilbbF97/TFrEddoONrbIN+pM2cku+uSrTFpWS4/CNlQQWkpjsjb7Z9Ey+h3
 hXn9ns5NIvd4lMDvPbGLMnH+1UJHBaYTEFMZrYdO23Dxq6vvFiY6vuNXpOAffKBiOcJF
 SCzd1Z7vlgZ0qSKkHkd9l7o2GCERpyktvGjy+gKyIxq7UkWlCnCdf84EjSmBD/TtXpGL
 AFxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D9jq8XhE
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.12
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
 package/python-urllib3/python-urllib3.hash | 6 +++---
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 7efb96dcc9..8aacf5780a 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/URLLIB3/json
-md5  80f4985c3e636b10bafc65f3d64c3df6  urllib3-1.26.10.tar.gz
-sha256  879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6  urllib3-1.26.10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/urllib3/json
+md5  ba308b52b9092184cf4905bc59a88fc0  urllib3-1.26.12.tar.gz
+sha256  3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e  urllib3-1.26.12.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index b8de7e69dd..96d3938fd2 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.10
+PYTHON_URLLIB3_VERSION = 1.26.12
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/25/36/f056e5f1389004cf886bb7a8514077f24224238a7534497c014a6b9ac770
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/b2/56/d87d6d3c4121c0bcec116919350ca05dc3afd2eeb7dc88d07e8083f8ea94
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
