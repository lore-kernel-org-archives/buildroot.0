Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB5FCD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 14:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0387780C1B;
	Wed,  4 Sep 2024 14:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ryKmnyB62Rwo; Wed,  4 Sep 2024 14:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A2581204
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A2581204;
	Wed,  4 Sep 2024 14:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA551BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A2C260896
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 14:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRCQO58Z1nGr for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A643606C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A643606C2
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A643606C2
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 14:25:15 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5befecad20eso1109818a12.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 07:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725459913; x=1726064713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCuPfXDo7qWdW4QEirI9ae8gogh6VXU03U+B+oNPQAo=;
 b=qUEuPrTfk9lt1B+y7JHrO0FeNtqW7e9OLnzohGEsfafDtld8kFqlj4zpktrHXcetWa
 851kW+0DN6Sg30xFyT9vWAUzw8Lpfibv0WuJh5ziRN+UqxTwVLmSVz2abIgm3X0DhVcU
 Tc2/K1YQUN1InlRcCyR4yOUEh7+yVJL6cQ5e5L98N8xJSEA19CxOc2i9ncTq5u+Iv3cN
 9fX3AFEIQSjk2O3gpn2XJy2fWsieahNAbZAlmyiSoG25zrD8h/PG0CmJWDYSJ/kLmBFO
 Bf+0IPBGmAegfgCokSnRMuoiJu2f9GF+NHU5rWb28Kkh+ZLOb0QkzkO4icSLqaraPjvk
 U4BA==
X-Gm-Message-State: AOJu0YzhiyhQjTU+NexwSAET+swiuX9MlyoGwWFeGrlsaTkeCjFWQAQg
 X0mfy5ZHc6kvaPxuIfyfh0JGabXcScKPtDgIle0hFP1NCakeiWv1K2SdTDo5zmdZQ7tIBQ+cctG
 BqiYmvczY
X-Google-Smtp-Source: AGHT+IHKU6JUgMJAIw6UByq7Aj6olwgnfD2o5kokEviUncdRWfB6VJuv88dxcgMat3/30z2qlWt3rQ==
X-Received: by 2002:a05:6402:3583:b0:5af:85fc:1a98 with SMTP id
 4fb4d7f45d1cf-5c22f5908b5mr7228287a12.0.1725459913054; 
 Wed, 04 Sep 2024 07:25:13 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce96ddsm7564644a12.94.2024.09.04.07.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:25:12 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 16:25:09 +0200
Message-ID: <20240904142509.3295502-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
References: <20240904142509.3295502-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725459913; x=1726064713;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCuPfXDo7qWdW4QEirI9ae8gogh6VXU03U+B+oNPQAo=;
 b=bwNbCE4Qr4+zXcmrkZgrSBC0ju3RJgVrFJx9zG18AySTb78vSe7ecZwmnYZWph1g/e
 G6OcYQ0BVTTLQkSslsnKLA81eNsi0AT2UHqzyVuPmXT7uCSDfcmPcVPn/jY/zMr8mEY9
 OKHbBXrLQ+UOdh3lAn/XduZfc3Ntz+iFS/sVA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=bwNbCE4Q
Subject: [Buildroot] [PATCH v2 5/5] package/mender-connect: bump version to
 2.2.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License changes:
New:
  BSD-3-Clause:
    vendor/golang.org/x/net/LICENSE
    vendor/github.com/gorilla/websocket/LICENSE

Removed:
  BSD-2-Clause:
    vendor/github.com/gorilla/websocket/LICENSE

Modified:
  Apache-2.0
    LICENSE (Year change)
    vendor/github.com/mendersoftware/go-lib-micro/LICENSE

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-connect/mender-connect.hash | 11 ++++++-----
 package/mender-connect/mender-connect.mk   |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 33ad999180..5f7e082e1b 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,17 +1,16 @@
 # Locally computed:
-sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0-go2.tar.gz
-sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
+sha256  7e83c4cabc090ed26088036c6c68fc8e73546fa4a75db817f676dc8b1e8a3c8f  mender-connect-2.2.1-go2.tar.gz
+sha256  c57e1178f932015d7f08b4d76c4b18e4a55083a6fbc97629cd25ef426bf1db30  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
 # Generated with sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 #
 # Apache-2.0
-sha256  1033348db7606a7e61b6484f293847cf8d7a35766efebb97e304d4bd5d7f3f6b  LICENSE
-sha256  3eb823230e5d112e1bd032ccc82ae765cf676d0d6d46a1a1daa2d658b3005b67  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
+sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  a4e99d13c6cd0e4faf3867ae5c9815ff88cab3cefdefe0dc1ec9ac28b1152944  vendor/github.com/mendersoftware/go-lib-micro/LICENSE
 #
 # BSD-2-Clause
-sha256  2be1b548b0387ca8948e1bb9434e709126904d15f622cc2d0d8e7f186e4d122d  vendor/github.com/gorilla/websocket/LICENSE
 sha256  8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86  vendor/github.com/pkg/errors/LICENSE
 sha256  1530185dd39cdde7cb2f786a7a5fcf8bc34368b6ae73c15e72bafe88fd80b9a2  vendor/github.com/vmihailenco/msgpack/v5/LICENSE
 sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor/github.com/vmihailenco/tagparser/v2/LICENSE
@@ -19,6 +18,8 @@ sha256  0f02aac22084ef463aa5f42f566feeec6aa4c99653519744a8c25cb079da5b5d  vendor
 # BSD-3-Clause
 sha256  2eb550be6801c1ea434feba53bf6d12e7c71c90253e0a9de4a4f46cf88b56477  vendor/github.com/pmezard/go-difflib/LICENSE
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/sys/LICENSE
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  vendor/golang.org/x/net/LICENSE
+sha256  0b77fdea862f869ef4f201ac5649bdbd38ccb055c7f6454dffae9e2adb4941c1  vendor/github.com/gorilla/websocket/LICENSE
 #
 # ISC
 sha256  1b93a317849ee09d3d7e4f1d20c2b78ddb230b4becb12d7c224c927b9d470251  vendor/github.com/davecgh/go-spew/LICENSE
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 36ddd5f7db..f4f7e0f195 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.1.0
+MENDER_CONNECT_VERSION = 2.2.1
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
@@ -14,12 +14,13 @@ MENDER_CONNECT_LICENSE_FILES = \
 	LIC_FILES_CHKSUM.sha256 \
 	LICENSE \
 	vendor/github.com/mendersoftware/go-lib-micro/LICENSE \
-	vendor/github.com/gorilla/websocket/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
 	vendor/github.com/vmihailenco/msgpack/v5/LICENSE \
 	vendor/github.com/vmihailenco/tagparser/v2/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
+	vendor/golang.org/x/net/LICENSE \
+	vendor/github.com/gorilla/websocket/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
 	vendor/github.com/creack/pty/LICENSE \
 	vendor/github.com/go-ozzo/ozzo-validation/v4/LICENSE \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
