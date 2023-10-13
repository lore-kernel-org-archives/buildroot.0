Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F826CDB483
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF8561503;
	Fri, 13 Oct 2023 10:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF8561503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id saDq4puahtoq; Fri, 13 Oct 2023 10:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE196F514;
	Fri, 13 Oct 2023 10:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE196F514
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ADAA1BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62F8940580
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F8940580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxSti8Xr1D-o for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAEB640571
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAEB640571
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AF87846EE; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 12:23:35 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 13967f09637198c32599b8f2c17d0f946820e85c
X-Git-Newrev: 4cb43fc95700b648933587001a4e29f968b065fb
X-Patchwork-Hint: ignore
Message-Id: <20231013102537.9AF87846EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/at91bootstrap:
 disable PIE and stack-protector build flags
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cb43fc95700b648933587001a4e29f968b065fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The toolchain wrapper automatically adds Position Independent
Execution and stack protector flags in the build process when selected
in the configuration. at91bootstrap being freestanding code, it
doesn't support these, so we have to disable them.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1351222486b93b72c00057fb3401d40967025164)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap/at91bootstrap.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 1a084756fd..385957b5d4 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -32,8 +32,14 @@ endef
 AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
 endif
 
+# The at91bootstrap Makefile doesn't support customizing
+# CFLAGS/LDFLAGS, so we cheat and pass our custom flags through CC and
+# LD.
 define AT91BOOTSTRAP_BUILD_CMDS
-	$(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
+	$(MAKE1) CROSS_COMPILE=$(TARGET_CROSS) \
+		CC="$(TARGET_CC) -fno-stack-protector" \
+		LD="$(TARGET_CC) -fno-PIE" \
+		-C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
 endef
 
 define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
