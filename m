Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0ADC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC03661166
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC03661166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF6A82CFA;
	Wed,  8 Sep 2021 08:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gAly-rtyLKf; Wed,  8 Sep 2021 08:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB76482FCB;
	Wed,  8 Sep 2021 08:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6CE1BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DC13403B0
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVBO5EDC8ptM for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B155840332
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b6so1915454wrh.10
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8AdtEy5yKI9KHqon4as3qyk7ayP70vCsfrVt8wtd7I=;
 b=n5TjAOxyhBDeKpG1LTFUCMJtfdklOmAf32RYvQIaEzKWjuIUhT0hndyw2tD3g60XpJ
 GY1IExcX1PtbJF7tymS7Q1IK3hQnZ2jWQq8EInhefBOEwHpAkAq5KlBqzwg01sTWXDf9
 V2rjQKHiZvHpzXXF99CEx7Pw1nIhQ0lqEjBy1xrsWD5/m2mfc/CtjO6iYHo/o6UQX8Kc
 I5Y6BIFRnkWVPztCkZ7Pfe60EWrILVfpQsVah9PpPhs/AjVwhRDpxyYd1i4MmO1QMtFz
 l1I6SPBsH2YtymxI1iN0D9wWcYokx0Gx7yt6K3FNct7ZG95Tn3UDXnnuo3C+40plJqks
 EyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8AdtEy5yKI9KHqon4as3qyk7ayP70vCsfrVt8wtd7I=;
 b=oNpgnA3Edyq/6JWCYQILClZKJKaSHdhUhzAyq8ZaGXetwIlaq8OIHZqolpEaX3gNFH
 XxOe8k0+K37lSqVpC+vwEVb/RcG2qlkQIq2Kgo1J8qa1v56S0V6esuFTt/+WCtrt9Hgl
 oCGCFdmLDmHdW2dVxFYYbLly81fi5CCD5MxjYnvFc6leW3faB59lx0BmmNA/mhHyghsl
 Vg8XmcCYD3B5U5bCC2+3E8RGUpJ2UANSGNak/88DndXMWFA3YYijNhI86jDZaAw1fv85
 rMxGaD3mMimZotoTwYT/qfrKyPxzpclyfwpMNzlcpoA0zUlukYQVyyHGrFJpRHhYwhTV
 SVHg==
X-Gm-Message-State: AOAM5334iwXRtsVa94AoGamVMVTGt8yyqOP7JXIBnULZswQm+RaO/3hk
 idT6lG9mMLhWC9nqdNmcoxpxMvXP/aenPQ==
X-Google-Smtp-Source: ABdhPJye4C1+0wYZWk5KS8LbJK+GcoJidntlyRPcZoR0o2sW6aSTDCfSspLpVwukLS3riEzR64Q9RA==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr2637634wrx.126.1631089178691; 
 Wed, 08 Sep 2021 01:19:38 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:38 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:23 +0300
Message-Id: <20210908081927.694201-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 21.2.0
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

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 3841595754..5d4c46304e 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  5b2db50fcc31be34d32798183c9bd062  attrs-19.3.0.tar.gz
-sha256  f7b7ce16570fe9965acd6d30101a28f62fb4a7f9e926b3bbc9b61f8b04247e72  attrs-19.3.0.tar.gz
+md5  06af884070d9180694becdb106e5cd65  attrs-21.2.0.tar.gz
+sha256  ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb  attrs-21.2.0.tar.gz
 # Locally computed sha256
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 72b280c333..b99a98501c 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 19.3.0
+PYTHON_ATTRS_VERSION = 21.2.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/98/c3/2c227e66b5e896e15ccdae2e00bbc69aa46e9a8ce8869cc5fa96310bf612
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/ed/d6/3ebca4ca65157c12bd08a63e20ac0bdc21ac7f3694040711f9fd073c0ffb
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
