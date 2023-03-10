Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B9BC6FA99
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 20:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8920141705;
	Fri, 10 Mar 2023 20:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8920141705
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JE4yMqs2mXLR; Fri, 10 Mar 2023 20:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD9C14041C;
	Fri, 10 Mar 2023 20:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD9C14041C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 295191BF390
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09B0E82323
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 20:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B0E82323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e82J6OULMX2w for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 20:54:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A4082036
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 20:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A4082036
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C21B186E18; Fri, 10 Mar 2023 20:54:49 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 21:44:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 863811974e04b3332c4959c07a20e3e97050835c
X-Git-Newrev: 37be4bda854d921e4db7f4202c3a99f98c1bfb69
X-Patchwork-Hint: ignore
Message-Id: <20230310205449.C21B186E18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: use -isystem instead of -I in HOSTCC
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

commit: https://git.buildroot.net/buildroot/commit/?id=37be4bda854d921e4db7f4202c3a99f98c1bfb69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A package might install headers that are incompatible with the kernel's
header. One example is the most recent version of pahole (1.24).
HOST_CC includes -I$(HOST_DIR)/include which comes before any include
logic the kernel might have thus forcing the kernel to prefer headers in
HOST_DIR.

The logic to substituting -I with -isystem is taken from
boot/uboot/uboot.mk.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Francis Laniel <flaniel@linux.microsoft.com>
Tested-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..03d89cd204 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -150,7 +150,7 @@ endif
 # Disable building host tools with -Werror: newer gcc versions can be
 # extra picky about some code (https://bugs.busybox.net/show_bug.cgi?id=14826)
 LINUX_MAKE_FLAGS = \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
