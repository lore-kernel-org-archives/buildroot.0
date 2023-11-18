Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506DBC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 13:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5FE2418B2;
	Sat, 18 Nov 2023 13:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5FE2418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gt9dXKgSeG57; Sat, 18 Nov 2023 13:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2903441846;
	Sat, 18 Nov 2023 13:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2903441846
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C70071BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A009041846
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 13:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A009041846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbcCB7HUzRXJ for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 13:41:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0C9D417B3
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 13:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C9D417B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B513786970; Sat, 18 Nov 2023 13:41:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 14:35:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 751e90e6eba68325e8d84a45539224e12dd27247
X-Git-Newrev: 439c9516e84976741db84f233b9c2816fe1c9b06
X-Patchwork-Hint: ignore
Message-Id: <20231118134153.B513786970@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: don't pollute
 user's home directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=439c9516e84976741db84f233b9c2816fe1c9b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flutter-engine will forcibly create ~/.dart/ and ~/.flutter/ and store
stuff in there.

This is however quite dirty and pollutes the user's home, and will also
not work when the home is read-only (e.g. shared in a container).

Forcibly redirect flutter-engine to the same location where we
redirected host-flutter-sdk-bin, using the same trick of redefining
HOME as for host-flutter-sdk-bin.

Ideally, we'd like to have some way to share this with all flutter-based
packages, but we so far have only a few of them, so it is too early to
even think about some commonalities (even less so about a shared infra).
So we just duplicate the setting for now, this can be revisited later.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-engine/flutter-engine.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 32aaa1cccf..d31d435d79 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -185,11 +185,14 @@ define FLUTTER_ENGINE_EXTRACT_CMDS
 	| $(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 
+# We must set the home directory to the sdk directory or else flutter will
+# place .dart, and .flutter in ~/.
 define FLUTTER_ENGINE_CONFIGURE_CMDS
 	cd $(@D) && \
 		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
 		./flutter/tools/gn \
 			$(FLUTTER_ENGINE_CONF_OPTS)
 endef
@@ -198,6 +201,7 @@ define FLUTTER_ENGINE_BUILD_CMDS
 	cd $(@D) && \
 		PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 		PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+		HOME=$(HOST_FLUTTER_SDK_BIN_SDK) \
 		$(HOST_DIR)/bin/ninja \
 			-j $(PARALLEL_JOBS) \
 			-C $(FLUTTER_ENGINE_BUILD_DIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
