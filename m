Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1539EE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD71A610E7;
	Wed,  4 Feb 2026 17:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2o9Xzahn-nl; Wed,  4 Feb 2026 17:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC5D610F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224824;
	bh=iZzHgQXzaSbRiwt8z+B0d0MBLG/Mlnljn8S9dgVbYBY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iJIMrSEHB+OqFRnxJSX2E+72YLTsI+/q9dTD4MThjwCx9tHz3M8SNb5RggfOqMiMV
	 t+hBRPnOJwy+rFPM1b1QSm/QV6x0zVMHqxMWY3S9ABJexsey6ZPshqclvyjGCADjLH
	 /RZ1UPzqm5BAcLmAJzB9dq2iIs2DroUVYta1s0x0Ep/grP2K2KgOrVnqJgn0+z6jvG
	 MyB+aLcpAAnZqmaP6UN0bJ2KG/sP/UMk5pxBg65KfLC8l1hLAA3qmLLuF5tvq6rQbT
	 6b1yDKPhR7AqTroNWnAC9uTY9c8vhv3uRrjMhlaMaSjc7kdSnmkUjqA1ldT6fTYcHu
	 j0Pc2ellasvlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC5D610F0;
	Wed,  4 Feb 2026 17:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C8E2173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 808A3607B3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f04V8UxHLR3R for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9B4660A63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B4660A63
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE7528697E; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:34:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dff1de6497cc187d8cef368f8a52fca5b5ae1976
X-Git-Newrev: 3c35297cd4d775c0e5cb2e25e1dbd99942010510
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.AE7528697E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/beagleboard/beaglebone: exit post-build.sh on error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c35297cd4d775c0e5cb2e25e1dbd99942010510
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Add 'set -eu' to ensure that command failures or unset variables are
properly reported to the 'make' process. This prevents silent failures
during the image generation phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c22dc1b819b3428eb0313afc5216bd69575c1021)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/beagleboard/beaglebone/post-build.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
index b7afd92ffe..f2ee613949 100755
--- a/board/beagleboard/beaglebone/post-build.sh
+++ b/board/beagleboard/beaglebone/post-build.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
-BOARD_DIR="$(dirname $0)"
+set -eu
+
+BOARD_DIR="$(dirname "$0")"
 
 cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
