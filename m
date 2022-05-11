Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FD9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 07:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74AF541883;
	Wed, 11 May 2022 07:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0O2HgfIOaME; Wed, 11 May 2022 07:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B98F41871;
	Wed, 11 May 2022 07:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59D0C1BF294
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 07:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4861260AAF
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 07:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gwbox8g2E6g for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 07:20:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E952460A68
 for <buildroot@buildroot.org>; Wed, 11 May 2022 07:20:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D3348200008;
 Wed, 11 May 2022 07:20:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nogdm-004yUT-JV; Wed, 11 May 2022 09:20:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 09:19:46 +0200
Message-Id: <20220511071946.1185665-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/shim: big endian arm/aarch64 variants are
 not supported
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
Cc: fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
