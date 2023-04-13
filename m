Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474A7C77B6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 17:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC5D1429D1;
	Thu, 13 Apr 2023 17:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC5D1429D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwVfDLcd4JYO; Thu, 13 Apr 2023 17:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04322405CD;
	Thu, 13 Apr 2023 17:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04322405CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24F051BF2B1
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F10FA42703
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F10FA42703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2kqH1N1eKdS for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 17:36:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B393C426F8
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 17:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B393C426F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D0AC84085; Thu, 13 Apr 2023 17:36:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 19:36:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b40a2cc3912a039d29231241daca477790e366cd
X-Git-Newrev: 131cb09c79ffe155c51444b5b86145d9e184c304
X-Patchwork-Hint: ignore
Message-Id: <20230413173643.9D0AC84085@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu: fix post-image
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

commit: https://git.buildroot.net/buildroot/commit/?id=131cb09c79ffe155c51444b5b86145d9e184c304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last-minute changes to d9b244d8a3c8 (board/qemu: define start qemu
script outside of post-image script) were not tested before being
pushed, so they introduced a bug.

As Arnout put it:
    [...] multiple expressions need a -e to interpret them as
    expressions (now they're interpreted as file names).

Fixes: d9b244d8a3c83b39f67444f36b21a88cbaf4547b

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Knight <james.d.knight@live.com>
---
 board/qemu/post-image.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index ccd0fb78c9..763287ca39 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -41,10 +41,10 @@ case ${DEFCONFIG_NAME} in
     ;;
 esac
 
-sed "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
-    "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
-    "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
-    "s|@HOST_DIR@|${HOST_DIR}|g" \
+sed -e "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
+    -e "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
+    -e "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
+    -e "s|@HOST_DIR@|${HOST_DIR}|g" \
     <"${QEMU_BOARD_DIR}/start-qemu.sh.in" \
     >"${START_QEMU_SCRIPT}"
 chmod +x "${START_QEMU_SCRIPT}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
