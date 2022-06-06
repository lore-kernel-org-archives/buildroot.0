Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E17C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 619DE84035;
	Mon,  6 Jun 2022 13:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wE6SD8DeqrAM; Mon,  6 Jun 2022 13:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81BF983FF5;
	Mon,  6 Jun 2022 13:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7B41BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2765860BD6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgykYzOuXmMS for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D89760BBC
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 369B286DAA; Mon,  6 Jun 2022 13:04:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:14:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66496a40564a2ea590081c4461075ea9d256e579
X-Git-Newrev: 3b3105328e4aa54f3cfecbf8454a9db63875d76e
X-Patchwork-Hint: ignore
Message-Id: <20220606130446.369B286DAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: only allow BR2_STATIC_LIBS on
 supported libc/arch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b3105328e4aa54f3cfecbf8454a9db63875d76e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is currently possible to select BR2_STATIC_LIBS while
BR2_TOOLCHAIN_BUILDROOT is selected even when there are no buildroot
toolchains that support BR2_STATIC_LIBS for the selected architecture.

Add BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS so that we can
disable the selection of BR2_STATIC_LIBS when using an unsupported
architecture.

Fixes:
 - http://autobuild.buildroot.net/results/4da59af8193376ec893321c4c2aaf1d25598502d
 - http://autobuild.buildroot.net/results/1950348218a4f097f078d158977c13f8b0a97d6e
 - http://autobuild.buildroot.net/results/2f03f2be32ad9898a990f6f0264d8c8d51991eb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: add back James' SoB from:
    https://lore.kernel.org/buildroot/20220516210756.3093190-1-james.hilliard1@gmail.com/
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in                               | 2 ++
 toolchain/toolchain-buildroot/Config.in | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Config.in b/Config.in
index f0cd6f48ed..52c3c4b4c8 100644
--- a/Config.in
+++ b/Config.in
@@ -601,6 +601,8 @@ choice
 
 config BR2_STATIC_LIBS
 	bool "static only"
+	depends on !BR2_TOOLCHAIN_BUILDROOT || \
+		BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
 	help
 	  Build and use only static libraries. No shared libraries will
 	  be installed on the target. This potentially increases your
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0dac816a4d..11566c27ff 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -20,6 +20,11 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_STATIC_LIBS_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_SUPPORTS
+	default y if BR2_PACKAGE_MUSL_SUPPORTS
+
 choice
 	prompt "C library"
 	default BR2_TOOLCHAIN_BUILDROOT_UCLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
