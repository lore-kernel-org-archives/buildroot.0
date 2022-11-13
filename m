Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B86C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 15:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E06E81405;
	Sun, 13 Nov 2022 15:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E06E81405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBoUFb7QpBe9; Sun, 13 Nov 2022 15:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6761813E7;
	Sun, 13 Nov 2022 15:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6761813E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C00D61BF267
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AFD1813E7
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AFD1813E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yA2XHqAMRWn for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:59:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4A19813E0
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A19813E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC7C883679; Sun, 13 Nov 2022 14:59:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:58:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0910ada70b7194596c6ace0cb06b303173c13de7
X-Git-Newrev: a0d1c6288a9adfb54dc9d98b8c4f5531eb4c9cba
X-Patchwork-Hint: ignore
Message-Id: <20221113145957.BC7C883679@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: needs fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0d1c6288a9adfb54dc9d98b8c4f5531eb4c9cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533:

mdio.c: In function 'mdio_modprobe':
mdio.c:738:15: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
  738 |         pid = fork();
      |               ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/c53aaeaa34dd4d6d9a57da196687beecaeed9fe2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mdio-tools/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index f24c1a6974..237f4454cc 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -1,12 +1,15 @@
 comment "mdio-tools needs a Linux kernel to be built"
+	depends on BR2_USE_MMU
 	depends on !BR2_LINUX_KERNEL
 
 comment "mdio-tools needs a toolchain w/ headers >= 5.1"
+	depends on BR2_USE_MMU
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
 config BR2_PACKAGE_MDIO_TOOLS
 	bool "mdio-tools"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
