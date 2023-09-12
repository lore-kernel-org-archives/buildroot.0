Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3DDCA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F338160E03;
	Tue, 12 Sep 2023 06:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F338160E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZrFpg33bVDN1; Tue, 12 Sep 2023 06:27:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6EA610C3;
	Tue, 12 Sep 2023 06:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6EA610C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1E9A1BF27E
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C2E581F8A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C2E581F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHDqNoNlkpcw for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:27:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD17681F38
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD17681F38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3BF786D74; Tue, 12 Sep 2023 06:27:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 08:04:34 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 575aa623698f83c3ba942236e46e6c8570c146fa
X-Git-Newrev: 2ca34cdf187ea06745b791987127a90a34e97d4a
X-Patchwork-Hint: ignore
Message-Id: <20230912062709.C3BF786D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] board/raspberrypi: enable
 hdmi console for systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ca34cdf187ea06745b791987127a90a34e97d4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Most of the users use HDMI console on RPi and with increasing popularity
of systemd they face a trouble.
systemd doesn't use /etc/inittab, enable getty@tty1.service instead.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c415820662661a6ef3cc8b2d9ea1a79791c1d7eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
