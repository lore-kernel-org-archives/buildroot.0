Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F828C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C7D60F5A
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C7D60F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A5B1607F0;
	Wed, 27 Oct 2021 13:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlAuw3s5KK-k; Wed, 27 Oct 2021 13:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C79C60853;
	Wed, 27 Oct 2021 13:53:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AB3C1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 279AA40101
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_rW-Noa7O1t for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46EC4400FA
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 92389882C7; Wed, 27 Oct 2021 13:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 14:36:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d49446ebdbd32c1b4591c0aa8cacb189a69e318
X-Git-Newrev: 607a5a3b79527d75128949d15a39b16166f7c7e4
X-Patchwork-Hint: ignore
Message-Id: <20211027134931.92389882C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: Fix NOMMU RISC-V
 64-bits toolchain base name
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

commit: https://git.buildroot.net/buildroot/commit/?id=607a5a3b79527d75128949d15a39b16166f7c7e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using *-uclinux-* seems like an only partially followed convention.
And at least RISC-V 64-bits gcc does not know about uclinux tuples.
So switch back to the normal "linux" one for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>

[Damien]
* Make the change conditional on BR2_RISCV_64 being "y".

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 04347d2d84..dae7a859fd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,8 +39,9 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# FLAT binary format needs uclinux
-ifeq ($(BR2_BINFMT_FLAT),y)
+# FLAT binary format needs uclinux, except RISC-V 64-bits which needs
+# the regular linux name.
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
