Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF253C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 12:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F362410B8;
	Sat,  8 Jan 2022 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApP4ikVUuF6E; Sat,  8 Jan 2022 12:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6B0409F7;
	Sat,  8 Jan 2022 12:32:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D06A1BF957
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68D15409F7
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0GcXjkKW8rU for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 12:32:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFF3A409A3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 12:32:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 743AD82AE5; Sat,  8 Jan 2022 12:26:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 13:32:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5630e83c8452d3e9039feb15fd30ea005bfc6b55
X-Git-Newrev: 2f33654365ffa8fc1b3d8f9e5394a81abb776f66
X-Patchwork-Hint: ignore
Message-Id: <20220108122611.743AD82AE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] busybox: background udhcpc by default if
 no lease is obtained
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f33654365ffa8fc1b3d8f9e5394a81abb776f66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current behavior for busybox' udhcpc is to terminate if no lease is
obtained at start up. Therefore no address is acquired if the link is
established afterwards.

By setting the -b flag udhcpc will background allowing the link to be
established at any time.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
[Peter: drop incompatible -n, also fixup busybox-minimal.config]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox-minimal.config | 2 +-
 package/busybox/busybox.config         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index a7aa19ea8a..65a347756d 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -961,7 +961,7 @@ CONFIG_UDHCP_DEBUG=9
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R"
 
 #
 # Print Utilities
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 1ea810e5be..3925521f28 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -970,7 +970,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
 
 #
 # Print Utilities
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
