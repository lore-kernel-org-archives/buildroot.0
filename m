Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A067EFCBD4
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 08:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130C082E4C;
	Mon, 16 Mar 2026 08:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_RbFwOoJgw8; Mon, 16 Mar 2026 08:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3C982E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773649530;
	bh=Qj90HzGBmGeKTf9dQJddzgsDj3W6/hbH6SjRRAGFoN4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dE01VLJo2+kYZ15oBBlef2ZW+xYWeOynUmMceYFpBnqXN8JRvyX+eCv+DQHq3vUYV
	 I9VffxLLB9rYAgzybmBQ4/Lvn664NSApdMfdOMguvULU0dkurAH8ZhlzJ4PlIJQA96
	 JOIWiBuyn/172s8/AykSUhfcFXNz6I1cgmJKPmocEuVMPadbqXZBaHN2/bqFpWPs4b
	 /OaIkzE5vG76Eb9DAVH2PCbMo9KvSbm7LY4BkZ077xWeg5vGsGK6LqhF7EYXtPu0dz
	 N7uQqhm7wtaYsPeWT77cF9MyY1uolQwvsQQ4QObBwrjsqpwFtOL/unENPF2YdyhO8D
	 pXR+Ee7gbstlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3C982E95;
	Mon, 16 Mar 2026 08:25:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A2F81B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BB9460F29
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HdWHBUXtc0G for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 08:25:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1271160F1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1271160F1E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1271160F1E
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 08:25:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439b78b638eso4499495f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 01:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773649526; x=1774254326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AL/kvKO0tWzzOZkJ/sVdtc0ptzIH+60LxKRtCkOMCA=;
 b=VkPuga21ATmquKojEwMIWayhof/V9hiOdZGDuIi1z+FKRQLi6R46Vb/gxwvd9anW9d
 uWxkGgNtvF2hXl2NVCqvRWR5DOrn1US6v6jcxZpsgXPUyAhsPSzLfjmretCk8/BFURAt
 ZCBBDNy7gR/tJtewLNU7x3VI2Leq2DMzSkn3isOQFTfUsLb5VNOSHO5KXjJCRdVBzxdt
 eGtif6tBIy58bBWg3sJr25YsJFLQQINrgYAtDwa7rhxq62C1SprxtQrFzctrfoVnYMIE
 lxpvlM4f9V16NScjMmiX4LoVdfOhdmCkgjb15JyXvnN/dcVuzeDBh81F+djdxbs0cYrQ
 HrCQ==
X-Gm-Message-State: AOJu0Ywh2KfRkXTDCUIIg1oBW3qF6RPJzsbEqqSbFpcjYkqqdGSn2PGN
 IMVpCdPQp/EIbpuWAhPDe98hRxhIVgO/CtcnbYypCN7A/yZihVK9h+dSMusPIYztr9qpkvCd6xU
 CCw/W
X-Gm-Gg: ATEYQzxLI/cRI2g/kr0DcUW6HO6ofO64gPZPQ4f96k/bVkbfu/9Rtl+AwEDWbaBfJ4x
 fj0vXMg/HGJdGLOGrkR8Zys96N648Ys8JCykgJiSE3vnU7wpbeJxDh+5lOSd2RnOgvWfmJyM2ia
 aXUcI65NKypoU3qaSt6XH9fskEezzH/UDoP8ns/U8a4nDVYN/hrbWIUTe2W3x7eXOfS+neqiEKL
 BBQCpnD7p6Rrnhb+83NXqgpN+zzynJCFk1zGHQlWd+ujMvpFpUwsvfdHSfxBAtcfc+VG9cZE7Ce
 bDQrMyjany/+8hAgoIuAIjDdyRMZXDz7MLbCbYN433pCcFkTFtgPgxkmof86U7Xppbmq3HhXkfj
 fbpz9iLSCHTJaPGgDp2pnzy4G/yNM/Vi6iJfnXDtZQwnr2gevJxxRkuDJM9rOqoue2D09+1XBTh
 v2cWJHIzhjQz6XICQX1WfXmxmQ9v8UbQevTbMsHneex0d+4bKMx6/z+RIzsbZ96kRphXZrk82tI
 har9FRmsRefosibxwtvWQ==
X-Received: by 2002:a05:6000:26d2:b0:439:cb3d:e42c with SMTP id
 ffacd0b85a97d-43a04d7a113mr22009034f8f.8.1773649525768; 
 Mon, 16 Mar 2026 01:25:25 -0700 (PDT)
Received: from FRSMI25-BOLET..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe1a72cdsm43151174f8f.9.2026.03.16.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 01:25:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>, El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Mon, 16 Mar 2026 09:24:50 +0100
Message-ID: <20260316082455.1392636-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773649526; x=1774254326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6AL/kvKO0tWzzOZkJ/sVdtc0ptzIH+60LxKRtCkOMCA=;
 b=sZzglnMGoIKfpyozq8GjR8E5eU3c44mGGwVGvvu/tbSH2/DmX4dMnopPG74swHA0zA
 ilwRdJRYgjrWXENwlEvR4mp4zmQKuZhhUIJE9PX4N2Um8rCPSNXBMMsnSlCI2XTJKkJm
 wqnBFC/wm0ZByIFwkfIbnE+4pDkOFvd3qRMnQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=sZzglnMG
Subject: [Buildroot] [PATCH v3 1/6] package/rust-bin: add
 HOST_RUST_BIN_STD_TARBALLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add HOST_RUST_BIN_STD_TARBALLS to separate tarballs and be able to add
other tarballs to extra-downloads.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
If I understood well, Thomas suggested using HOST_RUST_BIN_STD_TARBALLS = instead of +=,
In this case we kept += as a precaution because the assignment is inside a
conditional block. Using += ensures that we are appending to the variable rather
than risk overwriting it.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/rust-bin/rust-bin.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 215bd84ad3..37df1db566 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -16,14 +16,15 @@ HOST_RUST_BIN_PROVIDES = host-rustc
 HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
+HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
 endif
 
+HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL)
 HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
 
 define HOST_RUST_BIN_LIBSTD_EXTRACT
 	mkdir -p $(@D)/std
-	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
+	$(foreach f,$(HOST_RUST_BIN_STD_TARBALLS), \
 		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
 			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
 	)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
