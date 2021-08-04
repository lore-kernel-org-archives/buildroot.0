Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBD1C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:11:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E8C560BD3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E8C560BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D8660B7D;
	Wed,  4 Aug 2021 10:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv6TJ_PIwwNn; Wed,  4 Aug 2021 10:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7C6660B30;
	Wed,  4 Aug 2021 10:11:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF0F1BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F44A83BF6
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhYBgs42yldb for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4259483BFE
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:11:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b11so1594879wrx.6
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJ4BsM6LRq+9dMYFeacDF8SZKrB5FcCbrbGL+5ian3g=;
 b=fmi8VP/onz9qMW7xIFlC29T9ryzPw40IZE3OO7cX9+p1zHpWc47g3xTK5KYPjTfdbB
 tEx0NR5ZSywY9nKocYzQZuE8zlzKtoPRW7UCI0P/5XeryT89IipSyRKi2xmdofu5F5qo
 h7AjGFZPHI/qGb8awUsfpOj6qUtyHAJ3WuFu5NmVEgspH83z2yAiJz94qXnnCi9odweF
 uXYVLw3o2rb5rG0fFNPb4xroh9FLZDKRF10wG/1NeXnIsyS+nj0m80sL8Hw7IX/ML5Hv
 sc0wymu4vePsPpYIMqucHEhMS0yy6A7Xk3LYTGniU/T9nNI/56NSZzN0KR8/MDam/wRe
 bwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJ4BsM6LRq+9dMYFeacDF8SZKrB5FcCbrbGL+5ian3g=;
 b=pa5K0gV0cNNKRdLbHW7zgSJ5gG1PRU+IyFm6Tr3fBDkIaw+2QGyz0MeouYEDBm4HuM
 FtxtYTCKy9epAy5jFaCJL6cKKZw1otzirutIGobVR5vXnPKRjBCAlcy7036K60WMcWSV
 4QLKaQxpC5RlQfg6WVbiSiRt7qgTHAXD6oRRmVhiZyA2nETLbapK27ZTJ7SUQPkQmOt4
 1rhaaglgPtV442lDV/iTgNjKnqUzjIQUzBuxALbeS/sGaITCVb0vyHu4sElXL6quMMb3
 Z/j7mGbhwEg+D99W7N9razQl1a0AU/CQbTA9gvttPlmSiJ9hFyLLWVUXxby+YCq1woqN
 HE6g==
X-Gm-Message-State: AOAM530oiBvnMtO13es4srvl9/YSLEoxjrduFjJXw26cwAZTNuqvb2Wo
 VmwXgWndp1oEDiUM7KuaQDcWYz15bRg3yw==
X-Google-Smtp-Source: ABdhPJx6FfwCrD+UmYDqnCfobf5pauMg18LLhmtEsi1catOTaGxoXWnbf+YnwZqvwUX52SAi3fSO5A==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr20618303wrn.13.1628071867125; 
 Wed, 04 Aug 2021 03:11:07 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id j6sm5369484wmq.29.2021.08.04.03.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 03:11:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 12:10:57 +0200
Message-Id: <20210804101057.932028-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbguard: add SELinux module
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for usbguard is added by the admin/usbguard module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/usbguard.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index a0d1c8446f..c16a7529a9 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -8,6 +8,7 @@ USBGUARD_VERSION = 1.0.0
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
+USBGUARD_SELINUX_MODULES = usbguard
 USBGUARD_CONF_OPTS = \
 	--with-bundled-catch \
 	--with-bundled-pegtl \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
