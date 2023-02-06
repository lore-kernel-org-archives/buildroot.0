Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4704CC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E2260AD4;
	Mon,  6 Feb 2023 13:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E2260AD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Fh2F6WNMLw6; Mon,  6 Feb 2023 13:23:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BDFC60AAF;
	Mon,  6 Feb 2023 13:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BDFC60AAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4FC1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2596081BCB
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2596081BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y3j44RWmg5br for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3117E81B3E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3117E81B3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FEBD83C23; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01cb02cfaecb34fd7d413775673e78272c68f85f
X-Git-Newrev: cc3a4a7b1de7b158354c650d234339e8a969a730
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.1FEBD83C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pugixml: fix configuration options
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc3a4a7b1de7b158354c650d234339e8a969a730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit upstream 1c5a0bb32583fd294022e68e66b541bf6ff71a67
":sparkles: Update CMake to modern approach" removed all feature
toogles, so starting from release v1.11 any flag passed in BUILD_DEFINES
was completely ignored during the build.
Version 1.11.4 was in use in buildroot since February 2021.

Commit upstream 0f1e75a902ef1751dd63a67fe223b5e8daf4c7f1
"Re-introduced the custom build defines" added PUGIXML_BUILD_DEFINES to
release v1.12, but BUILD_DEFINES is still completely ignored during the
build.
Version 1.12.1 is in use in buildroot since March 2022.

So switch the config options to use PUGIXML_BUILD_DEFINES instead of
BUILD_DEFINES.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 7d4f47c6fa..1a915980a5 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -29,11 +29,11 @@ ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
 
-PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
+PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 
 HOST_PUGIXML_CONF_OPTS += \
 	-DBUILD_PKGCONFIG=ON \
-	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
+	-DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
