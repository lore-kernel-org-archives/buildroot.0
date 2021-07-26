Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D6C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938EC60F49
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 938EC60F49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65CB5402A9;
	Mon, 26 Jul 2021 09:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZug32r5I4O3; Mon, 26 Jul 2021 09:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA638401C0;
	Mon, 26 Jul 2021 09:15:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFBB1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06A5401C0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mdD-Fva_1pvB for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:15:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE23F400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:15:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b9so9343252wrx.12
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4lcN6E4H8HK1lh12oJEorvlSs52Z4A84e8d05tRaHSc=;
 b=JQLQGK5+7owg0ao3NWlRVgB9Fo/rkGOAEqApRSwOr/JwrX7HvnG6UUK0/lxio4DOqx
 am9BWTxWf3s+GHeZg2n484coju0Aa5eG4yE6If5LnH5qSlV1AcI6czuAlkN813Ea3Sii
 raJCZSkApg1sC3f+hu4EyxcIpTBGiZdGvuF6hy3B8V4iJuVKZ8SH9Vb8KUXOuQ6GLSxC
 ylxOLHjuVvFw6wujlvxUVJmBm7jGW3e7BQPAaXP19YenojgUbhgFPqttPDsAjZj4H1yw
 djyohK+YvAQ6VCoRbE9vEfbP5lVWKyseZkdlmree8TTqlBhh85smdyEJOPDiIMZ2E36M
 oxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4lcN6E4H8HK1lh12oJEorvlSs52Z4A84e8d05tRaHSc=;
 b=DuEHwSAFl6QkQGnnpXjXDaT5i7jgP9Y79nVhbMcKACK+qXpSrwjnzoXFHmPze5RHeD
 JqDmyWmKzWg9NKHdeosILpVq4SmjrkolKuJeYdORFFNodwGMnsXI1hCvv8OgtZEmQ6V1
 oAFht2OkBgOh1fgzrvlnH/tN5rSOzECW8+j5zYURHRubteT5XvijSieT47j9t78AwNvz
 YycRMEZXdHKjdXpcclLrtyhUaCurXGJ7Y2wWPSy+uTCUkhsX/JPyyrLFp6Stjx9C3SYS
 ZvVzQxUraxcDHXMmvXq1QxL74wlbcDXzRa8nBVfgv21tWUQIcER6EQEgkWBrQKIDRZAL
 MWAQ==
X-Gm-Message-State: AOAM532xcGWnWTfdWjRM4eHUzoGz66pDlUUg3ErpcmvWACApoOIvf0TG
 xeMMbj7M3QPuTaOzomRQMMsek4om7C1oiA==
X-Google-Smtp-Source: ABdhPJwOUx8QwrGJKS5SRzs/wsbmJZbZAttSAHEVwOrEPN1D6Y6ebR6tmShyAJaJwBwCpo3ZOaB2Hg==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr18085257wrs.405.1627290900009; 
 Mon, 26 Jul 2021 02:15:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id g18sm34598326wmk.37.2021.07.26.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:14:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:14:50 +0200
Message-Id: <20210726091450.1712562-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726091450.1712562-1-fontaine.fabrice@gmail.com>
References: <20210726091450.1712562-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/monit: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for monit is added by the services/monit module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index b9e131a363..6d5d475813 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -9,6 +9,7 @@ MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 MONIT_CPE_ID_VENDOR = mmonit
+MONIT_SELINUX_MODULES = monit
 #
 # Touching Makefile.am:
 MONIT_AUTORECONF = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
