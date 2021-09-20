Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7037C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DEDA610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DEDA610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB116403CC;
	Mon, 20 Sep 2021 14:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id if1b1dOOC-as; Mon, 20 Sep 2021 14:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2939E403CB;
	Mon, 20 Sep 2021 14:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 613A01BF289
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5073B403CB
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOdZbabbO3OI for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 14:22:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FFA7403C5
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 14:22:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g16so30232886wrb.3
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1E7L89jRfHp/I6MU5SHVoyIpVMdf+cd7dXJjWennMg=;
 b=pxHHIGKRKCLRsGl+Ju6BYohme7GjtkHkN+ZG/+bMYG3RfL1WacwRA/SFtANuB+MoZK
 dJ7nsVQ4/Vk13xLumJdzqZdzrgWz0G6YO6xSLgoq/UKnceFT84cnfHQ1f7Svkfrlq+OE
 OF/upc1ydZFFW36SOM63peId/ILqq1Cwzo5RNBV1r+UheMuqY62g+9k47P/O88uPyec3
 S7TvXxoR9Pft/fEyOX36xHv9NYG8zkGlyKbkW51ds8DRkB5DmpxSb5A7SSnL5dpMh8uJ
 pei3jbLM7bWA4xhPnTRrM44Ki37pQgGHYHBNOSCH3Qkm5Z1248sHtuNjDX4oTwwfmszl
 HLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1E7L89jRfHp/I6MU5SHVoyIpVMdf+cd7dXJjWennMg=;
 b=O2lPEVlfI5Ej1IyFeoWda4FpCMlhARAY0VGpNLtmQj2ZPrL1gPSmk9OEDWATSC6UfI
 Dfv8wrEYeZl1u1DtQi6xogXuuB7n3wpkdrEt7zzklexO61Fb68lVxu8R2Moa5a8ePPJT
 vKPU/bvwcSKgpIZ0Mv6TrW30Mt+FKk5V193BwEj4qWg6PXeOtP1pf6ArvyKWBOPgSpnQ
 wG3qv4NfyWbkaS/0+Zx3blhepNAF3ANnY82hCWhkH3XTNVh3/vp+sQIMfeAEtJ6VjHIL
 P9LGDoDGWzYRjeNlgdzEZhdG1lSAf+cqbZh9uVtFz4zD0qpkU86SuzmDxsya5P6WXF90
 QfNQ==
X-Gm-Message-State: AOAM5336bduXy6gIiQ98XzKwqf12Jml8hFF1KLjxcdHMZNqbwyyMnZGH
 Hu+ntafWxhhijmgE4MRriTpwojTyCqw=
X-Google-Smtp-Source: ABdhPJySnw8ltHBZ3FuHxSSU1vwg9CeqPT20Rn1ulYXPuuJm0oghUrzjPRV7IZXbNASePOtEdrlXNg==
X-Received: by 2002:adf:de09:: with SMTP id b9mr28339285wrm.114.1632147747331; 
 Mon, 20 Sep 2021 07:22:27 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ed43:881f:d7cd:d42d])
 by smtp.gmail.com with ESMTPSA id e2sm16295494wra.40.2021.09.20.07.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:22:26 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:22:17 +0300
Message-Id: <20210920142221.299817-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.17.5
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

Plus, indent with two spaces in hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 6 +++---
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index d89d824d14..bb44bdfc79 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5	8a5ed75c367b90fedc3d685742e2a1c7  simplejson-3.17.0.tar.gz
-sha256	2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81  simplejson-3.17.0.tar.gz
+md5  1756427859454004e90e028d263cf23e  simplejson-3.17.5.tar.gz
+sha256  91cfb43fb91ff6d1e4258be04eee84b51a4ef40a28d899679b9ea2556322fb50  simplejson-3.17.5.tar.gz
 # Locally computed sha256 checksums
-sha256	fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
+sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index cf5bd3a482..5bed8d20a9 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.17.0
+PYTHON_SIMPLEJSON_VERSION = 3.17.5
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/98/87/a7b98aa9256c8843f92878966dc3d8d914c14aad97e2c5ce4798d5743e07
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/01/52/41c71718f941c9a5abebfaa24e3c14e3c0229327b7ebd21348989845ed8f
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
