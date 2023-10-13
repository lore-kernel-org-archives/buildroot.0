Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC05CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B605F61504;
	Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B605F61504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hg7quVuDjYdI; Fri, 13 Oct 2023 10:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03FAB61726;
	Fri, 13 Oct 2023 10:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03FAB61726
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2C71BF349
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B7CD41FCB
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7CD41FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTYHONPmTpQ1 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FF0D41FCC
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF0D41FCC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D613846D8; Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 12:23:59 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e785e38dcc0d717f9f265a4aba8ad29b0a3d3c1b
X-Git-Newrev: 67c5936f4249b8edcda8de9e70146d332730524a
X-Patchwork-Hint: ignore
Message-Id: <20231013102431.2D613846D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] boot/at91bootstrap:
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

commit: https://git.buildroot.net/buildroot/commit/?id=67c5936f4249b8edcda8de9e70146d332730524a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
