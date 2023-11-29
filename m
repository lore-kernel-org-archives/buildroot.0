Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E576C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25092817FF;
	Wed, 29 Nov 2023 09:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25092817FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ieg-Hgfhyz93; Wed, 29 Nov 2023 09:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58053843C0;
	Wed, 29 Nov 2023 09:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58053843C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77BD71BF276
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5866981852
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5866981852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-C1ktENCjIt for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB3EA81290
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3EA81290
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84A3C87570; Wed, 29 Nov 2023 09:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 09:58:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb72418160417e9e872f626c356f898bff49cf48
X-Git-Newrev: a82ff22698e4e4ffecfd2b07ba0e00cd8a0d4a85
X-Patchwork-Hint: ignore
Message-Id: <20231129090117.84A3C87570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix selinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=a82ff22698e4e4ffecfd2b07ba0e00cd8a0d4a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following refpolicy build failure raised since commit
aa8e38a51658723dafb8f05275d3a318058f0d6e:

policy.conf:2509:ERROR 'attribute virt_ptynode is not declared' at token ';' on line 2509:
type qemu_device_t;
type qemu_devpts_t, virt_ptynode;

Fixes:
 - http://autobuild.buildroot.org/results/210db01ac72cabd42e1478900cdbfa4cf4b19bcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index afe0d8a196..ef406dc8e9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -9,7 +9,7 @@
 QEMU_VERSION = 8.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
-QEMU_SELINUX_MODULES = qemu
+QEMU_SELINUX_MODULES = qemu virt
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
