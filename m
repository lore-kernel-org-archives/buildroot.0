Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB675D3A696
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E9580FFE;
	Tue, 29 Oct 2024 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOQJxqMcak3l; Tue, 29 Oct 2024 20:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05DF580BFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05DF580BFD;
	Tue, 29 Oct 2024 20:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1BB5E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B5D640ACB
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5KvRssXT0vr for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 758794014E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 758794014E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61319847A5; Tue, 29 Oct 2024 20:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 21:23:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01177dcc8169d374325e23aa640a58b6efbde9a3
X-Git-Newrev: b730a1ea024300d1e27b30691a136c02694c20f8
X-Patchwork-Hint: ignore
Message-Id: <20241029202350.61319847A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: consistently use $DAEMON
 in start script output
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b730a1ea024300d1e27b30691a136c02694c20f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was already done in start(), but not in stop() and reload().

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/S50sshd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 7e5ccf079d..a5ff385acc 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -28,7 +28,7 @@ start() {
 }
 
 stop() {
-	printf "Stopping sshd: "
+	printf "Stopping %s: " "$DAEMON"
 	start-stop-daemon --stop --pidfile "$PIDFILE" \
 		--exec "/usr/sbin/$DAEMON"
 	status=$?
@@ -50,7 +50,7 @@ restart() {
 }
 
 reload() {
-	printf "Reloading sshd config: "
+	printf "Reloading %s config: " "$DAEMON"
 	start-stop-daemon --stop --signal HUP -q --pidfile "$PIDFILE" \
 		--exec "/usr/sbin/$DAEMON"
 	status=$?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
