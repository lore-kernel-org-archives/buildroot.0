Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F162C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 09:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C599B40BD2;
	Mon, 27 May 2024 09:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl3vFBIaL67m; Mon, 27 May 2024 09:16:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82DF941171
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82DF941171;
	Mon, 27 May 2024 09:16:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228271D1A65
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCD181299
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 09:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jis5FVVGJwpv for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 09:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B80081E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B80081E24
 for <buildroot@buildroot.org>; Mon, 27 May 2024 09:16:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BDB181064; Mon, 27 May 2024 09:16:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 11:15:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7a16c79198696e4a7e9863b61920f5f104d942c
X-Git-Newrev: d71c90a3018ee37b18f1c7f209e70a8b792efabd
X-Patchwork-Hint: ignore
Message-Id: <20240527091628.0BDB181064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pine64_star64: uboot needs openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=d71c90a3018ee37b18f1c7f209e70a8b792efabd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig fails in uboot build, with output:

    In file included from tools/imagetool.c:10:
    include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
     1178 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the defconfig.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6918689164

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pine64_star64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index 2c0c17ad62..9852e6d82b 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,u-boot,172b47f62039605d6806fa96bd403c21cda28996)/u-boot-172b47f62039605d6806fa96bd403c21cda28996.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_star64"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 
 # Misc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
