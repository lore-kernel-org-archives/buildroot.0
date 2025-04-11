Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCC8C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 14:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 462F080B9F;
	Fri, 11 Apr 2025 14:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1q_RiEb6LWA; Fri, 11 Apr 2025 14:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8029380CA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8029380CA5;
	Fri, 11 Apr 2025 14:47:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2A5138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6377460EA2
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qyFSAZr2z-i for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 14:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52CB960857
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CB960857
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52CB960857
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:47:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so1682778f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 07:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744382862; x=1744987662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wG4A4PkIh/ien4e2D1uA/D1/3CHWPKhjirFBz5TBZm4=;
 b=TYK02TM8FYJIthwFLyayN7WVCPpr59rJPRMUU/9Uq9EWv3lIkQiEkgCbODrMNis8f1
 j5hQwfQDGCcoKElMs5vRKCmh8f6Ys26Cn/Go70Ito2l6saMlU6gFE6ZszY8NTsLXsyG0
 ybvY32t0Rxmunz/0TZmdQOJsmu0XsGtFAgaAL1LK57GiIHGPgh2e5faBxpQnjwbRsEg/
 UA26rpeZYIc70MbXztM+l4fqtCceFKI2Dpe0oaKKJO+wG07oY8OyQ2Zh7GiexAT5+qlx
 n7CS2QTYcakc27Hk5I2+SqUMhv7xN5jtZNTA6v9xL6XY9RcqFh67sk534VttLHEQm1kt
 8xDw==
X-Gm-Message-State: AOJu0Yx49u7w0hoszfaH/s4d5GtcmpD9C9F595P8oqPt4NouDSq2mhMP
 tSBtRZ6HJ3vGzlpsi9/0my5zv4KZW+RADv/T5mScFTA/MwTFZYewcFNW5Gnvvr1AyubQdF5jVYo
 7
X-Gm-Gg: ASbGnct82ulssKYe5lvNydosanGfH3P4CPOBBMdY//yBn5u301fsC5Q9yLH1fFV+o6e
 EMKn45xWyFRNBKYkAuEpHoRQavzi5vubrEZbdEAOILLVdk/YXmkYbw0n1yj9JskK2dgEF75TrxC
 wgxm5tRCYMfQf/vHgXLA6TFhtqzRDh+r9rWH9DZfklecP3UxmUtIa88mybHxulghHTWozlEwSJI
 4K8pRBcGX7x/DyWG4RBdUjek9BF591bhS1EXfGN4YEhySXpwkcyvPXxPVnd32xciGqM/uqkIRfT
 liMkSwqlsMEhSIDg5/zkajw9WC4RRaeLLbmL/UPE5acvQWYD1wrb97PTfv9cuK9vll8K5C1UlsV
 +mh6TCxZC77vQSZrmPcHRIgzTUPfEyXC3fXggovOZ
X-Google-Smtp-Source: AGHT+IGclhq4OmZPRFrkn5ktOMiTlrABlCfLBQY8KQtzy7nTHorqlXIrluTARaIbNqM1zk/hX29P7w==
X-Received: by 2002:a5d:64e2:0:b0:39d:724f:a8a0 with SMTP id
 ffacd0b85a97d-39eaaecd6d6mr2579985f8f.58.1744382861950; 
 Fri, 11 Apr 2025 07:47:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.64])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979663sm2271804f8f.51.2025.04.11.07.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 07:47:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Apr 2025 16:47:38 +0200
Message-ID: <20250411144739.3957036-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744382862; x=1744987662;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wG4A4PkIh/ien4e2D1uA/D1/3CHWPKhjirFBz5TBZm4=;
 b=V9dYL5l3jHrVO0veatmiMF8IXk7KCkP8tQvfAk2ss6GiBsujCbp+ZRCBVh5SsFSYQn
 w+gRqJ7uf8ISn59lu78asV96kRJ+qbiypYhdcpVEto3CQrEhc0v/oL5uB600O6iLeRU7
 LgYtoVPf1FfEzGYdu0p+e8Q51+n8dBT+xYQ3o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V9dYL5l3
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: bump to version
 LTS_03_2025
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
https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_03_2025

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index cc6b6589adf3..d1170f7e4c16 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  3dbb005bfadc6162906d4ba3c8599b4ec39025d474fc5337546f7447584041bc  azure-iot-sdk-c-LTS_08_2024-git4.tar.gz
+sha256  28d4d79239fb278932cc1cb7118733e2c923a1ac95e91d541a1259e9c8a5beb9  azure-iot-sdk-c-LTS_03_2025-git4.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index 909b3d6b83ce..ecbd49b4ba6c 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_08_2024
+AZURE_IOT_SDK_C_VERSION = LTS_03_2025
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
