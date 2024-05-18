Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B327FC25B74
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 09:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF7C60865;
	Sat, 18 May 2024 09:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x1ZQCj78CV0; Sat, 18 May 2024 09:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64ABD6086A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64ABD6086A;
	Sat, 18 May 2024 09:40:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF01A1BF842
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 09:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB50D40313
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 09:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je7d08cBdZBO for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 09:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EC8640301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC8640301
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC8640301
 for <buildroot@buildroot.org>; Sat, 18 May 2024 09:40:13 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so5710778a12.3
 for <buildroot@buildroot.org>; Sat, 18 May 2024 02:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716025211; x=1716630011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6wvydTvGDOqb+PzWb1dseK0cO4YUQxFAvwyWX0nEZsM=;
 b=wwqCJT/N50/04fZShj6Jg6TNpAaGMvtzAB7HIcKy2SFcTiReTgEHpS128l8D+Rtcju
 SxMLuwptzsNR7VSal+jDN2SwnalPmGYf779HbkCVheiu8CsH4XtVCrHm6E1a+xqpUXdv
 s+BERUdt6Qnpd6zWpeHcxVbemLcYZj9iDSkfWkxF7MPoMzSUcL41l7/eOMvjJoZUcHmz
 z2qPGe3eW8EFGNFcjDdh+11WFW9tT2g0+p3xkHRcGTp/xzAcvddK0W/zFjgHnrqThnr9
 O2faPTveiA1YhlhZYK1B9E8po/gT98UKRjcaTHn2VtPS02qHU7/NRk5nZ2KfcMAnK37n
 u3kQ==
X-Gm-Message-State: AOJu0YxCcxTa7f3paqFSs7M4fcWXbEZSkhTobDPWQuXaN4753D5SdnSx
 fwFmm6NaYAvA8sFVVzQ6ef/Y988AZApdPhvLycB65AvUU/WK0A4kgP1DqPBSHLSlaXf7gkW4EQu
 Zn24=
X-Google-Smtp-Source: AGHT+IEzNvz6vqHRq21iElsC1FniiW/IcqcTLdqRZfGksKKJu50eNer2Y5ISJoiHDCOtimBN/b8Bog==
X-Received: by 2002:a50:ab59:0:b0:572:a711:3daf with SMTP id
 4fb4d7f45d1cf-5734d7047damr14451428a12.40.1716025211119; 
 Sat, 18 May 2024 02:40:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb73esm12850718a12.31.2024.05.18.02.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 02:40:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 11:40:06 +0200
Message-ID: <20240518094006.1134068-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716025211; x=1716630011;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6wvydTvGDOqb+PzWb1dseK0cO4YUQxFAvwyWX0nEZsM=;
 b=cBQBcGxw8UtjBfhYD+pAYE3Z7BsU2+NOGGIrb57v7HwXTvhT7VrJBkQim3xyeFgQPO
 CFI4Amxe8a7tUF6xN9aqhgkfKQkJHZjqcoGElWXS+ZVQNcHVzoCQh0JlBxnIg0xYb4u/
 F4/5cB4jro7mvSdLrA3E8ZnUKR0+Ws3GJ77RQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cBQBcGxw
Subject: [Buildroot] [PATCH v2] package/zxing-cpp: add options for enabling
 readers and/or writers
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch allows you to choose whether to build encoding (BUILD_WRITERS),
decoding (BUILD_READERS) or both. At least one of the two options must
be enabled. This way, it's possible to keep the library size at minimum.
By default, to ensure backward compatibility, both are compiled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
- Drop BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS selection

 package/zxing-cpp/Config.in    | 17 +++++++++++++++++
 package/zxing-cpp/zxing-cpp.mk | 14 ++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index b72a00ec35f9..511c21e7360a 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -17,3 +17,20 @@ config BR2_PACKAGE_ZXING_CPP
 	  compiles the C++ port.
 
 	  https://github.com/zxing-cpp/zxing-cpp
+
+if BR2_PACKAGE_ZXING_CPP
+comment "At least one of readers/writers must be enabled"
+
+config BR2_PACKAGE_ZXING_CPP_READERS
+	bool "readers support"
+	default y
+	help
+	  Build with readers (decoders) support
+
+config BR2_PACKAGE_ZXING_CPP_WRITERS
+	bool "writers support"
+	default y
+	help
+	  Build with writers (encoders) support
+
+endif # BR2_PACKAGE_ZXING_CPP
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 86a1ef96806d..077d7e75d3dd 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -12,8 +12,6 @@ ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
 ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
-	-DBUILD_READERS=ON \
-	-DBUILD_WRITERS=ON \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_DEPENDENCIES=LOCAL
@@ -28,4 +26,16 @@ else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZXING_CPP_WRITERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_WRITERS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
