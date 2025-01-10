Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D8C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F994F44C;
	Fri, 28 Feb 2025 16:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdYyXymh-R_a; Fri, 28 Feb 2025 16:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB544F1A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB544F1A1;
	Fri, 28 Feb 2025 16:52:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF691DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB2341807
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfK3XtVMfGoy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5E44252B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5E44252B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D7886612; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Jan 2025 18:52:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d2f3737a1e52d140bd412bf01241eecf5cff994
X-Git-Newrev: 5aa12833d5ca461b466a40a698711bf57d3b1edd
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.A1D7886612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/imx6ulz_bsh_smm_m2:
 fix kernel hash
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5aa12833d5ca461b466a40a698711bf57d3b1edd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 75320f567d "configs/imx6ulz_bsh_smm_m2: bump U-Boot to 2024.10
and Linux to 6.1.120" updated the kernel from 6.1.68 to 6.1.120 but
forgot to update its per-config kernel hash file.

The defconfig fails with the error:

    ERROR: No hash found for linux-6.1.120.tar.xz

This failure happen since commit 07149e5f30 "{linux, linux-headers}:
bump 5.{4, 10, 15}.x / 6.{1, 6, 12}.x series" which updated the
Buildroot 6.1 kernel series from 6.1.120 to 6.1.122.

This commit fixes the issue by updating the hash.

While at it, it also changes the "Locally computed" comment
by the upstream link to hashes.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8751983243

Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
index 25e4464adb..6d69eabbd6 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
+++ b/board/bsh/imx6ulz-bsh-smm-m2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
