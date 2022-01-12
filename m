Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9654C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7030160AD1;
	Wed, 12 Jan 2022 20:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yk9_4u8tAjQC; Wed, 12 Jan 2022 20:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29CAE60D4C;
	Wed, 12 Jan 2022 20:26:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0591BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79B804032D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QGkY4xQKaCL for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:26:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 947204023D
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:26:52 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.121.96])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1C7EF780313;
 Wed, 12 Jan 2022 21:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642019209;
 bh=GQTjNn/Ys79nDKQQucr+NurLi7Nk2H0WKXYVAbnrAEA=;
 h=From:To:Cc:Subject:Date:From;
 b=rZaUo68FigETOC1AjO0kA4FV5qDWAn8G96ZNboqr7jtLOj1gZXSdGd35C7TO/LOOv
 78RSJ2nRQV8e9kIwd8l10+JgVOWq+o3v4uiYbOeZNerFicI2q8mKBjXRiaSjmcz8Vc
 vqunqgO1qzs5Q2P76fExTlcrCZn459Wd4FZ8LoURIojcZQbFqlleL7rz3aGfY7s9vO
 Ug/fzWG3y1L2ETCFraKok0oUW4S7RmXp3VS+8aVN7a1OEPuIFsnwsLsd9j01NEcAJd
 SIMIbe/LTYKPLuEh+9a2++4C+dvoBZlZhFgKIVDzXLa9EO6tdox7pfTgr9bleqHPKk
 OQS+oMJRUnhtg==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 21:26:40 +0100
Message-Id: <20220112202640.7064-1-ju.o@free.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] board/spike/riscv64/start.sh: add buildroot
 host dir in PATH
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
