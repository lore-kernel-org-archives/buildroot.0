Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D529C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73B983FBE;
	Thu,  6 Oct 2022 18:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73B983FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4lzoQbX59Qv; Thu,  6 Oct 2022 18:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92EE383F3E;
	Thu,  6 Oct 2022 18:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92EE383F3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C01D1BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1555340BBB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1555340BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_9sUPC6unYG for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 200ED40912
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 200ED40912
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AA3486936; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:53:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 484b50507f31e90a3f955698ad10e7aad6f91b37
X-Git-Newrev: db678645eb1702e007414a9e9d5073d541a7c6d3
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.0AA3486936@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 5.18 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=db678645eb1702e007414a9e9d5073d541a7c6d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not add a preconfigured 5.18.x version to linux-headers as 5.18.x is
already EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host                                | 6 +++++-
 toolchain/Config.in                                                 | 5 +++++
 .../toolchain-external/toolchain-external-custom/Config.in.options  | 6 +++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ab59bdd368..9d993a2e99 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -133,8 +133,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18
+	bool "5.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17
-	bool "5.17.x or later"
+	bool "5.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 219578092b..c49691cff2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -567,6 +567,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -580,6 +584,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
 	default "5.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 6727778f42..16f1ac0a5e 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -127,8 +127,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_18
+	bool "5.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_17
-	bool "5.17.x or later"
+	bool "5.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
