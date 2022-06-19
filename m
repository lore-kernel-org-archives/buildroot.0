Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27C5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ADCC82422;
	Sun, 19 Jun 2022 16:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ADCC82422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DL_0pmm8MOfv; Sun, 19 Jun 2022 16:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E020C81971;
	Sun, 19 Jun 2022 16:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E020C81971
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17D6D1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1E444010E
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1E444010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c78dkV00mPp1 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:47:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD256400CC
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD256400CC
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8FCA787422; Sun, 19 Jun 2022 16:35:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:39:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 793ee1011e84bd79fa3d146dbe6c14c7fba39648
X-Git-Newrev: 32fcadba3ed75ad2449693258e66b089af5eaa01
X-Patchwork-Hint: ignore
Message-Id: <20220619163529.8FCA787422@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp/post-build.sh: auto-generate
 extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=32fcadba3ed75ad2449693258e66b089af5eaa01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the
extlinux.conf file, so developers will only need to modify the
board_defconfig file to change the console and boot file system locations.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/zynqmp/post-build.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 9fd8bbf2c8..7387576414 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -4,5 +4,18 @@
 # in the binaries directory
 
 BOARD_DIR="$(dirname $0)"
+CONSOLE=$2
+ROOT=$3
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
+FILE=${BOARD_DIR}/extlinux.conf
+if test -f "${FILE}"; then
+  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
+else
+  mkdir -p "${BINARIES_DIR}"
+  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
+fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
