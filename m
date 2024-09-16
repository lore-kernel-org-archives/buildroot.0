Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7CCC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DCA140DE7;
	Mon, 16 Sep 2024 15:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIvRC2DAgcLy; Mon, 16 Sep 2024 15:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 042BF40DF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042BF40DF2;
	Mon, 16 Sep 2024 15:12:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 656EC1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54452606EC
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4uM2FUmR5Gt for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FE0E606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE0E606B1
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FE0E606B1
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5c42bad4eb9so164745a12.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499538; x=1727104338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18gwsns6P7dumMCkfg4Ele8Uh4xveuNykvp/0h4589s=;
 b=A5N3RP8ohGpa4yfF67pGmQmHPq9ykJ6LPJCOlrhWQMi8eqGymIX/F5A8djjfNRXiwF
 vxYN4pSDcuWvUM9646NMJNcmSVHQCF5xxXM64KlCdSW68hfJUF/kRV82B/CevgG76nMN
 RAGWGsNuseHJ4lSmHnR4zh3K2pJd/fMr4NgGiEmwvVBJmHBiAiWt5/abPa/lcFex+Tzx
 Jx14v4+RRy1FgUDPfckMBXmGDssq3v666YvJcQHNmVRlaCrzcuU85/Ay1142k4WlDXds
 YIFGCUWrXgFVB/3IEvdhtaz6C7MzmoTq8gyLBm/Tl4oqfkUZGug3DT5AqqOZ3luYG02Y
 XeKQ==
X-Gm-Message-State: AOJu0Yw1gNpWlYpv/qUflRSWq/ZZQUnh42KM/oao12WiRaiVPaQNyXIw
 JLac+Nh4XKEoJEmcpB88Ue28k6Ph6AqNvtkU/6Cbbq3o0mfDdE1mjOsYDTKaRNYSFX4Ase8r7ar
 ZsSXDcKgl
X-Google-Smtp-Source: AGHT+IHq75W9IsUSc93j0aGJOg65b3ZETZ2SEcR9BetvK29LTaywVd/Z/fZQq6yZGnpHdKBPclfDCg==
X-Received: by 2002:a17:907:7f23:b0:a8d:2624:1a87 with SMTP id
 a640c23a62f3a-a902964c057mr604590566b.14.1726499537438; 
 Mon, 16 Sep 2024 08:12:17 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:17 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:12:01 +0200
Message-ID: <20240916151206.947484-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499538; x=1727104338;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18gwsns6P7dumMCkfg4Ele8Uh4xveuNykvp/0h4589s=;
 b=NrF8aaJdLbF/1VkNevhoNch5H+CdSb/8ht9Tq69ISSVta0m4xqrf9jel3NchU/3YpL
 y68WFzGKlVy92OicAwZikWz8oQqx9rAfQHnLVGsuWLkut2tjTtUp/Q2LNxEkqqn0qZHc
 OYgl5zicU2WkjNPEPSQEs7NwZJPcSUbFek6Ks=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NrF8aaJd
Subject: [Buildroot] [PATCH 08/13] package/selinux-python: bump to version
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
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 96be214fd3..9cf1fee97e 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  e2867d4cd26f9869c55216cc20ca7d10442491a0fbf256116ade99ec39426ec0  selinux-python-3.6.tar.gz
+sha256  630b2ad50e017a06a81d4f94312bee85465a93cb050a7536c728055de9a41a2b  selinux-python-3.7.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 84fc9cbc22..3ea461b37e 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.6
+SELINUX_PYTHON_VERSION = 3.7
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
