Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F2C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 23:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2BB14052D;
	Sun, 11 Sep 2022 23:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BB14052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-izFaxyzPx8; Sun, 11 Sep 2022 23:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3BE40C2C;
	Sun, 11 Sep 2022 23:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F3BE40C2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9908A1BF427
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7495A404EC
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7495A404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvH45PJgEQMk for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 23:41:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C87A404A6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C87A404A6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 23:41:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id l6so3728919ilk.13
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 16:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=go1oCAeYt4AGuT6OYpUjeXK1eT03CPXUu/JuO5/jDO4=;
 b=SpVLqYOCQTxSliaFT6nqMMK2YdzJJiyPCbWQ95PLlEwRs7OjhJoofXQ5Qehy2+NcSy
 L9eprlSIZ+56dFR1l+l/SetefzaAYQA4DH9aCgQxHfIQfIpjoHgiboTJ6EF8CQrrhD0X
 ni769DMt5dMH1K9gVbOhgntSM8Tx7nPQrWUeoMyq6oc0GGwkZ5kg1cX86A4KjSS1V9vU
 ezPB+KqoncfA1VDp+6sR40+LEE35FyAIFUvRtUSvQw3XAW/VftkSqcr6xfP2At+2tMCH
 EFuHJqbgm8Idj+gcAto6jJjPaOWe+dnMTVkv4Qi2guE3FuxD8O8AWYAvT4mzwnvQCgsq
 na1A==
X-Gm-Message-State: ACgBeo0JewM86rRelgcgPbCQVdPiEwxN8ISVcdAc2GOdTs0bc9WRnKwl
 BfruM9SbWcNzMANUycd1Bp/Ht0z3Rq4=
X-Google-Smtp-Source: AA6agR6WsmADxxaLEkMkl2Xu81HePBpRll5jQvt6Vb31c16+knklfJ+xZONFE07wRKgD2Fq3Q51BpQ==
X-Received: by 2002:a05:6e02:eea:b0:2ea:9ece:63ea with SMTP id
 j10-20020a056e020eea00b002ea9ece63eamr8790162ilk.86.1662939705984; 
 Sun, 11 Sep 2022 16:41:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 n25-20020a056638111900b003583a010e85sm2900098jal.94.2022.09.11.16.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:41:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 17:41:43 -0600
Message-Id: <20220911234143.3740819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=go1oCAeYt4AGuT6OYpUjeXK1eT03CPXUu/JuO5/jDO4=;
 b=ISzP5klmAGQmqyHWUPGjQ/joeSZFOE+Wokx/DS1uCM50Y2/ilAeE+pD4Np+Y7K6Gxg
 YVnD8cqdRQHKUYXw9kT/+kjZdFpV3rkPuqwn06jxhSunBWNqewRNJGVkmA+D5q8fvoCf
 vqoPCvqNkVn19iD5DHYOk8ko9r5Fv9Qf82d7RXUC3uYx3b1vEkT0ZHco9xQCtpJz96jZ
 vS5EevCLJd3gwbL26ALHCyQw9HwdEneiNUvBNQfAoPUA0skJmN9GjFLgF3TFRdbNH7QI
 GUriA4k/NhwGEpp+sehphGyn9BczFmFhFJxPj69ywdwwn45AafTvTRqIlJZAE0TNsOSG
 mYCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ISzP5klm
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 65.3.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index e01350124c..3f68084068 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  d72acb93671bde8e4ca0971866f9cdda  setuptools-63.2.0.tar.gz
-sha256  c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450  setuptools-63.2.0.tar.gz
+md5  66c6b8819c5306c12c38d7fad41b7f99  setuptools-65.3.0.tar.gz
+sha256  7732871f4f7fa58fb6bdcaeadb0161b2bd046c85905dbaa066bdcbcc81953b57  setuptools-65.3.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 082b293eef..b7483c6347 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 63.2.0
+PYTHON_SETUPTOOLS_VERSION = 65.3.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/0a/ba/52611dc8278828eb9ec339e6914a0f865f9e2af967214905927835dfac0a
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/cc/83/7ea9d9b3a6ff3225aca2fce5e4df373bee7e0a74c539711a4fbfda53374f
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
