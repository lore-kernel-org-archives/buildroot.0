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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50171C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1624E60295
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1624E60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFFB1605F1;
	Mon, 26 Jul 2021 08:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SG94tBPXnTqo; Mon, 26 Jul 2021 08:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32667606B4;
	Mon, 26 Jul 2021 08:26:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A628E1BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95647606B4
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7m5DqLwFsDf for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E705D605F1
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:26:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p5so4910074wro.7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFmF8ss+9McztmTJT5MAO6E4bmWzfO5VivMW9oR+HIg=;
 b=Q72MboeXg33DkcJTDdPdfx1xFLWWIm7W7tnPSzQ217LK2lcqRfkD/e7RmC09vVJb5N
 T8fIRwVhZUn8ctG0io8kO2QajMf1wPBKQv8MSyhRfHTD54t1k7FUeNgMXtbz7FawNqR5
 UXR+oQEO0YxxELW5cx8iCfatl1NVIkYpLu2Qnk82bYZ975W/ikpqiSVsMG5DMwtJ8QfH
 hvGZE1pBslM7/Te8BKAsm5OmBmRzEjJ6FjtYHpjgjQQ1PipcRaM0EH2OYogGeOrfqth8
 PADiqwKuVHuDdbl+FeNLTUrZqKmV1mPWDInjBbyENpdztEpN6NmjUPquRblWHgV+XS8m
 PISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFmF8ss+9McztmTJT5MAO6E4bmWzfO5VivMW9oR+HIg=;
 b=I1P+eBVgCFvnRfPn6a6dhuK+6JlLeLW6vRzEzIbDwFBDVNY0iwDt0rlfKe7EjvnSnk
 8F/0BPqbxCwYjgGqpJmsFTmR1HkojfCPoUfAtxHbCjRm40s0KVV40/WW/CmfzrgNtyL/
 7FWU2gOrHgD0jZZMyYSfuxr5ulHwm7AAGaXZNWP2WknY+or1fzl1pWf4mZEPVK1yk0bh
 4Nf3W2NGOcvGCnUE2I73Puw26+PPtiBZJixXysiOwnoiB0KFobxLQaXcfmZblwNVdAZC
 iL662npnTlWkArbUaVIk8trXhQNDnz9j1/F5zWeqxputXuPuyYNpEh0JGwxV9BKG+54I
 ga7A==
X-Gm-Message-State: AOAM530Tt9BVLDY2LGzNcU4MSvsJogD/mEDrncGyoz4uloPXGLZyGscQ
 e/NwoKDTb/KGUEngk6zHGGLVDI4HCcNTAw==
X-Google-Smtp-Source: ABdhPJx263ivX5jOw4ymGnmQjT/ZcOBtGv2Z62Tq0q79Ps0gDKJg/btDpil7gzBrPKrBosQf7fzibg==
X-Received: by 2002:adf:e546:: with SMTP id z6mr17867168wrm.245.1627287959836; 
 Mon, 26 Jul 2021 01:25:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id j1sm11205289wrm.86.2021.07.26.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:25:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:25:53 +0200
Message-Id: <20210726082553.1706431-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fail2ban: add SELinux module
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for fail2ban is added by the services/fail2ban module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fail2ban/fail2ban.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 0e465e9c0b..6b92a9f642 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -9,6 +9,7 @@ FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
 FAIL2BAN_LICENSE = GPL-2.0+
 FAIL2BAN_LICENSE_FILES = COPYING
 FAIL2BAN_CPE_ID_VENDOR = fail2ban
+FAIL2BAN_SELINUX_MODULES = fail2ban
 FAIL2BAN_SETUP_TYPE = distutils
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
