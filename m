Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF3BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34A0A60F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34A0A60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F390E40425;
	Sun, 10 Oct 2021 17:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFFDpy0HAuNY; Sun, 10 Oct 2021 17:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F8640422;
	Sun, 10 Oct 2021 17:41:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1E5F1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE61400F0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYK8vmZJnEXG for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEB8F400DE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 45CF194C62; Sun, 10 Oct 2021 17:39:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 19:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc7322fe544bb4a99b7204a79c5f15cbe23ebe75
X-Git-Newrev: 02972acf3f676d94e360f4b562b412d36133d246
X-Patchwork-Hint: ignore
Message-Id: <20211010173900.45CF194C62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: switch to gdb 10.x as the
 default
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

commit: https://git.buildroot.net/buildroot/commit/?id=02972acf3f676d94e360f4b562b412d36133d246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When doing this, we can simplify the RISC-V related logic. Indeed, as
there was no support for RISC-V in gdb 9.x, which was the current
default, we had some trickery in the Config.in file to ensure gdb 10.x
was used by default on RISC-V. However now that 10.x is the default
for everybody, this trickery is no longer needed.

Also, we now needs to enable BR2_PACKAGE_GDB_TOPLEVEL when host-gdb is
not built, as the default target gdb version is 10.x, and threfore
requires BR2_PACKAGE_GDB_TOPLEVEL=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gdb/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2f9790f6e1..fd739f3969 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -61,7 +61,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_9_2
+	default BR2_GDB_VERSION_10
 	depends on !BR2_arc
 	depends on !BR2_csky
 	help
@@ -93,8 +93,8 @@ config BR2_GDB_VERSION
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
-	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
-	default "10.2"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
+	default "9.2"      if BR2_GDB_VERSION_9_2
+	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.1"     if BR2_GDB_VERSION_11
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 
@@ -105,5 +105,5 @@ config BR2_PACKAGE_GDB_TOPLEVEL
 	default y if BR2_arc
 	default y if BR2_GDB_VERSION_10
 	default y if BR2_GDB_VERSION_11
-	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv
+	default y if !BR2_PACKAGE_HOST_GDB
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
