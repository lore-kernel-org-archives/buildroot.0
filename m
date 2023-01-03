Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35CDC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975E54EBBC;
	Mon, 20 Feb 2023 23:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975E54EBBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHO-bklgpQju; Mon, 20 Feb 2023 23:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EC94EBC8;
	Mon, 20 Feb 2023 23:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80EC94EBC8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 494161BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69B396F97D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B396F97D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tf39q24eLDig for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D9A6F959
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D9A6F959
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F7A186495; Mon, 20 Feb 2023 20:52:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jan 2023 22:10:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8d7c69a0c9e414b7112347c37e1424ec5f2863ed
X-Git-Newrev: 5cb87730fdf2eb5a7a5b1302c21afba71aeeb5e0
X-Patchwork-Hint: ignore
Message-Id: <20230220205222.8F7A186495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/tiff: add webp
 optional dependency"
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cb87730fdf2eb5a7a5b1302c21afba71aeeb5e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 3fd6ada8dbca3370b9bb67feb2971e637cb4b11f to fix the
following build failure raised because tiff is already an optional
dependency of webp:

package/tiff/tiff.mk:122: *** Recursive variable 'TIFF_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d8486cd1d5e56fb3719dc88b8aebc76c3e23cdc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/Config.in | 4 ----
 package/tiff/tiff.mk   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index b9e3656e6f..d1004d6668 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,10 +72,6 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
-config BR2_PACKAGE_TIFF_WEBP
-	bool "WEBP compression"
-	select BR2_PACKAGE_WEBP
-
 config BR2_PACKAGE_TIFF_ZSTD
 	bool "ZSTD compression"
 	select BR2_PACKAGE_ZSTD
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c2a4108f35..f0b56150b1 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -105,13 +105,6 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF_WEBP),y)
-TIFF_CONF_OPTS += --enable-webp
-TIFF_DEPENDENCIES += webp
-else
-TIFF_CONF_OPTS += --disable-webp
-endif
-
 ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
 TIFF_CONF_OPTS += --enable-zstd
 TIFF_DEPENDENCIES += zstd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
