Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C09C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:51:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5EB604DC
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 19:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE5EB604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79FFD40108;
	Wed,  8 Sep 2021 19:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yLq5yooEoSm; Wed,  8 Sep 2021 19:51:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DF3640264;
	Wed,  8 Sep 2021 19:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DFDD1BF397
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF89829FE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 19:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viodJKD-tivk for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 19:51:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BE6C80D36
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 19:51:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d6so4914736wrc.11
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRXKPsDMVGGdXag+5xtwVTKNZumddDZRgnQDub+PIf0=;
 b=F7M+7MKzguiQDpNeN1gAcTwVz8leqU0W1tJSZMabE2s+2y0apMwVg1bgIFpPDlNtPI
 QVW2jW5cc0SyeycfCPZYRX+9eyussFGIeM3A2I9KrYxi+L27ES9Bd03CqEM81hCagbUp
 YHEt6nlA4XP85b6kvSrww44up/Jz74GQSiONAKbjcgbWjO3FEZLITBF6eFWb4XvbjOGB
 JDz1+tUzJFIaAL+OAXtauXoW3m1c79xucWFF2UQj3WTss2ierflMqzWEY29KklSruhp7
 CJeNlLctlELZ7G9Jh2AR9ONkY5K6MmVJ7cdBLiU20f3yPBk4Vx5yOJGSsY5gVNlssXOt
 ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRXKPsDMVGGdXag+5xtwVTKNZumddDZRgnQDub+PIf0=;
 b=kosCW/tPJ2elJXGaLPZvbqMoq3PE4jz9/Z1w2CLNv10ApRHhXNZ4MeX6A/mo6+Qu/s
 nmd1FB/xHtJ8fO+dypDh+KQPvCfDNSatOWzzuti1yToQHKBPVyb6KX6u7FIXEhzxeVCQ
 kqNaHyW6gNr/Yt1H+MMEBOksFkTgZWZqvQXUzcaZnNxCjTyXw5WVeOJwQ6EW8PEui6T1
 ctHrdmUCjcQTRA16vmM/LumWf2La4YX+0IY357zeeC32YScozDxjQdHCsV2+VDON3MhF
 +kt6PaGuFAn84A/RiOL20EmTFz5PcKOP/T/cb80u5iVBf71+MuENzsbmvzoBYCX7sPd6
 QLpA==
X-Gm-Message-State: AOAM533sVrAx+0hix45PPv0NjmT5iKKHBiEbw0cyDMhHx89iQt59Yatu
 Cw2TjOMvZ+Az2UZDD0fBN+ov8TkejEg=
X-Google-Smtp-Source: ABdhPJxUqINSVr124qGH4sy5Otw+KR7SvD+sMNv0i99fu0zbrJZ1O7NAJva45QpHban9O8blAbK6Og==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr7113wrr.313.1631130695914;
 Wed, 08 Sep 2021 12:51:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id p4sm37286wmc.11.2021.09.08.12.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 12:51:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 21:51:10 +0200
Message-Id: <20210908195110.590900-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/civetweb: bump to version 1.15
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/civetweb/civetweb/releases/tag/v1.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.hash | 2 +-
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index 0295e74da6..bdf6d77427 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d02d7ab091c8b4edf21fc13a03c6db08a8a8b8605e35e0073251b9d88443c653  civetweb-1.14.tar.gz
+sha256  90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9  civetweb-1.15.tar.gz
 sha256  24d3d2aee56ae3cddcdf3392c1250877818108314233cf15f2bc9eb3ac298934  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 40841285ef..33c3bfdf33 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.14
+CIVETWEB_VERSION = 1.15
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
