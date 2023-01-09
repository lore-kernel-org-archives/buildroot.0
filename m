Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39721C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA688199D;
	Mon,  9 Jan 2023 07:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBA688199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaOc5PMHzCUm; Mon,  9 Jan 2023 07:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179B0817A4;
	Mon,  9 Jan 2023 07:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179B0817A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 787351BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 517B6401B4
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 517B6401B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kz86XiTLuimW for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:43:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B2EA401AF
Received: from mfwd11.mailplug.co.kr (mfwd11.mailplug.co.kr [14.49.36.98])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B2EA401AF
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:43:12 +0000 (UTC)
Received: (qmail 4738 invoked from network); 9 Jan 2023 16:43:09 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 16:42:56 +0900
Received: (qmail 707342 invoked from network); 9 Jan 2023 16:42:54 +0900
Received: from unknown (HELO sslauth39)
 (cherniaev.andrei@kairo.space@211.252.87.61)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 16:42:54 +0900
From: AndreiCherniaev <cherniaev.andrei@kairo.space>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 16:42:02 +0900
Message-Id: <20230109074202.12012-2-cherniaev.andrei@kairo.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] board/pc/post-build.sh: allow to use grub
 config file
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

Allow to use grub config file with set timeout not default. Before this set timeout always was 5s and can't be changed, any set timeout from BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC was ignored

Signed-off-by: AndreiCherniaev <cherniaev.andrei@kairo.space>
---
 board/pc/post-build.sh | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
index c76dee2676..8538faa7eb 100755
--- a/board/pc/post-build.sh
+++ b/board/pc/post-build.sh
@@ -9,7 +9,22 @@ if [ -d "$BINARIES_DIR/efi-part/" ]; then
     cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
 else
     cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
-
     # Copy grub 1st stage to binaries, required for genimage
     cp -f "$TARGET_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
 fi
+
+# When post-build script is runing $BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC is unset, so parce Buildroot .config file again
+GRUB2_BUILTIN_CONFIG_PC="`grep --only-matching --perl-regex "(?<=BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC\=).*" $BR2_CONFIG`"
+# Using the native shell prefix/suffix removal feature (see also qstrip)
+GRUB2_BUILTIN_CONFIG_PC="${GRUB2_BUILTIN_CONFIG_PC%\"}"
+GRUB2_BUILTIN_CONFIG_PC="${GRUB2_BUILTIN_CONFIG_PC#\"}"
+if [ -z "$GRUB2_BUILTIN_CONFIG_PC" ]; then #if user doesn't use his .config for grub
+    # Set time to wait 5 s for keyboard input before booting by default
+    sed -i -e '1 s/^/set default="0"\nset timeout="5"\n\n/;' "$TARGET_DIR/boot/grub/grub.cfg"
+#else if user use his .config for grub
+# to configure bootloader put something like
+#  set default="0"
+#  set timeout="5"
+# to your file located $BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC 
+# More info https://www.gnu.org/software/grub/manual/grub
+fi
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
