Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C87CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105856FCDC;
	Thu, 19 Oct 2023 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105856FCDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pM1Z0LzNuBE; Thu, 19 Oct 2023 21:01:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553446FCD9;
	Thu, 19 Oct 2023 21:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553446FCD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97D81BF316
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA126FCD9
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA126FCD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jyp54jf4oETS for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:01:31 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5370661133
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5370661133
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c504a5e1deso1555601fa.2
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 14:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697749289; x=1698354089;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+VZejoYKZwX/4InftIIL1WbWvvGd5Wobf7nmmAuiohk=;
 b=HLaLPRW0wUa8Du6BiFfom8PbUlW8W+kwxR+aD0EWmY6OAlFMVP6qFUfLvl9Qvn4EAK
 q3NVLaQ8rXn5hr9Z0T6hKNAsEbBqiPly4MXTqr5TXtUqEQgSCdxbAVz3vEHqE49FrzpL
 42PWHVKeqdRbYSPan5JDhj0cAWh8VPEWYfnfbsN4Bk+o6M/fi0vsFcYsVeUyZJGzV8Xu
 CImJhTsg1N90kNDH5GzigmcpdTVJgcVa/pGAw3VidU6ynuGr/MH6eWnNq9XS63f8ymvW
 fPH3o4bzAp6NLxuF71iH0rq3dVEv1uRGhzjiaH+p2ibPuTpZJuOjc8xSXSrOPB/nsh6u
 TJMw==
X-Gm-Message-State: AOJu0YyPNE06JDCU01+fCjeURtgf1kO2AoWuq26umgCK919wuBIxO+Pp
 xAWam3ASOxoujj6EDzpYIgabjR7DNxs=
X-Google-Smtp-Source: AGHT+IFlrwg6ZZFREXqU/ZljckHapy5Hk/++pBXDmSxLE542MaKR6BmTnvnD6U9IG3JZ9xm20eMI3g==
X-Received: by 2002:a05:651c:1503:b0:2c5:1f20:926c with SMTP id
 e3-20020a05651c150300b002c51f20926cmr89100ljf.11.1697749288567; 
 Thu, 19 Oct 2023 14:01:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c3b2a00b00407752bd834sm499383wms.1.2023.10.19.14.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 14:01:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:01:17 +0200
Message-ID: <20231019210117.417632-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697749289; x=1698354089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+VZejoYKZwX/4InftIIL1WbWvvGd5Wobf7nmmAuiohk=;
 b=ARVRPtmtlIl7pJK2nfBjAzceauOu9gyogrCSY1KhHYO/rCb4FUHQETRhKCigb02ZhF
 Jubtp+8NnR90A96Wz4/NKeq61lAR+XfHriiICzHtaGU7zRd684ozI3KE0PS3KQRSftz4
 ULihAtqiMc7qh0ErG61lrWA374+OKxg/oze9XiGw6J3GoTARXhwivHObulfQ3kW1rG4k
 /BW8gOY+yIkBJDDubmaHFCul99qlu4Pr6pgq+n7er8Ib8IrmiugBDGKhwtzRpVUH/aLC
 6QHEPMI+s1+XEbwL0U29Pa8BN5gDRqMzzWIBG0sXPybXK+bYWInFQ7/qCTecONYTfwly
 lWzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ARVRPtmt
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.4
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
Cc: John Stile <johns@msli.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.2
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.3
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 88032f05c1..b015dce4ac 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.1
-sha256  6e9f6a5c47fcd8a763cfa26f1ca6eedf1e534992224a01d6c1ab8abb154af972  dhcpcd-10.0.1.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
+sha256  ced5bbde8da3726eac77b9e77e4f31a89c9849d811ef8a2c749664fc5f55a718  dhcpcd-10.0.4.tar.xz
 # Locally calculated
 sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 82efe10ef9..a194bce323 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.0.1
+DHCPCD_VERSION = 10.0.4
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
