Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47B4C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 12:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7398132D;
	Sun, 24 Mar 2024 12:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNZHlqkYKcjI; Sun, 24 Mar 2024 12:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 867258132F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867258132F;
	Sun, 24 Mar 2024 12:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3DDE1BF32A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B094A60780
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 12:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcznyCr1ohbN for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 12:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4508460597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4508460597
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4508460597
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 12:39:33 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d48d75ab70so52460071fa.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 05:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711283970; x=1711888770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s7U9zTp7qKVkr1zpaXFbLgvTCFZnbKNSJI0LILtFeI8=;
 b=m2Mb/hGtYOpWOT/y+7gskwFpHQf3+oxEIGl6PyyxAvC2+tW7jyE65DnrM62IJxfqbI
 RjowWGgdeVTDraV3xwLVnbLvcswDGumFQ7q1Viu99EhtveEAbR9V5eeYPwJoqvd93Eis
 54nJD3j8H6yoi2ujelMB8V/xDjDoRxQjhJBj9x6eJx1biM95+YT/qOZQCQ6U6p85dEfB
 qJhnJ5Rw2pmvL+rYl4HWnrucmI8jpfmHjDqdckeozsQzL7KN1XO5InmNYHwsRj0tFWmB
 dLDRdIs1RfqIKa5rN6cffkVhFTAUY70AZJt3NCZNDvVQbkrjdddYk5pyknZ7jjS8XxwS
 pQNQ==
X-Gm-Message-State: AOJu0Yxl2mMg1/57yVJgftPGOZd561kEqS5MdAFGtpeimUYz76gD4+1Z
 eOS3UpKVx2NZGK+/trIToZnkif2EH9h1BZGnHI/geBC2szoYKeLwLRJw4abS
X-Google-Smtp-Source: AGHT+IGw3RpDfHugX9qTWMdidn0h52motQPLXvih3L70PHuOwZKQI3vgQ/5UlAqLR2QqbmEJWRMuug==
X-Received: by 2002:a2e:310a:0:b0:2d3:d9fd:568d with SMTP id
 x10-20020a2e310a000000b002d3d9fd568dmr2867587ljx.8.1711283970304; 
 Sun, 24 Mar 2024 05:39:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c358a00b0041488691eb1sm1272361wmq.17.2024.03.24.05.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 05:39:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 13:39:26 +0100
Message-ID: <20240324123926.584023-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711283970; x=1711888770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s7U9zTp7qKVkr1zpaXFbLgvTCFZnbKNSJI0LILtFeI8=;
 b=VKtCIdKe86/i0XwgX3AgX0TVm4S61o4cczcyA73J3HLRw80Zyic4dMy3zYGK6shnlC
 GvivDurpvSQ+f1i2iOu9tGNh5pnvRKnKp7ApE8I2Vmb2QVciRZcScA0rJ7O5/bOfUxzJ
 t9LpBQWaMiPatwYvMqZYZfXae177R9L8Sp5OFR2d421Kwov04YgavOotR04p0urRb8RL
 XbVbsBegg8yYtKEP9fThSvBulvShaRdX8vs7gbrBYF/v1pUvBuB5sRgpscm5X1G2WtCT
 ubqMOBJFqc/fJPTrXKbCgnnbU8NZ6Hue7ivRe62bgLJ2d30H2B7A/n5bPkzimEUXOfPs
 IJTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VKtCIdKe
Subject: [Buildroot] [PATCH 1/1] package/mpc: bump to version 1.3.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.inria.fr/mpc/mpc/-/blob/1.3.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpc/mpc.hash | 2 +-
 package/mpc/mpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index 0520a7b9b4..f69a5b66ca 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459  mpc-1.2.1.tar.gz
+sha256  ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8  mpc-1.3.1.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 364e4c3c85..467bed4dbe 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.2.1
+MPC_VERSION = 1.3.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
