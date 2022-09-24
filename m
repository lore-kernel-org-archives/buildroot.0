Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735FEC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 20:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020FD409C3;
	Sat, 24 Sep 2022 20:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020FD409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmoKW2Zpt1Hq; Sat, 24 Sep 2022 20:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 574104093D;
	Sat, 24 Sep 2022 20:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574104093D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF4A51BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 971D24093D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 20:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 971D24093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4QWCC1xbfLK for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 20:53:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED16B408E9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED16B408E9
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 20:53:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 239DBE0002;
 Sat, 24 Sep 2022 20:53:41 +0000 (UTC)
To: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>, Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 24 Sep 2022 22:53:23 +0200
Message-Id: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664052822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VtFtWaWxH6FsEe2aa1Ba/mCwkRQS36XOpvlQwSZUVK0=;
 b=nNvVd7KzzEqqbSyTKA4oY7FyTjcIts475HAE4pTfzPp9ZkR10iE6vgVFHWdsFyJ3vbcVjL
 GmmR+yAiQ5J1N78MVxGxPZlBtzh3P+lKaV2WHlSWDdys5/bLQL+0oO9ibHHlTQOkeKljnl
 a7zDjGhiNHYHskzD78CUWRIOpy9Y4qwXY6r28E10K3SC4j5dlGE8eLg9Xj9KoEcUj3bx1Q
 zxNTvxUUzfgEzOAsm9D+IvypJjsemyfB6ZAn+y5qI24qEB4ip6OmiTkI6NCxofb3CITBaX
 iwP45XITVV40HBQWj/ZfFZhHwewlyGCmLRhvKWEtDtNgP51kVZtkbJptTwbyNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nNvVd7Kz
Subject: [Buildroot] [PATCH 1/4] arch/Config.in.xtensa: adjust endianness
 logic to avoid bogus configurations
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Xtensa architecture supports both LE and BE configurations. When
BR2_XTENSA_CUSTOM is chosen, a choice in menuconfig to choose between
LE and BE.

However, if using the internal toolchain backend, when the
BR2_XTENSA_OVERLAY_FILE is empty, in practice, the configuration will
always be big endian. But the choice being present, random
configuration testing ends up testing configurations where
BR2_XTENSA_OVERLAY_FILE is empty, but the endianness selected is LE,
which is incorrect.

This commit fixes this by:

 (1) Showing the overlay file option only when building an internal
     toolchain. For external toolchain configurations, it does not
     make sense to show it as it will have no effect.

 (2) Showing the endianness choice either for internal toolchain
     configurations with non-empty BR2_XTENSA_OVERLAY_FILE, or for
     external toolchain configurations.

 (2) Defaulting to BE when BR2_XTENSA_OVERLAY_FILE is empty.

Fixes:

  http://autobuild.buildroot.net/results/702e2886156f291466375dfcf412c20f1aa5857d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.xtensa | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index f9d5adb4c9..e9263f888e 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -14,7 +14,7 @@ endchoice
 
 config BR2_XTENSA_OVERLAY_FILE
 	string "Overlay file for custom configuration"
-	depends on BR2_XTENSA_CUSTOM
+	depends on BR2_XTENSA_CUSTOM && BR2_TOOLCHAIN_BUILDROOT
 	help
 	  Enter the path to the overlay tarball for a custom processor
 	  configuration.
@@ -31,6 +31,7 @@ choice
 	prompt "Target Architecture Endianness"
 	default BR2_XTENSA_LITTLE_ENDIAN
 	depends on BR2_XTENSA_CUSTOM
+	depends on BR2_XTENSA_OVERLAY_FILE != "" || BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_XTENSA_LITTLE_ENDIAN
 	bool "Little endian"
@@ -51,7 +52,9 @@ config BR2_XTENSA_USE_MMU
 
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
-	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
+	default "BIG"		if BR2_XTENSA_BIG_ENDIAN
+	default "BIG"		if BR2_xtensa_fsf
+	default "BIG"		if BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE = ""
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
