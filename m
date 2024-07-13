Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58EFC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 806786069A;
	Sat, 13 Jul 2024 09:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smOh_q9XcA3V; Sat, 13 Jul 2024 09:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94750606C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94750606C0;
	Sat, 13 Jul 2024 09:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 070351BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD2336069A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYZANCEU6m5Z for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1177606C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1177606C0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:34:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7B3486385; Sat, 13 Jul 2024 09:34:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:33:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92a8ad923e33e3fdf8c76caf2825de9b36b2ff43
X-Git-Newrev: 7c0733c9be8a9f7ea54a1880896686ae7b323100
X-Patchwork-Hint: ignore
Message-Id: <20240713093424.E7B3486385@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: reenable Qemu user-land
 emulation for musl toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c0733c9be8a9f7ea54a1880896686ae7b323100
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compatible "struct sigevent" added upstream in musl 1.2.2 [1].

[1] https://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb

Signed-off-by: Joseph Burt <caseorum@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qemu/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 91e0de884f..74962f3e26 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -122,16 +122,11 @@ comment "systems emulation needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_QEMU_LINUX_USER
 	bool "Enable Linux user-land emulation"
-	# Incompatible "struct sigevent" definition on musl
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Say 'y' to build Linux user-land emulators.
 
 # Note: bsd-user can not be build on Linux
 
-comment "Linux user-land emulation needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	bool "Select individual emulator targets"
 	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
