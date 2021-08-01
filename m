Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2686BC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:20:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3011610A2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3011610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D5040496;
	Sun,  1 Aug 2021 12:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PqJQLXmqLu9; Sun,  1 Aug 2021 12:20:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D89A40393;
	Sun,  1 Aug 2021 12:20:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 736281BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62464401CF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IA7mqgJTxfQA for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71E3240155
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:20:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so9293363wms.0
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9c/x01NAk21cCN7Z740hhiNXWyPeO4iOy9oPhQVqG24=;
 b=HIC/hIeI75L4BNIzWGqwKqdr1WQ+qGXmOLBgL3zLuj8qXY1MjVBbN+0DdihEsrZjr+
 yjkFGqPg+WI1T02IKA09FCPNiaI89j6w6kWt6wVJn0PXsE+SZFfEOfUNQyanap6pbEza
 y6LeUBU5Us2nX4H60Idnnx4q50+3qMRCrH3AeHaCj7X9L65bB2olV6eZzGHc39E3XJZG
 QMT9r+kIjuFBB+4J6Zo3GaR69TnRRCN+LAsBk+CtlhI483fBaRoX0wFLOn0qj8oObFGH
 DYMor1cpN/6XpYWkAB9MRtF3oowcCcN8a3zaxw2DHyUdUYkCNEm7aAGxuHtNIlvJwK15
 WKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9c/x01NAk21cCN7Z740hhiNXWyPeO4iOy9oPhQVqG24=;
 b=eskHlvudn1ttkNwFhGMuUvVNQXjMjbfrhXDl4zXAXL1GeJloah1iVktdm4lXGdtjUw
 ZmemMk5C3Ast1fbxmZYJdHbkDdbTeu+SNTRYd5ZN9n3EGoJ5UKUFeYPGGeycbxrmcRMy
 KSkcHb0VsDFFR3Gk7VR62bU5p5QcPcH8HjvxCegDEOVIke5ePtIOlr+J1AXY/S/5JJWQ
 WZHPpunk4zUYdM+whadbuzHhD8uk0O2oNApKKumd2UcFTwNdJ+ul6/R6q76RgIAh1dTI
 yjIt9lLeDSLtUamq4SCBZZ3drAdNPcVavI9lkMoSe28JexGqnOz/KLIhIq6x9Nq3oIcr
 hcuA==
X-Gm-Message-State: AOAM533mMAZJz/5TJXml571AyyYgZtYCo/b37t06f75muYRis24LpTba
 bu1HXLPbSzj4u0xXrwHg7aIkcrFxZSjhqg==
X-Google-Smtp-Source: ABdhPJwsJI5pSPKAAjSqEZ4C29UPglPu7/vEjLDkVpqYO/g6NqYUmcDA2o0o7j8awkK8vOV73QdI7g==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr12269242wmk.97.1627820425434; 
 Sun, 01 Aug 2021 05:20:25 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id h9sm7103237wmb.35.2021.08.01.05.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:20:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:20:17 +0200
Message-Id: <20210801122017.3060928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/quagga: add SELinux module
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

Support for quagga is added by the services/zebra module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quagga/quagga.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index adf8085054..97297baff8 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -11,6 +11,7 @@ QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
 QUAGGA_LICENSE_FILES = COPYING
 QUAGGA_CPE_ID_VENDOR = quagga
+QUAGGA_SELINUX_MODULES = zebra
 
 # We need to override the sysconf and localstate directories so that
 # quagga can create files as the quagga user without extra
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
