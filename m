Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D45EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E550610CE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E550610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED0A403CB;
	Mon, 20 Sep 2021 14:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j7CStNr30gyb; Mon, 20 Sep 2021 14:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E044044A;
	Mon, 20 Sep 2021 14:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA38E1BF289
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D958F6064E
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvQa1Jnk2Qdx for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 14:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C526064D
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 14:22:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u18so28489030wrg.5
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 07:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4nd4qwMGeCrGutgabCfChRwvzKkEmWEIa3Lxu7MpEU=;
 b=Xvv1eXY3xO1levAELH50ORH0lggbGtc6QWXrg4I2PFFmoTqwaUtadeYHouW3EGvNkd
 nZS2tV/6ncUoaYBzgmu40ICBU5X0BU1eIHkTyJ/qE4j4O2KApG/32tBUUCy6M5lX5LqC
 M4VKINemaiGMhPk8cjrvJ5g15/0ElmMxpAmbby7fYpA/M7D1dKpphVimpYzds7j8TN+G
 ULXnzfsiMsfuUS8T0OG+rKAZdzcPiHR7OzgCGaMd/02WZpHsjsygMPlaEZz6b/ekkxrZ
 0PyxrW1yuefxDggHlS+MIRg3dJE05mCrpjegsYUIqqudp6zTlYBfZXsnT5T5lDV46XHI
 OXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4nd4qwMGeCrGutgabCfChRwvzKkEmWEIa3Lxu7MpEU=;
 b=D/GHuJyusRoPG3517JNA6LySCsgO672PSi24J0RECBjGwKpKAa1MufdPXbcseox/8p
 KyeyylzS8XrNYoMZdPcq7Ak0Sg7vxFSdwNPMh7vfCEQa3bQnRDu1lOiNrC9E5lTn/wA6
 4uL0RsX2zH3tft0qoQj4YgvI6keEJtPBDiI3ATNUO3IDkQiDgciTbHG8kt+JoiSAM8Ok
 jUnM3k4D88N6rNPfn44DrYTHq0T85jkveLY6pi6qNmGHyK0kmyw/dWJJ9ONAY93VkYei
 OjA0zVQLyhsDA8RX3RwSaxRvK/ngY8AjzoAppXUHjNOoNaoQSnbkSrZ4TFOCvdBteq31
 qZHg==
X-Gm-Message-State: AOAM530aCUtLdGqahWq/N8h/UUq9iUmw3zi7dNF7W5aVGFOQGZDm9GJf
 yg9n9GQQmDanx/2ZGVnBZjznwmDu0j8=
X-Google-Smtp-Source: ABdhPJxLvFEx1T8WY8t7qimZq/MRNjA3uL73OJNnociaok96IIJjaYGSTCg/oFx/zZRqNgMQxA80Dg==
X-Received: by 2002:a7b:cd90:: with SMTP id y16mr29162187wmj.84.1632147748925; 
 Mon, 20 Sep 2021 07:22:28 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ed43:881f:d7cd:d42d])
 by smtp.gmail.com with ESMTPSA id e2sm16295494wra.40.2021.09.20.07.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:22:28 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:22:18 +0300
Message-Id: <20210920142221.299817-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920142221.299817-1-asafka7@gmail.com>
References: <20210920142221.299817-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-tinyrpc: bump to version
 1.1.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Plus, indent with two spaces on hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-tinyrpc/python-tinyrpc.hash | 7 ++++---
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index b4bc7ae863..c5bdad567e 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,4 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-sha256	4b41fab967fb1c978f573bf0d609a3b12cc3b6ed62bd3108f43f575563746396  tinyrpc-1.0.4.tar.gz
-md5	cd61e3cbc01ea940abc97d3a87abf4a7  tinyrpc-1.0.4.tar.gz
-sha256	587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
+md5  34d7b41ab48297b6b8fbf937e3d43a57  tinyrpc-1.1.1.tar.gz
+sha256  9e68d7b9688dac8deaa342a2507d04f0b2ece64a9d19382aa2ee13d692e87d7f  tinyrpc-1.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index 0ac0470f74..f3f7dcc52b 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.0.4
+PYTHON_TINYRPC_VERSION = 1.1.1
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/9d/91/c639ba014aada92446516c5fc4b04f2cee3539ab2d0758a6a87a6da973cb
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/63/0851365686da1ca9ab03d63b035eccf87a1d85b743ce07d079462350da33
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
