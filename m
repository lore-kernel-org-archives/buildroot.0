Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA48C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 22:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF24360894;
	Mon, 17 Feb 2025 22:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TEUIRdDWw8A; Mon, 17 Feb 2025 22:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C9560EAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C9560EAD;
	Mon, 17 Feb 2025 22:24:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B25E05
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3248403CA
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjCYSt5s5JkW for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 22:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D381A4011D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D381A4011D
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:24:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA80687751; Mon, 17 Feb 2025 22:24:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 23:22:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02b9d987c4865d4cb6354728c6eac1310e6a619f
X-Git-Newrev: 3761177a89a78c83a102d811efd0079ed01a3abb
X-Patchwork-Hint: ignore
Message-Id: <20250217222451.CA80687751@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-embeddedsw: change dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3761177a89a78c83a102d811efd0079ed01a3abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH can contain multiple tuples,
BR2_TARGET_XILINX_EMBEDDEDSW can no longer be dependent on:

depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"

A valid definition could have "microblazeel-xilinx-elf" as just one of many
tuples in the list.

For this reason, this patch changes the dependency to:

depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

One side effect of this is that the user comment will be displayed now when
using multiple tuples, even if one of them is the required tuple.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/xilinx-embeddedsw/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
index 757ff59e35..b0691d7e7b 100644
--- a/boot/xilinx-embeddedsw/Config.in
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -1,7 +1,7 @@
 config BR2_TARGET_XILINX_EMBEDDEDSW
 	bool "xilinx-embeddedsw"
 	depends on BR2_aarch64
-	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
 	help
 	  Build boot firmware applications from source for Xilinx
 	  boards. Users can mix and match applications to be built
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
