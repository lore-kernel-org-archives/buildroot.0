Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD86C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3129C4058B;
	Tue, 28 Dec 2021 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlOOrqWjTYhR; Tue, 28 Dec 2021 21:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFBD405AF;
	Tue, 28 Dec 2021 21:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE0AB1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC393403AC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoA1Wfykc1zd for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC7F40253
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C167982BDC; Tue, 28 Dec 2021 21:09:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:14:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35ef82fe3bd866227eab11cc3f72a414f614cca6
X-Git-Newrev: cf494c78c1b3963e80a5c601e3e23346cac494e1
X-Patchwork-Hint: ignore
Message-Id: <20211228210914.C167982BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc_e500mc: enable dhcp on
 network interface
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
Content-Type: multipart/mixed; boundary="===============7601036899292672947=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7601036899292672947==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cf494c78c1b3963e80a5c601e3e23346cac494e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a virtio-net-pci device with a user mode host network backend

Cc: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc-e500mc/readme.txt  | 2 +-
 configs/qemu_ppc_e500mc_defconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/ppc-e500mc/readme.txt b/board/qemu/ppc-e500mc/readme.txt
index 77a864ed2b..76bad015d2 100644
--- a/board/qemu/ppc-e500mc/readme.txt
+++ b/board/qemu/ppc-e500mc/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc_e500mc_defconfig
+ qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -net nic,model=virtio-net-pci -net user -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc_e500mc_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
index 1a5b1e3c2c..232bc1f70c 100644
--- a/configs/qemu_ppc_e500mc_defconfig
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -2,7 +2,8 @@
 BR2_powerpc=y
 BR2_powerpc_e500mc=y
 
-# Serial port config
+# System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Image

--===============7601036899292672947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7601036899292672947==--
