Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1DCD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C27D404D6;
	Tue,  3 Sep 2024 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REKgMYx6qCjF; Tue,  3 Sep 2024 21:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75105404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75105404A3;
	Tue,  3 Sep 2024 21:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9470D1BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EED640182
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6W385tdLck1O for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B0940198
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B0940198
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3228A86D34; Tue,  3 Sep 2024 21:14:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:14:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6016dad5cfbaa93d4acbf4edcc709d81bb6e5148
X-Git-Newrev: 4e9ef05b2ef85ab746a982c3663b80b2c94b5b53
X-Patchwork-Hint: ignore
Message-Id: <20240903211449.3228A86D34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/delve: needs CGO
 linking for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e9ef05b2ef85ab746a982c3663b80b2c94b5b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The target variant depends on CGO linking, so propagate it to the host
variant as well.

Fixes: http://autobuild.buildroot.org/results/530/530e95c3b1f8dd0494075735a401be89e0cb9938/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/delve/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/delve/Config.in.host b/package/delve/Config.in.host
index 0938ab0659..305198f1ab 100644
--- a/package/delve/Config.in.host
+++ b/package/delve/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_DELVE
 	bool "host delve"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
 	select BR2_PACKAGE_HOST_GO
 	help
 	  Delve is a debugger for the Go programming language.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
