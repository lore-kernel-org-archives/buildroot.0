Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C61CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 17:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2280A81383;
	Sat, 19 Nov 2022 17:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2280A81383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVd4bWmRiVCK; Sat, 19 Nov 2022 17:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D1081330;
	Sat, 19 Nov 2022 17:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D1081330
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC921BF292
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E548132A
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E548132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7VIEsRQBKE7 for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E2AE81330
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E2AE81330
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i64-20020a1c3b43000000b003d016c21100so271481wma.3
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 09:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCl9u6cWpGnMnj+/RnZJy3CXSB4mdDb0uHNJTF2mdaM=;
 b=S/mTI2MSKhMhTlQNzQ6hVtx2UB0qkkIBFsRTsEmQ2aVW82c5Y/tIlVioCkFtUAZTQ6
 ZnvpilYy/ei8/D5ZT8VeoKYfMoZcflbMwmxDjzNrjN4VgL68c/dvmBC2jK35+c1iLS4u
 GC6+Esw3xToCCKeW6pJfJX8QzBlVXIA1Hru2yb8yqxA6B3bqMAgpxbHXoXdYTuMp3hVO
 GuO+391nXfmsQucSoCBeMMjpjNsRk2QSkqnZsw6poZnu8kWqWrzW9ySjoThCfwo8R3X5
 fiQF4V5FOjqJOL9ys5P3p5R8hHcA8X14qUQwX8DicQBzSavlVUvV/Ot8ERMDy31Sv0dG
 0gOw==
X-Gm-Message-State: ANoB5pmoIehzTGfCoFp0tDd+axRUX73m2QG20AeJPFVJj2ECnM19SAdK
 wX2xZi2NuqEwGCMG9Of9yCunFfWfvEY=
X-Google-Smtp-Source: AA0mqf40cItBGAw28vANZUvuh86UplWAEuvpMYOuPsaoaHIhGrAQzeKWAviH5qoO7NGio50oRxK0/A==
X-Received: by 2002:a05:600c:4fc1:b0:3cf:e95b:fe7a with SMTP id
 o1-20020a05600c4fc100b003cfe95bfe7amr1446002wmq.142.1668878173816; 
 Sat, 19 Nov 2022 09:16:13 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003cf4ec90938sm8854383wmo.21.2022.11.19.09.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:16:13 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 19 Nov 2022 18:15:49 +0100
Message-Id: <20221119171549.26487-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221119171549.26487-1-francois.perrad@gadz.org>
References: <20221119171549.26487-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCl9u6cWpGnMnj+/RnZJy3CXSB4mdDb0uHNJTF2mdaM=;
 b=qMU2j5rDGk20gajKJ5vvkojo5DLREvV9QAJ5Mm6aZLbEl+8fRpVjbx90maUZV8BY0w
 SP3J1hOOMvw7pguM9ASI+FGl668Bxq77BR1t3aKxOCHTUXY/ZDzm7w1zNNYCoZncGjbk
 6NeU9aVLesuDyBAI0AsWCh8GsZxIm860ZRrx21JyKzQJG8JWV+PcmbH1nCDMGyWvpAhA
 cBIEjfTDXnXOkRggUDP64w/Xz5+B2V1lZIc2Bnfc8elK6QlHeMYqSetvKAHDB72GBZCD
 y/LJH+RQpQgghFzTB2pRG1z1bctWJW6WvW03iKtIGAs6szA1IoAOsinDMcW/YbhO+gA4
 zL5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qMU2j5rD
Subject: [Buildroot] [PATCH 3/3] board/freescale/ls1028ardb: more
 documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/freescale/ls1028ardb/readme.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 2dd2e2d84..cfd1c8c49 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -8,6 +8,16 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
   - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
   - https://www.nxp.com/LS1028A
 
+for the software NXP LSDK (Layerscape Software Development Kit), see
+  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
+
+the components from NXP are:
+  - rcw, LSDK 21.08
+  - atf (fork), LSDK 21.08
+  - uboot (fork), LSDK 21.08
+  - cadence-dp-firmware (blob), LSDK 20.12
+  - linux (fork), LSDK 21.08
+
 Build
 =====
 
@@ -67,3 +77,11 @@ The Cadence DP (Display Port) firmware must loaded from uboot with the following
   Loading hdp firmware from 0x0000000080000000 offset 0x0000000000002000
   Loading hdp firmware Complete
   => boot
+
+The interfaces of Ethernet switch (Felix DSA) are bring up with the following commands:
+
+  ip link set eno2 up
+  ip link set swp0 up
+  ip link set swp1 up
+  ip link set swp2 up
+  ip link set swp3 up
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
