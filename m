Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2179BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39792603E9
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 23:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39792603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01D2040178;
	Sun, 10 Oct 2021 23:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TYxgrItUl_jL; Sun, 10 Oct 2021 23:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02EB4401B6;
	Sun, 10 Oct 2021 23:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56B2E1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458F1403A2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 23:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VewZiGitGZLs for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 23:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C009A40398
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 23:46:59 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so13373706pjb.5
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 16:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44pJVc8n++JLpeVkxrsrFIgn9chcruqRKRM0yrdw4mM=;
 b=FBCx/viZEtMHSoUrd0XcuILqM3DN6/i7iy/6WqtT8HP/onOumqtsh9KGBP2CPKTVyG
 sC4kUXssVXx1m85su0EWG1Uby7SEksP4C+6RBaUbvKFu8lnpPNaGMAvzinEDUf2H5N8t
 2J0nfxZ5XB5xpl5B9iWOk93N0ZLKhKPzIZS52st8K+SlnFS9eRSHG82IIydq/eooFeEZ
 kilgLoDhHxObgtMzs8wZnd+r8XeKgppXUYd6v7YTeXIVQaBAyBI4Zn1RaAGHC3s+Fj1+
 6saDPOxUyH41BeEDEZTkvp6nRA8+7z9nscCxFaMelIkbM2dW0F35428QKhWllBxicaX5
 9c9A==
X-Gm-Message-State: AOAM532KNz+J27KquMU6Hz+WOdSt6cXdpuwn2BM3bqUp59PhAHMq3JZA
 Kw6Ce2CN9isaNGTBYhuXHfVCZ3sC3XvWtg==
X-Google-Smtp-Source: ABdhPJwTr+UAZPIlGG+6l5IuOyhke6d+0Vbut6vfuTsjqI8b/ytaFAqdtEfCM5DlVkkSCYlhJzi1jQ==
X-Received: by 2002:a17:903:32cf:b0:13f:d59:7a4c with SMTP id
 i15-20020a17090332cf00b0013f0d597a4cmr18679656plr.78.1633909619048; 
 Sun, 10 Oct 2021 16:46:59 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id t6sm5662547pfh.63.2021.10.10.16.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 16:46:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 16:46:51 -0700
Message-Id: <20211010234655.585526-2-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211010234655.585526-1-christian@paral.in>
References: <20211010234655.585526-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v3 2/6] package/pkg-download.mk: add
 <pkg>_DOWNLOAD_POST_PROCESS variable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This will allow packages to register than a download post-processing
is needed. Note that this variable is intentionally not documented: it
is an internal variable meant to be set by package infrastructures,
not directly by packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2527ba5c60..66a415cce0 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -117,6 +117,7 @@ define DOWNLOAD
 		-n '$($(2)_BASENAME_RAW)' \
 		-N '$($(2)_RAWNAME)' \
 		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
+		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
 		$(if $($(2)_GIT_SUBMODULES),-r) \
 		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
 		$(QUIET) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
