Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB098C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3C760BEC;
	Sun, 13 Nov 2022 21:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B3C760BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MnxcmyX6zpf; Sun, 13 Nov 2022 21:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7243960BEA;
	Sun, 13 Nov 2022 21:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7243960BEA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F33991BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7CA6407D7
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7CA6407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmU-mS9rLw7Q for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5DAD4069B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5DAD4069B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A29A4837FC; Sun, 13 Nov 2022 21:37:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:37:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6465c79166fed0c9a9b99a15d34c555a3141344f
X-Git-Newrev: c81da5e41c8b8863920a1f0416e4f7f4d22788bf
X-Patchwork-Hint: ignore
Message-Id: <20221113213752.A29A4837FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: disallow configs with
 BR2_XTENSA_CUSTOM=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=c81da5e41c8b8863920a1f0416e4f7f4d22788bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_XTENSA_CUSTOM=y is used with the internal toolchain, an
overlay file is mandatory, which genrandconfig can't provide. So we
simply disallow such configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index f19a405685..9c6c2b359c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -304,6 +304,11 @@ def fixup_config(sysinfo, configfile):
     # No C library for internal toolchain
     if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
         return False
+    # Xtensa custom cores require an overlay file with internal
+    # toolchains
+    if 'BR2_XTENSA_CUSTOM=y' in configlines and \
+       'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
+        return False
 
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
