Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EEEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FDAD60757;
	Thu, 12 May 2022 08:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtkfaTyxwjYZ; Thu, 12 May 2022 08:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CD560B68;
	Thu, 12 May 2022 08:48:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A0C1BF84C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C15AE40BD0
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpDwaljkGWa3 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A74640122
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6714985A58; Thu, 12 May 2022 08:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 10:40:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b02f13cd54912f3dffd0e0863378050104430d77
X-Git-Newrev: 0ebbf0b280b10b04ab6b7b23c597f76f6490df64
X-Patchwork-Hint: ignore
Message-Id: <20220512083801.6714985A58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/shim: big endian arm/aarch64 variants
 are not supported
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ebbf0b280b10b04ab6b7b23c597f76f6490df64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a6c7dd171529e2a7b7a26af8d99bec53117a7a02/

Commit fd5842a1dd03642b2ea084439 (boot/shim: add
BR2_PACKAGE_SHIM_ARCH_SUPPORTS) added explicit support for big/little endian
arm/aarch64, but the shim code is hard coded for little endian:

head -n 1 elf_{arm,aarch64}_efi.lds
==> elf_arm_efi.lds <==
OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")

==> elf_aarch64_efi.lds <==
OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")

So drop the support for the big endian variants.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/shim/Config.in b/boot/shim/Config.in
index c4f1a9f317..462ef12d62 100644
--- a/boot/shim/Config.in
+++ b/boot/shim/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 	bool
-	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arm || BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_arm
 	default y if BR2_i386
 	default y if BR2_x86_64
 	# it includes gnu-efi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
