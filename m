Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AFFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1966113D
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C1966113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A0740634;
	Mon, 27 Sep 2021 06:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgTgDEkR3XhK; Mon, 27 Sep 2021 06:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435B940293;
	Mon, 27 Sep 2021 06:38:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAC151BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB0C60805
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YioVdj_Yz-a3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB2806079A
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d21so49046954wra.12
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGaSSSyz6PYnS6+s/bcdtlMGhQrnP8Wbx8vWe3Tfw58=;
 b=LyTaT1vh4iXAEDgK7dhU8ZHQ6vJskt7UlB6DI/q0CZnauX4J8BS/CgPMJANvgJtTDR
 JGDtTXYOl2xWqBsj19Za6rolKrSXXMeAv2H0+ZebsHm+wSQ9lsrzxNdcC+Cnvvg/JRV/
 pPDyplDnCJ3LoKLfv6e2qPZWO9X5De7BhtVjXRpgQZw8zezZ/JabrQM1acLaanMp0YAG
 wkeHGihlVlsuoGvanjwRma2zSc8BxTqUQYqkaQPr0j0b/T9Il2HKAbRjmG+LB993ibKh
 DuxQE1x2yoB6emFIq6fouj10nsSbQYKUU2v0+FJ29Ox9bcXUsCjAk/xl8hFtkwLCQqyh
 nAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGaSSSyz6PYnS6+s/bcdtlMGhQrnP8Wbx8vWe3Tfw58=;
 b=yPdB3S7OEjnY7BinGCEI4GIlbhkH8CqdavFxnz1uBFkDlXsGlY3JPq7MBgSjzL1yM0
 9ZZgzu66Pb9CH1srozsf8C4Hyty6Q5KMny6g1Ub1fMFPPemvvSrh4AfDaD4OxPF7VCFT
 OEroekjkW1J85cyZafq+0KMnxrCpIUprt+1jBusU5vPWD13Bd6QYBDnUSLdncrWeV11h
 VFY6I8604EdNJjM5lUZqhaKKo3z7UIDQvHhiqsu0YSSgbTgRad5tIVwBHO1sLtx5X9lB
 jfb953AxJ23Qh/l831OtEnHeZKktuaTQJCh/9pjhoLf7SGqhJ9fWzMMBwp8YAEcoHZ6y
 EzLA==
X-Gm-Message-State: AOAM533hktm4IlMqHDqLjpixBXqaJVmEqmu/NYLB2GcSZItRU3VNtpwf
 fCzteE7Lq/vyh0RNN3C+y3mf550qbGo=
X-Google-Smtp-Source: ABdhPJwwaGQcSPe8a7rndGUZJcTGgpep12z39k7YaF1yi8Jb1ixXyHcSWAr+USeXzIXE0EY5CBzmJA==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr14027623wmq.16.1632724697887; 
 Sun, 26 Sep 2021 23:38:17 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:17 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:05 +0300
Message-Id: <20210927063809.505480-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tabledata: bump to version
 1.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tabledata/python-tabledata.hash | 4 ++--
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 5c9a538f66..3613589ae0 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  7d1ab52001d85d19d86f08a5ad8aab58  tabledata-1.1.2.tar.gz
-sha256  db893596ab9066e5c4f002ae0fed70657e3b75cceb52dd1de5a0e145e338d830  tabledata-1.1.2.tar.gz
+md5  1874cb0bf69cbc824a7bec67431023a9  tabledata-1.3.0.tar.gz
+sha256  54541b0c9e58f8fa38251ea0a60965dbaf95737027fa80e6ab56f98d7e4d61e9  tabledata-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index c1503e69cb..48f544b115 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.1.2
+PYTHON_TABLEDATA_VERSION = 1.3.0
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/73/7c/67eec8e92504b8e00e5cc0053a3401bd1441eefc70cecfa4427bfcf76b89
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/ed/ed/dd0d6975963967492ac2c230107587593c7bd94acfa802b0c60a5395125c
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
