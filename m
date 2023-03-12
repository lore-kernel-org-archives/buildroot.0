Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3861CC6FD1C
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF300606B0;
	Sun, 12 Mar 2023 09:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF300606B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bW8VI5PGOWVB; Sun, 12 Mar 2023 09:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE1960C0A;
	Sun, 12 Mar 2023 09:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE1960C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBDBA1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C70DA4026E
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70DA4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0N_muXGnkpaX for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0896940136
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0896940136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91C586E5A; Sun, 12 Mar 2023 09:08:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:08:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d1b87a346a0c0b775ee44ec7090bee03ba8be7ba
X-Git-Newrev: 92f6a843b81479a9c8f8769d9e728767646b9901
X-Patchwork-Hint: ignore
Message-Id: <20230312090853.E91C586E5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/qemu/aarch64-sbsa: use
 the default console specified by ACPI
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=92f6a843b81479a9c8f8769d9e728767646b9901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ARM SBBR (Server Base Boot Requirements) defines SPCR (Serial Port
Console Redirection Table) as a mandatory ACPI table that specifies
the configuration of a serial console.

In the linux kernel, ARM developers have decided that consoles defined
by SPCR are always enabled when existing, see e.g.:
https://lore.kernel.org/linux-serial/20200430161438.17640-1-alpernebiyasak@gmail.com/T/

Specifying console=ttyAMA0 (which is a serial console) is thus
redundant for an ARM SBSA board. (It also blindly assumes that
the serial console is on ttyAMA0, which might not be true.)

Drop the explicit console=ttyAMA0 on the kernel command line,
such that the kernel can pick up the default console defined
by SPCR.

This is similar to how it is currently done for
board/aarch64-efi/grub.cfg.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/aarch64-sbsa/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
index 39b7842f8f..d99e19c4cd 100644
--- a/board/qemu/aarch64-sbsa/grub.cfg
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=PARTLABEL=root rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
