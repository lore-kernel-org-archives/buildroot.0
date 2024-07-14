Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3CEC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471A3606EB;
	Sun, 14 Jul 2024 17:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6o5nDZDIIuJ; Sun, 14 Jul 2024 17:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C096074A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C096074A;
	Sun, 14 Jul 2024 17:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B6211BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7621081204
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-1y7mTTPY4o for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A516981200
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A516981200
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 614548690B; Sun, 14 Jul 2024 17:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:31:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02d8e072d1149264601d87762c77cc806d29044b
X-Git-Newrev: 1f743f4004fc97576609dd8c09d80f0bfd08913e
X-Patchwork-Hint: ignore
Message-Id: <20240714173210.614548690B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: tidy up init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f743f4004fc97576609dd8c09d80f0bfd08913e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Use long options for start-stop-daemon

* Avoid --quiet, except for reload where the "stopping" message could
  be confusing

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/S50sshd | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index d16a7ad8fc..56db6ebff9 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -16,8 +16,8 @@ start() {
 	/usr/bin/ssh-keygen -A
 
 	printf "Starting %s: " "$DAEMON"
-	start-stop-daemon -S -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -29,8 +29,8 @@ start() {
 
 stop() {
 	printf "Stopping sshd: "
-	start-stop-daemon -K -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
@@ -51,8 +51,8 @@ restart() {
 
 reload() {
 	printf "Reloading sshd config: "
-	start-stop-daemon -K --signal HUP -q -p "$PIDFILE" \
-		-x "/usr/sbin/$DAEMON"
+	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
