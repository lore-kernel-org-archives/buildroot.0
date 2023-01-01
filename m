Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D2C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 08:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BC938142A;
	Sun,  1 Jan 2023 08:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC938142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdIutwYxuC-w; Sun,  1 Jan 2023 08:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 770F081426;
	Sun,  1 Jan 2023 08:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 770F081426
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7886B1BF282
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 08:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6116E60B26
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 08:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6116E60B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrfPS7GDa6We for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 08:58:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A27B60BCA
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 08:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A27B60BCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4564486A17; Sun,  1 Jan 2023 08:58:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 09:33:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e75f3962084045cf50f38f0adf8bfaa8da71dfd5
X-Git-Newrev: acaae6c39bd046a4a2a6250e7c167d77fb24f1f0
X-Patchwork-Hint: ignore
Message-Id: <20230101085815.4564486A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: allow building only the tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=acaae6c39bd046a4a2a6250e7c167d77fb24f1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 44be514b21fd (package/qemu: refactor target emulator selection)
mistakenly forced to always build at least user or system emulation but
it should be possible to choose only the tools (e.g. for a guest VM
image).

Still, we don't want to configure qemu with neither system nor user
emulation, nor the tools enabled; at least one lust be enabled.

So, change the selection to force the tools to be enabled if neither the
system nor the user emulations are enabled.

Reinstate the the machine selection guard behind a dependency on whether
at lesat system or user emulation is enabled.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
[yann.morin.1998@free.fr:
  - ensure at least one of system, user, or tools
  - guard the machine selection
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qemu/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 0f9e353510..2bbc6a14c0 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -27,7 +27,7 @@ menuconfig BR2_PACKAGE_QEMU
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_QEMU_SYSTEM if !BR2_PACKAGE_QEMU_LINUX_USER
+	select BR2_PACKAGE_QEMU_TOOLS if !BR2_PACKAGE_QEMU_SYSTEM && !BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  QEMU is a generic and open source machine emulator and
 	  virtualizer.
@@ -114,6 +114,7 @@ comment "Linux user-land emulation needs a glibc or uClibc toolchain"
 
 config BR2_PACKAGE_QEMU_CHOOSE_TARGETS
 	bool "Select individual emulator targets"
+	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER
 	help
 	  By default, all targets (system and/or user, subject to the
 	  corresponding options, above) are built. If you only need a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
