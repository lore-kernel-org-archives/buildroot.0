Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D074AC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:46:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6220A60C3E
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6220A60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096154026F;
	Sun,  8 Aug 2021 10:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY78PHGdJlbE; Sun,  8 Aug 2021 10:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 245FC40200;
	Sun,  8 Aug 2021 10:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DCDA81BF38E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC2AE60805
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xn8rWFWIzUrn for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 10:46:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1744606FD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 10:46:09 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q11so5198031wrr.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nTFzgR0Xa37ytEx6F2yj0vJVtArjBaYlH0V8V9xKyE=;
 b=pNl0aYps74eZnvNF5I9OJGqB8RKQ6gQGSuX7ZTnU9mxk0vOca79VWHn/wdhfuyrTsb
 N9agx1sOr45mlnJn6nEJtW01KIJU1CR/kUFiAIhjpQUMXAID7gp4e9w112l5wrsm04rl
 kiDiyXDX00OlDnrGyUFqfgw1RK1xmg6mHb0lD/aMRHU5AP1cSsULHRX1IIXtPbU1+rUy
 WzcbXMWRXoGwylphO7BtyGdekTKpOhgS0raoExuJuehzgxOOcc8KGEES9kGoI9ctuCTp
 L87nqi5mjxpiXlTOqEvXPDRjnsQPS5unRUQkffNMXFDIvUTlCIF56Gj9VIBiW4MQXkzI
 aLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5nTFzgR0Xa37ytEx6F2yj0vJVtArjBaYlH0V8V9xKyE=;
 b=r8TBhnUs7jxW7FPe45rrtALvGQir5cX3PDY2mF86naW1IDiLGgsqdtk141I5L2wcLg
 J8QvbdKi2oSgDIoXZAdr9F/oNGlxaAg3aRYswZDS0OL/KT4iT/vKZ8zo3ayQ9bqQPyKS
 tdIG69tRbfsMSGr5xWv7Dz0nIUQMSQui3RVdfGElIo3IzfMLR2x9U1XaI2Pleu6PQAxy
 glXmDFHTfS6tmlh57VOXGp0GV390gJxb2ThrZ1Gknj3vF0Ts8hvnQCSs7SB/xopN8B5e
 OfO5kEiRrPlPu3NTJUeLsAcp9scjIp0nIWk00o+RPziG92SXppciwsqSn24WnJWJsIyt
 Ui1w==
X-Gm-Message-State: AOAM533KJtBjY/1qdHV8MtefY6CruOA1hLFK2oiHimQ71JwgtBANeyhN
 vKBNnRGxpjvi2F6TRVjjoeNeos0XOEfT8w==
X-Google-Smtp-Source: ABdhPJxOV7GDWmEUqIfQJTM4bqotfgHscC3BrA83DGFiaulfbaDvAeDcGj3nnah2gHBE1AvBn9fV1A==
X-Received: by 2002:a5d:428f:: with SMTP id k15mr5539206wrq.73.1628419567961; 
 Sun, 08 Aug 2021 03:46:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id v6sm15729235wru.50.2021.08.08.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:46:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 12:45:49 +0200
Message-Id: <20210808104549.3651744-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iputils: fix rdisc server option
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit 95b0078cc089b48be8973b9507599cc836397869 wrongly added
BUILD_RDISC_SERVER instead of ENABLE_RDISC_SERVER:

WARNING: Unknown options: "BUILD_RDISC_SERVER"

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 6e182e6a70..5721436221 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -23,7 +23,7 @@ IPUTILS_CONF_OPTS += \
 	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
 	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
 	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
-	-DBUILD_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
+	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
 	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
 	-DBUILD_TRACEROUTE6=$(if $(BR2_PACKAGE_IPUTILS_TRACEROUTE6),true,false) \
 	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
