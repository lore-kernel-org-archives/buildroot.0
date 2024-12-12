Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515D4E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 15:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9691D6071C;
	Thu, 12 Dec 2024 15:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52vlcgFBJw1q; Thu, 12 Dec 2024 15:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2763613BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2763613BA;
	Thu, 12 Dec 2024 15:52:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B4A91146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 15:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69A4780CCD
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 15:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW3YReT7zCEY for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 15:52:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F6C980C52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F6C980C52
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F6C980C52
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 15:52:38 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso37412666b.1
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 07:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734018757; x=1734623557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99n+H/h84cvrRIThF4F/mJCpdFqQvMzhPVtl5BaMim4=;
 b=QXXU92P9xMlPFxgjS7y4YV8lSZbov9F8z8YIsNG5XpFKfcQX/qd+A0i9fZ+/oUeCCd
 0ECnfAsbC/yOEvx4ZPrgT4YVoY9uWL1sPrTeDB++bzy3CPZQe08TCkQHftzt101tsZ85
 eHi3oEeZ1y++A8XtWnGmBik/3ReXVl7ccvqxoxeGLb6HYJhu7Lg6bUGWdSIawLFWX8lm
 nfqLWUNoKwaAWMxkEOJXVOyDQ/SCnfPWca9P3OvDTxyOh8PeicVmIrrjHm/p6wVIlMjk
 D7AL2P4aJCTSUAOad4LzkhI/66vtAHXfV6uYr5pzJjHs/8AlqPGULKLMy+0svbuXU31M
 g7AQ==
X-Gm-Message-State: AOJu0YympccppHwVA4F/dLhf1Y5jEP9ZUT93IHUmVipdJluvt0WlyFtH
 RKEm3t/YVlPvnrsZIj7KH10kQM0kCZ9GkHAmKttbf5XXPtjcabG0UBXbBD/cY8w6MujZCaSajup
 b
X-Gm-Gg: ASbGncuG2AdaLK6m3hEHNafKNvWebBKY4OVZKMHVtVU32hEYG5rVEwOoAyiAou1azMr
 C0EygZukao9r/lDlyhtwKddkx0aJk76gXeWxhM24azmH0+DuDwvVYeY5EKDnrCdvme0WWwiOV+9
 AhkU40nmn8QysHB2k8xtyaL7xiCtqqPlHe8V+x2IgqjvgYiortxzRnz5xaLIyQ9PpfcoKeIDq/D
 nsxa34DmUNpaj4gv4fKTKDkPvmwArfDl4/8gXet+OBcA2HJLw7e2AK6qgNtQcHHwjrkoFPeBzW3
 chaL6Pu32epikFqyim7vve+EP5cKHmFHGUIbd+rk8QKbfA==
X-Google-Smtp-Source: AGHT+IEvj6fhQJMk7wuYptazhYdEr1sHKpOBddqXRdWTNcUbvM4doS+fnxrqUmS4ECBtlrkckI11gg==
X-Received: by 2002:a17:906:308f:b0:aa6:995d:9ee8 with SMTP id
 a640c23a62f3a-aa6b10f5d50mr770128566b.5.1734018756974; 
 Thu, 12 Dec 2024 07:52:36 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67c6141b9sm675539466b.190.2024.12.12.07.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 07:52:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 12 Dec 2024 16:52:28 +0100
Message-ID: <20241212155228.885926-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1734018757; x=1734623557;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=99n+H/h84cvrRIThF4F/mJCpdFqQvMzhPVtl5BaMim4=;
 b=IXYhifLQRAilm2CSaIE/vMyAEqGOqVbXO/GEaqEOnDbP1NBPeiADjZTFw+VpHTUyWD
 Q/IoIqiawHXpEFiwGBzba4eCWjDqimiV0MbohFj6Ff1VDVJif/mzQwMAAL+noRPwinOI
 1ZJgmb/9bshLJGa6/YhEFIbcqSLsUe8/vfJ0w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IXYhifLQ
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to version
 LTS_08_2024
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

Release notes:
https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_08_2024

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index fdc1acc62401..cc6b6589adf3 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  73bf42846089152d298d4a3810df274820aa84013943676eb71a7d4131a4a769  azure-iot-sdk-c-LTS_08_2023-git4.tar.gz
+sha256  3dbb005bfadc6162906d4ba3c8599b4ec39025d474fc5337546f7447584041bc  azure-iot-sdk-c-LTS_08_2024-git4.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 4d0ecb077f8b..909b3d6b83ce 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_08_2023
+AZURE_IOT_SDK_C_VERSION = LTS_08_2024
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
