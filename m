Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9338FC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 21:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 549F841180;
	Thu, 11 Jul 2024 21:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGU-SB9RyK1u; Thu, 11 Jul 2024 21:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DE144118D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DE144118D;
	Thu, 11 Jul 2024 21:27:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8992E1BF5F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 842F060752
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 21:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7ToXxK6c1hm for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 21:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B10CB6063C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B10CB6063C
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 21:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EB5C8516E; Thu, 11 Jul 2024 21:27:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 23:26:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 60495596cde8463d5931dad5cc48fba0b77eaae5
X-Git-Newrev: 9cddd68f8e667a4ab28f18ceb2eaa9e69c2fdef8
X-Patchwork-Hint: ignore
Message-Id: <20240711212752.9EB5C8516E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 board/pine64/rockpro64/linux.fragment: integrate stmmac driver
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cddd68f8e667a4ab28f18ceb2eaa9e69c2fdef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Currently, the stmmac driver is configured as a module in the defconfig, which
means that the network functionality is not available until the driver module
is manually inserted.

Use extra config fragment to integrate it directly into the kernel, ensuring that network
functionality is available immediately upon boot.

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 54c82a237581dbed74aab2086381ae69b4626cc6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pine64/rockpro64/linux.fragment | 3 +++
 configs/rockpro64_defconfig           | 1 +
 2 files changed, 4 insertions(+)

diff --git a/board/pine64/rockpro64/linux.fragment b/board/pine64/rockpro64/linux.fragment
new file mode 100644
index 0000000000..ed7dfd3d3e
--- /dev/null
+++ b/board/pine64/rockpro64/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+CONFIG_DWMAC_ROCKCHIP=y
diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index 472b9aded2..0c6cdd477a 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -40,6 +40,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64/linux.fragment"
 
 # Filesystem
 BR2_TARGET_GENERIC_HOSTNAME="rockpro64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
