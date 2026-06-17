Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D5CD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 164D06F777;
	Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKdsT2t76rh1; Wed, 17 Jun 2026 12:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A7736F64C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781698797;
	bh=WvfGr9Jd2sf/lxshyvnvyuU23HeFlRXMQQxJJtbSriM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YtXdRAFcWiPw6PEBQKS16iGdhWXGctuuK2Z4Rt5b6Zr0JPpIdPKGdxwysdlAilbmj
	 7uiaw5n9jKF+vF7QvMbSZQHsV+FHibJZI5EsbTgmvdH8HEKbU6Lg+F+NIPfs9MfzLu
	 UfS2fZH589njYu6shDszPCE8G5MQXE02PrdWWplYn2rFHQK2Ys3pyswfZNLDAM/jF8
	 D4f49F8rLyhhb0N5//rUaKYmx/wvcWts9dGXqilT/ZKYX+K5365NPxNa+VlxT6u72V
	 LMdAwSniBXMUQZD/Yj8W0GCu8+PASDz6mWaQTqB35vtMRZqepl9zPn0YPyZmJffrW7
	 vUQZ9/uElceSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A7736F64C;
	Wed, 17 Jun 2026 12:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A7AA347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B9846F64C
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnlJvb39TqdY for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A456160815
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A456160815
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B85811FF; Wed, 17 Jun 2026 12:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:18:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b94ada76083824475e92c51b14042dc8f2a66717
X-Git-Newrev: 118ffb20b5c739c61448ac6036f38a2aca6afcbc
X-Patchwork-Hint: ignore
Message-Id: <20260617121934.14B85811FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd/S95mpd: avoid unnecessary exit
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/118ffb20b5c739c61448ac6036f38a2aca6afcbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The exit status of the last command automatically becomes the exit
status of the script. And if there is no explicit exit shellcheck
accepts unused functions (here: start/stop/... called via variable).

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
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
