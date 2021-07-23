Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D353C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C33160E73
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 08:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C33160E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D941840645;
	Sat, 24 Jul 2021 08:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9q8kkalcPzNc; Sat, 24 Jul 2021 08:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A274063E;
	Sat, 24 Jul 2021 08:08:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A80C1BF37B
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A4FD83B32
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 08:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl0WdmuzdNMR for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 08:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F7FA83AEA
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 08:08:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l4so4752548wrs.4
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 01:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHHDLnBGGVHWFjqgfg0gPakzVIlruc67423E6E5Y6eg=;
 b=lfJNO7/UcKUG0VNSLTDbjzqEFbUYxEOwWj+Ii4ThsF07tOYIMMBuZbVDPnaDeHiryJ
 hlKNeKzAjiS3hHVoIOg3/P4XjNVpgz3gKKbOVWWHNwyrihlT+0XGj/uVAEU3L4bMMZly
 GK8yW/P3KBtmoEQbnLRa+p4euJitV5FwiBeAhK/fRgxdfLdGExdS2q/KObTdwzV3SkXf
 y6BShngCJDu3mb69ggIQK+eTQ9sSUN4nXDNtFTo+l9D0rRqYoDZrezvTr2Oz6sqo+j/W
 9aIVtMIJR/Z67K4w4o/eqCYGO99zN6lFCb0ltla5su2cdPEEy5NRsQVtGKtSCINjv1ob
 cRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uHHDLnBGGVHWFjqgfg0gPakzVIlruc67423E6E5Y6eg=;
 b=AHnZWKAxU9NBqOXVO5AmyEtGVtjoAik2JvJQGB2U7KMYZzvT1Ozym04zuakIYXJ+L9
 k1JK4bSZN2elsV7MhvLSB6RQwvsHUGinFJ09KPa27/ydOzJhtkRuOT+3bpLVNHxkTOuo
 ICf1E9canVHCNN5nSWPAjsxAKaePDcIWTU4pdy6y7YJxuW1EAcCMk6NB4+/FwcLOlkEn
 MxGSi0cxj71laBs+krDKZw8xf/f6NXGxH4sH3wdk+TthWP9zopA9N+SgOzFScXvw0RYn
 cMkWcWkrg6iIzMYtSrkCFYUUym+VgIiGyx5Eoh2gnCSzAYaKfo8ZTmrKNZ7VJyboARnU
 3Ybg==
X-Gm-Message-State: AOAM530eYzK09ZopFA96ymMvM+5x+qscRiSpQdB4cB4RIl05ApdhWOrp
 xmMmC7fYDicBQTZ06vQXufkQ20fjwN4=
X-Google-Smtp-Source: ABdhPJxpcqEuOLxGlLMDjkNRnLgBfKufaPe0x5ZMnMByJGwFdcYhnZsoQzJzuJK2JhCxHfp+G/OAJA==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr8756813wrx.399.1627114116821; 
 Sat, 24 Jul 2021 01:08:36 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id l9sm2808414wro.92.2021.07.24.01.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:08:36 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 23 Jul 2021 22:43:24 +0200
Message-Id: <20210723204324.2533212-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2021.06
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 5464c4e12..44c54e35b 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e094728536da421dc9a3e8651160ab6a5e8d0eafa834e8953feecf33285a11e7  MoarVM-2021.04.tar.gz
+sha256  2300a921d504c9d33f111cbe08097d0011bfb06000c018b8d4353d97966772a7  MoarVM-2021.06.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index b6b9b6908..17b2a234e 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2021.04
+MOARVM_VERSION = 2021.06
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
