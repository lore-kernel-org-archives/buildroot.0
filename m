Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F3C6FC57;
	Thu, 13 Jan 2022 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoaoLrVdT06W; Thu, 13 Jan 2022 19:39:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327C56FC60;
	Thu, 13 Jan 2022 19:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2A841BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF55A84C44
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNeZWJViRUxq for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5531484CBB
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 20D7A821EF; Thu, 13 Jan 2022 19:32:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:38:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba46964b85b26b6c6537b6339140b353d3e0bdb3
X-Git-Newrev: dc819438f61c693ffe01cd6827f23372570cb7c6
X-Patchwork-Hint: ignore
Message-Id: <20220113193229.20D7A821EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/spike/riscv64/start.sh: add
 buildroot host dir in PATH
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc819438f61c693ffe01cd6827f23372570cb7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit 0d0f84d2004b04bc93d5ceb58c86640f190e5d78
added the missing host-dtc dependency to riscv-isa-sim.

The spike simulator calls the dtc binary at its startup. The host dtc
command needs to be in the PATH at that time.

This commit add the buildroot host binary directory into the PATH of the
start.sh helper script. It make sure spike will use the buildroot dtc
version. This commit fixes this start.sh script on host not providing
the dtc command. Since the "spike" binary is now in the PATH, the
binary name is also simplified.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/spike/riscv64/start.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/board/spike/riscv64/start.sh b/board/spike/riscv64/start.sh
index 75b1412df8..6fbbced806 100755
--- a/board/spike/riscv64/start.sh
+++ b/board/spike/riscv64/start.sh
@@ -3,9 +3,13 @@
 SCRIPT_DIR="$(dirname "$0")"
 BR_BASEDIR="$(readlink -e "${SCRIPT_DIR}/../../..")"
 
+# spike uses dtc at runtime startup, so make sure buildroot host
+# directory is in the PATH
+export PATH="${BR_BASEDIR}/output/host/usr/bin:$PATH"
+
 # Use Buildroot host spike by default, but allow the caller to
 # redefine another spike binary
-: "${SPIKE:=${BR_BASEDIR}/output/host/usr/bin/spike}"
+: "${SPIKE:=spike}"
 
 exec "${SPIKE}" \
     --initrd "${BR_BASEDIR}"/output/images/rootfs.cpio \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
