Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A24C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:53:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D6260EFD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88D6260EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B33424C9;
	Wed,  4 Aug 2021 00:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2atWQML8ACQ; Wed,  4 Aug 2021 00:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC779424CB;
	Wed,  4 Aug 2021 00:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068121BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 739DE40F13
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09AZZOXvU-jC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9320840F16
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EAE5387C2D; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 12:09:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 209e580219640fd0a12e6af15e4a611f4660fdba
X-Git-Newrev: cb46522f3ef1f2efc5785e6151c290af78f837f2
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.EAE5387C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: fix
 sdl2-config.cmake instead of removing it
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cb46522f3ef1f2efc5785e6151c290af78f837f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

SDL2 autotools-provided sdl2-config.cmake uses the absolute /usr prefix.
For this reason, we previously removed it (as of d59261836a).

This commit fixes sdl2-config.cmake to use relative paths instead.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2/sdl2.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index a2e426e578..5aad92eda8 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -24,13 +24,15 @@ SDL2_CONF_OPTS += \
 
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
-# Remove sdl2-config.cmake file and avoid unsafe include path if this
-# file is used by a cmake based package.
+# Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
 # https://bugzilla.libsdl.org/show_bug.cgi?id=4597
-define SDL2_REMOVE_SDL2_CONFIG_CMAKE
-	rm -rf $(STAGING_DIR)/usr/lib/cmake/SDL2
+define SDL2_FIX_SDL2_CONFIG_CMAKE
+	$(SED) '2iget_filename_component(PACKAGE_PREFIX_DIR "$${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)\n' \
+		$(STAGING_DIR)/usr/lib/cmake/SDL2/sdl2-config.cmake
+	$(SED) 's%"/usr"%$${PACKAGE_PREFIX_DIR}%' \
+		$(STAGING_DIR)/usr/lib/cmake/SDL2/sdl2-config.cmake
 endef
-SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_REMOVE_SDL2_CONFIG_CMAKE
+SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIX_SDL2_CONFIG_CMAKE
 
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
