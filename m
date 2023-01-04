Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B88BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C66D04EE31;
	Tue, 21 Feb 2023 00:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C66D04EE31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RCmLhseZTJh; Tue, 21 Feb 2023 00:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9EB4EE13;
	Tue, 21 Feb 2023 00:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E9EB4EE13
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2B51BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 931EF6F9DC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 931EF6F9DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDGO8avKq6Ki for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFC5461B25
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC5461B25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D17F8648F; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:47:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee73336da98a7de04301a90c9b5a881761274a47
X-Git-Newrev: 92219bdf2ece2a0ddfbc45691879a03acd5c7442
X-Patchwork-Hint: ignore
Message-Id: <20230220205223.9D17F8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/qt5/qt5virtualkeyboard: really configure language layouts
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

commit: https://git.buildroot.net/buildroot/commit/?id=92219bdf2ece2a0ddfbc45691879a03acd5c7442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit "170777f342 package/qt5/qt5virtualkeyboard: convert to qmake
infrastructure" changed most but not all <pkg>_QMAKEFLAGS to
<pkg>_CONF_OPTS.

As a consequence, BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS is
ignored and all layouts are compiled in.
Some layouts have different licenses (e.g. pinying), so the license
information for a build that is configured to not include such layouts
is wrong.

Change the remaining _QMAKEFLAGS entry, fixing the config for which
language layouts are compiled and installed.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index c31d455c4e..3fefdc874d 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -16,7 +16,7 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES = LICENSE.GPL3
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (openwnn)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
