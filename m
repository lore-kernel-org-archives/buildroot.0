Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8C9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1789161058
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1789161058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFD383EA8;
	Fri,  3 Sep 2021 12:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWRUR62H72oD; Fri,  3 Sep 2021 12:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCEF183ED7;
	Fri,  3 Sep 2021 12:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9011BF4DB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13EE140835
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjPd04HZI58I for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 12:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C60BB4083A
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 12:22:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id x11so11801386ejv.0
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5XEd8CqYzfwOKQ62G5GB2JtAE0+Z+2XFsC9no3EDLNU=;
 b=M3wrkwIe8Ck2Rnrbb7cYHIVhQ57voFxVoMhmRkLz3U35eogpRMSEVXrnlvZqjLvQot
 Tqsg8rl/Y3TCCp7A9yzfyvEya352PB2FUd4nbJ4i65Ns5MKtTw137sBsWeaNIYPbGj41
 Ht+TZJ947TGNYxprGrQ7si2wx3bTdBNwmmGa5rnni1t9eeDF0bE7glg3rhsGc4i5Q9k2
 38dQM7jKDM4Y7PrGohGZtxof9NMtvpRh8Ku9phAvn2XYFfh9omMItzCjVcS0cLJkvRHN
 VTaGglXXxqnhaaxF2MbHIZZDSb+Wxg2qQJXHhDd86341BM3hJRKu2cToECPPAV0mlfDb
 gFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5XEd8CqYzfwOKQ62G5GB2JtAE0+Z+2XFsC9no3EDLNU=;
 b=KCqe7E3CuTZo+AP0EKCSX0qPTd6/RqkWkBYy2dgwykKo9nBmJ+Tt7uo7hKgc9g4qx5
 z3ZqckSEralJFrvBKC7+0GQT9LBpLTwsRzqmvyw776RAC4jbaPSMnOEaVkK79OLD72wC
 iShdGhuX5iia4fOYIdKGjJyNJ2tpDfoQ7zqtpDXT0vDmgClpfAVa9ZwNdQihP2XKR+8a
 5HrO37fHg8hWeHpvQN+D/iAL+THB0FtfpbIhtafWos+1IkUgWf82oUr85bZs0f1kvrzC
 sSNb81pzdQXX7VTGexaXefhWpQNeeWcfE2lvDSQ6N+V7olir7eyIVO2MIQ2JtMzoPl6E
 0D5A==
X-Gm-Message-State: AOAM533tWViHLNZYSQ9w+PqRyIZsBa9l2WCm6H/yCLyDbuMtwwDd6wjl
 M1oXDfA/y0/dvv89cP5c52T8/eok0mPttPh7
X-Google-Smtp-Source: ABdhPJy9Iq+V3K8C+HoUakEh76gPv5K8f845M9McC6vqgq0O73GrD87qyrpWB3vEarNQQ7ysfzCZ2A==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr3889520ejc.504.1630671733660; 
 Fri, 03 Sep 2021 05:22:13 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id j24sm2834315edj.56.2021.09.03.05.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:22:13 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 14:21:51 +0200
Message-Id: <20210903122152.2881120-2-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903122152.2881120-1-illia.bitkov@mind.be>
References: <20210903122152.2881120-1-illia.bitkov@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/alsa-lib: add smixer-python module
 for alsa-lib python config
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
 Adam Dusketta <duskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add mixer python bindings to build when "Python support for alsa-lib" is active

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

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
index c71ad5dd58..57c654649f 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -58,11 +58,19 @@ endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
-	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
+	--enable-mixer-pymods
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+ALSA_LIB_CONF_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python
 else
+ALSA_LIB_CONF_OPTS += --with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
+        --with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
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
