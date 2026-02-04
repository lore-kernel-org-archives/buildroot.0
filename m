Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B73CE9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBF6607B3;
	Wed,  4 Feb 2026 17:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7RfRTD7WZEg; Wed,  4 Feb 2026 17:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7D760AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224478;
	bh=mTOuI0Fqbnho+GK8QuIFImVQHotEJ+9yamFvJPzwyxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BfNWnUyEAXjkL1QR2TvFH2cC/+cm/1qADprHcGn3gXb+7aL2cAW+LrzZQABda6jEj
	 77NcoWaX2dzJYEGfzrh4fKT2PxyZ2FQs3AP1X5XwZ6DTCNuuaGkBadSFN/LJyOCmB/
	 w4RkxJpaFCTBdILIW2XvT3veoMRlT4yl4HPbviBafrfv+jCo1hbT/BN7Wy9pM+jWYm
	 YX8eXGXeTJPZWZNZr2a9HpOcwRhMC/tCFpb3IYcrwgCFB2W4y05NrLflr0Knh8UWj6
	 5XXqZfVvLQkVZI3PT8Rtd+VRpo1JYKzi//nNu/xYxSHCzW/Hmc34J2DEcuwURdNpkP
	 E8gZqvDuqhK5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7D760AE8;
	Wed,  4 Feb 2026 17:01:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A47BBF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8028240279
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4WFvsZcOJkPG for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 904ED40278
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 904ED40278
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BDCD86974; Wed,  4 Feb 2026 17:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 18:00:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 272d281ba9a06cfdb802ff13d5ca32ef06166cce
X-Git-Newrev: 70043d9e9a0ecb97d46be9527f73b3157da799f7
X-Patchwork-Hint: ignore
Message-Id: <20260204170115.7BDCD86974@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: fix build failure due to
 wchar
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/70043d9e9a0ecb97d46be9527f73b3157da799f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since commit [1] package dash requires wchar so let's depend on it to
fix build failure. Doing so makes default non-busybox shell dash to
depend on wchar. This is too restrictive since this way wchar becomes
mandatory, so let's switch default non-busybox shell to bash.

[1]:
https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360

Fixes:
https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dash/Config.in | 6 ++++++
 system/Config.in       | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dash/Config.in b/package/dash/Config.in
index b816ac7837..3573a40aa3 100644
--- a/package/dash/Config.in
+++ b/package/dash/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR
 	help
 	  DASH is a POSIX-compliant implementation of /bin/sh that
 	  aims to be as small as possible. It does this without
@@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
 	  for most tasks.
 
 	  http://gondor.apana.org.au/~herbert/dash
+
+comment "dash needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_USE_WCHAR
diff --git a/system/Config.in b/system/Config.in
index 98bbd93092..8f2dde59e7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -399,7 +399,7 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 
 choice
 	bool "/bin/sh"
-	default BR2_SYSTEM_BIN_SH_DASH if !BR2_PACKAGE_BUSYBOX
+	default BR2_SYSTEM_BIN_SH_BASH if !BR2_PACKAGE_BUSYBOX
 	help
 	  Select which shell will provide /bin/sh.
 
@@ -418,6 +418,7 @@ config BR2_SYSTEM_BIN_SH_DASH
 	bool "dash"
 	depends on BR2_USE_MMU # dash
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_USE_WCHAR # dash
 	select BR2_PACKAGE_DASH
 
 config BR2_SYSTEM_BIN_SH_MKSH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
