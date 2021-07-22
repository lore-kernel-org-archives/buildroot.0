Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B47C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 20:44:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7326260EB2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 20:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7326260EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A205401AD;
	Thu, 22 Jul 2021 20:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXFP-vH1Jdri; Thu, 22 Jul 2021 20:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CA384013C;
	Thu, 22 Jul 2021 20:44:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2CE1BF2F0
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07FBD405ED
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 20:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIVPmAphv55H for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 20:44:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFCB24018E
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 20:44:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so2298710wms.2
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3KkEGk7l9TD9fvNF1YKI6bMrLibjaCkS1ktMpVQiw8=;
 b=a7yJxx4NExD04F9eqZ0vj1l2Q24dqiTvMbhYq6gyxHuhjBj4aDk90tMh1r8JEmQw4m
 pGEMx6g8ybxCeMkmvAGjdzj/FDuoLKmVLXwq7QjZt6WVkvPpr5Ibv9aAxdm77Yc3ik5j
 He6rYNTb9RfLrdZFVF6nfyUBFUcMkSRcUS4ynxcs7l3Qs9+f5GKHH48ELx4VY23pln5D
 IBw1YaIn7Od/Ku81RxqCGEjSe/Pnvgdxgt+Zc8Xsoq4uOopHqIFsvFYtAir2NnRwMEIe
 /8HoiNyXz8AFzPxn7MoFslSQ6VBdsPdnpm7WRcCP5HDB9/YtZiMIwdMBV8mjZ39UDXGe
 vF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3KkEGk7l9TD9fvNF1YKI6bMrLibjaCkS1ktMpVQiw8=;
 b=Jh0aaTy9lIuOpkkeY63kGCX5PtX0hIC9emCYJCnPSsXNtl0fOcSisBRkN2PZYwOPAz
 HpPEmwtc0b3gJhEhZdn7DBVd03oWWRi0Gie2fOA9gcPMEFMJdfB5ahL25BMRnFlzn0VW
 cZG8HY406V3JX9RmtoaU0WlxIeyfWhzpEtZRTPNsKbmwZuGN8+HT/gH9sZYBrUeZGOva
 H62paUB1BqFJS19vWptmR+4EYvLedlCC3IQPdpvctOFJB2ACRcFXQ3OPtNWfS+J0oQj9
 B4wXVkPGSTWfatV0WGfYV5AP3stZwsBE5mThhtuRu47w5IFNIrz95vXMXVseSErO72Ji
 3NQA==
X-Gm-Message-State: AOAM532Wd9HwKrFlX+NMQf5rIaYm0JsSuj3iizm5qRG/pZfahUZKOvJN
 sCPG8IXK+ILOlg+HY8PQ7guTQykLY4T17Q==
X-Google-Smtp-Source: ABdhPJzYrpKcjP8BOGCHKb903q7on0M+2qNWdY9R6UOrrDzwsOGBZ7n+T+x6ESKCmxAOt1/mK/vZxQ==
X-Received: by 2002:a05:600c:4a17:: with SMTP id
 c23mr10927029wmp.50.1626986653668; 
 Thu, 22 Jul 2021 13:44:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j12sm31697861wrq.83.2021.07.22.13.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 13:44:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 22:44:08 +0200
Message-Id: <20210722204408.1217781-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/stunnel: requires DES support in
 openssl
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/4b306a13f543bbabf3f01d882b3549e3d9961556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stunnel/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index e4a956770e..087fecd930 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
