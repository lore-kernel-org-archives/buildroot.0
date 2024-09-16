Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A7EC3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D6040CB6;
	Mon, 16 Sep 2024 15:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7j-oIIfU772; Mon, 16 Sep 2024 15:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B7140C49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B7140C49;
	Mon, 16 Sep 2024 15:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 522E31BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 409B840706
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUQ963o_UNuo for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24325406EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24325406EB
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24325406EB
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:15 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a8a7dddd2bdso33809566b.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499534; x=1727104334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pivG0RdpbTHlTzYT5lgWl9VMBUuP/yR0zQJub/Wqnmw=;
 b=AJw5I3+O5can6rVjEnw79yeJ2Uo5X32WNZY3LzKtJmuViT2I24t+wTKd5TZHugjIv4
 xqTA8qKnZi8NI/pEr3qbZv+5pimMOkNR+zzBVIskJzSpCBtzN63v5yxUo9N0EyP2hzUS
 MsKP762Q76YoLoixvsezCTNSbJcrOx5vjXnRYkXAsIHGDV/NjASNMD2U2KB9RD+QUY/D
 ZaWHIIhd3KYrgqO9lYVcV5J+cl9JTybw9ZjPvg+QxpqqRCPS+ACmpB9uiU28mCNcb3re
 BNJmyij/iJjN7yF9euDuDEreaVvZqCK5g/09XONei+lEU9b2y+k0uk5C/EDx2G8WyClk
 hgDw==
X-Gm-Message-State: AOJu0Yx0duFcnJozFF8SAbbdSb5Zf/KYM6DbCMCG0+V7eroH873+lO7C
 7NRvPKvcu3TWuIA8J2Yz9yiRjtq1NSAnh6m2dkq9PqELoMM4vcyZ9U8Jw09tQdWNA9gRtDzHeaa
 LRoxJhvSk
X-Google-Smtp-Source: AGHT+IGsDFRE5gSyprnUomoOMf5aWH6JWroW/ufjBDQW0RWup6TtnTKk4Hnug8QbRbWQJdKTM3VjKw==
X-Received: by 2002:a17:907:724e:b0:a8d:2623:cd4c with SMTP id
 a640c23a62f3a-a9029663244mr591558266b.14.1726499533434; 
 Mon, 16 Sep 2024 08:12:13 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:57 +0200
Message-ID: <20240916151206.947484-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499534; x=1727104334;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pivG0RdpbTHlTzYT5lgWl9VMBUuP/yR0zQJub/Wqnmw=;
 b=bfF/0eCHsLwfIkBktpl3UmBXhxV2CqyhfJ7RSYzeboI2fem1zRr2HQgOAaRZrUDD+q
 9z2UYfhD4fy/wXEk6sORC41XMiFNzYtgKGVRcM8wOXLBLfyX2jp3SZttBULUPQNlIUAu
 tbDPU9tMThZP7SnNFYGyhEqwsm6N2GcADIHd0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bfF/0eCH
Subject: [Buildroot] [PATCH 04/13] package/policycoreutils: bump version to
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
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index ea45116912..661c1285e8 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  a76ac431ea40a35a83164ce9007909c1c6c12fd1056627f622144e4a705c0a2c  policycoreutils-3.6.tar.gz
+sha256  58fe4e481edfb4456c114925442e11389df17394925acdba3de211145ce5ea98  policycoreutils-3.7.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 714e2d7ad6..2b53c56e49 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.6
+POLICYCOREUTILS_VERSION = 3.7
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
