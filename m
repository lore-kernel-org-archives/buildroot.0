Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A8C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEFBE4044B;
	Sat, 18 Nov 2023 15:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEFBE4044B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kXx7X2Qzykm4; Sat, 18 Nov 2023 15:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5C41404A1;
	Sat, 18 Nov 2023 15:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5C41404A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D94C1BF47E
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33DC1404A1
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33DC1404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kAn5SXm0Kjk for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:16:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 464D140467
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 464D140467
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 262D8872EC; Sat, 18 Nov 2023 15:16:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 16:14:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d82a063ae981f434d55735bf63a117847f889208
X-Git-Newrev: d6d0f73a2eaa4904ee0842a01941b01306d97be6
X-Patchwork-Hint: ignore
Message-Id: <20231118151605.262D8872EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/khadas/vim3: add the path of the
 devicetree in extlinux.conf
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6d0f73a2eaa4904ee0842a01941b01306d97be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch, the devicetree used by linux at runtime is
the u_boot devicetree.

While using rusticl on the khadas vim3 board with the default
extlinux.conf, mesa's panfrost driver return "gpu shed timeout"
errors. Adding "devicetree /meson-g12b-khadas-vim3.dtb" to the
extlinux.conf file solve the problem. Linux successfully boot
with and without the change but without this patch the devicetree
used by linux at runtime is the u-boot devicetree.

The differences between the u-boot devicetree and the linux
devicetree are:
-The u-boot devicetree contains two more nodes than the linux devicetree. Those nodes are:
    - smbios : compatible option is set to "u-boot,sysinfo-smbios".
    - __symbols__ : present if -@ or --symbols is used during the devicetree compilation.
-Most of u-boot devicetree nodes have a "phandle" property.
-SoC and vpu have a "u-boot,dm-pre-reloc;" property.
-Some aliases are different.
-The u-boot operating points tables contains more nodes.
The size difference between the u-boot devicetree and the linux
devicetree is approximately 3.5kB.

During runtime, the linux devicetree have the "phandle" and
"u-boot,dm-pre-reloc;" properties and the smbios node. So,
The runtime devicetree is the one from u-boot.

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/khadas/vim3/extlinux.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/khadas/vim3/extlinux.conf b/board/khadas/vim3/extlinux.conf
index fede99b502..2b1544a5cc 100644
--- a/board/khadas/vim3/extlinux.conf
+++ b/board/khadas/vim3/extlinux.conf
@@ -1,4 +1,5 @@
 default buildroot
 label buildroot
    kernel /Image
+   devicetree /meson-g12b-a311d-khadas-vim3.dtb
 append root=/dev/mmcblk0p2 rootwait console=ttyAML0,115200
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
