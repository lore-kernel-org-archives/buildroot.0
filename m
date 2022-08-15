Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB076C282E7
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8754460B49;
	Mon, 15 Aug 2022 16:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8754460B49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCgv2SlLaffa; Mon, 15 Aug 2022 16:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC0D60EA0;
	Mon, 15 Aug 2022 16:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CC0D60EA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27B321BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 603D460A80
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 603D460A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNNDXo_08Bps for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:46:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AD17605E8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD17605E8
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8421887658; Mon, 15 Aug 2022 16:31:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:42:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 085407351ddd46c6e2a51ded6df3a0e11e31c2c9
X-Git-Newrev: e4040d0d8e1d3d3b77de582b8354eca641a0613d
X-Patchwork-Hint: ignore
Message-Id: <20220815163153.8421887658@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: rework custom handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4040d0d8e1d3d3b77de582b8354eca641a0613d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop default value of BR2_PACKAGE_XENOMAI_REPOSITORY
- Add BR2_PACKAGE_XENOMAI_{CUSTOM_VERSION_VALUE,REPOSITORY_VERSION} to
  mimick what is done by other packages (e.g. barebox, u-boot)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xenomai/Config.in | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ec6d9e5d29..269b85b5ce 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -64,17 +64,29 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
 endchoice
 
+config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE
+	string "Xenomai version"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
+
 config BR2_PACKAGE_XENOMAI_REPOSITORY
 	string "URL of custom repository"
-	default "https://gitlab.denx.de/Xenomai/xenomai.git"
 	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
+config BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION
+	string "Custom repository version"
+	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
+	help
+	  Revision to use in the typical format used by Git, i.e a
+	  SHA1 or a tag.
+
 config BR2_PACKAGE_XENOMAI_VERSION
-	string "Custom Xenomai version" if \
-		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
-		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	string
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
+	default BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE \
+                if BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
+	default BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION \
+		if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
 
 config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
 	string "URL of custom tarball"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
