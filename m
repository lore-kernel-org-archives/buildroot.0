Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3BBC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:44:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE5661037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DE5661037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4514283BEA;
	Wed,  4 Aug 2021 20:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4R7M6aoUGKVU; Wed,  4 Aug 2021 20:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB00283BD7;
	Wed,  4 Aug 2021 20:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1275C1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 020126073B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peVL1luqE_yD for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:44:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44C0760705
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:44:49 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p5so3642734wro.7
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvUah5zOrSA3XCl9k394BoJek3F85X6GQG6IExsj3Zo=;
 b=GTisJ3NfctOfTigC8H4UZwXSsBkWlWfVsDkTQ1okO2kgJ7rGEQn6RCy4I9hrYSLUjX
 BQtmy32dOOBUzbghNWp1l1JzFLqrOADHDNGl3hLTDGS+wni/5HUVJG5mloXwpDkoVHZr
 uO/Htu67ogPocolTTrDOoglurtw1dJ0wXkuAC/cF2LySCWSeU6l8mJW/zzjdIJZhdGg9
 QvFMosbJO0F1i4eg0mjZkSxU5fBMtzzS5LkQrJcXHcecdpqx26IJc0qO26mSirpaE6TA
 rUhOHH7D6lMQV5oVWohuLWJT28fte9IW4/pEkGlKDPb8He/xR6M6y57CiPTBO1gDwb00
 eF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvUah5zOrSA3XCl9k394BoJek3F85X6GQG6IExsj3Zo=;
 b=UapLc6MlJU6bzPJjZy+Z8QAPypwMJv0lVRUiLEEuoBoHdq0LCiDGi6ZC22n1yS9VRE
 MICSkL6LSPqeA4ypALMoL5SExcTAIdyOXJ5RzJt/JrGPVI8WvRqlL96Xo9Hogj5KgcbY
 9K9lFKvWzuMYVM27HqEpc34aJpYg7LqcMu/kD5LVP5uP8XArNMG3Ji7vODEEoKEPmUyT
 Q6fiVhvYSq5iLcgZ17VIAU1YheDCtQUyigvuPmHbeVKv7rvOIGS1Cpqr9uyFB4MsTwfS
 pv9dJCi0Yku6RBJg5wHtR2KbphStKkiGQQ3NSC0nEMeoAFIy7eiZEH0LgnBvKocYIhVm
 Z0lw==
X-Gm-Message-State: AOAM533IJab9vUfMGCuGPxTfACYblVMb1DPjlw55Z4Zt2pRwgieC3DlR
 F/IiaHhheMHAAzqUnZ2FYQ733/B0Fb1ubg==
X-Google-Smtp-Source: ABdhPJy39mz1KXL+qj3Ofn5cAW4kFls1o9ltiODDMxoFY5OlFP7QTjkFkJWVziyqSBeTBn/F5fXtsg==
X-Received: by 2002:adf:f584:: with SMTP id f4mr1160072wro.211.1628109887283; 
 Wed, 04 Aug 2021 13:44:47 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id h11sm6458727wmq.34.2021.08.04.13.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:44:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:44:42 +0200
Message-Id: <20210804204442.1466003-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqrtr-glib: add
 gobject-introspection optional dependency
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

gobject-introspection is an optional dependency (enabled by default)
since the addition of the package in commit
ea64e05a1bfbe3b258a69013462f94d7db7a9c0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqrtr-glib/libqrtr-glib.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index b9fc5cf3ba..6ab8335417 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -12,4 +12,11 @@ LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
 LIBQRTR_GLIB_INSTALL_STAGING = YES
 LIBQRTR_GLIB_DEPENDENCIES = libglib2
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBQRTR_GLIB_CONF_OPTS += --enable-introspection
+LIBQRTR_GLIB_DEPENDENCIES += gobject-introspection
+else
+LIBQRTR_GLIB_CONF_OPTS += --disable-introspection
+endif
+
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
