Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE25FC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75AE14040A;
	Fri, 10 May 2024 20:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0d5pbzcX5Uc; Fri, 10 May 2024 20:56:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B93D404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B93D404A3;
	Fri, 10 May 2024 20:56:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8717F1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73888404A3
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taMABkKBAHBe for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA994040A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA994040A
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:56:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36B2686F3C; Fri, 10 May 2024 20:56:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 22:55:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5961b219180c180ad816faa18681674d89eccaa9
X-Git-Newrev: 3c8cc1dfc4aacdf247a4ba4a730a74118849c828
X-Patchwork-Hint: ignore
Message-Id: <20240510205604.36B2686F3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: require host gcc of at least 8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c8cc1dfc4aacdf247a4ba4a730a74118849c828
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ccache 4.9.1 requires a host gcc of at least 8.
See "Build-time support" at
https://ccache.dev/platform-compiler-language-support.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index e4f58f3f66..b5a94325c4 100644
--- a/Config.in
+++ b/Config.in
@@ -318,8 +318,12 @@ config BR2_JLEVEL
 	  Number of jobs to run simultaneously. If 0, determine
 	  automatically according to number of CPUs on the host system.
 
+comment "ccache needs a host gcc >= 8"
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 config BR2_CCACHE
 	bool "Enable compiler cache"
+	depends on BR2_HOST_GCC_AT_LEAST_8
 	help
 	  This option will enable the use of ccache, a compiler cache.
 	  It will cache the result of previous builds to speed up future
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
