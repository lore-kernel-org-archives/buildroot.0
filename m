Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04449C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96C1E81FE6;
	Wed,  4 Jan 2023 16:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C1E81FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q7LiWamHYRLT; Wed,  4 Jan 2023 16:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E6481FB2;
	Wed,  4 Jan 2023 16:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E6481FB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBF011BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A51F24188E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51F24188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZDKiRkQ2uL3 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A27DF41891
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A27DF41891
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9134187518; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:47:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee73336da98a7de04301a90c9b5a881761274a47
X-Git-Newrev: 92219bdf2ece2a0ddfbc45691879a03acd5c7442
X-Patchwork-Hint: ignore
Message-Id: <20230104165453.9134187518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5virtualkeyboard: really
 configure language layouts
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
