Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C43C0218C
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5468404F9;
	Sat, 14 Sep 2024 09:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svj796Eag_Oq; Sat, 14 Sep 2024 09:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 636CB40590
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 636CB40590;
	Sat, 14 Sep 2024 09:55:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94AF01BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 838A384466
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0sDsq1UmXJh for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B14B984482
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B14B984482
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B14B984482
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so23443945e9.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726307714; x=1726912514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v33L/bTiJyURGhiWmloq/H1Vd7TKkGP7iE4KCR5jN9M=;
 b=Zb1rwFXwExuT0yMeWdHE3sCHniMvlhQ7uVh0Jopohxx1/x6X8f6CqiQOMCVRRW0Ep3
 ZeL1by+uAJxvwDt94CVXb6054IpOn9EVEuDciUkXyNyBVSKofyXmyohxPhBhlIIHwEN5
 a3tBuRxdjQACirLwMca4y7MPGL7ebxA+UHKEOx8gXOqmYdZQFzPHSVVEqmOLSmS8CpCl
 pQJ+GgD+tAnLr/+8HTq3DkEkOSEqb1GhpUxuVLcnyJbSFkSOn6/9PbDCm06v5fEEaa53
 QJjWqWiTaJzDlWRL2x1oJ/IdZPETkRXfCKAmw7Fr1l2uk+5q/ELskKW5v6N5PmNqDYOv
 2Wzg==
X-Gm-Message-State: AOJu0Yz8Ym9lp7gqzV/eHMqq5aFQTJJMPkeWye+BOjaoF9J03TytZhIM
 W9fQR6z11fJUfEkRsLW1rMQAMIMAK6fkmIJO+CsMttV8X3Rg/n+fVWrzte5rlMdp3uGrIb9I7S1
 tVbF7ng==
X-Google-Smtp-Source: AGHT+IF4YLubFpnKRG3ltEWeXRuIWv0Fhm71PgY6WzRj4L9XgCK0s2dS7tF4Q2kbzfaie+sPY6+BpQ==
X-Received: by 2002:a05:600c:45cf:b0:42c:a6da:a149 with SMTP id
 5b1f17b1804b1-42cdb56725bmr76267265e9.25.1726307713702; 
 Sat, 14 Sep 2024 02:55:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b87a9sm14457395e9.6.2024.09.14.02.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 02:55:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:55:00 +0200
Message-ID: <20240914095501.194725-3-arnout@mind.be>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914095501.194725-1-arnout@mind.be>
References: <20240914095501.194725-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726307714; x=1726912514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v33L/bTiJyURGhiWmloq/H1Vd7TKkGP7iE4KCR5jN9M=;
 b=KMtFHhjLMHfT/che14/SKrzySngt+PYmSs54OYLIhbV3R6Y6DKGv4OXc2mdmDAcb4x
 TROPtyEUFZXa+ho3HfVdjlxqqkWIKDSgBmAMuOVZIWt3h86IzL0GV5Ju5iJ/oiEwEcZP
 tKxW57BlnVnC/uvUUNNPQzxcf+wIqPpkpV6Aa1E6xVHdXg7hlEJI0pqXqU8lV0nbbhoR
 2JBuieVITkOdzG3qWV/E7V4zQxa9SYcOE0wznibCjdgOJsu3tXhL2uwMYUS/jP1nZF9T
 tESbo3l0zezxy6PvxS5nE/NIILZqD/Al4fzBNs0zQbegy+T4rh8jKZFvF9iIqcgqhnFq
 4QDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KMtFHhjL
Subject: [Buildroot] [PATCH 3/4] package/pkg-generic.mk: legal-info: proper
 double-dollar
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Everything inside the generic-package macro should be double-dollared,
except for $(1) $(2) etc. There was still a $(call ...) that was not
double-dollared in the legal-info target. The result is that
OVERRIDE_SRCDIR isn't actually qstrip'ed.

Double dollar the $(call ...) like everywhere else.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 48cc8ec800..e67f141604 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1164,7 +1164,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rm -rf  $$($(2)_BUILDDIR)/.legal-info-rsync
 	$$(Q)mkdir -p  $$($(2)_BUILDDIR)/.legal-info-rsync
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
-		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
+		$$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
 	$$(call prepare-per-package-directory,$$(BR2_GZIP_HOST_DEPENDENCY) $$(BR2_TAR_HOST_DEPENDENCY))
 	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
