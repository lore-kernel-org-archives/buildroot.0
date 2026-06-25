Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36F3C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967F481FBD;
	Fri, 26 Jun 2026 14:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XhtU6WkAljS; Fri, 26 Jun 2026 14:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF44821EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485405;
	bh=R+x/f/hjBQZHzPt7ByUoVPdpYPOqkuhNoA91ViyILwQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TDsdFvGZbW6k/se3x4ZcvtvrsSNE+BVu84mkK3wE0lP5ZBf3QdUOteiQZ/SVcXd+r
	 Aq1DiqKl6GNMXkiPjD1EnMvBiChK6V/Bx0JOo/FLTTZpvwuADtJ3FtnT7IFhWbRslR
	 L2E8sZfX/yLA054k/n9Br+d4fsIbgQ7ewiqJrORKU/hUE15m7sdrcmeHHY2Yj0QpnY
	 H+nVriY9NU2Sn/J2+H7i+lgNhpnqxWa0hA6RyaU5KfV2zSjw934T3W1ATeTSdDzQp0
	 myU/0j6auThTsS9lVhmcbPDkrS7JprOt6YzxczAqkrizVXvsBa+mlIoBhtoq02b2+g
	 JkLvLGppT8azw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF44821EC;
	Fri, 26 Jun 2026 14:50:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C153231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7733781FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-l4YGpYZAhx for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F14E181FBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F14E181FBF
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6356864B7; Fri, 26 Jun 2026 14:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:27:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4d20d7f1ca069957c94bb38b77416b8e6d5d44ac
X-Git-Newrev: 26af331ea3073e396044ff5340609b1612cb1f82
X-Patchwork-Hint: ignore
Message-Id: <20260626144919.E6356864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpd/S95mpd: avoid
 unnecessary exit
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26af331ea3073e396044ff5340609b1612cb1f82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The exit status of the last command automatically becomes the exit
status of the script. And if there is no explicit exit shellcheck
accepts unused functions (here: start/stop/... called via variable).

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 118ffb20b5c739c61448ac6036f38a2aca6afcbc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/S95mpd | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index ac971e04a2..e33654a501 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -2,7 +2,6 @@
 #
 # S95mpd	Starts Music Player daemon.
 #
-# shellcheck disable=SC2317 # functions are called via variable
 
 DAEMON="mpd"
 PIDFILE="/var/run/$DAEMON.pid"
@@ -57,5 +56,3 @@ case "$1" in
 		echo "Usage: $0 {start|stop|reload|restart}"
 		exit 1
 esac
-
-exit $?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
