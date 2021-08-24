Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2C8C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:39:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8744A61220
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 19:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8744A61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E94780DB4;
	Tue, 24 Aug 2021 19:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjOGo8YruSHm; Tue, 24 Aug 2021 19:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DEA80BC6;
	Tue, 24 Aug 2021 19:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8ECA1BF5DF
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98C6A80B71
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xP47lvZ8sWAw for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 19:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E347C81CE1
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 19:39:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h13so32974236wrp.1
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AH2XW6PLhsSaIUPKcsaIaAI+Zo9YYTms/P+xwBiZkp4=;
 b=hQmJkdaHMiHjgt0H1W0XHY+cuzG0yeacZfQWTUK9FR2mhyiO32ulEyfHubkAvhx9qu
 X4NGvB+V7sMjq1LT2gso1ddZWJR9rYKho/B1baeiGFxzTPpOOUCp1s/KWDJdjtqCcs97
 +ZQlh6ExbhyO8u7RcaONEAOIQbY//H6JFcEWAJlK1/R5nwlUyOsttOhjMUu6ld105u/3
 gI+yDPXUJ7ZSaPoOp+cUY0KUwyMtSyLRTAKNwO6mTRI6sEXMaO7jSAwV3H670HPtXeTa
 fCrLNv5P9IPxDDS9kQQePpm5BCiQr2vX3fbyKFvrS3U0LvOs67COxl/2y8uhwQ0mUAbH
 DktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AH2XW6PLhsSaIUPKcsaIaAI+Zo9YYTms/P+xwBiZkp4=;
 b=lnbjfHyCVaMniRnooDOiIvlLxL2FxF/T36AWf93RWYBEMwRrHH+k754G0Vj8vxx1f2
 HeHvflHuNbsHsi0+KI/ubRLu4eS6Q+kdzFNEVW7X8DTuP1WtU46nfwNH5k1pHfDc7wyg
 N9QFahwJsC/BTGMi0meVh3oSzrzbCeoNvnqU4mQNGteOCWNcaDjWjgZTWXJTbHeIwhTf
 nV/4LVkTacuCwaK9n3XkLXx7rPRlULz9cC+8c2ghgbDRDsTNPAo0DpNkiRKeuCWrTgAv
 CPirUo8It3ZIsBe5Td3DUsLe3kuoRuw5y3rhv+eXkMshiC/ZD9kKIPj2YPWrERk89C5B
 Tt1w==
X-Gm-Message-State: AOAM530pou/nziMyn9+p0mcY2erug9aQwEsUSRMSQm97hOw5LlEYfmTx
 7o0Mg0p8j3bc1wq51KHbQKHukecpFPjVnPkL
X-Google-Smtp-Source: ABdhPJwgLQ72jFxx+07fQgoVIegY1PE5Mhxc8l71UaglKtHIO04Ck7or1jOYYptvw1SJ63kDHBWu0w==
X-Received: by 2002:adf:f552:: with SMTP id j18mr20739857wrp.273.1629833954834; 
 Tue, 24 Aug 2021 12:39:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id z11sm2377329wrw.53.2021.08.24.12.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:39:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 21:39:04 +0200
Message-Id: <20210824193904.127514-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/belle-sip: add
 BELLE_SIP_CPE_ID_VENDOR
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

cpe:2.3:a:linphone:belle-sip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinphone%3Abelle-sip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/belle-sip/belle-sip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index 23b60e51f5..11b96f3fd9 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -9,6 +9,7 @@ BELLE_SIP_SITE = \
 	https://gitlab.linphone.org/BC/public/belle-sip/-/archive/$(BELLE_SIP_VERSION)
 BELLE_SIP_LICENSE = GPL-3.0+
 BELLE_SIP_LICENSE_FILES = LICENSE.txt
+BELLE_SIP_CPE_ID_VENDOR = linphone
 BELLE_SIP_INSTALL_STAGING = YES
 BELLE_SIP_DEPENDENCIES = \
 	bctoolbox \
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
