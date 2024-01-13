Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61689C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2157160E09;
	Sat, 13 Jan 2024 21:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2157160E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-7O_Vz8YUrV; Sat, 13 Jan 2024 21:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737A660EEE;
	Sat, 13 Jan 2024 21:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 737A660EEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73EB01BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D27A48303C
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D27A48303C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xcfw8fiH4KhV for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DB318302F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB318302F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B83B8605F; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:02:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4267375218e211148b16bca3b4decb45a5ed9fcf
X-Git-Newrev: 4e8c88382dc92f2b52a16e46b324dc9999e2e9dd
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.0B83B8605F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/broadcom/northstar: fix building
 custom images
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
Content-Type: multipart/mixed; boundary="===============1864004380489415242=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1864004380489415242==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4e8c88382dc92f2b52a16e46b324dc9999e2e9dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Custom Northstar images allow installing (flashing) them using vendor UI
or CFE bootloader.

The change of DTS files paths ("broadcom/" prefix introduction in Linux
6.5+) prevented post script from generating them.

Adjust post-image.sh to deal with new paths.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/broadcom/northstar/post-image.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/broadcom/northstar/post-image.sh b/board/broadcom/northstar/post-image.sh
index b6150fc539..559ed8bf4b 100755
--- a/board/broadcom/northstar/post-image.sh
+++ b/board/broadcom/northstar/post-image.sh
@@ -27,8 +27,9 @@ build_trx() {
 	rm -f $images/zImage.$device.lzma
 }
 
-devices="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+devices="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([^"]*\)"$/\1/p' ${BR2_CONFIG})"
 for device in $devices; do
+	device="${device#broadcom/}"
 	case "$device" in
 		"bcm4708-smartrg-sr400ac")
 			build_trx "$1" "$device"

--===============1864004380489415242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1864004380489415242==--
