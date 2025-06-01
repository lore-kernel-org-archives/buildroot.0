Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE93C5B552
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 13:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E344F808AE;
	Sun,  1 Jun 2025 13:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWuEjDZ2YKI8; Sun,  1 Jun 2025 13:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC1580CF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC1580CF3;
	Sun,  1 Jun 2025 13:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEC191F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8228860B0D
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZxPbzoReRTr for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 13:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2865F606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2865F606F6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2865F606F6
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 13:28:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso4627437e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 06:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748784517; x=1749389317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZkG4QLutiKpOuGB0SHIUws/em/JU4QkhsA7B+Zfl5Ss=;
 b=MxGDOc+kxF+v49JRkRA2kIyzsdjlwbg67O8Ihia4GWn/E1cNCpuR3EyuePDX+nJGDj
 4ttcI+riorERF4S0gZZD3EbdP0mkwWM25qtTg9mWuzXteQRBXVgMXfxr5umgmKWgpRrd
 DudoK9RaHHFH40zecTvunYjlZ2k0Gae4x+lYjFTcVOLDSK1QqDNYhzJRv4Ddmb+ywdcM
 T/m3fqALVo2ZXnG1UPswcgX5dsHz2dtew+YimaW0Ix0BOQK8LLT1umqShoDup+8jdIuf
 QyMC1exbtci80Key4jXwMDXkHbN894COcsikdnLgRdY7Xtuy2TiGz2d/EJoLn7TxMKpp
 V8Nw==
X-Gm-Message-State: AOJu0YxvKxQx5fC3Id19HW5pWQlEzbvfS0fNaUsOMpkJ11UuCvu5kBUv
 ZzQhfNZqfOPSw3E21Zb5FWnplNpGL6dnCfMQlPsr0doCufZ5ZyntWUfX1Y10ig==
X-Gm-Gg: ASbGncvriua+coKdBaoRxMWzkxSWIhYUHqbCGQXf+pGgM49mezjcDSK+OqnsR61z8eq
 bZTZMcusOU2i8l/5QuKvZvaY7QPyps0XnqGnPYXXGHpnJGh16gMWSMW/trSUfBmiCjbb9oz7i8e
 sq4lmz2SIK4zZu15DYmnBbyI1bgefz2mLOtTNdBIm+88zzxQIN985/XSu3ozkJCKpH6kBNfg/b8
 u11m751Puso0YHSD5qtq7C49Qz+pWOghmgl0rMZQMS4OjUveSDCY4iCiU052gKnUDNATq0x37ei
 GTlJ/ZFcPVh3vILnmb5T6eTFvArAp18Axjt+OUAaFzVREbpTBXirE8QH7PKdKIMOTJf/3o/KU0Z
 Bz04=
X-Google-Smtp-Source: AGHT+IGeorLCU0CD+Eo+hgxgIZ0/5OqlCa8HE50Oq13hHELR55p8ZcNw15hfmgEcixLeH7jNHUp8iA==
X-Received: by 2002:a05:6512:1389:b0:553:287e:718 with SMTP id
 2adb3069b0e04-5533b93a5f0mr2932995e87.48.1748784516638; 
 Sun, 01 Jun 2025 06:28:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d38fsm1275178e87.42.2025.06.01.06.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 06:28:36 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 15:27:32 +0200
Message-ID: <20250601132736.3582117-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
References: <20250601132736.3582117-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748784517; x=1749389317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZkG4QLutiKpOuGB0SHIUws/em/JU4QkhsA7B+Zfl5Ss=;
 b=kBAHMopofFokn5eY2tc7GHV+AtrLGG0Rvr1VmDnfjdopDrc6qNVWY6kxRUafcDqnD4
 ivW+WsUQddHj4FtzMOTIvMtJ1Frjqz23p7IeTXuTM4iP64y6VeDDO8WveeBKoaAsm22N
 K19OrxJ3/oRXgPXYxgQR5/NwmgSAkZDwnS6dKeYBeDWt8kznVa6W1ksO8rnT1eZxs8lU
 FGwtcHBrYgQWygcSKUTWkxBtZG2T2/4XU3gZN7g20lI6itIuvdJLw7/RlV1FzF32Xy1I
 kM0UnVZF1AedodyzWihtdmOet1gH9tSw4RXZc3/yrMo5cVI/mCoobXeTBprgIT4UyN4t
 v4ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kBAHMopo
Subject: [Buildroot] [PATCH v3 2/3] package/qt6/qt6tools: build without
 clang support
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

Fixes:
If external clang is available on the host system, the buildsystem tries
to use it. The result will be unpredictable. We can't use the version of
clang that is shipped with buildroot either, because it is too old. See:
https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1. So we
disable clang support in qt6tools for now.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/qt6tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index f5cfbaec9a..75065ad0e5 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -31,6 +31,10 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
