Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE04C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FDD81B9A;
	Mon, 21 Nov 2022 12:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FDD81B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxhY6YvIvw3K; Mon, 21 Nov 2022 12:20:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FED781B71;
	Mon, 21 Nov 2022 12:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FED781B71
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB7D81BF2AB
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D7180CE0
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D7180CE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pL3UQI6oA5Ab for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 12:20:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C07D80EE1
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C07D80EE1
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 12:20:28 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id x16so5563751ilm.5
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 04:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nC+YhEeguF22z7ZXHVpFeIAwIk1SQVLt354wkAVbYd0=;
 b=ssTu2Ka/ArQH18aWw3cQbu1+p7ocmOGR9zAqFvkCXX0ObgnPeP496GNh0frMr8RKV6
 xelkfoolPmXjn2vEUQo/FAv8c9Mb1o9ALREQ1UYHK7lI9dRWyAn3yXY2TreSAUdBpcDU
 kgYUu4faRKAVMJWoISvzjTAzhSPszJ/31lH746EW/7XTDDbCbU1b5a6nPS9F+NalvlMM
 FxUon91g2sEVNC6pcBnA7xOSfou8UoeAzVQdCq8BmRDrvi0NUGKLeyR7mqS0s46ObDHv
 OXBzNNsRNI46Dv2aRfaYyU9JBHDqLui6sqtT60TfiJUnVm/7aGU/0AEQuhihjCxWDv0N
 UZCg==
X-Gm-Message-State: ANoB5plqJFc0N7M7DOGSCd1z4DevVwVtCy7KS4y/zbWZRsUwI/OjuMff
 sGJDGRgwkPRB9Z0G2BnM4d7yt1OJoi4Uuw==
X-Google-Smtp-Source: AA0mqf48AAcU2ldpQIqy0HMaZgnk00nlEm5f6UK6Y1/VxNZgStdIA5DJF/bulW9Mwn9xSh3/2CL03g==
X-Received: by 2002:a92:b0e:0:b0:2fa:52cd:80eb with SMTP id
 b14-20020a920b0e000000b002fa52cd80ebmr6130ilf.236.1669033226862; 
 Mon, 21 Nov 2022 04:20:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056e0204c900b002f916f15625sm3864695ils.23.2022.11.21.04.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 04:20:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 05:20:20 -0700
Message-Id: <20221121122021.287011-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nC+YhEeguF22z7ZXHVpFeIAwIk1SQVLt354wkAVbYd0=;
 b=BoEI6PUHoOqqJ8UF6rgfcuGY9bZmXN3gFepHH1SnNlDciYfAuSajnuL/U8NRHKOBkH
 y8i1yAOoGTC5uDXZHJpP2PYpP9pkEN/YjLOr8w2QisfbJyaWNe+LCOuC0RDAIdSk6zaN
 Ze7jA/MyfgiFYFakr4h+ESAEl+pdKRtw7Xv2dSwt3WD0Vo0dKK5gkMSRUGKLjmOvngLc
 wVowIpyYvERHZlEU8yuEcsTpjITw9V4sgl9AiMdnyl0wEdEVd1MDCdelp7rYsIjwIuj5
 pMjt5g/0eh4ukjKiWd/66umfpGt9ntfN1mPC8eJBd9B2MVFS19aHSY0wtZ7FYMCeHmbc
 Wqbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BoEI6PUH
Subject: [Buildroot] [PATCH 1/2] package/python-orjson: bump to version 3.8.2
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
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 1de1d7cdc2..8563ed544f 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  285091518bdbde8086c60c5ed6d7090eccc1c232b00138c964c410f1a7da654f  orjson-3.7.11.tar.gz
+sha256  dc06889b0ce52d5e96253573f6cbdf5939c5902022cbe2538cedc622e9378372  orjson-3.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 0a266e827a..b18a5cdada 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.7.11
+PYTHON_ORJSON_VERSION = 3.8.2
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/fd/52/42520dbfd47191977140c49fa601624b9b4c6cc9d6a62d3e68970ee9eac6
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/13/08/d476fff015ccc0f043d3df6332c807695ae3d6abc1758b24f3d335750550
 PYTHON_ORJSON_SETUP_TYPE = pep517
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
