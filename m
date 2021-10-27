Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39321C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB4160E74
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 13:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FB4160E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AEAE4018A;
	Wed, 27 Oct 2021 13:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZciN2HjlAto4; Wed, 27 Oct 2021 13:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 782824019F;
	Wed, 27 Oct 2021 13:53:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBE81BF9C2
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0F55607F0
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8jH3_UPTdFG for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F32560661
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 13:52:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B54F88307; Wed, 27 Oct 2021 13:49:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 14:39:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607a5a3b79527d75128949d15a39b16166f7c7e4
X-Git-Newrev: 343643fdf1c68927439da34992953834e9c05fbe
X-Patchwork-Hint: ignore
Message-Id: <20211027134931.9B54F88307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/config: Make RISC-V 64-bits MMU
 optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=343643fdf1c68927439da34992953834e9c05fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux supports No-MMU RISC-V 64-bits since kernel version 5.8. Make
MMU optional to enable building for RISC-V 64-bits boards that do not
have one. MMU use of RISC-V 32-bits builds remains mandatory for now.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in       | 1 -
 arch/Config.in.riscv | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d50718e2d4..c99af89efa 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -209,7 +209,6 @@ config BR2_powerpc64le
 
 config BR2_riscv
 	bool "RISCV"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	help
 	  RISC-V is an open, free Instruction Set Architecture created
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 1fc20e5de7..e6436d7c39 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -71,10 +71,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
