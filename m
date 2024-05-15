Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927EDC25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 16:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54BE6812C4;
	Wed, 15 May 2024 16:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6MDgaTvyzvk; Wed, 15 May 2024 16:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46AEC812D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46AEC812D5;
	Wed, 15 May 2024 16:49:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 785541BF396
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65CAB60755
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 16:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-I4UiKVqwk8 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 16:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 516E86071B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 516E86071B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 516E86071B
 for <buildroot@buildroot.org>; Wed, 15 May 2024 16:49:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3504ad82a64so1687276f8f.3
 for <buildroot@buildroot.org>; Wed, 15 May 2024 09:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715791756; x=1716396556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hHIq+LarMzhsnWKkR+ZPJLRjuidOVAsiiUr4ngwP/x8=;
 b=fgA9q2AjFMAWJcDN6V2y2e0GiMFJuL7Rws3oejc8va7ZZ8SEtH9xeB65JdIM7G08Op
 haahkkYN6wX4AWB2hMKGDXSgrFVCtiy2oGFbqkPhbWPca3MeWHdW26VeWDXPWDRbAZ/h
 lroq9o96Hnw0gSxsQvO+h4yaA54DgU0TIure/H3wV5hxnaFD9exn5H+y4n2SE+xMT2e7
 EmKTDJsqeGj/KuTV8ahSzTVc+zgWxLt4uKLFitEtRmjEcAmnpjYe/mpbtzl3wsCwaQB8
 fwyrBtbcYQTfmp5RWwbNCb0pA2qKsQX/GOnIhppGeijj88aPispHt00dS8H7tD6UXIpj
 sudQ==
X-Gm-Message-State: AOJu0Yw4PCN49MLfbvwl5F9A6SpkbWV5C4fXBTaHxRAUZwx4xAWJcUs6
 AlPwgsSwlEfDhiaLXpB6BQuDYd3pCFNQ7VsLkIVvBmHP9huVxmG6QWwiAuBIgKprtZ6yrI9SBTQ
 0e9E=
X-Google-Smtp-Source: AGHT+IFXNUz4kwqsSKMzC+Df+zv0xkXTEjSXx6vt8Vilt/vEZSQ0I3GWw8tJL/BR6Y6/rwAetrzPaw==
X-Received: by 2002:adf:ebc3:0:b0:346:4d41:8d5a with SMTP id
 ffacd0b85a97d-3504a954e3emr9916844f8f.56.1715791755933; 
 Wed, 15 May 2024 09:49:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:b365:f79:d950:c9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc99sm16838779f8f.11.2024.05.15.09.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 09:49:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 18:49:12 +0200
Message-ID: <20240515164912.104672-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715791756; x=1716396556;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hHIq+LarMzhsnWKkR+ZPJLRjuidOVAsiiUr4ngwP/x8=;
 b=EPiXk8MizkDZALY2jIKgiaiZcJdeLR7fwNbobxHTkzVIrGHAJHIiVEJ+D/q1pPM8A1
 QxXJwndWxRVMwsT3TVirON2/ZFcPZNDTRDPNkj9zmXASXaE67wITS6e8yWqAIc3ckCkd
 6PyxdVoZx++N0egRHqzEi5h2QOasGUO2TuyFc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EPiXk8Mi
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: add options for enabling
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch allows you to choose whether to build encoding (BUILD_WRITERS),
decoding (BUILD_READERS) or both. This way, it's possible to keep the
library size at minimum. By default, to ensure backward compatibility,
both are compiled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/zxing-cpp/Config.in    | 27 +++++++++++++++++++++++++++
 package/zxing-cpp/zxing-cpp.mk | 14 ++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index b72a00ec35f9..f5883045fb1a 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -17,3 +17,30 @@ config BR2_PACKAGE_ZXING_CPP
 	  compiles the C++ port.
 
 	  https://github.com/zxing-cpp/zxing-cpp
+
+if BR2_PACKAGE_ZXING_CPP
+
+choice
+	prompt "readers/writers support"
+	default BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS
+	help
+	  Select what you want to enable and then compile
+
+config BR2_PACKAGE_ZXING_CPP_READERS
+	bool "readers only"
+	help
+	  Build with only readers (decoders) support
+
+config BR2_PACKAGE_ZXING_CPP_WRITERS
+	bool "writers only"
+	help
+	  Build with only writers (encoders) support
+
+config BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS
+	bool "readers and writers"
+	help
+	  Build with readers and writers support
+
+endchoice
+
+endif # BR2_PACKAGE_ZXING_CPP
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 86a1ef96806d..c37769ea5d6b 100644
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
 
+ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS)$(BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS),y)
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_READERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZXING_CPP_WRITERS)$(BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS),y)
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
