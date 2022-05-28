Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B3E41A11;
	Sat, 28 May 2022 09:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZISZcL1uELOP; Sat, 28 May 2022 09:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268EF419A2;
	Sat, 28 May 2022 09:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBEB1BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 244AC84CAD
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQsBZtj0jr8c for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7006C84CBD
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3412684257; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:14:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b16eca8e45e9e8613a38ef0c958a49e12958a3f1
X-Git-Newrev: 4b364f26e6cbb9e370567b5d71e47f4001501d96
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.3412684257@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/shim: big endian
 arm/aarch64 variants are not supported
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b364f26e6cbb9e370567b5d71e47f4001501d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 0ebbf0b280b10b04ab6b7b23c597f76f6490df64)
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
