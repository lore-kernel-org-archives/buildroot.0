Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABCEC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F8E405DB;
	Mon,  8 Jul 2024 06:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rors8V35BcnM; Mon,  8 Jul 2024 06:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E5340567
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E5340567;
	Mon,  8 Jul 2024 06:59:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 282971BF2C2
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE37B6069C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rd_SHbgHYP6 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED414606C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED414606C8
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC36B83D29; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:52:01 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 34b358bf2cb093ebb9a1e72f8cdce07f87917cf0
X-Git-Newrev: c366ecb95e154ef7cc84179915d68654c8c96737
X-Patchwork-Hint: ignore
Message-Id: <20240708065845.DC36B83D29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libopenssl:
 no-engine
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

commit: https://git.buildroot.net/buildroot/commit/?id=c366ecb95e154ef7cc84179915d68654c8c96737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Even though the "no-engine" option effectively disables the compilation
of the engine, it still creates the installation directory, which ends up
being empty. For this reason, the patch does not remove the hook for
removing the directory if the BR2_PACKAGE_LIBOPENSSL_ENGINES option is
not enabled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 623d3bbe43e9193aa8e3395367d01af59071b859)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index fe472e2c7a..89a9189bb8 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -85,6 +85,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-afl \
 			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENGINES),,no-engine) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
