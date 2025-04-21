Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89415C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31DE60B61;
	Mon, 21 Apr 2025 21:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn9gxv3No_d8; Mon, 21 Apr 2025 21:37:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A2960B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A2960B48;
	Mon, 21 Apr 2025 21:37:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E24F81A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8BAF40362
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlx9HL9OO9df for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33F6C40350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F6C40350
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33F6C40350
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:37:14 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-736b0c68092so3655201b3a.0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 14:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745271433; x=1745876233;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPKGKtgeskcjGeVlujStvXPnWpM0i5aqj8hh/yv2Jq4=;
 b=dmoHdB2gGbxOe06VOaHH+nOvOC5ra4/CZptr7Bx7fNaAPHX4+Phik9YEEOcgk+pysf
 /QV9ApL1soLbgc3QDiuftTp54be3gNjT5jAFU92TcA34kfQTzQXhg++BtHKrkwLQCd13
 Q9QWCxXQNLq10pZmk4gktFJsVFI7piPlEY4tFWhFf00luRA4FZnQO7xqdmyIkJUMOcU5
 6BOBwtTUPgjdm/Hh2lotZYNBCxifGNR/ffiletziU2ar+Y/0vuw7J2T9mqcoczSQ/iqy
 XN261wfP4G7JVVs0Jh4kGaucxq4vAAN1qZ6TCOQIyHg3KGIRdK3G9nv09TXz4zSlVG90
 mPaA==
X-Gm-Message-State: AOJu0Yw46lPI3qxtBpBi8zyPQzcLOc9sQiaLfSuDSiSJd9SPVVItGMd8
 MzFHweYgm0HAlb6quXtlapEIkkWDor9q6FYweawfW676m2tvaR4Sp9AecEirHHOqy7oI1cSz1Fu
 Q
X-Gm-Gg: ASbGncso4JVPmK9tyYCjkcJqXwgdJwYpX3s1Wk6Q77gQYhSruikb3/HHQMqn0CHoGtU
 fUkoroMuhx0VaAoGKFCErEyQBIbh5V6jO/PfCLGEMXk7wNAZy/q7Pvwrgc/+t6BC3s7Uju4lUhe
 DE7sZmpa9/9g+TDTqeDTMB1TU/J0kBAOHmvsu0qVIHVvsvAKsfCA+0XJZq8QeXEUh96PwX2+APF
 myB9pC9dOrRHDZrKUYw5b1jWRY8kpe5gSAN71LJiPlYYotVA4pW4hOw2HCSpyK6Psg3cELYMlKj
 pNBiykW2f7Qz6VhDxp2xI28sIGqecZ4Sqtxxxibsjc9x6ghHkotCNjT7
X-Google-Smtp-Source: AGHT+IEIVYo6OyJ9ksCRrVGbSg0yJG7vpe48z3jfNR7JsKAKJBHYHtp9XXp5ZbEKmIE91Nh9A7SpNQ==
X-Received: by 2002:a05:6a00:4acc:b0:736:33fd:f57d with SMTP id
 d2e1a72fcca58-73dc156a8b4mr16100519b3a.17.1745271433597; 
 Mon, 21 Apr 2025 14:37:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbf8e4825sm7355082b3a.54.2025.04.21.14.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 14:37:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 21 Apr 2025 14:37:03 -0700
MIME-Version: 1.0
Message-Id: <20250421-pixman_riscv_dependency-v2-1-7209dd6f2485@rivosinc.com>
References: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
In-Reply-To: <20250421-pixman_riscv_dependency-v2-0-7209dd6f2485@rivosinc.com>
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=6ODtjpoAoh+3FEfrstBDh/uEubMfcTfbBCHx3fZ9GVI=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwbbrtbvTLO+ZC+adcJje4SZdfVPkSmXN/bsTc7L8H7uY
 /Dqx829HaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExEw43hf5KgssLF/ktTW/al
 MltlPS+R3MQzfaGjk7XLyxnGW/N1qxn+WVz5L/DyJoctz7q82UG8RXOF/d2zZq71fv9X8Y5OUrA
 wIwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745271433; x=1745876233;
 darn=buildroot.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HPKGKtgeskcjGeVlujStvXPnWpM0i5aqj8hh/yv2Jq4=;
 b=PCxDNuTEDGSR2B3wCMhXLPAUNCrXLNOC5MnFeyndNLXnfC2BbqXgDH27JCp/FXFvT2
 rsFjAYtgBbiXYFdNpEcKkTrH+8clUmVd9aiGIVbTx7qQ+uAKROqoU4QVBm7s7Gm9wBf8
 y/jJ796ygiWHJQ2gHcPGqopkvptEaAIMQ7ktk4TDSR+avFERwTofbUiYfx4G2UXwml5M
 Js/7y5EtCmb1x954ZLvEMPVWU/VM8iosqenGeYGxcTe5QDM3nl9VhyZpVXqi/coMKU/i
 AmayzTvnXiRnTKmiCndSMg9tw1wZCChkkOERSTdx2vck7ZXmCcmf4uB3ELj/114Oa+Cc
 Y8aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=PCxDNuTE
Subject: [Buildroot] [PATCH v2 1/2] package/pixman: Only compile with riscv
 vector support when selected
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

Pixman defaults to building with the riscv vector extension. Instead,
only build with vector if the buildroot user has selected
BR2_RISCV_ISA_RVV.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 package/pixman/pixman.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 391950cbfc31bd11eeb6765d6fd6b388b0d481f8..76e72d6d96161f9458cad71a8437e46b3fdf4d95 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -74,6 +74,12 @@ else
 PIXMAN_CONF_OPTS += -Da64-neon=disabled
 endif
 
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+PIXMAN_CONF_OPTS += -Drvv=enabled
+else
+PIXMAN_CONF_OPTS += -Drvv=disabled
+endif
+
 PIXMAN_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101737),y)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
