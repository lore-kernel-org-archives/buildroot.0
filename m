Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27582C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D015D405AF;
	Sat, 22 Jan 2022 19:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJ2LGEnITUa9; Sat, 22 Jan 2022 19:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7A3B4027A;
	Sat, 22 Jan 2022 19:09:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 864E41BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 747A0408FC
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esLtq1bZe-rL for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52AF408E1
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 90DF182A2A; Sat, 22 Jan 2022 19:02:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 20:08:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24307955a2edf9e112ab815c139ceab83b3d4072
X-Git-Newrev: 5803bbd9002aab836cf0d86c5bf0674e3c1ca819
X-Patchwork-Hint: ignore
Message-Id: <20220122190259.90DF182A2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_virt_defconfig:
 linux.config: enable fb/input support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5803bbd9002aab836cf0d86c5bf0674e3c1ca819
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux config already enabled drm-virtio for graphics output, but not the
corresponding virtio-input / evdev drivers for input or the compatibility fb
option.

Enable them so keyboard/mouse input works and /dev/fb0 is provided.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/aarch64-virt/linux.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index e3a4a92913..f9763b73b7 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -47,6 +47,7 @@ CONFIG_DUMMY=y
 CONFIG_MACVLAN=y
 CONFIG_VIRTIO_NET=y
 CONFIG_NLMON=y
+CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_VIRTIO_CONSOLE=y
@@ -56,9 +57,11 @@ CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS=y
 CONFIG_DRM=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
 CONFIG_MAILBOX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
