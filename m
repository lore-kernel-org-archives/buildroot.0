Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19458C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 08:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF94380FF7;
	Fri, 23 Aug 2024 08:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-3tTZA-zwtI; Fri, 23 Aug 2024 08:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6ACB81337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6ACB81337;
	Fri, 23 Aug 2024 08:02:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD9D1BF3C2
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D92C605C5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLDiI3PUR0rV for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 08:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C294605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C294605C3
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C294605C3
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 08:02:30 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A2F52C25BF
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 07:56:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45056C000B;
 Fri, 23 Aug 2024 07:56:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1shP9N-0062c3-26;
 Fri, 23 Aug 2024 09:56:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 09:56:00 +0200
Message-Id: <20240823075600.1440000-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] board/qemu/patches/arm-trusted-firmware: add
 v2.10 hash
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/7644930127
ERROR: No hash found for arm-trusted-firmware-v2.10-git4.tar.gz

Commit d037d9c2d63e9cd47b (configs/qemu: Update defconfigs to Linux 6.6.32)
enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES, but forgot to take into
consideration that qemu_aarch64_ebbr_defconfig uses arm-trusted-firmware
v2.10 since commit 73813c56c8bb (configs/qemu_{arm, aarch64}_ebbr: bump
Linux, U-Boot and TF-A).

Add the hash to fix the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0b99949745..5632db01f8 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
