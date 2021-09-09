Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0B8C43217
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD6661167
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BD6661167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFA6E404A8;
	Thu,  9 Sep 2021 15:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2q9XrKF8gqk8; Thu,  9 Sep 2021 15:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1706440489;
	Thu,  9 Sep 2021 15:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A584A1BF377
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9532F83B0C
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvE6VXXZlW_6 for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA5E88308A
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 15:18:05 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eb14so3141953edb.8
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vofAGJNDFxZ7B3/Tn5IxEniaLxMqO8BFuEpbGQ3GoPo=;
 b=XmI/yfwFJEKbRdx2DgMQd4w3vzUnKVc5s2EebyOvCfzMXMRGKonmNbq68/jbw3uaH0
 ISS/5NwdfG3KwujmFtbW4hvcGp8dvdWt5zhowlnGN26PTB242r3KBXRRxnFYEauVLy3H
 gJmCnUdN8+XBwBWysABDbB50QSzM7lZtRdWmPaxMKdCKukclv2S5KfhYs2p1D2AwRsny
 DtrYxcDuD77aMuiQLTEnL+yo4CutB9CsYoGE72v/DrGFAIi1kCYovV3QLO5n/RpUCKnT
 s6KFxKXFBz97KsBvSfGgoT8KUagzA6XQz2oSXcOuDA6imrG47v7MtIcVixC1iScvd9WN
 vlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vofAGJNDFxZ7B3/Tn5IxEniaLxMqO8BFuEpbGQ3GoPo=;
 b=DIVJANg8C2hHIUHIN+vrTN3hqiRaDBdzisoLVWD3qHup59tUKnIXgOt6aWA4dfpH8J
 ag2hOYgYs02v7RkFWFupKDmuaqrcuUJGWJuh9O7LA7DMojOzTv77A5oU+g6a/tNCEzMi
 Exx9InP9BqmXLe4UPTOlal1tq+amnkTXwfr/UVcZKx8zpCzf3joVxISUJLrSNbDyIrkQ
 9xle7NjagxshGdKmz4hrKqOh3Q0xO9KsLD9QvgMb+8X3sLZnKTFGPGWv14nOnDwdE2rs
 deGnvwJ8eiKx8DlRaPRewNGUYV9LYbhxaEHS6uaMDCeVIQ7gWxWVYOVj1SaVYcjG2W+d
 CTOQ==
X-Gm-Message-State: AOAM530JPy1LEcLJK/i88nm8/pKbj3D3Qs7Q5+ECfWVPRpDJ/KkS4Aic
 Wy3byzy/9fKKdJ4OtNHtw9/e0a2BjWmexP6q
X-Google-Smtp-Source: ABdhPJzZhSeitrmwePVLMnCP+PBCVpgALgFwwa8sGDFYbzRhTnM+7jip/4QA1VpzEGR2XQvtFDAzCw==
X-Received: by 2002:a05:6402:1395:: with SMTP id
 b21mr3835664edv.119.1631200683573; 
 Thu, 09 Sep 2021 08:18:03 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id d11sm966678ejw.8.2021.09.09.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 08:18:03 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 17:17:39 +0200
Message-Id: <20210909151740.1097665-2-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909151740.1097665-1-illia.bitkov@mind.be>
References: <20210909151740.1097665-1-illia.bitkov@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/alsa-lib: add smixer-python
 module for alsa-lib python config
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Illia Bitkov <illia.bitkov@mind.be>,
 Adam Dusketta <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add simple mixer python bindings to build when "Python support for alsa-lib" is active.
smixer-python is the only one python module which exists in alsa-lib.

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index f334b66bff..4168d1f220 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -22,7 +22,7 @@ if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Add python support for alsa-lib.
 	  Python will be built and libpython will be installed
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index c71ad5dd58..99c53f9408 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -57,12 +57,22 @@ ALSA_LIB_CONF_OPTS += --disable-old-symbols
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
+ALSA_LIB_CONF_OPTS += \
+	--enable-mixer-pymods
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python
 else
+ALSA_LIB_CONF_OPTS += \
+	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
+	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
+ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
+ALSA_LIB_DEPENDENCIES = python3
+endif
+else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
