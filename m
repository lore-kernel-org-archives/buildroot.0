Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24217C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 06:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901E360594;
	Sun,  4 Aug 2024 06:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anmL0XpjZXAb; Sun,  4 Aug 2024 06:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852E0605EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852E0605EF;
	Sun,  4 Aug 2024 06:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E799B1BF5A6
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 06:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D565B80BDC
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 06:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjqcrbVPYKr6 for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 06:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B19180BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B19180BD0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B19180BD0
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 06:00:18 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso60511881fa.3
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 23:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722751216; x=1723356016;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kePmkN4TN52ub0aOBCQApkDnImdgMSqeZvzVZmxWQ04=;
 b=CXdhVS7QkEaj/FPq5KUw1JjQ+3ZqtgRFoNG0QV/6tMC+nqldDgrZ9lMImZEaYCVLSE
 h7v/njNLNYRWgruBHpf69li7m3bAy/Ak/9yL3zRGpiscxzzliLN8kVbI1CWM9cuk1Isy
 suXDYpEjNwrE4gb7C1eyzN2XVLWZNO3ub/YjGxqQPXKe6AutZIZl8ezVqoL7xMtcedNK
 mcu/7HLJKIfR75E21Gz+blAV6W4ad9+sZkCHe4apV85qT5D3m8jewRejYRuqnKUCC6HD
 0EvkZwXMFthjH6W4Dfgtdv+18t9ZPKbLKY6Q93tKt4U956HpdswIR+9p0AL/xAM9cVxu
 Q8Jg==
X-Gm-Message-State: AOJu0Yx+yudISNbtf2FqUjy3B6420dDzmAkSNaRiKVR1VtTw6cGORHdt
 A05UiRLqphqCRLzWoPThvRE/wp2hdKNs2dHOsbWLbwYkZi5p2IZJOBzVhg==
X-Google-Smtp-Source: AGHT+IGx7KInnkB+UzkQoVhTlygkARWKpoQ5eU+rlFnilBWaVQerOzaGCMqZX8ENCAbmQ1FOK+kHew==
X-Received: by 2002:a2e:8502:0:b0:2ef:2ee3:6e75 with SMTP id
 38308e7fff4ca-2f15aa8778emr60434091fa.17.1722751215652; 
 Sat, 03 Aug 2024 23:00:15 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e27371asm6600291fa.133.2024.08.03.23.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Aug 2024 23:00:14 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Aug 2024 08:00:03 +0200
Message-ID: <20240804060003.735172-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722751216; x=1723356016; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kePmkN4TN52ub0aOBCQApkDnImdgMSqeZvzVZmxWQ04=;
 b=LUAzWY5fF6vxdbrvHSNnHxftU/ycdmsqigEFEXIIT68yyGlW8Vnkm++hpNyqfxJtJ0
 qrQ+pByzRQSQEegeOGN78247Pv+qTlUyq9YV9TAEjygis9llDR4PUypBBMQoSg1ARFgI
 zEwSGPmmX2aVrPBOV1/ZG3ueYszYxrb4USdPoJnSsqNr0EtC6oAi1JhoVmV1M7mpx+zO
 Uojq7EI/jwSkDeD00zE2u3xd149NXjL+G3N79b2PV5OKxACwhu11lJwb8pu7RBNEUWlO
 rHQA4ZkPZHRQSmLH42tFbBUD+m0ql7PoNIz6U4TQMFsVDNeQXHR6j+Nj6TUSpT5PY4oi
 TKIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LUAzWY5f
Subject: [Buildroot] [PATCH 1/1] package/spdlog: add menuconfig option to
 use bundled fmt
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/spdlog/Config.in | 10 ++++++++++
 package/spdlog/spdlog.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
index 877c1b6ab7..170e17a4f1 100644
--- a/package/spdlog/Config.in
+++ b/package/spdlog/Config.in
@@ -9,6 +9,16 @@ config BR2_PACKAGE_SPDLOG
 
 	  https://github.com/gabime/spdlog
 
+if BR2_PACKAGE_SPDLOG
+
+config BR2_PACKAGE_SPDLOG_FMT_EXTERNAL
+	bool "Use external fmt library"
+	default y
+	help
+	  Use external or bundled fmt library, default external.
+
+endif
+
 comment "spdlog needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 6b24357697..c2832c94f3 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -13,8 +13,13 @@ SPDLOG_DEPENDENCIES = fmt
 SPDLOG_CONF_OPTS += \
 	-DSPDLOG_BUILD_TESTS=OFF \
 	-DSPDLOG_BUILD_EXAMPLE=OFF \
-	-DSPDLOG_BUILD_BENCH=OFF \
-	-DSPDLOG_FMT_EXTERNAL=ON
+	-DSPDLOG_BUILD_BENCH=OFF
+
+ifeq ($(BR2_PACKAGE_SPDLOG_FMT_EXTERNAL),y)
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=ON
+else
+SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=OFF
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
