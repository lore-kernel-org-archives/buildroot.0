Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E764BCA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 13:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D8640945;
	Wed, 10 Sep 2025 13:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5yLTkxu7o1U; Wed, 10 Sep 2025 13:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35794099B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35794099B;
	Wed, 10 Sep 2025 13:48:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5794110E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DF9840945
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYdDqAbQOB4N for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 13:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 362A2409BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362A2409BB
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 362A2409BB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 13:48:36 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b043a33b060so1067192266b.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 06:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757512115; x=1758116915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9L+D/WVzKEhIeo5/OZreRRnyMXiplww9s44C9MP0G8=;
 b=ZtXhEZCTU88/AD39iSFIXWvPGYbLyDmd6NIwZr6m+ajK0E26eQgXXjfibVQb7u57kv
 ZK1kL79UmEn5CHvh270v19RDi1I37KYltIWDRD8+Tgi//qZt8JlEuV7DjPoRNfYQOt/7
 5dKdVNr9gJS0e8mS7IBWIZi95kl5qSP0oUJPokDlXegfq93XymRIhD05nEyCPcvxxSh8
 j3Zk3hUZQvMqzaoqskwdAhN7eyT7Y0rJhlzDgNd6H8ZjU+6j9eZ2xl7AVXpP/yvCVVHh
 yliCEJLNe5zlPpfuz8NjHNx/WeIphcneMdbIIUtK9tZZoM/JpuOn6CKKR5Ff5QLIIsv/
 FixA==
X-Gm-Message-State: AOJu0YypnWO/sHXu0LEvVJbcUkTAzt6qczYM26r6xroPuW8hy9sHeiyf
 Zvn4LhBsjtaCxQMy8evYefRGoxPsnBvj59J/6yw1Ox1s7czsVQ0Wsn6trcJOKqIekIlXFKCbDUm
 a/wI6
X-Gm-Gg: ASbGncs+/1/v/DguvaKlofMXmMET6JIgDNp11qiR7ZH1vpCor0SDgKcBhNwSWer5la0
 qc8QUmpMTi9fFcx5oURof+Xqsvn6lzz5DM8hpM0qeouwJ/jOOgNL9FoTUOI96DjXLQ1Z8R+0mss
 tt+JZ7R9IljQ18YPopw86KqBnO6CRvptnzZZZgbb7JsJHGq49EmcAjDpfgu8TIM0FP4VPGQYcee
 0uL7PMMO/HVpKM7x2jLJjp4qIVVJeD64eO2GrvFrPy9CRTiO7fQyryrpT32cWnyp03o0yOZstQK
 cXgQSscNlZCIZd5/Nl7QFuYcs4uV/bFgL0AfilkxgHRhrspJJptHS75WZXW2ZnRwxVeWHm0ooCn
 11zY4snhgoBPh4QMma9GExU2vU5YGJ2OWAaP6YQkLQjU7/9iLrs26A54JNjbT/NjAj1HQqTSA5Q
 R+A4jeG7WEVqCCZL2l7PQGKQ==
X-Google-Smtp-Source: AGHT+IFpaKiRF2NHZ8H47znwNBaScwcf+UvfMRmdnsaw3IvXNWZqkEu5hiqbUcmO9rcR/SGTjR+6/A==
X-Received: by 2002:a17:907:9810:b0:b04:a1ec:d073 with SMTP id
 a640c23a62f3a-b04b1437db2mr1512443266b.18.1757512114695; 
 Wed, 10 Sep 2025 06:48:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.199])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07833ffa54sm167537066b.90.2025.09.10.06.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 06:48:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 10 Sep 2025 15:48:22 +0200
Message-ID: <20250910134822.2908515-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1757512115; x=1758116915;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9L+D/WVzKEhIeo5/OZreRRnyMXiplww9s44C9MP0G8=;
 b=qpl4f3Ny4KOeB/Hg9Y+rEL8vz5hkUEqRNUcduuYp8G02AWUDHQkGtKBgoXyqzaThOJ
 JXHfdud5wDd4a8Vx3nzi13alREOmtL+VUjYInrojlq10Dy6jVp+AeU7lUBYyFDoQusM9
 s8pcLCBUgZKMMmAUTpdI9UjosIeYuZ4FaEMzM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=qpl4f3Ny
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: add support for extra
 configure options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the same approach already used for qt5base, add a single
config entry to pass arbitrary qt6base options, which are appended
to the ones generated by Buildroot. This allows to reduce the qt6base
binary size without requiring every qt6base option to be mapped to
Buildroot.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 11 +++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7f3948ec27c6..6b48fd31facb 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -43,6 +43,17 @@ config BR2_PACKAGE_QT6BASE_GUI
 
 if BR2_PACKAGE_QT6BASE_GUI
 
+config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
+	string "Custom configuration options"
+	help
+	  Define custom qt6 configuration options which can be used to
+	  enable or disable options not managed by buildroot. These
+	  options are appended to the ones generated by buildroot and
+	  passed to qt6base during configuration.
+
+	  E.g. to disable mimetype handling, add the option
+	  -DQT_FEATURE_mimetype=OFF.
+
 config BR2_PACKAGE_QT6BASE_VULKAN
 	bool "Vulkan support"
 	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 51a4f1b5be7f..473fa7291ff0 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -426,6 +426,9 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
+# Must be last so can override all options set by Buildroot
+QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
+
 define QT6BASE_RM_USR_MKSPECS
 	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
