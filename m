Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9773CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F13B41889;
	Wed,  3 Apr 2024 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxXDuoM1r7eu; Wed,  3 Apr 2024 21:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6CC41899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6CC41899;
	Wed,  3 Apr 2024 21:09:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8D41BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 493E260E47
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_CrBYBlfPFo for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72AD66073E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72AD66073E
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5238E84A78; Wed,  3 Apr 2024 21:09:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 23:09:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a1bcbe17e83c78de31a4cdf9161c1342d1021ae
X-Git-Newrev: 087115b96a6b053a333de2960aa75c6dd122f087
X-Patchwork-Hint: ignore
Message-Id: <20240403210939.5238E84A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/psplash: fix systemd unit ordering
 and dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=087115b96a6b053a333de2960aa75c6dd122f087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
