Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3942C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD886FB4C;
	Fri, 17 Jan 2025 10:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfqik-B9Xln2; Fri, 17 Jan 2025 10:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529876FB58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529876FB58;
	Fri, 17 Jan 2025 10:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBBF1B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2F36FB4B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Yy6gZch3ih7 for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDC9C6FB44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC9C6FB44
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDC9C6FB44
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:54 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso2006753e87.0
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110993; x=1737715793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwyFKca97uYalQbLjtD0EvE8GkvGk25bq0RH/MvgZsM=;
 b=LI2cTdm9O+vuiqYZQjDOTPv8UHllKhbQ7dwYapgmNY/XusyA27WHblCsf9izJdX1c4
 tGSMPSq/0hcWsSOp/rxlcuX9nLCLXbyexIvdfunNoOffwVdmm9b8XYQreTSg+vi5g8qN
 V6v0ga+bynqVKgPraxxAbhHcbIc3K8D7sL53sJyYwaIjB3UfaA/QiiUfJovRUqg2wQSX
 N7FRTAzvOTjvnlzA9efNXC+eIksh7O6gj3v1i+FMo4g4EKCQe1s5nhUhqiuEWOh8QRzG
 45mGFldS7t8mlR5Ui6E9d69ssSFM7ad+KRPsD35ZVUAzgPRUPCy0As3MERHtRSUDvPQN
 LDrA==
X-Gm-Message-State: AOJu0YwvW2e+kGtXMYmVdicW1w1A4/+N+hkc2XdmHWenT9A38FHORNiY
 zee34hoH6CZ2QKHv3ZSEq4HeN8U+f/8AjAaZibBxI0y82ANHDCNZNvF04w==
X-Gm-Gg: ASbGncvxDfiY1fB1Z2zO+ADjvDZpHpj1V6c4ePdNR9nZk3ITo4u2jRPevrbdf9P9sjS
 9sRzxbQamXHhvAebaF5nmM+7h0Opy4D30fpVS5c2p3EWYMzPFBauH/IGtEj/+VhzVPpe0f7Oq8u
 tjT2Zu947+bvq2tZmIRLBl2LAD/IWqTtGqP4jz0fYgRaFUDaU2k1vZcP13HBc06QSZubiXt1OEa
 Q5saVMDV3IYsMBXezt6EYNv9Uw/yHTMsOn+1O9oDNnQKKDljUvcxLFLdrQaylygMXrlik/62K2p
 OqqFOKEoClc=
X-Google-Smtp-Source: AGHT+IE/+JXT+1O3LTjxjARPFg1idrjeBDK88qf71Gwy3MyBHmCiRPKDHCkMjrv3yMZCIhv2zA4MDg==
X-Received: by 2002:a05:6512:1599:b0:540:2add:c1f1 with SMTP id
 2adb3069b0e04-542abfb56a9mr3720576e87.18.1737110992448; 
 Fri, 17 Jan 2025 02:49:52 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:50 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:48 +0100
Message-ID: <20250117104911.613221-8-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110993; x=1737715793; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwyFKca97uYalQbLjtD0EvE8GkvGk25bq0RH/MvgZsM=;
 b=SS5/hyeEYQEs0u+YBIHxeOZ1bfefbdVfIEy6LULOH9uHXGzduw9spKq10c6YLrdZJU
 u4x6mALo+yCTwF7cFBM1cSqOZ2BQlmClEupYEk8hOFOR2gaRMv8B8SWQ8FvBRtp5NtJC
 ZAJMBPVF+DsXDZXTz0uir852o/N6ocKJHuuCQBhWYkjfmSEAV7OCT+hVz1A6UuB5sG1s
 0eCzJTmEdEGcx4Y0KQ9en10g0+i/yan7NUKsJcWvMa3///J29lJCsXWrsSOpfcIPcrQT
 nSVuIVk1oRA3xVBKjOpyTnD72qP7+PXsCHPUmwARpmsgsxnkbkUB1EWF/aR1h17CrphU
 dojw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SS5/hyeE
Subject: [Buildroot] [PATCH 08/19] package/qt6/qt6multimedia: sort conf-opts
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
 package/qt6/qt6multimedia/qt6multimedia.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 31c3405b5b..919b6990cb 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -35,9 +35,9 @@ QT6MULTIMEDIA_LICENSE_FILES = \
 	src/3rdparty/pffft/LICENSE
 
 QT6MULTIMEDIA_CONF_OPTS = \
-	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF \
+	-DQT_HOST_PATH=$(HOST_DIR) \
 	-DFEATURE_alsa=OFF \
 	-DFEATURE_ffmpeg=OFF \
 	-DFEATURE_gstreamer=OFF \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
