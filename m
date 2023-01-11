Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9322EC6379F
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 07:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A48182014;
	Wed, 11 Jan 2023 07:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A48182014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEN5o3g4cZpF; Wed, 11 Jan 2023 07:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C4282012;
	Wed, 11 Jan 2023 07:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86C4282012
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43FFA1BF2C4
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F65B82012
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 07:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F65B82012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9owxUIySa8Cb for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 07:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F60682000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F60682000
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 07:55:19 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d17so14184797wrs.2
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 23:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Fs041vAktMGjBzWbogjQUVhKxGHq5pcaZTAGcXYl5Y=;
 b=CvAfAvjTO5MGGC1iacWS4PA1JtIusHs+IdBgvViUPY/W1ysKFO45IFIou+9TfxDObZ
 9CTc44hrL+r0IWhL4YzS1CqhKVXZDZqKr4gR4eiQ3D+N4C8j1+i0uYaU01n17vuU1L7H
 edCZyHnT1S1M6lc7Oqek+IWuZlT7Xz9K2eiEn9M43bW2EmlYrSQ5Jpuyv0BAljVTX3yH
 A3YlBXXd0Mn3kZ1ExHuHa5GWu3VKCjUYbulQ7vvC8oPKDNPvdYznqmddK2fcqdIKrEgT
 WleG/D+MVvbWqdojwktUTp2g5npd28rzNy2bQ33dhbri1Zm9vdTt7kUtm5zFb673ANGH
 3eWA==
X-Gm-Message-State: AFqh2komO9Zj4927V3koXL5VBr72kIhEqYq4zx29nA5BzBnJQbO6lqN7
 hKP/2xWvoHJZwoAHbDusB4vPFXpaOGvdOXtu
X-Google-Smtp-Source: AMrXdXse802TOvFbZBU5O5E43orIOTrX4BdSWsLzxWXq1QDzRQHOx64hlxNbgSaBnyPk5utXq1MkGg==
X-Received: by 2002:a5d:5085:0:b0:2bb:de29:5c16 with SMTP id
 a5-20020a5d5085000000b002bbde295c16mr7622734wrt.71.1673423717096; 
 Tue, 10 Jan 2023 23:55:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c9ae:a8ee:206a:9211])
 by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b002bbe7efd88csm8583684wrb.41.2023.01.10.23.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 23:55:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jan 2023 08:55:14 +0100
Message-Id: <20230111075514.8131-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Fs041vAktMGjBzWbogjQUVhKxGHq5pcaZTAGcXYl5Y=;
 b=kXdTXBNi+HEXQgH0CMxiD/Cg1s961Me8r46TWVh3vn7KH6PQ9ZZPMtoQEgUUqwDxbw
 WUbQnkO+Kx6LL+UbeTYylgJIw1XfQ0aiKD/qcFsGyd2PIK/4Ss1uAbLCeRSk1lY2k/2b
 cBi6xm9fPMaYMaB32qlw5BgpXqEnIE91YofH8zq90w1boofE9EAyU5snadeiuHwaj+dK
 3E+RkHTHTsJ9PN5722RMBnSYjPVIW2oR3Veil32xqJgBsje/a0zKy5NYRBXOZu+kn8j4
 NIzQ599HPAC5DNQBOSpUU20L/01XJ/wOiBqkxY5kddNrjlaDgHDkxa5Tzrf5GXHZTZg2
 W4Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bgdev-pl.20210112.gappssmtp.com
 header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=kXdTXBNi
Subject: [Buildroot] [PATCH] DEVELOPERS: remove my entry
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's been a while since I've even used buildroot at all and I don't
really have any spare cycles to spend on maintaining its packages.
Let's face reality and drop me from the DEVELOPERS file.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 DEVELOPERS | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..8e1d68c026 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -283,17 +283,6 @@ F:	package/ttyd/
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
 
-N:	Bartosz Golaszewski <brgl@bgdev.pl>
-F:	package/autoconf-archive/
-F:	package/doxygen/
-F:	package/libgpiod/
-F:	package/libserialport/
-F:	package/libsigrok/
-F:	package/libsigrokdecode/
-F:	package/libzip/
-F:	package/pulseview/
-F:	package/sigrok-cli/
-
 N:	Baruch Siach <baruch@tkos.co.il>
 F:	board/solidrun/clearfog_gt_8k/
 F:	configs/solidrun_clearfog_gt_8k_defconfig
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
