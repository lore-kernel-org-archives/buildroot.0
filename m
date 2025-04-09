Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D7AC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87376617B3;
	Wed,  9 Apr 2025 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQ14sWaXnTjU; Wed,  9 Apr 2025 20:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD70E610DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD70E610DC;
	Wed,  9 Apr 2025 20:04:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31EE1220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D988C413A0
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jKal7-0mC4l9 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 308E641394
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 308E641394
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 308E641394
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so2323f8f.0
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229029; x=1744833829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F0V++Z3CZx6eWOxWHCsKALrjQJu0HPv2di2XNNxLyCE=;
 b=hx3qY7HQ0w4HsCVuftiCm1gXeDVUcKyhecRJxjhuzhkB45VJluE3wqup8XVa7hs2Oq
 W3tP4+Rxi5fUTCRXlsGrc19fmKm8WbYp9IuusWwA3cgclBaDLZx7CUju2VY71MmG2V7c
 gVrJNa8JM3SRLXBKGRCkCCDq5qHB5MTKTAvqTV1AW5Pog36xT57HuNzGo/EX8hZRMAUb
 BWUWKG42p8KDKXLIplNJHA4S0lWwcB2Lvwln6I1lhwafjIWd6tGe0jVdFiHPw2/fgwfa
 sfD0+WYIVfx/FvFF4ZgiOFWzZcJXDhOxOPInwP4yqLuygu2bWKbCmIq31WmsVN3t0qiN
 boXQ==
X-Gm-Message-State: AOJu0YzPAhamCWZ4o4l1md5MU++QfKw2B9cP8gvhrSiBNkySkzNrkJwX
 prRiif0OJWQvLr3iDNFcCH79vwqLso6z77cCv1JxHaQSI/GkzOO440Teww==
X-Gm-Gg: ASbGnctzeJV1Y5refmro88CYoPNr8zFD812ZFH2u2crOeE9o93LRioJnojtPms5yuSN
 zSNr0lU9+za7BMeU36w4ppg1xAOz0azxEimZzhWMp7+m9DGM+0/Bt1e+XSzp0ENm01oWqHMzlut
 g/wOCd0atvrFR17P0mc8wC8yAABCcCD8IoQ8zL7b50biknohIZ6sQv62U87t0wgrBFYjFn14LQl
 qdyk5KnrRKU/0gEQ+1aL1TVVtHx4FRlNrH2Lydz1PjoI5chS8rCcFhttUjnQJWOLepbvP0A4A3f
 mj7xbYaH0QcHNG8oev+D7NJpK8GHXXKq+wBloOU3KcWWflLir+c=
X-Google-Smtp-Source: AGHT+IE91z1bGCvkFl4SFndYFLFd1IlOwAIVQI2iPNOByb2v3SXIx7SAmWfr+w7wDX07/QU1cbnsJw==
X-Received: by 2002:a5d:5f53:0:b0:39c:30f7:ac88 with SMTP id
 ffacd0b85a97d-39d8f469f64mr70378f8f.20.1744229029123; 
 Wed, 09 Apr 2025 13:03:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:25 +0200
Message-ID: <79aa20e8eb97a3cc0bae35d44a1419a2378d0f8d.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229029; x=1744833829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0V++Z3CZx6eWOxWHCsKALrjQJu0HPv2di2XNNxLyCE=;
 b=Dx6whI0zfMrNBP7pxR5qC9QZ151Q6LF7UG4/gAj4848o4oh/ldwKc0pRWsHQLl1sCg
 NfpPnvzWbRpEjSV7wHEq7F8Sn07gzfcZDBhRTOtnx9+hoTYpWQHWqBUeGeoajFCakj3W
 +mKiNcKMb5tElcvk/W91+Ue4sFUd7jQ2Ocv3p49l7W3vl5rYRyELnYZ//nonLKDRd5dK
 0CMwtjBbR8RYkhcqV/DzhSd9ojyTfJptgxzagX4UJi1Gug3vst65UiFR4oxHBxRt4Lou
 HxXFbQ4qZwHJqKKu5p9WMg2r4S/7fLpQoKBzuK3J9lk50YAeksZzM7geMXF3OgPdhxl/
 DLFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Dx6whI0z
Subject: [Buildroot] [PATCH 10/29 v2] package/boost: prepare for a
 configurable host variant
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though we do not envision a host boost with nothing disabled
(i.e. with everything enabled), we still model the _WITHOUT_FLAGS
variable after the similar variable for the target variant.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 1dcc4a4b3a..6af76e1302 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -35,10 +35,13 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
+HOST_BOOST_FLAGS = \
+	--without-icu \
+	--with-toolset=gcc
+
 # keep host variant as minimal as possible
 # regex & system are needed by host-riscv-isa-sim
-HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),\
+HOST_BOOST_WITHOUT_FLAGS = \
 	atomic \
 	chrono \
 	container \
@@ -68,8 +71,10 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	timer \
 	type_erasure \
 	url \
-	wave\
-	)
+	wave
+
+HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED = $(subst $(space),$(comma),$(strip $(HOST_BOOST_WITHOUT_FLAGS)))
+HOST_BOOST_FLAGS += $(if $(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(HOST_BOOST_WITHOUT_FLAGS_COMMASEPARATED))
 
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
