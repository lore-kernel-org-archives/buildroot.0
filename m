Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F7CC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 08:22:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1F360EB2
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 08:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D1F360EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33BA54010A;
	Thu, 12 Aug 2021 08:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5u9jBpzpwBCY; Thu, 12 Aug 2021 08:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A49F4046F;
	Thu, 12 Aug 2021 08:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3F81BF947
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 08:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1A54072E
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 08:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfIUMNyQ3Ekz for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 08:22:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5CE5403D6
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 08:22:15 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 c23-20020a0568301af7b029050cd611fb72so6797751otd.3
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 01:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQjhdnEleda3WKwx0A2MNbixlZtYXUAhy9c7PDvGsxM=;
 b=T/5dWlzVlD7uEFkQQ8KP47Qp3VmXsYOEe7wJI4+cexLZWfjZgqaqcdhL37ehCkXKeb
 DcsCI/X7Gqfb4VF4hi3lDsynao0p6K0pEf9PgZvCy8wPZd/Zowb7H5Qr+Wmu0oPdhx4i
 gp64JMCGnmRMig1DcjjrM6+gXieQHmABzSlilutQZsMrXFGfByOzDhFHWf3z8fd/mz9V
 XX6jWUGjhMBsxMZEnc9siueTa1MDiUEuxQJy0dyUea7uJ1tJwLB1v/8FSeXyuJQ/Ueqx
 R9idWWmoMTGCBMF4y1QlDLHG+TvXhIvQgA0RiU1A5YbnLY8XrLolrU4KV2JG1cWAxvse
 BwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQjhdnEleda3WKwx0A2MNbixlZtYXUAhy9c7PDvGsxM=;
 b=ZiP3jWz9wyeScaaRv9KIrzUE7Stf3J87CECk2jdQudYWwQAC7VDPOmO26ZLkqiG4r5
 mPngrUY65hAS+IKe9GlS/3Ad7l9Gl7RiPjXjJm6obhHermbHFoVW/tP+uvGTnQWJDZtg
 CGlibINtEzd6U/EkP6tN717feaihDtmbi6RP3dmUwC+J3/1ZrCnVXCiLpihzFPLcFUmm
 gEQl4TMoqrtGX9KfgKt61DDVKMYNaxH2/mQWm1VXhHRjtEQ4KP1njMjgL2HkXrvOxtp1
 G+vzwrWhE0iqHiX/Bv7BNFLbxiLSpEof4Y2hl2VDf1gz2Z3x0iTQl1q4puRw1VfuLap6
 ekkg==
X-Gm-Message-State: AOAM5302SyPg7mB72+nja92CP5riKEmafbwkapWImoDOSZ2TpaoY7uZa
 Fc3Yh0HaQWsk3G1T8slDsEXF90MYKU8=
X-Google-Smtp-Source: ABdhPJwSC+1hjFlZgPVfSZZc8azK+wJuPVuDRbCDos6m3kOa4dO13W51GVXO/FQa9wm2hR7+67Ac4A==
X-Received: by 2002:a9d:6310:: with SMTP id q16mr2561078otk.203.1628756534670; 
 Thu, 12 Aug 2021 01:22:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id s35sm486536otv.44.2021.08.12.01.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:22:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 02:22:10 -0600
Message-Id: <20210812082210.3942159-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.4.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

License name typo fixed upsteam.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libbpf/libbpf.hash | 4 ++--
 package/libbpf/libbpf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 1afda50c9c..afc7aec1bf 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f97295987c745eb07c48f8db992f7df307b5cd45c9a20eb352ee6d08cf7bd36  libbpf-0.2.tar.gz
+sha256  21cbee4df093e7fd29e76ed429650d3f3abe3a893f35e346ab9bc3484f6e68c0  libbpf-0.4.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
-sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LPGL-2.1
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index a1aeb7d894..3f09cc38dc 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.2
+LIBBPF_VERSION = 0.4.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
-LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LPGL-2.1
+LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
 LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 LIBBPF_INSTALL_STAGING = YES
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
