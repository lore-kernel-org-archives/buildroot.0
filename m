Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F8EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 17:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E46540DC2;
	Wed, 19 Oct 2022 17:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E46540DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O-oksPKc9Vs8; Wed, 19 Oct 2022 17:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CBDE402E8;
	Wed, 19 Oct 2022 17:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CBDE402E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC08A1BF42C
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 17:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE1F9402E8
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 17:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE1F9402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLbivDS_HeJD for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 17:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05DEF40141
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05DEF40141
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 17:53:10 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id f22so12184172qto.3
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 10:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jK6plpj0/6sOlQ87u0o8lWCUSiSQ9oBHAC4gJA1ch7I=;
 b=zDF+RQVx3H81TatQZCyFj4n+B7VyGTr4v4+qfZlFonTwJxWyBwA+DlWzNGvwjwRSET
 qWeMtjdYtbmiUTm6v5N0yJOJ+yM07QXDJXj0laiuV4JefETtOpwM3OrIOHX4eiCvTyUk
 kf+p+RybHUSEF/oKN4aZ2mfIyeLqVwuW0GQZYNPq+d10nO8SPh5qqElU3rMkYa4IA70r
 WuMPr3OnRwnYX1DFwzkKYLQW5lBHNozlrMbfr7RF3E274dHqnkDPJKep/u2qOCIuwrP1
 vwNMFZxcPpizoFGxvoV8TaAQm3Gr/dENMZa5Pz3PZmbAn1M1VPd4V9xzmaesYTm1STlH
 hpCw==
X-Gm-Message-State: ACrzQf38hNbRsnYiTzQX2Bkk1A79ORNaoKjCNMgIWcfpuA693cpuCsdp
 5zH6ijdfDZTmvsk8wJX3Wp0FJiDzILUMZkmPYG5dsg==
X-Google-Smtp-Source: AMsMyM7YC/HpSK50lSdpiF0u7s++qmgCCKqCaKg4xY7ctua+g8v1hLVf/p/WskgaFAvcdrJQFv7+UQ==
X-Received: by 2002:a05:622a:12:b0:39c:f028:4881 with SMTP id
 x18-20020a05622a001200b0039cf0284881mr7630913qtw.94.1666201989603; 
 Wed, 19 Oct 2022 10:53:09 -0700 (PDT)
Received: from starry.com (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id
 bm34-20020a05620a19a200b006ce1bfbd603sm5162072qkb.124.2022.10.19.10.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 10:53:09 -0700 (PDT)
From: Nevo Hed <nhed+buildroot@starry.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 13:51:51 -0400
Message-Id: <20221019175151.1030079-1-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jK6plpj0/6sOlQ87u0o8lWCUSiSQ9oBHAC4gJA1ch7I=;
 b=cjmQl5VfNYTSWj1MwJZi6j0WZuCwlYx5faGxaLS6bfg8W3RSH8qNLsoKMtUTeC2bUJ
 HDcRQmwFnriRf+Q8+jLaW7o/owMFGg0aV/oS2CIV9hLz+0imivX3qE/vlmmuTMd2g1mE
 NlXv8iwHaydZxHDex29tYmCAPyzJRrniu/QvA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=cjmQl5Vf
Subject: [Buildroot] [PATCH] core: Use of percent_defconfig seems to impact
 performance
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Nevo Hed <nhed+buildroot@starry.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Noticed a significant slowdown with rise of number of external trees
in our env.  This slowdown seemed to be related to invocations if the
percent_defconfig function (GNU Make 4.3).

While I have not do a deep dive in analyzing the performance issue, it
felt like redefining the %_defconfig rule N times impact performance.

This patch makes %_defconfig a single rule which combines uses the
first return of a wildcard expression.

Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external
trees:

    #Trees    Before    After
         1      0.38     0.37
         2      0.32     0.31
         3      0.31     0.33
         4      0.36     0.32
         5      0.45     0.35
         6      1.26     0.36
         7      9.10     0.36
         8     85.93     0.42

Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
---
 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..a8298dd5fd 100644
--- a/Makefile
+++ b/Makefile
@@ -1010,13 +1010,12 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-define percent_defconfig
-# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
-		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
-endef
-$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
+	@defconfig=$(firstword $(foreach d,\
+		$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/configs/$@))); \
+	if [ -z "$${defconfig}" ]; then echo "Can't find $@" >&2; exit 1; fi; \
+	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
+		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
 
 update-defconfig: savedefconfig
 
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
