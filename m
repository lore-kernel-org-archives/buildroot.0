Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70912C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1594A40B85;
	Sat, 28 May 2022 21:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd9qpG2JhUtD; Sat, 28 May 2022 21:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BCD40B80;
	Sat, 28 May 2022 21:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D0861BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6921340B80
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpvKKXQlAxwK for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:35:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95E840905
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:35:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4FCE6863EC; Sat, 28 May 2022 21:24:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 23:35:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ae4e99aa9e36ca4cf51a853b5b1f74574bd78af4
X-Git-Newrev: 727ca56d1426171052ccdc39e33dd72adbbbe1cf
X-Patchwork-Hint: ignore
Message-Id: <20220528212419.4FCE6863EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware:
 install all RTL_RTW88 blobs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=727ca56d1426171052ccdc39e33dd72adbbbe1cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rather than installing just the three blobs mentioned explicitly in the
.mk file, use a wildcard to install all blobs. At the time of this
writing, this matches the following:

-rw-r--r-- 1 arnout arnout  29K Mar  9 13:28 rtw8723d_fw.bin
-rw-r--r-- 1 arnout arnout 136K Mar  9 13:28 rtw8821c_fw.bin
-rw-r--r-- 1 arnout arnout 148K Mar  9 13:28 rtw8822b_fw.bin
-rw-r--r-- 1 arnout arnout 198K Mar  9 13:28 rtw8822c_fw.bin
-rw-r--r-- 1 arnout arnout 142K Mar  9 13:28 rtw8822c_wow_fw.bin

I.e. rtw8821c_fw.bin and rtw8822c_wow_fw.bin were missing.

Although including all blobs nearly doubles the size, it still totals to
just 660K which wouldn't warrant making more refined sub-options.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0c725737d0..64d096df14 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -154,9 +154,7 @@ endif
 # rtw88
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88),y)
 LINUX_FIRMWARE_FILES += \
-	rtw88/rtw8723d_fw.bin \
-	rtw88/rtw8822b_fw.bin \
-	rtw88/rtw8822c_fw.bin
+	rtw88/rtw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
