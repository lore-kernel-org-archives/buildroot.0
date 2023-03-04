Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FCCC678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 12:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 973E4605D5;
	Sat,  4 Mar 2023 12:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 973E4605D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ALVY-xY9AZQB; Sat,  4 Mar 2023 12:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC6B60644;
	Sat,  4 Mar 2023 12:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC6B60644
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5381D1BF853
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EF34404B4
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF34404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y16953I6Xk4b for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 12:55:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18C04016F
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 12:55:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18C04016F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEEA2860E7; Sat,  4 Mar 2023 12:55:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 12:27:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 81d754698df5c57a0376ef8f5c394122cdac23da
X-Git-Newrev: 500cc1f46f048febd6fe3dd2c3a5e61f9926dbec
X-Patchwork-Hint: ignore
Message-Id: <20230304125552.DEEA2860E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-golang:
 disable version control information
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

commit: https://git.buildroot.net/buildroot/commit/?id=500cc1f46f048febd6fe3dd2c3a5e61f9926dbec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

By default go tries to include version control (VCS) information in
binaries. Since Buildroot separates version control from the build
process it is sensible to disable this behavior.

This avoids build errors when building with a git repository higher
up in the tree owned by root. In this case the go build system
calls `git status --porcelain` which returns with an error:
fatal: detected dubious ownership in repository at '/build'

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c3a1f0fe1b912727bb7b5baebe938f75036e566b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0b3dc3d32f..775633190e 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -45,7 +45,8 @@ $(2)_BUILD_OPTS += \
 	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
-	-p $$(PARALLEL_JOBS)
+	-p $$(PARALLEL_JOBS) \
+	-buildvcs=false
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
