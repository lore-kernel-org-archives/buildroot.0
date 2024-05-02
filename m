Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA065C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EE86414E2;
	Thu,  2 May 2024 08:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fX_dThruE6T9; Thu,  2 May 2024 08:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CD341524
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31CD341524;
	Thu,  2 May 2024 08:37:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4F921BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CAA68233A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTwJsWyiOrOA for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9CAE82339
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9CAE82339
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B33688660A; Thu,  2 May 2024 08:36:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 09:51:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 99f6397a80d92bbaf64a07816a555d531655d799
X-Git-Newrev: 330386fef9179b169d3619818a6c692098f3f0e4
X-Patchwork-Hint: ignore
Message-Id: <20240502083654.B33688660A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/psplash: fix
 systemd unit ordering and dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=330386fef9179b169d3619818a6c692098f3f0e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix a typo in the dependencies, and switch the type to 'exec'.
This ensures that the psplash-systemd service will find the
FIFO created by psplash.

Change the psplash-systemd dependency to BindsTo, so stopping
psplash itself will also end this service and free resources.

psplash-start service need to start early, otherwise it might try
to compete/take away the framebuffer from the final graphical
stack. Order it before sysinit.target.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 087115b96a6b053a333de2960aa75c6dd122f087)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/psplash/psplash-start.service   | 2 ++
 package/psplash/psplash-systemd.service | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash-start.service b/package/psplash/psplash-start.service
index b97e883e54..74cbc33955 100644
--- a/package/psplash/psplash-start.service
+++ b/package/psplash/psplash-start.service
@@ -2,8 +2,10 @@
 Description=Starts Psplash Boot screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+Before=sysinit.target
 
 [Service]
+Type=exec
 ExecStart=/usr/bin/psplash -n
 
 [Install]
diff --git a/package/psplash/psplash-systemd.service b/package/psplash/psplash-systemd.service
index 249aa54039..f89bc5f4fe 100644
--- a/package/psplash/psplash-systemd.service
+++ b/package/psplash/psplash-systemd.service
@@ -1,8 +1,8 @@
 [Unit]
 Description=Start psplash-systemd progress communication helper
 DefaultDependencies=no
-After=systemd-start.service
-Requires=psplash-start.service
+After=psplash-start.service
+BindsTo=psplash-start.service
 RequiresMountsFor=/run
 
 [Service]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
