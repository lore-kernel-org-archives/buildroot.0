Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72A5D10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A3B2408C8;
	Sat, 26 Oct 2024 14:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AU-AcRYNge8P; Sat, 26 Oct 2024 14:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4795E407B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4795E407B2;
	Sat, 26 Oct 2024 14:06:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E36395C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD9FB40175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brBUjpAm4tnI for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B414018E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6B414018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B05A783BC2; Sat, 26 Oct 2024 14:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:01:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec525c0c583f88d1440cb592c012b59161f5421c
X-Git-Newrev: 408bb87fbbea6f4f7903b229ec0116b73527096e
X-Patchwork-Hint: ignore
Message-Id: <20241026140638.B05A783BC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: fix build failures
 to due RTL8723 file changes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=408bb87fbbea6f4f7903b229ec0116b73527096e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a build failure due to these changes:

Commit 2bb8fb26599302c9cbc69a5aff329a8559c91e48:
rename rtl8723bs_config-OBDA8723.bin -> rtl_bt/rtl8723bs_config.bin

Commit 5a017996c6de64ebd7f7c60e1233a45ba04086ca:
remove rtl_bt/rtl8723d_config.bin

This has been broken since Buildroot commit
4c619e6d87be08d8d9214f630bb89076d75d32e3, which updated linux-firmware
from 20240709 to 20240909.

https://lists.buildroot.org/pipermail/buildroot/2024-October/765934.html

Fixes:

  http://autobuild.buildroot.net/results/8a7f7bac71cfa743ed122b6ca7f6e7389bc2a4ac/

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b48bb80713..9ffd52dff5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -79,8 +79,7 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_bt/rtl8723a_fw.bin rtl_bt/rtl8723b_fw.bin \
-	rtl_bt/rtl8723bs_config-OBDA8723.bin \
-	rtl_bt/rtl8723bs_fw.bin rtl_bt/rtl8723d_config.bin \
+	rtl_bt/rtl8723bs_config.bin rtl_bt/rtl8723bs_fw.bin \
 	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin \
 	rtl_bt/rtl8761b_fw.bin rtl_bt/rtl8761b_config.bin \
 	rtl_bt/rtl8761bu_fw.bin rtl_bt/rtl8761bu_config.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
