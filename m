Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE12C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF2E4057F;
	Sun, 13 Nov 2022 14:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBF2E4057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwR2z8G4Bfkf; Sun, 13 Nov 2022 14:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1940E4055D;
	Sun, 13 Nov 2022 14:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1940E4055D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EADE91BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D18B181427
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D18B181427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-EYzwhNownp for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA4A081446
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4A081446
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA87283671; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:30:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5146b9943d986a811cf5b728faf8d7a8ce7bcf8a
X-Git-Newrev: ae830d4ebd98a933b904b5e13b0d9376e8b84b2c
X-Patchwork-Hint: ignore
Message-Id: <20221113143503.DA87283671@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Force cmake packages to
 use makefiles
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae830d4ebd98a933b904b5e13b0d9376e8b84b2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Force cmake packages to use the "Unix Makefiles" generator
in case CMAKE_GENERATOR is set in the host environment. This
patch further isolates the buildroot build environment from
the host.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a5d8582e37b8b7440a71d4cad68e85bebc4aec6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3b1db35fb6..fc6ce4921d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+		-G"Unix MakeFiles" \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
@@ -117,6 +118,7 @@ define $(2)_CONFIGURE_CMDS
 	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
+		-G"Unix MakeFiles" \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
