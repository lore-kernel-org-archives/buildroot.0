Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE5AC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A6660F8B;
	Fri, 26 Jun 2026 14:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iCzcOkfjqOmF; Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876DB60F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485499;
	bh=yXdCURUGOPev4dWx0O1WF7rDigax7Zgm6ev8CXTtHEc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G5aWcWpHyHxjW5t25u0XDTUYTonbQTdVxhwqRU/XcMkkM2vNLWy6vSRAZq53SZlSf
	 Jhf/8PQS5OM58qPGLbFYl5AdfGhQC51IgxAG8lCVshfgcwk0pWLQZFLwnTBeFC0ZBf
	 EOz0gAHHs/LQB3yDTMYMgPbjpglkWZj/bs2HYf9LeivaGOFq6NmFUYEZFQJrVqqB07
	 93B7UJwzFhvG5YZ4nQ3YAQjhTwreGT8Fkiscfx/KGbFQQR1DCtdUIlmU2XN+OwqAg1
	 k0imW7s9GmdpkS/GQQsFu2T73EeUar/mllDVASDTryJHZHlihzei8QMIy73tBDLjsk
	 Aldi+59PRaXYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876DB60F3A;
	Fri, 26 Jun 2026 14:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 274E23A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C8C040F36
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZ6nYVHEVqro for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C4A140E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C4A140E21
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F18864B7; Fri, 26 Jun 2026 14:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:27:52 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 207b0a2699df2327a9502dddd7c9584eb2e760a6
X-Git-Newrev: 834c844e3b52b9f55c55d8e6c30284c8ce48afcf
X-Patchwork-Hint: ignore
Message-Id: <20260626145106.53F18864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mpd/S95mpd: avoid
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/834c844e3b52b9f55c55d8e6c30284c8ce48afcf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
