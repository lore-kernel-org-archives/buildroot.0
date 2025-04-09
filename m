Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E72FC369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F04B61AD0;
	Wed,  9 Apr 2025 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qlul1atTa48p; Wed,  9 Apr 2025 20:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5789F617BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5789F617BA;
	Wed,  9 Apr 2025 20:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 104A4201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B66361102
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9BrZb9MybJ8 for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADDE961778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDE961778
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADDE961778
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso1189445e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229032; x=1744833832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wqJrPSzY44nByywc7slvD3ypUw70LOE+RQlJT45aVAc=;
 b=k2ybtfSCKZYPVk7XjxnG9POTCaVXiDuQtlTnFi9OZN2XjY8wS5bAPsBn8TpzQCpGKe
 Oa0bEl8fwXQYuzwoMnW2A6RGDZEzyMpUhXf0W9fKd4tW/DDHyUCHRS40vdtLo+Rh8+is
 0+N+6pEeFYhemcXbJWYJQm73H7pqPJNLD2NoZw76NrPLZhzhDsKdTzYDW/ojfjmB0VYl
 LbxprqgsQXea0vDwCkDU1O8qoK16ylGEYl3r47g9/6c8ozB3K7HeokA4cABc5ABBdfhV
 Vq2NDZWRgKgQgFunyMhed7+8MIs43OduElh9xpNmesDRPTzR+X/Wne/CzkT3j8QlHt1k
 Y3nA==
X-Gm-Message-State: AOJu0Yxz5XG6Ll5N4bVnOem84oVOlkmemDXxvWwoEJ+RcNsvk8DpxYLq
 pAipUSD4nXEWvpI/S16oYOk22KQVki2N548DEhZVSiYNoHS0P73InH6xiQ==
X-Gm-Gg: ASbGncvvC7KgwIgZ4WgRRW5ZGrhpw54zrW4fPwUst90wgywAMZuvhk+5DoeZgpXHem+
 VQVz41T0lEfizieXUvVAj1Z+wfiHC2nCWeTwF+48U+wUTC6RfP1ePe0y8m2QH54i20mOuGAK2gn
 x9POCAsD3RQcfgpmult8IZP5cjyG/Jj6kqBYO9chqLV/xnSlvdQ9rCtmaQDHvfUxF/Za+gyCUbN
 KLMj/SLpVlSzqy5YFJfAN0P5R8gTh8+4unSrUKoNEjIrB8QDqQk/SeCzsSwG/R0mhhYXxRYTIGZ
 aMHp/nwUdvzVva79bVj7unHIfWPYuXGK2OkPptnUjyXS5f4Y1tA=
X-Google-Smtp-Source: AGHT+IGdS3FETDIQM/S/eaFIAz2nvFeXerT10/NUEIj4TQYsHRlIWCb1gSu+96jJf6m+NW8mGSJ+cw==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f64c:44a4 with SMTP id
 5b1f17b1804b1-43f2d7b4ed6mr2169845e9.8.1744229031339; 
 Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:51 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:30 +0200
Message-ID: <a6060ec2ba803f5fb25cf4faf98b1e865fae03e8.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229032; x=1744833832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqJrPSzY44nByywc7slvD3ypUw70LOE+RQlJT45aVAc=;
 b=PrvJJneNWr3SUX9K0WhdAC4uglqFmandiBGxxR5BJRngJ2FkWbZ24em2HW7rK6nIkP
 IH7NQ6t/hv18/ymcNwoXb4b73fVozwlVeg0NupCIyEIg/X3WGd1lQ4llV2TLu6/MvcjS
 N/PRC8rZTXGw3vCpRPeNa+CFPEVFtB2HUiKj5cS/2Q0zKZRdKH0PlZBbEwJEprYoqPsw
 JuyxjtNdZqNUC4XPyXSZxuebn8DK3L9Aao8X1r/M0NnZg1mUzKqzgIM75YrO7XH2gdBb
 s2aV1bv8n6fARdboREhZnC3959kiCdh24MeVdCJsYKfsg8oYeSn/9Z7FWBd0ycsoWpJh
 BBPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PrvJJneN
Subject: [Buildroot] [PATCH 15/29 v2] pakcage/boost: make host variant
 slightly configurable
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

regex and system are currently not disabled, on the off-chance that
host-riscv-isa-sim is needed. But when it is not, this uselessly builds
regex and system...

Add options for those, and select them from host-riscv-isa-sim.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in.host         | 10 ++++++++++
 package/boost/boost.mk               |  6 ++++--
 package/riscv-isa-sim/Config.in.host |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
index 5ffcbe6932..d377a8fbd8 100644
--- a/package/boost/Config.in.host
+++ b/package/boost/Config.in.host
@@ -1,2 +1,12 @@
 config BR2_PACKAGE_HOST_BOOST
 	bool
+
+if BR2_PACKAGE_HOST_BOOST
+
+config BR2_PACKAGE_HOST_BOOST_REGEX
+	bool
+
+config BR2_PACKAGE_HOST_BOOST_SYSTEM
+	bool
+
+endif
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6af76e1302..95191476a8 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -39,8 +39,8 @@ HOST_BOOST_FLAGS = \
 	--without-icu \
 	--with-toolset=gcc
 
-# keep host variant as minimal as possible
-# regex & system are needed by host-riscv-isa-sim
+# keep host variant as minimal as possible, only add options when
+# an actual host package needs it.
 HOST_BOOST_WITHOUT_FLAGS = \
 	atomic \
 	chrono \
@@ -64,8 +64,10 @@ HOST_BOOST_WITHOUT_FLAGS = \
 	program_options \
 	python \
 	random \
+	$(if $(BR2_PACKAGE_HOST_BOOST_REGEX),,regex) \
 	serialization \
 	stacktrace \
+	$(if $(BR2_PACKAGE_HOST_BOOST_SYSTEM),,system) \
 	test \
 	thread \
 	timer \
diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index eb28d5b063..60dc6823d8 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -2,6 +2,8 @@ config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_HOST_BOOST
+	select BR2_PACKAGE_HOST_BOOST_REGEX
+	select BR2_PACKAGE_HOST_BOOST_SYSTEM
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
