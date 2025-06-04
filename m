Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D0C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96541408EE;
	Wed,  4 Jun 2025 18:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7T4YSrtPioT5; Wed,  4 Jun 2025 18:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A68B6408CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A68B6408CE;
	Wed,  4 Jun 2025 18:46:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB615DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1CF94005B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeBt-EcGO31a for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB0340077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCB0340077
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCDC187936; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 20:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fad08d32f9f029cb0d11f4dcd805b479df7ab59
X-Git-Newrev: ac7f65d83e57843951df843be65bbf2e79531ec7
X-Patchwork-Hint: ignore
Message-Id: <20250604184642.CCDC187936@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: build without clang
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ac7f65d83e57843951df843be65bbf2e79531ec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
If external clang is available on the host system, the buildsystem tries
to use it. The result will be unpredictable. We can't use the version of
clang that is shipped with buildroot either, because it is too old. See:
https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1. So we
disable clang support in qt6tools for now.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6tools/qt6tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index a818cd7abc..fd32b3352a 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -36,6 +36,10 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
@@ -50,6 +54,10 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
