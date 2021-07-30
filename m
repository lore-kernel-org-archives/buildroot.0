Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9BBC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:07:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBD760240
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 13:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDBD760240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D6060A80;
	Fri, 30 Jul 2021 13:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKsCjo2287NG; Fri, 30 Jul 2021 13:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A420606AA;
	Fri, 30 Jul 2021 13:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 245BF1BF390
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 191504048E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 13:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFPOG0fVHRJM for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 13:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAD26403A0
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 13:06:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d8so11243936wrm.4
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/BF/pwIUOKC4kyVbHFQadulstr68ADZIK+coHOfCm8=;
 b=prU+oHdzrLOW1Lr/hfsAam0mUiEbqubUhzr17osxIkcAXvZhzLTrqItSL4wD7EJiDJ
 7PeVY4smtTr6z4uW3hxW2gFtSPvEc4s8lw5X0cBQXbiLpTVHqoEir/NoV9uSft8NsZck
 G3pIak+/6WWs444Bu4EIGFIcxtKBlykitUqO6nxsRiOC9gdtIFMiYNHhIjmZGe/cdh4/
 8ar2NjM2upjHSssOJvU6vvv57pivZqyF5lF+pr0pDon77OrgWd/O7YhQVX6PavGl8GH9
 HETP2CJQTXfIMxrNSfQdzX1llWclAAQj+RKkewd+TtRMfRd4fY49j8l2pb1a/8/u1RMk
 Pkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/BF/pwIUOKC4kyVbHFQadulstr68ADZIK+coHOfCm8=;
 b=oX801m9Ron5LRKqb3ZPpd82XkJkRJE2skor+B7xCDiNRXPn1LCRG9G2cr/BbG11qqc
 wPuRo98gXqT+MmFjCdPcaGj0+Ujd8Oq+gDW/wgo0+z+nXHWMQKsEP/4HD2oyfWRJitRg
 oc4HPJJyvWpfLc51IdidUoxt8CdRufFM/jnBdnE/iEk9QPblRNCOVPgkd3lS0brOVwQg
 QzlOv0gtZ9blVDXpi6KfKgc447wa1SMrhxwPKhRV/Oq2k4E5ZOyi+5lKreb96dxMEXDK
 58TGvDSXBUmDIcaWIofXCPxojAk8bbDWhEOwF7K5S0u+aSR2it8QW93D9IBqZZzB+cqO
 58LQ==
X-Gm-Message-State: AOAM533r9LZkARs5PPF70y0ZKfVxDZfqNSCcgNF8uCBXI+AkAcxFFWVW
 178JL1JUJ0/Buj6bKcnLiXhDcP9PbbPsQQ==
X-Google-Smtp-Source: ABdhPJxeTwNz3/a8TgTHx971ssqb/Eab+vDpB2JDmllTzrlfMh84XE0hSb3u6kwdZGRtBEY9frqRTA==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr3031993wrf.6.1627650417554;
 Fri, 30 Jul 2021 06:06:57 -0700 (PDT)
Received: from kali.home (pop.92-184-116-192.mobile.abo.orange.fr.
 [92.184.116.192])
 by smtp.gmail.com with ESMTPSA id j5sm1651007wrs.22.2021.07.30.06.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:06:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:06:20 +0200
Message-Id: <20210730130620.4084896-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.4.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/FreeRDP/FreeRDP/releases/tag/2.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index ebb5798ace..a6cc16c9ad 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.3.1.tar.gz.sha256
-sha256  20071c691c1947ca256149e1d03edec1a5dfbf9960f0ef4e21ecab87433c2178  freerdp-2.3.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.4.0.tar.gz.sha256
+sha256  10ec9b06d74182b354ae288c8e621d94c0fb189b0c3b14a59867ab4c414c08b5  freerdp-2.4.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 171c248bd2..1ff6feeaa7 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.3.1
+FREERDP_VERSION = 2.4.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
