Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB7CC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8F7814B6;
	Mon, 20 Feb 2023 17:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8F7814B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJBdb-1QSDO4; Mon, 20 Feb 2023 17:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACDDC8175C;
	Mon, 20 Feb 2023 17:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACDDC8175C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D14A1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2529E40BEF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2529E40BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJkFHSAZqp4z for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:23:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67C3540BEB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67C3540BEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5381C86400; Mon, 20 Feb 2023 17:23:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:17:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f1858e859833da272fce70bf445ca1b53ebffe1
X-Git-Newrev: b21cd8be3f9469d6bdbbaed951ae7c59efb46a24
X-Patchwork-Hint: ignore
Message-Id: <20230220172325.5381C86400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "xorg-server: not available with
 musl on ARM"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b21cd8be3f9469d6bdbbaed951ae7c59efb46a24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9daafbcb75a7ab593ce8a1f21c6149c8437bc0bc.

Fixed since https://gitlab.freedesktop.org/xorg/xserver/-/issues/840
(xserver 1.20.6).

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 865917c4ec..b933bd0285 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,11 +1,6 @@
-comment "xorg-server needs a glibc or uClibc toolchain"
-	depends on BR2_arm && BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	depends on BR2_USE_MMU # fork()
-	# xserver uses inb/outb on arm, which aren't available with musl
-	depends on !(BR2_arm && BR2_TOOLCHAIN_USES_MUSL)
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
