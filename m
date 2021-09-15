Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D61BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2511961131
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2511961131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E762180E43;
	Wed, 15 Sep 2021 19:15:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InrjG1fqj6Kv; Wed, 15 Sep 2021 19:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE2D80E35;
	Wed, 15 Sep 2021 19:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4871BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C9AB80E35
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA-CkzcG8ed0 for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:15:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4414580E23
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:15:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q26so5515614wrc.7
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=izKg4tBAvQiM0TtB79HQAnSbj4noXrvWun9A4jUd1ZE=;
 b=UZFWppKCXixAcuM8w4JPTPF4MScP9fxEO/nZi/TH2Pi73zrGr3fmHSAipjNcI9XD9u
 +9PnMGM7d++4MUwtdGG1yqs4Hh+TArtvTWrb9gDRfkgMXl4NxzyfJJ/pGyTD7CTxrMYP
 hGbBukCZ514SnvY9/3OLZxpR5TSdcgWLaPyjP7HUXtgHdMcXsFY5RS2uszIf1oa24loe
 ugitJ+EcpWQN+MxRW4Hyy0OD55d+HNrcZdTKlqoNcxwlZmX9+bpogTD4ZUx0Nawg/Bkb
 5Upj61q7NI8J2y7Coo0QebWBi/qIPa019dqVceSkURADEBqrnRm3SxvK31Uc9Shzxb9m
 LNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=izKg4tBAvQiM0TtB79HQAnSbj4noXrvWun9A4jUd1ZE=;
 b=yOvZ35KFaORGjO8pB6npwzauwVeU2lwekght+8gtDqQjIdYvMuQCjLelsl0jJRXRqG
 5ZnKEzZR4IWolG9blbuaI4uUZ0CeQ5lo6iN5ZZRoeTXzUxWT8XmIYdaqzXrLIW2mIUsn
 AhDdIB8KrWW5A7CPSR0WGLv839UBtfASrp8+qbU9WraLFTzOx4cgmJAObtCMx8du1cpc
 kSWrZcROKxogNIosjr7HpsX4yCia8cfr4J+1qakoWidnHSyef+DFmYfDXFHpJH8Z54NC
 AmYOB9Ro/frMVWVOsHHetBKxeihuZbExEmS68b6GsONBpP0mQEIP+R7Rq+3B5ZQOF0Lj
 1LkA==
X-Gm-Message-State: AOAM533ZblvGNvstWOCTc6AB9FSR9HX+r4nepuIXRO+ObB0Pj+fkb2RD
 b//uZRP7ITK08ev9FCGMrZHaLQ9Wd6s=
X-Google-Smtp-Source: ABdhPJye0btrV0w5pd0Vql0dS8hQ+ffJDFQFE/gLkciJVMl7ydviQ1GcPGGjVl43QNx1aI0fWmUFiQ==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr1762947wru.350.1631733343519; 
 Wed, 15 Sep 2021 12:15:43 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id z6sm818603wmp.1.2021.09.15.12.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:15:43 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:15:37 +0200
Message-Id: <20210915191537.15040-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/links: bump version to 2.24
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 156b73fb63..6dbb9d13c0 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d  links-2.22.tar.bz2
+sha256  9b12f5ba2d068306d7ff7385b520cdcafdc0e55c87eec877abb0e78288525430  links-2.24.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 015878f892..5f075a70da 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.22
+LINKS_VERSION = 2.24
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
