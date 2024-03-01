Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A17C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 18:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD613400C7;
	Fri,  1 Mar 2024 18:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9IL5uEPpP8X; Fri,  1 Mar 2024 18:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 894B340197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894B340197;
	Fri,  1 Mar 2024 18:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAB061BF354
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2AA2610C7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 18:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dv2NElxciDTM for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 18:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B4F60880
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B4F60880
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 18:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB0487F35; Fri,  1 Mar 2024 18:28:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 19:25:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82afcacb620b834cef157a8c2d9ad54ff76e4e4f
X-Git-Newrev: 1d6d8c32464459be08eff941a0e3c350c7ec343c
X-Patchwork-Hint: ignore
Message-Id: <20240301182837.8EB0487F35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_microblaze{be,
 el}: remove xilinx xemaclite patch needed for qemu < 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d6d8c32464459be08eff941a0e3c350c7ec343c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We carried a patch for xilinx xemaclite that was made initially for
qemu < 2.2.0 [1].

Indeed, between Qemu 0.11.0 and 2.2.0 the devicetree binary blob
petalogix-s3adsp1800.dtb (bundled in Qemu sources) used a
compatible string 'xlnx,xps-ethernetlite-2.00.b' that was not
supported by the Linux kernel [2].

These patches could have been removed since Buildroot 2015.02
when this defconfig was tested with Qemu 2.2.0 [3].

[1] https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
[2] https://gitlab.com/qemu-project/qemu/-/commit/c21fd2c79e1fcaf45582f2dd4deb491c257aa9f2
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/312990555c4d7d1cccd26e0728ad0d4ec86820a7

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Peter: drop drom .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 --
 ...-net-xilinx-xemaclite-add-2.00.b-revision.patch | 34 ----------------------
 ...-net-xilinx-xemaclite-add-2.00.b-revision.patch | 34 ----------------------
 configs/qemu_microblazebe_mmu_defconfig            |  1 -
 configs/qemu_microblazeel_mmu_defconfig            |  1 -
 5 files changed, 72 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a6cc58c448..c18cc4d417 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -71,8 +71,6 @@ board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-p
 board/pine64/rock64/post-build.sh Shellcheck
 board/pine64/rockpro64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
-board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
-board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
 board/radxa/rockpi-n8/post-build.sh Shellcheck
diff --git a/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
deleted file mode 100644
index eb3859f858..0000000000
--- a/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Apr 2020 09:49:11 +0200
-Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
-
-Patch added for the kernel 3.14
-- fix networking in Qemu using a small patch
-- disable DTS, because linux.bin does not include any DTB the
-  default Qemu included DTB is used and this is okay and works fine
-
-https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
-
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-index 0de52e70abcc..d8c13140ca77 100644
---- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
--- 
-2.25.3
-
diff --git a/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
deleted file mode 100644
index eb3859f858..0000000000
--- a/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Apr 2020 09:49:11 +0200
-Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
-
-Patch added for the kernel 3.14
-- fix networking in Qemu using a small patch
-- disable DTS, because linux.bin does not include any DTB the
-  default Qemu included DTB is used and this is okay and works fine
-
-https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
-
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-index 0de52e70abcc..d8c13140ca77 100644
---- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
--- 
-2.25.3
-
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index e02b8dae2f..a93ef3564d 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 146bbb67de..0b00b58b4e 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
