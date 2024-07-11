Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A143C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC2760EBB;
	Thu, 11 Jul 2024 10:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKebrs1B1zYS; Thu, 11 Jul 2024 10:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11CA6106B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11CA6106B;
	Thu, 11 Jul 2024 10:24:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB3591BF40D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5CD66106B
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puMqgwavSUUI for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE6F60EBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE6F60EBB
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:24:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C313B84C26; Thu, 11 Jul 2024 10:24:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 12:21:50 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 077861ec24a63a4d71444c439e72cb6cac936134
X-Git-Newrev: 7b3d3e52ac51acd774bd9d7ae189a56cda131e5c
X-Patchwork-Hint: ignore
Message-Id: <20240711102449.C313B84C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] Revert
 "package/libopenssl: no-engine"
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b3d3e52ac51acd774bd9d7ae189a56cda131e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This reverts commit c366ecb95e154ef7cc84179915d68654c8c96737.

While the change is correct, it causes quite some fallout from packages
using the ENGINE_* API functions without selecting
BR2_PACKAGE_LIBOPENSSL_ENGINES, so drop it from the stable branch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 89a9189bb8..fe472e2c7a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -85,7 +85,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-afl \
 			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_BIN),,no-apps) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENGINES),,no-engine) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
