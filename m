Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547A3C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF865610E8
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 15:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF865610E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F2B9401EC;
	Thu,  9 Sep 2021 15:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkU-2Vkv7Op1; Thu,  9 Sep 2021 15:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D836C4034C;
	Thu,  9 Sep 2021 15:18:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7E971BF377
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B478940331
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 15:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60o7nP4f7reK for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 15:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB0DC402E0
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 15:18:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id t19so4307612ejr.8
 for <buildroot@buildroot.org>; Thu, 09 Sep 2021 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ne2PuFEzvSHetFUtVX2z2gkePqXjW2mXWXCjR8fbomA=;
 b=M1pkBrt8r1roa8YJQKupdsfSPPo5GiOzgxMB7RGSmGyED1tfF1sWzigSQzrCeR02S6
 DjJsqIH4QHKQKXD/uAbPxueorT+TelAnnMcS8Sed1bcbmKy987lfsIt+0t5rve7EQ1k6
 RwwGVsDmIY8aDHGi7iekRbLdnmSXB6VHfuULGmVa/qsUJDWF0jm66eDLFiGDh936DExD
 nDJi+yBegykmgMtbojuGjz8ZItyE5TwjFIgdDdGe2BGnmH3AOCNR4J2fotUI131KT8+r
 qgA28Jk+4wrTIR7tVi+IQ1UMhWh5cH/DjHzCoD7Ck8amjPJuDqy0C50q/XSPdUnEegNs
 zcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ne2PuFEzvSHetFUtVX2z2gkePqXjW2mXWXCjR8fbomA=;
 b=i/TtBzkOyPn3V+clvDxrDRwbcrpqdcSMtg2hGBfZTBrhUYXYFVFlX9Gc5Ze2x5oyhe
 +xZY3cF0r7mPYP70vRBocDrbzU8T1iIeDziThPsVmXKfgs3PTogVzT6ivL7Rim9Rbt2u
 X6Il6904omCSr8VI7IFcjgLdffV5ELs1lznULozcBPACe7q5x/7LthyGUjdeX4ov9pfD
 TZnBaHEoidJlM8Ao4+0/orWY4qJBzXiHw2V4AoN9vcT7N9pmgnTspa7Ga1oBeDn+pOhk
 IAJsLPj8IY33Rb3kFYxKse3eJgViv1KhOGuuiqWaNuwcymmOrm8kzihsmTiwVoJVHcCb
 e5AA==
X-Gm-Message-State: AOAM533WxmKPP6d8ae2B23xVbEoCbAIfbiyO3NYUr0leyVf6jSOFzl2X
 ooPYQ/M2cf6z7aRXD8km8fmhxW444dQlm8zr
X-Google-Smtp-Source: ABdhPJwlA2+T1mym3mggtD/PmCAQaUChlvr1ZHCQhcABRNkvIGEZOFwWtG3bARuFStnSOLAmlFkYlw==
X-Received: by 2002:a17:906:b10d:: with SMTP id
 u13mr3339142ejy.135.1631200684744; 
 Thu, 09 Sep 2021 08:18:04 -0700 (PDT)
Received: from illias-PC.local.ess-mail.com
 (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id d11sm966678ejw.8.2021.09.09.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 08:18:04 -0700 (PDT)
From: Illia Bitkov <illia.bitkov@mind.be>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 17:17:40 +0200
Message-Id: <20210909151740.1097665-3-illia.bitkov@mind.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909151740.1097665-1-illia.bitkov@mind.be>
References: <20210909151740.1097665-1-illia.bitkov@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/alsa-lib: always use python3
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

Python is only required for smixer-python and it supports python3
Because python2 is deprecated removing it as a build dependacy

Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
---
 package/alsa-lib/Config.in   |  2 +-
 package/alsa-lib/alsa-lib.mk | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

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
index 99c53f9408..4e9fc916df 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -58,20 +58,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPTS += \
-	--enable-mixer-pymods
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-ALSA_LIB_CONF_OPTS += \
-	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
-	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python
-else
-ALSA_LIB_CONF_OPTS += \
+	--enable-mixer-pymods \
 	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
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
