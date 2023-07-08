Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16451EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B319415F1;
	Sat,  8 Jul 2023 16:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B319415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9X9mgUhKHt4; Sat,  8 Jul 2023 16:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A714415F2;
	Sat,  8 Jul 2023 16:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A714415F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 969851BF47A
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E4AA60B42
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 16:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4AA60B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6V1fmO0nQwg7 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 16:36:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E2860B38
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37E2860B38
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 16:36:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80C29A4C0C68
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 18:36:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41128)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIAvM-000729-0x
 for buildroot@buildroot.org; Sat, 08 Jul 2023 18:36:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 18:36:44 +0200
Message-Id: <20230708163644.710352-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688834204;
 bh=kg5QI6PyYjRi2qFFeZEZIyTuybQeBJ9dVb25E7pz9kI=;
 h=From:To:Subject:Date:From;
 b=Gd7Mb4wxSl9UYH4EfzT1RJGw2UI2c/Rpri/qBU4Ph1DXistDPoBoH9OMzAx3d11Z0
 yimI6mJrmlbELoyCun6XrggStbkNQVRzVXs5ddf60lL0f2KiR5I0qCzkurir1uMu1Y
 f9obhHrWLymUbBExfuS3k8GnF6Q0TL1Cg0sOc3iIS9ZZQoaiIl003JZ620tLr6bwM1
 jJM+OMt4FSVX6bKeBD7ys7huoP+GFgod91x4TJZ6TEasmPkToAtXP0KmJzMCEFO8WA
 RWXK5AUJP5fE2lEARIML6xlfzWLSrjHV94Csdh+g4+2nkxG6XOZZ0EMMqsgCWeKlHD
 ygroZ1qpJh/QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Gd7Mb4wx
Subject: [Buildroot] [PATCH 1/1] fs/ubifs: increase logical eraseblock size
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

This value is unchanged since 2008 and too small for current images.

Fixes:
http://autobuild.buildroot.net/results/f72/f72918d63510b170e5da01bfa9c247cf9dcf507f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
There is no particular reason for the new value, it was just the first
value I found working for this defconfig while increasing it in steps
of 0x10000.

 fs/ubifs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index e79ab9a17e..bad26bf99f 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -7,7 +7,7 @@ if BR2_TARGET_ROOTFS_UBIFS
 
 config BR2_TARGET_ROOTFS_UBIFS_LEBSIZE
 	hex "logical eraseblock size"
-	default 0x1f800
+	default 0x3f800
 	help
 	  Logical eraseblock (LEB) size. The value provided here is
 	  passed to the -e/--leb-size option of mkfs.ubifs.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
