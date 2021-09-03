Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165B0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC1F60E8B
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 12:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CC1F60E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE0D83E5F;
	Fri,  3 Sep 2021 12:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SER0bJN3RYWZ; Fri,  3 Sep 2021 12:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38E4783E62;
	Fri,  3 Sep 2021 12:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 563C01BF4DB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33D4A83F23
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 12:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2-eicyV5zEd for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 12:22:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9284B83E5F
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 12:22:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id u14so11675138ejf.13
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 05:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojirHNWV0h6fsYi1+BLoiZGwbUxI1KS6lbXuop9yF7E=;
 b=JatXTNViBGm5q/R/opblreflDPTAB9qexg1tnnp7E5JHwXoYQdyUp/cy7MNDWrsywZ
 f2GPUXGemE36lcCAnB7ss8Ti4yhuToNonX5wzFY/aSFLhH6EvVxLxucTc703YCmDbiKD
 /boZ6bk8saXnleFmuZ7+mZ33EXd2mC9OXHIYCX7rIxXW5hp539MIXGKsmt+qQtCrI94T
 2hpQa6qW4gXbNQIkASUlGTRWlf4z8XSiZwJ8cb0wehnQOwjXCGQ+C6ZcomkIMrAH7ktq
 QuOVx9Z/I28VLPM1dMJ/KueHrLLn9xZrC1FMjaP1ljWU/FpU70d43mhBx0Ww9PeOEfwW
 ujtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojirHNWV0h6fsYi1+BLoiZGwbUxI1KS6lbXuop9yF7E=;
 b=LgrV/HX4HwtYZkCUZBAX9iydmuWgOZYBTkuZ/jj05ruxcuZ2Fvaa4C1nDwBf+ko++1
 6BVXXK7UPj8ApokrKizw5ufUpiFGJ+mAFkAqziGqxq5aIaNZz+89J47t1s2VnD2cff3T
 2wYUoRpKZjqfuetbqLpfit5jDQ/jeoOjYG6bcL7Dn4atgRgFpKf9norOuoXfnTQi7Xxk
 U/LTeuOo4jCoGKdR12E5NM2loMd3TYDKl0qJww94C9vP1eoIm4JZqlxtew/iH384EXam
 1/9f6jaESE8zlmTVP6v8DR87/HkXSrSS5pNNUNDuh9NCYbTFqFARQlH3+DECYyLZXbqV
 GfmQ==
X-Gm-Message-State: AOAM531Y6OCWLpO4zH43qA2I8T+c7KTo1z3n6IOpnGs9vc2zYkIPnju4
 FcH9A2Vu+5wCS7x66gk7ETITJfgS6EfiK67g
X-Google-Smtp-Source: ABdhPJydSctENzrlaz4jGtoBgbybG6ZIRUamGCswPrbyouaSJgBGySxvn/FngL4bsN2hJmo86UlQ3A==
X-Received: by 2002:a17:906:d0cd:: with SMTP id
 bq13mr3977635ejb.66.1630671734384; 
 Fri, 03 Sep 2021 05:22:14 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id j24sm2834315edj.56.2021.09.03.05.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:22:14 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 14:21:52 +0200
Message-Id: <20210903122152.2881120-3-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903122152.2881120-1-illia.bitkov@mind.be>
References: <20210903122152.2881120-1-illia.bitkov@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/alsa-lib: always use python3
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

Python is only required for smixer-python and it supports python3
Because python2 is deprecated removing it as a build dependacy

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 4168d1f220..af3de984d9 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -22,7 +22,7 @@ if BR2_PACKAGE_ALSA_LIB
 
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Add python support for alsa-lib.
 	  Python will be built and libpython will be installed
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 57c654649f..f1a65b8e40 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -58,18 +58,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
-	--enable-mixer-pymods
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-ALSA_LIB_CONF_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
-	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python
-else
-ALSA_LIB_CONF_OPTS += --with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
+	--enable-mixer-pymods\
+	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
         --with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python3
-endif
 else
 ALSA_LIB_CONF_OPTS += --disable-python
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
