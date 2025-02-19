Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CAFC021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB064F39F;
	Wed, 19 Feb 2025 08:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id miyoNEloM2kR; Wed, 19 Feb 2025 08:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E01E4F390
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E01E4F390;
	Wed, 19 Feb 2025 08:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B0C1968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD4F48128E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9X9k0wEE8xHc for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B60E81263
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B60E81263
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B60E81263
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f22fe8762so3232624f8f.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955048; x=1740559848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FYz4q+z+z9CYaBBMh4ELDlCBRHxW0CuSBSTtXEdWbe8=;
 b=DDlSUtirQzDZu3/+h5nsP8plOMg/qrvLpC+ozzkEm46KPpb+gom8IVCzprl4PTmuCw
 1E9wnxUsD03qgoXvn9M2Fdv/YmS6c4eJIStsLPiY2V1P9AYAOYT6tA0ZWckNzTIdeqfp
 zI9wtKiV4k06nCwv+AFpdY/rOFBbyP1R2btl+Bq4cusvX+Xl6DekAcLAhISSXuiY3mV+
 s6S0WsS6zdbrZIBewC0z1bXb5QBDE5M0NItpZGK4R1QLz9+5EZOAhk6o/0hXjLRGPfUa
 GIVKjuMJKgEFvPS1VIbdzteuykBuH/HKNAnWJuU6lsKDzoisx6ZN+6yQoDzWHuRXHa4o
 JvCA==
X-Gm-Message-State: AOJu0Yw/r37EZwE9NyxrCQlbsI/ySIcimKFgzUnDUy5k0CQZZvnVMCi5
 J0rwqQTkm31UAaZ9fTYk17UhT+gugQxh1nJvh+0q+Usi51CeZr5lusu6+A==
X-Gm-Gg: ASbGncu70+VQELzxNdSjb5I7VqiU45Bk0Q4DjQTadha1EYgq0kZMfR10sMmXlMJus+O
 SQMvtpSTGCJB/6JN9LJakvqQZqeEBiHYnI8R7j5bTeLRz7Jl8hAVne4p2X/7ziyZIl7k855+AwT
 52PwLHWFGd8ZJd+hw8/pRgPKnm08dhyBURzRt96O47pA3bnc6y3RPTbejaHy+NqUb65qCghufDH
 ajUSOrsMxZ2KxyIDRoZ3slV7gzYo5mTJaGWhybQAQDWkeaiT/5/e6Nz8wCKUhUtB1Aup8YlT0M3
 QamHsGR3QnMUE5/umECpxwJFsg==
X-Google-Smtp-Source: AGHT+IF5ArI7P0uZxoosMtVYkk3IjSzp3mxzgpOm4pWknjJSPO4IbSI6YOghOInfxVR8uBOfl0iUXQ==
X-Received: by 2002:a05:6000:1862:b0:38f:4c8a:d5ea with SMTP id
 ffacd0b85a97d-38f4c8ad67cmr7505718f8f.22.1739955048085; 
 Wed, 19 Feb 2025 00:50:48 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:23 +0100
Message-ID: <47a5ecbda64d00db8d9abb259113988875933aa7.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955048; x=1740559848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FYz4q+z+z9CYaBBMh4ELDlCBRHxW0CuSBSTtXEdWbe8=;
 b=FI3mM0W4cZWYouPzUrZOjSalEhnFy+JcL2wS0sxpe3mjd344LXe8JXKt2JTHBs71g+
 eMKl4Vd7SoeDIWQFODfGiT5KuDPPo5QXuorFwJWoE2DTIDYLKQI+3lNNXilvLoADvJFb
 OCb+C9geKhzXJFUAGYKrdiiokWj/spsoof1XDGOTXUUt5VoWEqW4UaEbYxR/6d/Ulfe2
 WPxERNBIGxQsVAKGdhcKCz9ylW6JyaR5stIeVUgOEGIT6RvR6JXrq48Y5FfoC9cfPicr
 LOPo8+OLhrmLieY/fpjKHqaE66hEX/feqdPdyxR3bnGHflceHSVuuAY9DLOrp1sFH9i3
 p+og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FI3mM0W4
Subject: [Buildroot] [PATCH 08/27] package/boost: move host variables closer
 together
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
