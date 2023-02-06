Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F87FC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E9DA40459;
	Mon,  6 Feb 2023 13:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E9DA40459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62KTVCBEkr-9; Mon,  6 Feb 2023 13:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EAC4403B8;
	Mon,  6 Feb 2023 13:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAC4403B8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3F71BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 773DE403B8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 773DE403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpiJdAy-gYV2 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D66140360
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D66140360
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A2E683C4C; Mon,  6 Feb 2023 13:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:27:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2661fe63990386cf2626ce1dd26919346ca86c0
X-Git-Newrev: a97a4a74aa993b09b958639e2276e7f5cf7a75d2
X-Patchwork-Hint: ignore
Message-Id: <20230206133023.8A2E683C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: properly handle legacy
 for renamed options
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

commit: https://git.buildroot.net/buildroot/commit/?id=a97a4a74aa993b09b958639e2276e7f5cf7a75d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "a610bf9967 package/openjdk{-bin}: bump version to 17.0.1+12"
tried to add legacy handling but the new symbols are part of a choice,
and Kconfig does not enforce the select of a option from a choice.

Update the legacy entry for 2021.11, following the example described in
the beginning of the file.

Cc: Tudor Holton <buildroot@tudorholton.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy          | 6 ++++--
 package/openjdk/Config.in | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 42dbe6ef5a..53fe2f0b97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -832,18 +832,20 @@ comment "Legacy options removed in 2021.11"
 config BR2_OPENJDK_VERSION_LTS
 	bool "OpenJDK LTS version was renamed to OpenJDK 11"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_11
 	help
 	  The LTS version option was renamed to OpenJDK 11 to make it
 	  clear what LTS version is.
+# Note: BR2_OPENJDK_VERSION_LTS is still referenced from
+# package/openjdk/Config.in
 
 config BR2_OPENJDK_VERSION_LATEST
 	bool "OpenJDK latest version (16.x) was removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  OpenJDK 16.x is no longer mainted, so the option has been
 	  removed. Use OpenJDK 17.x instead.
+# Note: BR2_OPENJDK_VERSION_LATEST is still referenced from
+# package/openjdk/Config.in
 
 config BR2_PACKAGE_MPD_TIDAL
 	bool "mpd tidal option removed"
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8fbe51a27f..24a56e6b84 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -57,6 +57,8 @@ if BR2_PACKAGE_OPENJDK
 
 choice
 	prompt "openjdk version"
+	default BR2_PACKAGE_OPENJDK_VERSION_11 if BR2_OPENJDK_VERSION_LTS # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LATEST # legacy
 	default BR2_PACKAGE_OPENJDK_VERSION_17
 	help
 	  Select the version of OpenJDK you wish to use.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
