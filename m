Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E65BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAF3815CD;
	Sun, 19 Jun 2022 16:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAF3815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhRP9mmGRk68; Sun, 19 Jun 2022 16:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3011681357;
	Sun, 19 Jun 2022 16:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3011681357
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF9DC1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B919D404C9
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B919D404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GvWoT57llmB for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 068074010E
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 068074010E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AFCEB87425; Sun, 19 Jun 2022 16:35:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:39:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9bba9f1062b25f0117b5eefa5d415f75609d251a
X-Git-Newrev: 83adec71b9380c91a34df992157b7a25ee46d7ca
X-Patchwork-Hint: ignore
Message-Id: <20220619163529.AFCEB87425@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/post-build.sh: remove
 unnecessary if
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

commit: https://git.buildroot.net/buildroot/commit/?id=83adec71b9380c91a34df992157b7a25ee46d7ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all of the extlinux.conf files have been removed,
it is no longer necessary to check if the file exists.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/zynqmp/post-build.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 7387576414..0713bd1b05 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -7,15 +7,10 @@ BOARD_DIR="$(dirname $0)"
 CONSOLE=$2
 ROOT=$3
 
-FILE=${BOARD_DIR}/extlinux.conf
-if test -f "${FILE}"; then
-  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
-else
-  mkdir -p "${BINARIES_DIR}"
-  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
 	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
 	__HEADER_EOF
-fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
