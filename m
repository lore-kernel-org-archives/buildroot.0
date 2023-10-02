Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C1E784B6
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 14:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7455060A9B;
	Mon,  2 Oct 2023 14:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7455060A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyEWDKKuzFcA; Mon,  2 Oct 2023 14:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB41F6106E;
	Mon,  2 Oct 2023 14:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB41F6106E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A69581BF947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80B4340A1E
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B4340A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvtl3e1WLQEw for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 14:31:28 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D4B04000B
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 14:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D4B04000B
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso2353072366b.1
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 07:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696257086; x=1696861886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7zq1uPf/Z1wsDVOgAg1LZUicxHZKenrFQDC0F5jwSI=;
 b=H0LQxuNZqpuojb4JEPnavYYETplFqNmW+2MaEVa5/KCU3eNAVZbBZIDzn7a3A2WAIE
 d5AwD3hFaX0+1dmZ6ge5a1eg3cJ+TfLdU9DER6N5DEFVZ2PZkUgQ7bJaj83A0DdAexBD
 ZKnpShBD1W/wiK0uacxldRIp67aY4je5XX8m6Wp1gwVQzZQ+ScQgoTQC3kotDUM9kRwA
 rfDu8F2A31RkPCBNivDuMmJRgM8l7CuMbrNc8Of738+aj+FtGKfaB0wtvx1hnjZGZpNR
 sENuAVPAlzjmBs8RV/iQXTZMSK7XtWPBYBJSTDU/UM/B7eeOmoA7prJnvf+ltxISCKLc
 vBsA==
X-Gm-Message-State: AOJu0YyfcBg9Mv2CKtFDOtKcScffkaWIm9CgN7J+ApYIUkbxmU39bMlq
 swUb5vg7yBoGNo7BrgBAl7fVwieI5I56nJkBPJ8U0Ktd
X-Google-Smtp-Source: AGHT+IECSdDiC3h2ahKa3/lykXzbUeBrx2vpJbbkUudFIfKioQL7GhI24S0fe8rvF9c7QzphAq7wZg==
X-Received: by 2002:a17:906:24d:b0:9ae:6a8b:f8bb with SMTP id
 13-20020a170906024d00b009ae6a8bf8bbmr12021810ejl.6.1696257085906; 
 Mon, 02 Oct 2023 07:31:25 -0700 (PDT)
Received: from fedora.. (146-241-223-149.dyn.eolo.it. [146.241.223.149])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b009a1c05bd672sm16917735ejd.127.2023.10.02.07.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 07:31:25 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 08:31:19 -0600
Message-ID: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696257086; x=1696861886;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H7zq1uPf/Z1wsDVOgAg1LZUicxHZKenrFQDC0F5jwSI=;
 b=Bgh8lulti8CqW+nu+p1a+t4uAVdtL5kwjsA8bu4oxMJadVuYlJF8OP7pwQ2L/zSayb
 vlokUJGT30A9JIVF5G2AIAwui9ifNldx1oOkYyMToEuvzlcowYJm0aCRaSzn8CormqyX
 PHq9eMKxVnV9ua/EBuNVf1iiUTZRN9OEwPBXc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Bgh8lult
Subject: [Buildroot] [PATCH 1/4] package/flutter-sdk-bin: bump version to
 3.13.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 9daf6c58be..9255f9a6bf 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9bbfbfb6fe3c72a29c1040235126edd0cd461e4e18556335fd1cf217c2e1473  flutter_linux_3.13.4-stable.tar.xz
+sha256  c8b64bdf6982d51fc303376bc0b8e27b416fb23a137c0268f7fe401216e57bf4  flutter_linux_3.13.6-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index dc6d68fdcb..c3891fc954 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.4
+FLUTTER_SDK_BIN_VERSION = 3.13.6
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
