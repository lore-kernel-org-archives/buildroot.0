Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8400BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 20:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1434A4025F;
	Sat, 31 Dec 2022 20:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1434A4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_OQUaNShK-h; Sat, 31 Dec 2022 20:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BA14044D;
	Sat, 31 Dec 2022 20:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67BA14044D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050361BF344
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1324401A3
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 20:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1324401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dO0NgNZwhlQP for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 20:17:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432BD40158
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 432BD40158
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 20:17:07 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 k7-20020a056830168700b0067832816190so15023037otr.1
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 12:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YmZ9QuA0B4j4Cq4m70q/vxJsaZHwvGhWagFj8E+M4zc=;
 b=RYS/6qLNqhUJ9+jXyRDq+pvIJ+8FpPTQACEvzxRrMep5SJQVW2PFC/OZZjJsptcAG2
 2Oc9bClOasWICVkqrNL0Ad4r0+7zuSHP8Yvz1XdUHyycLzXow9EEpzAVnD9G7/bDzdgz
 12y5q0dbQtqHQGmo9RBPcvvnGY1jsPNMPsYGTxty2jEJbWHlEXdVugGsuZWNPanff7fG
 Hva/a0sOIj7TRh3qjFSIkJtv7NfqxFnuzzIdfGPl6HOILCZMAmeQcD3yTYtW71GrZ79k
 zsHOa8VdkkjyUzQN0G5JLp/Iu9bI3KPXt9cdepOuD3+4eH+ip/aRnN0Q7pWKskMCyCHh
 Srkw==
X-Gm-Message-State: AFqh2koiseQezFl92KFCvMf8Sj3SotsYeAR6h01FVzEa7GT7KoLUoiGr
 6qQeRfzIBeqzu0Q4P8cPH4v/VYrlK3A=
X-Google-Smtp-Source: AMrXdXu58ulc3Tb9yls/iXCPT/wTs0l9vaXsONLXYRJQi0zGrVAt8MIU+/wkXzqMgyFndw38IvqDIA==
X-Received: by 2002:a9d:12f8:0:b0:670:893d:a74 with SMTP id
 g111-20020a9d12f8000000b00670893d0a74mr19168210otg.10.1672517826186; 
 Sat, 31 Dec 2022 12:17:06 -0800 (PST)
Received: from casantos.remote.csb ([179.181.73.41])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a0568301d8700b00684074fbce6sm3984109oti.54.2022.12.31.12.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 12:17:05 -0800 (PST)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:17:00 -0300
Message-Id: <20221231201700.3105911-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YmZ9QuA0B4j4Cq4m70q/vxJsaZHwvGhWagFj8E+M4zc=;
 b=o4NmE7YMta8Bqm6jgUs4PXKeHDmKxrC0xGrolYhQdVjeivxzfyRzq2adHOR//5ZHfF
 6v7mqrHDQXYA/eXFN0YjZ+/7ioelMAyPyJovRPH5KjUgCxzy6a3FAbVcNb9c3JZtBfEL
 LCzlYblq59dL5JYjSZTm1xID1cS5GANSRwhk0FGPssICFnp8T77Ilcy/xDko2q/jrhyx
 YPYDs6VvcxbOldPHCboYXunoWJ5oW+KK0zMMJEdlPB2AmIztSJywP4T8hdOanwL9OqBG
 C3igg33mbCp+ADcvVkRKGK8aXeHOOpn/3qpD0byNgOe3dIfl5VZJaqf930/o9cc/KF9j
 KZ1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o4NmE7YM
Subject: [Buildroot] [PATCH] package/qemu: allow building only the tools
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Commit 44be514b21fd94096702b80c62d46c31d72f15a5 mistakenly forced to
always build at least user or system emulation but it must be possible
to choose only the tools (e.g. for a guest VM image).

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0f9e353510..435e92781c 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -27,7 +27,6 @@ menuconfig BR2_PACKAGE_QEMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_QEMU_SYSTEM if !BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
