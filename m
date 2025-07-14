Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06248C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C823561499;
	Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQ_9zv8qRAHf; Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D7B16148D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7B16148D;
	Mon, 14 Jul 2025 20:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CBD2DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517E1820E0;
 Mon, 14 Jul 2025 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WggVsw7jjBKs; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31C8D820D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31C8D820D0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31C8D820D0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4530921461aso31015315e9.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524772; x=1753129572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GCfnKj3csvUfrKUOzvcWEgisYCE7/wlJiMwGOagzAro=;
 b=GAKB9TOxFbST8ymMjczPx6L7LyJSTB0AZhiRf0qlhFAiUustAl9g8eJ9FHr2pWsSi7
 GsmPA5HREc/se8lx1+StDR67B5et6a/ulT9zWFQw8nQc2CARR7JmrQj7kDitiBEnHImf
 C5JLIH7ChBK/IXN7S1/AnNinRB3VqcFv13utc77CQR5ZFZVCPm24wJcblEczshR93jJk
 HstNrvBb6+UQBRJ7IqTcHk9gtY/jlJQ7+zDibVbl26Z2KLaXPT8uey0cwkvMVoCi9giX
 t1vFpaTpZPpt97MD2Z3YhEnTcqkBIaK6f4klLIrbSs/YDXo7FAvkFAwzGgJrRQr+wRo4
 5z+Q==
X-Gm-Message-State: AOJu0YzVNP+uLIa9GT/jbVbzGg5mFBqkpwCRd1KZOQZRQhnGZpekZ4uC
 7SSxTuY0zPv4lF1n7yw/HKGqn5NRLQuL10kTYgCgMM6fkmllFybaUkPmcrJlbg==
X-Gm-Gg: ASbGncuitxo1rcoe4mozM2XxVaozAfl7JMnQq/wjWI2EuTigRXA67L93xUInJoYgvgN
 KW+FcRFx4/gdKEt8r9pbSinQijk6pHbhuVrsiugI8P6/a0dRRVnOVgi4Imxal3FgboXQJx5IThq
 iE1+HUDXVTUi7mkNWfJihRSowyW9XeOdiRcOrQTpHNZGGntZIPYn0LtLfPEuWUFVqpkFJPZ6ZYt
 F1vjsHQGKoGYBRKyRh49IR32I12Pk/sdU3Gt/qrAhwrX15WoTn5LZ0Kjj4jKZwVP3OYCFzAfjF3
 uMma24Ejk8NaStedi7klNqo73/DDustBfC7hWwx3oJ0W+TXaXmy4kvfqXd/rLhUURLRdT3XThr2
 NGj6HGi0d0xkKVZtgV1qozXAEneVzWgK0
X-Google-Smtp-Source: AGHT+IHny6SSOF0BxY9DCrjeq54fiopWL/3ygWcqavWwLvj8qTMsm+9+ESzkAHVPUXZG0YsvItA0Uw==
X-Received: by 2002:a05:6000:2502:b0:3b5:e6f2:ab4d with SMTP id
 ffacd0b85a97d-3b5f35856e6mr9900179f8f.42.1752524772029; 
 Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 14 Jul 2025 22:25:59 +0200
Message-ID: <18d566c2139dc478d4963c3926580d60dc347672.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524772; x=1753129572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GCfnKj3csvUfrKUOzvcWEgisYCE7/wlJiMwGOagzAro=;
 b=JNIKcI0Rfx9dye7gfwokwkHpY7yNsFchEz2jg0rLXKIqooLe2C/Z5lQScaAnUVbEiY
 GSr9gvZ6PxbjabIPURz0D1YIvW7xD+WuMcfwFwb0SNPL7zPboTxOw2djCz9UvB8RJwHy
 gc+IkeKVAjGasDPZrpWeWQCaLo43+GcGQlVWuqkRUimJS23/D2ONTNs0KaH8NKRx0ZND
 WGoGDmzJU+zfnsolSAoGSJ0lsQqOh0ha+O9seqhy5+ESo9K2Wn+c3da39/MxI33GrXfG
 goLFAX/YtppLaWvAl+861qSRFROUHZ8NSxlIpLuD8n1nm3y/JcOpZcvWDL4hGcLI3Mtx
 I3hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JNIKcI0R
Subject: [Buildroot] [PATCH 05/13] package/docker-cli: bump to version 28.3.2
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 154063d89a..34d77bb137 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  abd16e3911bc7bbd00596ebe4f58baf3d577160d99eefd749a908507ddfc587b  docker-cli-27.5.1-go2.tar.gz
+sha256  b65cd415e63be23fcaa63107bc47a762173a06c84fb78b1575edc5443bb39867  docker-cli-28.3.2-go2.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index e118481838..511ec1c8dd 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 27.5.1
+DOCKER_CLI_VERSION = 28.3.2
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
