Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38E9C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD6640233;
	Mon,  8 Jul 2024 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfhtSEvIrELv; Mon,  8 Jul 2024 21:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27DD40327
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27DD40327;
	Mon,  8 Jul 2024 21:03:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 698FA1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62DB7608F5
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taCwhYQUeW9H for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D35D608D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D35D608D8
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7865483D7D; Mon,  8 Jul 2024 21:03:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caaf80dabe244dc8c7515b27a012942aceedcc70
X-Git-Newrev: e8f80c24026110390ac9d53829e50f0a95d3206a
X-Patchwork-Hint: ignore
Message-Id: <20240708210353.7865483D7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8f80c24026110390ac9d53829e50f0a95d3206a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes link time errors, undefined references to various ENGINE_*
functions (paths shortened to the output directory):

host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined reference to `ENGINE_load_builtin_engines'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference to `ENGINE_by_id'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference to `ENGINE_ctrl_cmd_string'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference to `ENGINE_init'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference to `ENGINE_ctrl_cmd_string'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined reference to `ENGINE_free'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined reference to `ENGINE_finish'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_cert':
signature.c:(.text.load_cert+0x114): undefined reference to `ENGINE_ctrl_cmd'
host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: librauc.a.p/src_signature.c.o: in function `load_key':
signature.c:(.text.load_key+0x124): undefined reference to `ENGINE_load_private_key'

Before linking there were matching implicit declaration warnings
during compile.

[Peter: only select if libopenssl backend is used]
Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Tested-by: Heiko Thiery <heiko.thiery@mail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rauc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 7451b29a55..01a321e3dd 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_RAUC
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
+	# uses ENGINE_* API
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_SQUASHFS # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time dependency
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
