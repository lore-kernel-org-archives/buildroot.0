Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86C3EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B45B41482;
	Mon, 21 Aug 2023 20:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B45B41482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8iDYeKu5BVIf; Mon, 21 Aug 2023 20:17:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9091841480;
	Mon, 21 Aug 2023 20:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9091841480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE5E1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 863F9414C3
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 863F9414C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yu9JVZwUIQ3 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013514160A
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013514160A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDFF186023; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 12:46:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe42fa8017b10602ed57ee066f8a9710f0f8e7ca
X-Git-Newrev: c415820662661a6ef3cc8b2d9ea1a79791c1d7eb
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.DDFF186023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/raspberrypi: enable hdmi
 console for systemd
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c415820662661a6ef3cc8b2d9ea1a79791c1d7eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Most of the users use HDMI console on RPi and with increasing popularity
of systemd they face a trouble.
systemd doesn't use /etc/inittab, enable getty@tty1.service instead.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/post-build.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index b24256fcea..38fdc80734 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -8,6 +8,11 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
     grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
 	sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
+# systemd doesn't use /etc/inittab, enable getty.tty1.service instead
+elif [ -d ${TARGET_DIR}/etc/systemd ]; then
+    mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"
+    ln -sf /lib/systemd/system/getty@.service \
+       "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"
 fi
 
 # exnsure overlays exists for genimage
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
