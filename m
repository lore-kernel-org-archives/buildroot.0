Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D096C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 13:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91BF610E5;
	Sat, 11 Nov 2023 13:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91BF610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcs3x8vXr1iV; Sat, 11 Nov 2023 13:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B86610B9;
	Sat, 11 Nov 2023 13:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49B86610B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0731BF3BD
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 793D0822F1
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 793D0822F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXN5lVdtZdev for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B177B822F0
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B177B822F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1D6D86C57; Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 14:23:35 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 8b09097f4f2082afca7760a7d5172d29bd0eacbf
X-Git-Newrev: cfa253f8dce081dc5395ae6369e7a0811b58e236
X-Patchwork-Hint: ignore
Message-Id: <20231111133057.A1D6D86C57@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/petitboot: fix
 pb-discover pidfile creation
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfa253f8dce081dc5395ae6369e7a0811b58e236
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

pb-discover does not create its own pid file. Handle the creation and
removal of the pid file in the init script.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0f04c7ae01e2bbbb88b8e39f786bc91f4a01c07c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/S15pb-discover | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 0d960b54ac..71ab62d998 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -15,7 +15,7 @@ start() {
 	mkdir -p /var/log/petitboot
 
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -31,6 +31,7 @@ stop() {
 	start-stop-daemon -K -q -p "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
