Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23990C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266BA40649;
	Mon,  8 Jul 2024 21:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sP0HEEiDyD1Q; Mon,  8 Jul 2024 21:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCDD40691
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DCDD40691;
	Mon,  8 Jul 2024 21:51:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1B701BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB667405ED
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7kwFrqzDxPq for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08680405BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08680405BE
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69394841EF; Mon,  8 Jul 2024 21:51:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:50:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df605de1349251687640519fcc2d2147cf146af9
X-Git-Newrev: 2c14a55c6cf28ada9f1d3d17d3b11370829372ca
X-Patchwork-Hint: ignore
Message-Id: <20240708215103.69394841EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: implement "reload" using
 SIGHUP
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c14a55c6cf28ada9f1d3d17d3b11370829372ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the documented "reload configuration" method for OpenSSH.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/S50sshd | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 781aad8715..d16a7ad8fc 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -49,6 +49,19 @@ restart() {
 	start
 }
 
+reload() {
+	printf "Reloading sshd config: "
+	start-stop-daemon -K --signal HUP -q -p "$PIDFILE" \
+		-x "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
 case "$1" in
 	start)
 		start
@@ -56,11 +69,14 @@ case "$1" in
 	stop)
 		stop
 		;;
-	restart|reload)
+	restart)
 		restart
 		;;
+	reload)
+		reload
+		;;
 	*)
-		echo "Usage: $0 {start|stop|restart}"
+		echo "Usage: $0 {start|stop|restart|reload}"
 		exit 1
 esac
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
