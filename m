Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EB6C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF25441DE7;
	Fri, 17 Jan 2025 10:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJej_mJgZHjF; Fri, 17 Jan 2025 10:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17A4423CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17A4423CC;
	Fri, 17 Jan 2025 10:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EB5B94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 668FA8174A
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pvDEpvdD8Aj for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:50:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83B508148A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B508148A
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83B508148A
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:50:22 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2267390e87.3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737111020; x=1737715820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqKHfhi9oVtyTwyCmCIX+8vY7dGQS+/RHD3juiLvd1Q=;
 b=jnYy7g2/+FWVRBx4A0rfgGuVGTMi/WAd/R9SJfQiRgDbrFQp6q+y2gXlHSTwntWRZh
 Jy7bYfpWRbXNPGQ5sayra/H8WUn4d3RgSSDITI/4xzu84HKaLC0NuLXGPIBqqBz8ngc+
 sxfWJa/Tu3neWZ8ixQf2w69pyp9kRtwX0q7e+mcxZkXZZqQtjgHI8tlkAkf8vxmW92aD
 hpVL51YjTSWCdU48Z8dj77Z2RKt7n/EW8ACgpmXO0QCdZ7ca7kdYNY138tr5jCofJrqf
 11crCxze1m8LqtcQuxoeqhrOyeW3lIQIAOfn/1nUw5o34ru4UnTM8noz1tLeJ3XTUV+E
 tZAQ==
X-Gm-Message-State: AOJu0YyIDCBo8+JZL9CKNbX8Xup3bqXSJZpuFrLNTNlgkyLyJuiTFhHs
 6nYB6inP42bnxQ5BnrklZRCl8I6fIopZ8Uk6JLWLCrr5gVfag/AiW91PEA==
X-Gm-Gg: ASbGncs639yjgRj/QkVjboIUqQKPs/QoZ5injCr2gwD5CPdFVn+ms1oLkqdzf7muBZQ
 5btmmjF1v2W0adCqhML/omJllhf41kti6iAfrl1qb6Nl0yCaTytQjq/D31r59VkLXVgRqHcwgKP
 qPnzmc1c3HYkwYOBxrNtU3EwX+XpXkOnuh6l6VNmzxj3QoyKjgMQvs0m6L4ujXRwFN8F+SchW4x
 G3wOOC91DU03/0u6wMT5X7lfyXaU0huAja0ahZv8KAdOrJSE+9XfyhSZltSjKjoeVl4bvZWMt0W
 8Gx4gjCjQ0w=
X-Google-Smtp-Source: AGHT+IEFsqywLvFJvJz1w2Qi+4e9jeWX7EUN8ByLwNpPQJnFFigoHExyD2sdLwcC4/rs0XpKhtGRSw==
X-Received: by 2002:ac2:54b9:0:b0:53e:ca48:776e with SMTP id
 2adb3069b0e04-5439c282d8fmr510962e87.36.1737111020135; 
 Fri, 17 Jan 2025 02:50:20 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:50:18 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:57 +0100
Message-ID: <20250117104911.613221-17-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737111020; x=1737715820; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqKHfhi9oVtyTwyCmCIX+8vY7dGQS+/RHD3juiLvd1Q=;
 b=R2cAbZ4KcerAWPTaSq6ELn2Fc4j3x1E94g4UT4IQxkBQgWWqhiT/C+0YG1+8pBMNTq
 t+Cr5N11KvK6xIBbwlc9+pCw+eb/Zooje/kPT4BOHwQvuDKAURZP18qXzFs1tUe2vqtJ
 bHTcKa4HNgwdphKL5oJLvF76kmla0wGES6UJrxOnxOrfeupYlXsyk6chdKTyqjlybIEK
 NERbmyiqVNa1ZwmZypEB/joXVEKaLIzPLuyCoSAsgkSY32++/SliL6M3HY/lJD01u2em
 NVaXn63KgA9How/dFk6EZLoVqtcRVqfMBKfagsAhVfgfG/n6PqLsHtQs89G3dBOIJm6q
 6cWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R2cAbZ4K
Subject: [Buildroot] [PATCH 17/19] package/qt6/qt6multimedia: be consistent
 in using '.' at end of help text
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index bc57481b13..e3a25c31b0 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	help
-	  This option enables ffmpeg media backend
+	  This option enables ffmpeg media backend.
 
 if BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 
@@ -63,7 +63,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 	select BR2_PACKAGE_GSTREAMER1
 	help
-	  This option enables gstreamer media backend
+	  This option enables gstreamer media backend.
 
 if BR2_PACKAGE_QT6MULTIMEDIA_GSTREAMER
 
@@ -75,13 +75,13 @@ config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_OPENGL
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
 	help
-	  This option enables gstreamer-opengl support
+	  This option enables gstreamer-opengl support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_GST1_PLUGINS_PHOTOGRAPHY
 	bool "photography support"
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
-	  This option enables gstreamer-photography support
+	  This option enables gstreamer-photography support.
 
 endif
 
@@ -95,12 +95,12 @@ config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_DMA_BUF
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
-	  This option enables the linux dma buffer support
+	  This option enables the linux dma buffer support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_LINUX_V4L
 	bool "v4l support"
 	help
-	  This option enables the video for linux support
+	  This option enables the video for linux support.
 
 config BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
 	bool "pulseaudio support"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
