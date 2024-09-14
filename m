Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA90C02191
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B450040481;
	Sat, 14 Sep 2024 09:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4Y9p5siFV0m; Sat, 14 Sep 2024 09:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F291E40590
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F291E40590;
	Sat, 14 Sep 2024 09:55:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FDEF1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E3EE407AA
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R0ZcwOXXRuSV for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11EEB40789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11EEB40789
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11EEB40789
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:55:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so14650815e9.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726307715; x=1726912515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kUT26IeVJHycT8Eg+pTeJcmTqsyMxpym0F+OIrueNmY=;
 b=vU3MKuEfe6KUGuv8o5QUyQ3AT6iNwrnW6qVK95TtX6OGkV0h26XzA9V44RLiulyOWo
 bHWOsszuR48b+U+JzljjuSoPI18XOoRsVel9wuzUbG53wVrdTYP6utiuI3t3nuJO5+eb
 lkI7/YswpdMly4q3B3ur/17ZYeo3bSz6vwB5p1f3bIGyPlH+Q0sR1TLqlh5bLDEfruPh
 hrOB7M+BS3eXoKLKuTEKVcPPUFa8pHd92u6PU8ZDxTbdvdHY//8X7Vo0XoDOm1nQ4gTR
 55heds09j1OrnyoxfHME7xtz9ZUVTty5l9cRBdxwNGA0q4BJGAmWxbTRI2XVuGrPdBAn
 QjGQ==
X-Gm-Message-State: AOJu0YyBVQ/sX1xydLf0DzbQsMYoIkqACWurzO4gBogHtcxrFngSCHaI
 mlbXCkYZoTMr+NaKpUnUxCLD6Y1/EzP5Xi5QOYtPPrXbpzAlIH2WahoXIhz7rotgLPNl6JY+xX1
 kVpdFQQ==
X-Google-Smtp-Source: AGHT+IGn1eA2VaIRaVyvVtfsQrq+pZtWpEjpX3oeY1QMmQOkkJqBNvxcZWOt5+KeH/9dkO04jYczJQ==
X-Received: by 2002:a05:600c:c12:b0:42c:a7cc:cb6d with SMTP id
 5b1f17b1804b1-42d9070d97amr40155255e9.1.1726307714820; 
 Sat, 14 Sep 2024 02:55:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b87a9sm14457395e9.6.2024.09.14.02.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 02:55:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:55:01 +0200
Message-ID: <20240914095501.194725-4-arnout@mind.be>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914095501.194725-1-arnout@mind.be>
References: <20240914095501.194725-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726307715; x=1726912515; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kUT26IeVJHycT8Eg+pTeJcmTqsyMxpym0F+OIrueNmY=;
 b=hhbBFaVpyurM8isZxGPwHI/Sz2Fos81eb9OpkcPaLSu34/lLLXPFhSUQ1gEECDVmlp
 o6Ry6foV3CMnkQ9eLPEjSOR6WSVK9ir8hh4KGJTPffpbDe6hoZu1ZaNYAesiMMd/1fIX
 4cB8clO4QpV635T89pQVfZxgdEgCAaYF6zCASWsBL05+Qu5L9nV7NysGMAxU2W9LnZYF
 N/Sj5fD4ycbz5gy1wZhvlisBOsRa/YdkZOJ9zuNUkb4JFlliNm8FKHuQGhNoHropGzSu
 d5NcrC3ZFLy8k/ScfZuEZklaMh219pog8200JcBtsk8q2G1ETspge8CZSRKTDK8WtiFo
 mLeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hhbBFaVp
Subject: [Buildroot] [PATCH 4/4] package/pkg-generic.mk: remove set -x in
 mk_tar_gz call
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The set -x was added for debugging, and forgotten to be removed
afterwards. Remove it now.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e67f141604..9ec84d0f45 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1168,7 +1168,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
 	$$(call prepare-per-package-directory,$$(BR2_GZIP_HOST_DEPENDENCY) $$(BR2_TAR_HOST_DEPENDENCY))
 	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
-	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
+	$$(Q). support/download/helpers; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
 		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
 		$$($(2)_BASENAME_RAW) \
 		@0 \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
