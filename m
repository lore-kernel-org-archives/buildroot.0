Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E71C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A8C80BBB;
	Mon, 19 Aug 2024 10:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyxlKiPtYzif; Mon, 19 Aug 2024 10:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BE280DB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BE280DB7;
	Mon, 19 Aug 2024 10:48:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7711BF39D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F074E403C0
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drRqEU-0u2lS for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05B0E40225
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B0E40225
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFE8D85FF8; Mon, 19 Aug 2024 10:48:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 12:47:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce3dedc26b9080399c44d86e14aa1704f7bf563a
X-Git-Newrev: a7fe8c88d1d01ed59cdd477b87e26213d1ed9c21
X-Patchwork-Hint: ignore
Message-Id: <20240819104810.EFE8D85FF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: fix cli with
 BR2_SHARED_LIBS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7fe8c88d1d01ed59cdd477b87e26213d1ed9c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flashrom requires --default-library=both for the cli when building
with BR2_SHARED_LIBS.

As such set --default-library=both instead of disabling it.

The cli was disabled in 8637884057ddc3c1aeb9f0dd285fc6fcf378c26b to
work around a cli build issue which this fixes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 1e7d332dae..030f6816a0 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -10,6 +10,7 @@ FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
+	-Dclassic_cli=enabled \
 	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
@@ -78,10 +79,8 @@ endif
 
 FLASHROM_CONF_OPTS += -Dprogrammer=$(subst $(space),$(comma),$(strip $(FLASHROM_PROGRAMMERS)))
 
-ifeq ($(BR2_SHARED_LIBS),)
-FLASHROM_CONF_OPTS += -Dclassic_cli=enabled
-else
-FLASHROM_CONF_OPTS += -Dclassic_cli=disabled
+ifeq ($(BR2_SHARED_LIBS),y)
+FLASHROM_CONF_OPTS += --default-library=both
 endif
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
