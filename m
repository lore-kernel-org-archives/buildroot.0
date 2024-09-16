Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C331C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6736140C06;
	Mon, 16 Sep 2024 15:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Me4KfE822K69; Mon, 16 Sep 2024 15:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A017840DD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A017840DD4;
	Mon, 16 Sep 2024 15:12:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B17E1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87F4380FB9
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymSue4GL83Zx for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B1BC80F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B1BC80F89
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B1BC80F89
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-37308a2ea55so330320f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499537; x=1727104337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrbwP7Akc66Ccp26TXJsABzZGcThM/oDFbrnMEmjTPQ=;
 b=lVG9t4ScW00pCFmpMErxbhkTvf0H9dEZKswXonMs8dFno04WgEp2ugMvJgT+L1g00q
 EtNPPY6BSUKoNtpcRM3KPTo1F4vVDMusTyyCMvesMKKS5ympMW6+BU05LXe68OPGVjMD
 +yOCklHoETn0y+De9FmY7nCUAz0XG8SLvJSsdeRhLb6w5TsxqRsLGUZP4AYEDgr9Z7Vc
 YrZ3aEfmcOBlvq+iPRngmZmEwcwwCajoOTBF3BAq3R0nZncigypVQE/eWEG1KwIvp+Et
 CdxMUzQL1BE9qWaNOWMYdSEel4XAMl1a3fGQA0nIztMQNyZoIPBtRJiUx6hlNcgzuSfW
 0ulg==
X-Gm-Message-State: AOJu0YywhwNMuZa9SFrBmhlBHx/ek5xBWvHF6W5Mral4iMQZq63ZJviw
 jYBjFYk7Jd93+MbiYrYKR3sxw8OS5td4PYJEJmWiwFaWEltRPNoruEkCy57ivNMbbtyTXAN0TRf
 gFIJ2x+tG
X-Google-Smtp-Source: AGHT+IFbiE0Z/hihF7fXnXJGonzFqG1AhpwmwCbuP9jqlBAn/u7TWIFJ6KlBbC+vJf2Qie9zwR4HhA==
X-Received: by 2002:a5d:47ad:0:b0:374:d258:90d1 with SMTP id
 ffacd0b85a97d-378c2cd685emr5286972f8f.2.1726499536930; 
 Mon, 16 Sep 2024 08:12:16 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:14 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:00 +0200
Message-ID: <20240916151206.947484-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499537; x=1727104337;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrbwP7Akc66Ccp26TXJsABzZGcThM/oDFbrnMEmjTPQ=;
 b=cRjnPoFV3m39w6RV5PdKrZ6sDtFQICqHfZp/b98b0E4IgAIv2oPkPeotKv160MgaMp
 rfOoYCAAXC1VuJu+RU7QmmjHwi8rtr62lpqaNwW/UMRGfQwCWrhV5sKGubWPjAKJ2vPy
 0zRVJS1pVJq7/YYNFqToKIWpHXQ4hcko+rc8E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cRjnPoFV
Subject: [Buildroot] [PATCH 07/13] package/semodule-utils: bump to version
 3.7
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
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 5e7d698f3b..296f7fe137 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  eedb88f2b2124e538f2d614be063c0d9ac3eacc0c51a4da44500ca1ed1ba16f4  semodule-utils-3.6.tar.gz
+sha256  db0641aeafefec46612c7c2ddd33ef1060bb721ce64842d2a96c33dddb5eb176  semodule-utils-3.7.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index b58f7535f1..c9d3af4509 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.6
+SEMODULE_UTILS_VERSION = 3.7
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
