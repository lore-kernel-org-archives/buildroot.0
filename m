Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31539CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72776411B8;
	Fri, 30 Aug 2024 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0P2IsMbKcVTQ; Fri, 30 Aug 2024 16:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F03C40267
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F03C40267;
	Fri, 30 Aug 2024 16:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA911BF98E
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C26D4243B
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlQYPAFpRDbB for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A23AC42439
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23AC42439
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:57:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DD778674C; Fri, 30 Aug 2024 16:57:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 18:57:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ccee6d1ea870b1e98485def2b629a0728978b5c4
X-Git-Newrev: 3b104b805521ab529cef20c79b919d910718f20e
X-Patchwork-Hint: ignore
Message-Id: <20240830165733.8DD778674C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/radxa/rock5b: do not let
 the kernel mount the rootfs as rw
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b104b805521ab529cef20c79b919d910718f20e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Do not let the kernel mount the rootfs as rw.
There is no need for this, and init will remount the rootfs as rw anyway.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rock5b/extlinux.conf b/board/radxa/rock5b/extlinux.conf
index a82050a682..9832255992 100644
--- a/board/radxa/rock5b/extlinux.conf
+++ b/board/radxa/rock5b/extlinux.conf
@@ -1,4 +1,4 @@
 label Radxa Rock 5b Linux
   kernel /boot/Image
   devicetree /boot/rk3588-rock-5b.dtb
-  append root=/dev/mmcblk1p1 rw earlycon rootwait
+  append root=/dev/mmcblk1p1 earlycon rootwait
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
