Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056ADC369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B27413A1;
	Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjRsCwTNjdFp; Wed,  9 Apr 2025 20:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEB56413CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEB56413CD;
	Wed,  9 Apr 2025 20:04:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF07201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44FB960EAA
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_DVprkuqOpg for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F37D60B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F37D60B7C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F37D60B7C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so712385e9.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229028; x=1744833828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FYz4q+z+z9CYaBBMh4ELDlCBRHxW0CuSBSTtXEdWbe8=;
 b=U4gFxzRigiNfDjX6v6t9of73Qv1jVxe+p1rv/LUvvmbY81yjYZn7//XK7X4zZbe+Lu
 llscYsikV0uDiR8Ek2ooHYvdNDwVmkdVS1TC4truSRk5jMuwy7woeB1bYTiD+jlgvTxh
 goewNTTVSF5l9P1OYjuB+PD91rIVbjM8j3bYnxMaEWSx53Qr+tpkHnTGEh0AFYxoya4G
 ZDBVaBupCNYQhkjKJ4uI/jvm2LE1KZ6oigDbzdbYH/6p9bHIme646oiYZYC0thrPiNlj
 FUJ0ptzFlqk1Y1WKtefNjI/xlKFtOHNiaEDElH/wY10VwoCsLYsgGkvh+s+KzCqAYK3G
 i5/w==
X-Gm-Message-State: AOJu0Yz3sa/dPtGNEbaxw2N7e4wUbkG7NU6NiZSIvZrGlHsaHKv5AYFA
 aHcc5/U+iTskrQXrWnavbdP2awM3De1ccgz2/TZS/CaMzDwzZtipeSFddA==
X-Gm-Gg: ASbGnctZzoF2tv1zySLFj9x51px/pii033Hfv3dsBbD7hYYI/9rRZth0aSX2reuX5AQ
 HvOeHno2Khp27CHZ8IxAF1upaBwu2EqCpUGrKO6twP+Dfzze4jGz1Yq6xCKiZNGTCJBoVj/WF+E
 6a/8ihuUWKJjJc/kPLMDS4F0szUH7GpYfp4bMEuZR5SCHiVUKwSI3QfiKbOxTsF6oELXvMIjk+4
 cy/HtdgDKaxA/CAjGwxBz3Kf3Siz1Gbwrq+8nX4ar9qkkUN2xmgZu1OLbse4XY4KxSazyHqZ7Hb
 kyDqcwuFWOkzOss3DsFdvC/B+mzQb5OsTWKZ1kQXbTNmmKKr8jcyTJ4pgqGsKQ==
X-Google-Smtp-Source: AGHT+IHhQ+ixDdh5nUEqjVh5MQVgH0fl9tYzOSZotrZOQZQ3b03S5fzb5VuC+ZBZdMNCBAgdWvDvxA==
X-Received: by 2002:a05:600c:1e0e:b0:439:8490:d1e5 with SMTP id
 5b1f17b1804b1-43f2ea2a1a9mr759075e9.4.1744229028237; 
 Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:23 +0200
Message-ID: <74ac3e89c91062ce3cba6da676623c69fb2eab0e.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229028; x=1744833828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYz4q+z+z9CYaBBMh4ELDlCBRHxW0CuSBSTtXEdWbe8=;
 b=QgYOx07eu1K0VhEmjry/XF9vIozW22c/Djj9z7I8rOwwWX1we5TtnQTE/LAGu/zqnx
 IwxLYJNehJz4Rr2p1nAq/4W4/4hp/lzL7krRk6PDd78f5F4OqoNK4mHZA7OXt/rCZlMf
 Ts5q0OovT9SDdCteMYY/k3LDBtEo6k1cIJDXUeg5yMFmUcam0Hp7K/a46soSqQTXXgJU
 tfeYCalBgxEz/SV1TZk0L7qC1QKCmOjxtf6BN/03DJP41686GLVHzqRvJWo29BBlorjF
 12snUZWxSGxC3iJEd5fjaZT1zpQ+vRWR026NkUOflXmO2v7el8teSLjKKe65JruMoAzS
 Qnxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QgYOx07e
Subject: [Buildroot] [PATCH 08/29 v2] package/boost: move host variables
 closer together
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

Also, one item per line (chrono, container) in the list of libraries.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk | 71 +++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index c0d17f7670..044dd275b3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -12,41 +12,6 @@ BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
 BOOST_CPE_ID_VENDOR = boost
 
-# keep host variant as minimal as possible
-# regex & system are needed by host-riscv-isa-sim
-HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
-	--without-libraries=$(subst $(space),$(comma),\
-	atomic \
-	chrono container \
-	context \
-	contract \
-	coroutine \
-	date_time \
-	exception \
-	fiber \
-	filesystem \
-	graph \
-	graph_parallel \
-	iostreams \
-	json \
-	locale \
-	log \
-	math \
-	mpi \
-	nowide \
-	program_options \
-	python \
-	random \
-	serialization \
-	stacktrace \
-	test \
-	thread \
-	timer \
-	type_erasure \
-	url \
-	wave\
-	)
-
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
@@ -103,6 +68,42 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
 BOOST_DEPENDENCIES += python3
 endif
 
+# keep host variant as minimal as possible
+# regex & system are needed by host-riscv-isa-sim
+HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
+	--without-libraries=$(subst $(space),$(comma),\
+	atomic \
+	chrono \
+	container \
+	context \
+	contract \
+	coroutine \
+	date_time \
+	exception \
+	fiber \
+	filesystem \
+	graph \
+	graph_parallel \
+	iostreams \
+	json \
+	locale \
+	log \
+	math \
+	mpi \
+	nowide \
+	program_options \
+	python \
+	random \
+	serialization \
+	stacktrace \
+	test \
+	thread \
+	timer \
+	type_erasure \
+	url \
+	wave\
+	)
+
 HOST_BOOST_OPTS += toolset=gcc threading=multi \
 	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
 	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
