Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62595C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AB8340253;
	Tue, 28 Dec 2021 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xh7XMDDRxg9N; Tue, 28 Dec 2021 21:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25678403AC;
	Tue, 28 Dec 2021 21:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A105D1BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E2A4030F
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYvqeMqA_rMX for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9F7B40287
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:15:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B9FDF81273; Tue, 28 Dec 2021 21:09:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:14:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f60e1d125d4223355d4a790fbdded92c90a73e01
X-Git-Newrev: 35ef82fe3bd866227eab11cc3f72a414f614cca6
X-Patchwork-Hint: ignore
Message-Id: <20211228210914.B9FDF81273@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64_e5500: enable dhcp on
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
Content-Type: multipart/mixed; boundary="===============4202732184908844829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4202732184908844829==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=35ef82fe3bd866227eab11cc3f72a414f614cca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a virtio-net-pci device with a user mode host network backend

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/ppc64-e5500/readme.txt  | 2 +-
 configs/qemu_ppc64_e5500_defconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index 61d51f7f4d..7c8c80af44 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc64_e5500_defconfig
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -net nic,model=virtio-net-pci -net user -append "console=ttyS0 rootwait root=/dev/vda" -serial mon:stdio -nographic # qemu_ppc64_e5500_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 286d79a26b..09aac50252 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -2,7 +2,8 @@
 BR2_powerpc64=y
 BR2_powerpc_e5500=y
 
-# Serial port config
+# System
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Image

--===============4202732184908844829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4202732184908844829==--
