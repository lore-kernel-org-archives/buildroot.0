Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810E7C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1B560FD8
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D1B560FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB9B3400EE;
	Wed, 25 Aug 2021 19:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50W9Oj3Ec6Q8; Wed, 25 Aug 2021 19:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AC0B40105;
	Wed, 25 Aug 2021 19:40:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33D251BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC4180CC7
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAV6aD_qk87A for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D348480CC5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:40:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u16so1011838wrn.5
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKwMWgJnteuZHSbcL6xf9ePUIcG5R2FlqCveqYZVeYc=;
 b=Ga0HPAIEi0vbgZHd7cvN47dfjX6OOeqzduU5c1rT6mseGWBUPgeOvt+JMQmnvRsYeu
 SblvtGS7ghyfSEqT83yzPV+AS4HpCEyMk5KzbSddWUUsJNFZSdhUsf24NnpU7lGPuxDR
 pOskLYbnwES5OFjZbmbTDx09R4JZ70vCB3GidBFZ+KVo1e6BdkYa+BbWg7jLeMswMOTT
 x1H3O33LONUF+dh1K8XgTt9/djKIhlWIXyAyufxA4C0MOPiDWAqzHYDL7DfoF3SA1jgN
 0421dHcKHQvnaLJn7+giS+uYuJP8oNCnJjp4sAybdz013mXsrniUvhy8kbr0jwFXIHh8
 ieYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKwMWgJnteuZHSbcL6xf9ePUIcG5R2FlqCveqYZVeYc=;
 b=A7EiSLc0li0CPO/jr6qp/isYMgbA640CoaIcMnQkpR/6GxhKpbM+Fkh1RKCc3OuPDL
 1uu8CTGl1Iv+7b5dD6YmiMQABQu+in6mRBSD8Xa/+r0OkRW5jmszSphPT64r6nj8R7Tm
 sK9fq7XiFModnX2wZxmvtmP1Alpzt4LBCkQhhvw1JpnRWEHMmc197PELiMJjUWN+VqSv
 QC7eoub988xPjo98bRYR9U4YIska7XD0CtrFNSPS04YSoYnhgSrPWRix3n8b30lVx7uk
 pZfHbiMm7ZlBZE2ADF3+iSl+VP5xVhiiVnlh1jeKRZYYlr8bpb/UgzmfvEeNDonEKNiT
 gZGw==
X-Gm-Message-State: AOAM532Yya4bSIjN+rOR5RdugUrf4Rrj4Xf2xebUHPBmv6qaQqY6kYfT
 Z18kqi7UnI7tiGoIAM2tjwrHRwndl8bn0Q==
X-Google-Smtp-Source: ABdhPJzUzrAeCVMUa9fWx9E94YSmPlTBOhzrEtlfW3PeazYdK0St/HHwn5v6Dd13XlvEL0G5d74zig==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr20684198wrj.98.1629920419821; 
 Wed, 25 Aug 2021 12:40:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id c190sm534188wma.21.2021.08.25.12.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 12:40:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:38:17 +0200
Message-Id: <20210825193817.5466-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cjson: bump to version 1.7.15
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes:
- Fix potential core dumped for strrchr
- Fix null pointer crash in cJSON_CreateXxArray
- Fix several null pointer problems on allocation failure
- Fix a possible dereference of null pointer

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cjson/cjson.hash | 2 +-
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index 5133c15a4f..c39e884cdd 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fb50a663eefdc76bafa80c82bc045af13b1363e8f45cec8b442007aef6a41343  cjson-1.7.14.tar.gz
+sha256  5308fd4bd90cef7aa060558514de6a1a4a0819974a26e6ed13973c5f624c24b2  cjson-1.7.15.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index daa498f9ff..ac8db5701f 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.14
+CJSON_VERSION = 1.7.15
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
