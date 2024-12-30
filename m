Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF78E7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB09E4052B;
	Mon, 30 Dec 2024 18:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNJj9A-Zysjl; Mon, 30 Dec 2024 18:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF18A40572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF18A40572;
	Mon, 30 Dec 2024 18:28:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 74A17F11
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DAF840572
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlUubLteBstA for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60AE54055E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60AE54055E
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AC9F828EF; Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:25:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82326a3d8392d02f53c47bdaed21ff8012a6d978
X-Git-Newrev: 954b5514a92d9d8439d57a815f097046e6270bb9
X-Patchwork-Hint: ignore
Message-Id: <20241230182802.4AC9F828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: select proper defconfig on ARC
 750d/770d
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=954b5514a92d9d8439d57a815f097046e6270bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux kernel "defconfig" on ARC is haps_hs_smp_defconfig, which
cannot be built on ARC 750d/770d targets, so let's use a kernel
defconfig that works properly on ARC 750d/770d.

Fixes:

  http://autobuild.buildroot.net/results/2913e5958cd6b20dbfdcdad304a5f5a0f8030d8d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7e443fb227..12699b8ee4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -347,6 +347,8 @@ else ifeq ($(BR2_powerpc64),y)
 LINUX_KCONFIG_DEFCONFIG = ppc64_defconfig
 else ifeq ($(BR2_powerpc),y)
 LINUX_KCONFIG_DEFCONFIG = ppc_defconfig
+else ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+LINUX_KCONFIG_DEFCONFIG = axs101_defconfig
 else
 LINUX_KCONFIG_DEFCONFIG = defconfig
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
