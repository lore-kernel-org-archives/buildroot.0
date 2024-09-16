Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10E9C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AAF94102C;
	Mon, 16 Sep 2024 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awxRBToZN8AY; Mon, 16 Sep 2024 15:13:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 654FE4101C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 654FE4101C;
	Mon, 16 Sep 2024 15:12:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2BDA1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F6340CA5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBywICQUI2Ok for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76CF340C21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76CF340C21
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76CF340C21
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:22 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a8d302b6b30so74309966b.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499540; x=1727104340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9mPY3RBDCrX4uM0os8lI6TXaWp9ME5v1CpqPHaQMm8=;
 b=ddHNIbXllCb7CKpVwzTuWtyDwdCPE/3PiuhUxgGWWHOkQwbzqNdKY9vYt7QdFfXSpe
 a9+iKNXyfzy8KTcQdcRRPyOX02iEn4rBB4dMV54k9yFb2qB8jZZX4GWRE49JKey64321
 jp6AQoJxW8+nYgvgQb/SkxJOvs/WPjJeoQq6wjJjh65iph/KJ2dfRTici0Y500aCfe2T
 gTp77CeZrrpC1zlkBgDR7MM2uPti1NZuBXgVuoIGSHlx+S7pjT//FyN4d5Tma8+7ES9C
 5WQX7lVS5qxvn/ZBi5/Bbzze5JvjlWFXiw6ozXGE7WZ30EM2xQeQTsC8bcmyk7+5cjB3
 5qPQ==
X-Gm-Message-State: AOJu0YxlvMCjN2t7sN8zkuIj/WOctUidNC5OOzNpMHi2H/zfrXPOTzhz
 Y3xcPH+QPEkghcZkbokbcqZHv7S8oiLiF3PwF1p6/pbpYk/RFuU/PAi04sM4s6yYkqm8mhHXNuI
 RDXB6WJvX
X-Google-Smtp-Source: AGHT+IEDOE0eVfuzu5kgrVj+v3sNxCYm7xiWqnDd79Tz18WkHeNqxlmnUjAMYL1j9Vlv+uYFD1Xkzg==
X-Received: by 2002:a17:907:9724:b0:a7a:b895:6571 with SMTP id
 a640c23a62f3a-a9029612b9dmr677708166b.9.1726499539407; 
 Mon, 16 Sep 2024 08:12:19 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:03 +0200
Message-ID: <20240916151206.947484-11-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499540; x=1727104340;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9mPY3RBDCrX4uM0os8lI6TXaWp9ME5v1CpqPHaQMm8=;
 b=OfwNp4N9SCIVBBkspeJk1hfsPxpQJ4WFtr5HEbkZcuHNf0QQhO8D7RpkJyAMOfXwnu
 NtapHDURewpKMNSifTAUTpsiBG+noUaO5ZRNp/Oh+Y03qglIOBZs4Srv8/1JP4jfrrDK
 xPAlHyxSA8ywNEJsYdxoO4WNgLPyZubwFJlv4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OfwNp4N9
Subject: [Buildroot] [PATCH 10/13] package/refpolicy: bump version to
 2.20240226
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/refpolicy/refpolicy.hash | 2 +-
 package/refpolicy/refpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
index 70d1acc9af..5e876d4a43 100644
--- a/package/refpolicy/refpolicy.hash
+++ b/package/refpolicy/refpolicy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/SELinuxProject/refpolicy/releases
-sha256  c89cd3b2e5d99765cc24536fd8e76de83951ad23e05472350328b5a4f8bee410  refpolicy-2.20231002.tar.bz2
+sha256  7ed41f4f45189b9ee9706da8ac357eccc103651b56daabaddb54c436e8117cf9  refpolicy-2.20240226.tar.bz2
 
 # Locally computed
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index fb1c213b84..74ccb79624 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
 REFPOLICY_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
 else
-REFPOLICY_VERSION = 2.20231002
+REFPOLICY_VERSION = 2.20240226
 REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
 REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
 endif
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
