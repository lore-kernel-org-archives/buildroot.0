Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC80BC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BB880E3B;
	Mon, 15 Jul 2024 09:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn-lc6_qeIko; Mon, 15 Jul 2024 09:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7272280E77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7272280E77;
	Mon, 15 Jul 2024 09:29:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CD971BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3949240425
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JxeP7leNc8l for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D0BD403D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D0BD403D6
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:29:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B10986B4C; Mon, 15 Jul 2024 09:29:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 11:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 009f9106d991c9adbf8e57869d4355e0f71da31b
X-Git-Newrev: 246763308bfca93977c4ad5bee7c8654fcf7dfd3
X-Patchwork-Hint: ignore
Message-Id: <20240715092919.2B10986B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: fix missing plugins
 and qml2 imports
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=246763308bfca93977c4ad5bee7c8654fcf7dfd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the default value "." for of ArchData, qt6-applications that require QML2 imports or
plugins, will not run:

In my case the wayland-egl platform plugin is not found:

  qt.qpa.plugin: Could not find the Qt platform plugin "wayland-egl" in ""

And I also get a lot of qml related warnings:

  qrc:/qml/main.qml:3:1: module "QtQuick.Layouts" is not installed

Prior to this fix, we had to set the QML2_IMPORT_PATH and QT_PLUGIN_PATH or make sure qt.conf is
available.

After this fix, ArchData starts with "lib", which is necessary (according to my own experiments)
for qt6-applications to find plugins and qml2 imports. The root cause is still unknown, but I
think the current solution is sufficient.

Setting ArchData to "lib/qt6" is also a good first step towards a better qt6 filesystem layout.
I will continue improving the qt6 filesystem layout in a later patch.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6cb82d9a94..5ab61ba3e0 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -42,6 +42,7 @@ QT6BASE_INSTALL_STAGING = YES
 
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DINSTALL_ARCHDATADIR=lib/qt6 \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
