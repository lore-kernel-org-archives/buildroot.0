Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E830EC8734
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0612F80F04;
	Thu,  7 Sep 2023 15:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0612F80F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzkIQpDsZCZs; Thu,  7 Sep 2023 15:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F2483C44;
	Thu,  7 Sep 2023 15:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F2483C44
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0436A1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8491641DE0
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8491641DE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uz4LKKaFUebN for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C4A41DEC
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C4A41DEC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2CB086A1E; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 15:04:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80b56887006cfba50833881dc31f045d494af185
X-Git-Newrev: 875ab7d9e3d32990cd07fbab3c68f31dfa9927a4
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.D2CB086A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/microchip/mpfs_icicle: update
 post-image script
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

commit: https://git.buildroot.net/buildroot/commit/?id=875ab7d9e3d32990cd07fbab3c68f31dfa9927a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hss-payload-generator cannot find where u-boot.bin is when looking
for it using the config.yaml. Update syntax issues and working
directories. Fix the post image script to allow an image to get built.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/microchip/mpfs_icicle/post-image.sh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/board/microchip/mpfs_icicle/post-image.sh b/board/microchip/mpfs_icicle/post-image.sh
index 04b34bbd40..596bb21d78 100755
--- a/board/microchip/mpfs_icicle/post-image.sh
+++ b/board/microchip/mpfs_icicle/post-image.sh
@@ -1,8 +1,13 @@
-#!/bin/sh
-HSS_PAYLOAD_GENERATOR=${HOST_DIR}/bin/hss-payload-generator
-MKIMAGE=${HOST_DIR}/bin/mkimage
+#!/bin/bash
+set -e
 
-"${HSS_PAYLOAD_GENERATOR}" -c board/microchip/mpfs_icicle/config.yaml "${BINARIES_DIR}"/payload.bin
-cp board/microchip/mpfs_icicle/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
-(cd "${BINARIES_DIR}" && "${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb)
-support/scripts/genimage.sh -c board/microchip/mpfs_icicle/genimage.cfg
+HSS_PAYLOAD_GENERATOR="${HOST_DIR}"/bin/hss-payload-generator
+MKIMAGE="${HOST_DIR}"/bin/mkimage
+BOARD_DIR="$(pwd)"/"${0%/*}"
+
+pushd "${BINARIES_DIR}"
+"${HSS_PAYLOAD_GENERATOR}" -c "${BOARD_DIR}"/config.yaml payload.bin
+cp "${BOARD_DIR}"/mpfs_icicle.its "${BINARIES_DIR}"/mpfs_icicle.its
+"${MKIMAGE}" -f mpfs_icicle.its mpfs_icicle.itb
+popd
+support/scripts/genimage.sh -c "${BOARD_DIR}"/genimage.cfg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
