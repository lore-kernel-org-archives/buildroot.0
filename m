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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1523AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0D16113C
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A0D16113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21FE84028B;
	Wed,  8 Sep 2021 08:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXk4t8k9lFJj; Wed,  8 Sep 2021 08:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48804400DE;
	Wed,  8 Sep 2021 08:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5670F1BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4534A400DE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTqLwhoYh5Xb for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:19:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D4DC400C3
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:19:39 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t18so2025827wrb.0
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZvegjftH45tFiwUV4wg9i+2NQtX8E4eN/310C6gGnQ=;
 b=JAYS+TzdEacPiCrhaNz5tQH9/fWF9XhGGw3VzKZuwQmUPuv11tSHA2IKWHUO3G/Hbg
 v/hNgwypHzasX/MMYjARIG9q0/OiAE4FNGzggBjcXi7JhdktkAxsFfAB8TiRvwRza2QR
 8vR0t75xnu//Vr5EZneYV5Qs2P2OCUbA3k5rAiTiobUn/CH4Zng6PhCvk3PqaCVY9urz
 x5x5vPY4b4q/OlInSwGsDPXDALHH90DJsqxWjHBnvxW5isgUTKfBDdO0HVJZVT5cMuBh
 LjTNKJTR2GGupKpNGZSL56CzSQNgsJO6jkC7eitzEx0z+UTQYScdxkvDLJ8PrQOVcc4+
 FX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZvegjftH45tFiwUV4wg9i+2NQtX8E4eN/310C6gGnQ=;
 b=v6gkAwd8yS0B+Ph+RzYqJo/xIVrgEBjOt1cDSpbA0TWQIrZkAquG0lYmPvnAAj/QrZ
 YAhMTgSfkQp5gu6vUhWpVHq/Ct8bM8KS0dOmA86QABBQFkAAPL0CnBG7mK5QDux9jqz+
 ENGFYpK1jGawTL3scGQF+KWxe9UuNv2L3h1nTnWwjN62ROvCpnJxPNR00X6bUYI5F1c6
 eVSnX6gR6Z/2oMZt+CGiWNDR6s+JXuG/nxV0lHpzyEOoS0uZzQ2fWh2LejmfhDbeMkA2
 vaACHfbCTZXM1Q60Lw/tcMoApWUjsEzsFyk7fmJ0fCIdkYE9/NMYPAtNNCInqfZ/IiM5
 j9IQ==
X-Gm-Message-State: AOAM530fu5RyYs5bMcCBICLkqZV0b1xFa+iXktf/EieV6kO8UASCd4mC
 9SJmxEDAUPml2qWunXUgG6i+sL+w46px0A==
X-Google-Smtp-Source: ABdhPJy4Ts3XRUDIUuZ5VFmiIhLu9lQ3VkAdI1WxhtLcUeZs0qNgc2F5KYX6IGdsDAXXfx4XXs57tQ==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr2532902wrf.113.1631089177272; 
 Wed, 08 Sep 2021 01:19:37 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:8ac0:67ea:778a:fea7])
 by smtp.gmail.com with ESMTPSA id c15sm1304347wmr.8.2021.09.08.01.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 01:19:37 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 11:19:22 +0300
Message-Id: <20210908081927.694201-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
References: <20210908081927.694201-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python{3}-six: bump to version
 1.16.0
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
 package/python-six/python-six.hash | 4 ++--
 package/python-six/python-six.mk   | 4 ++--
 package/python3-six/python3-six.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index 9945ffd1d7..17615e8699 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/six/json
-md5  9f90a0eaa0ea7747fda01ca79d21ebcb  six-1.15.0.tar.gz
-sha256  30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259  six-1.15.0.tar.gz
+md5  a7c927740e4964dd29b72cebfc1429bb  six-1.16.0.tar.gz
+sha256  1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926  six-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8bb850c565aa389fdc16f3a46965ad23d82adff60f2393fc2762b63185e8e6c9  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 7c298d6f89..41ef41d0ba 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-six/python3-six.mk
-PYTHON_SIX_VERSION = 1.15.0
+PYTHON_SIX_VERSION = 1.16.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
diff --git a/package/python3-six/python3-six.mk b/package/python3-six/python3-six.mk
index debd338a4b..ee9dc818ee 100644
--- a/package/python3-six/python3-six.mk
+++ b/package/python3-six/python3-six.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-six/python-six.mk
-PYTHON3_SIX_VERSION = 1.15.0
+PYTHON3_SIX_VERSION = 1.16.0
 PYTHON3_SIX_SOURCE = six-$(PYTHON3_SIX_VERSION).tar.gz
-PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426
+PYTHON3_SIX_SITE = https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e
 PYTHON3_SIX_SETUP_TYPE = setuptools
 PYTHON3_SIX_LICENSE = MIT
 PYTHON3_SIX_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
