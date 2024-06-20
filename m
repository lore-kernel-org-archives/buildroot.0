Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1268C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 20:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBB880E31;
	Thu, 20 Jun 2024 20:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2HFjv1k1hQ4; Thu, 20 Jun 2024 20:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5541845CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5541845CD;
	Thu, 20 Jun 2024 20:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E97AB1BF83B
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6048845CE
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIyouVTN6iYW for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 20:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A01845CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A01845CD
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 20:22:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C83E188097; Thu, 20 Jun 2024 20:22:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 22:22:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99a5d51c6e9fbc24b86e1c144253cdfe5eb770c8
X-Git-Newrev: 85e41f5f21378a10adc3468c758555009e5ccda2
X-Patchwork-Hint: ignore
Message-Id: <20240620202230.C83E188097@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: re-add hash file for
 xilinx-prebuilt
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

commit: https://git.buildroot.net/buildroot/commit/?id=85e41f5f21378a10adc3468c758555009e5ccda2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xilinx pre-built was added in a6648ad8da (boot/xilinx-prebuilt:
new boot package), the hash file was initially a board-specific hash
file. However, that hash file, in commit a6648ad8da, really belonged
to the xilinx-prebuilt package, for two reasons: the package needs a
hash file for the version it installs, and no defconfig was using it
at that time. So the hash file was moved out of the boar directory,
and into the package directory when the patch was applied.

When the xilinx-related boards were changed to use xilinx-prebuilt,  in
551ba16a0f (configs/zynqmp_*: migrate to xilinx-prebuilt) and 8271323649
(configs/versal_vck190_defconfig: migrate to xilinx-prebuilt), they were
correctly made to use a custom, non-default version. But then, it meant
that those defconfig would no longer have a hash when we would bump the
default version in xilinx-prebuilt.

Re-add the initial board-specific hash file now that it is required.

Fixes: 551ba16a0f09fe550acb3ef6d12a1b2587d03292
Fixes: 8271323649c42420adaf4513b0472a7203f7784d

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Neal Frager <neal.frager@amd.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..c955cd79f5
--- /dev/null
+++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
