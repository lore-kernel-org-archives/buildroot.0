Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD6EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2156FBE1;
	Tue, 21 Feb 2023 01:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2156FBE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K9gW7HK7oquc; Tue, 21 Feb 2023 01:35:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BFE670066;
	Tue, 21 Feb 2023 01:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BFE670066
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9121BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA30A6FC26
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA30A6FC26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MygZvfeeJH2a for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE7F16FC1B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE7F16FC1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE9DF828C8; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:27:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b2661fe63990386cf2626ce1dd26919346ca86c0
X-Git-Newrev: a97a4a74aa993b09b958639e2276e7f5cf7a75d2
X-Patchwork-Hint: ignore
Message-Id: <20230220205249.BE9DF828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openjdk: properly
 handle legacy for renamed options
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
