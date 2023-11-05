Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74310C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2360B82117;
	Sun,  5 Nov 2023 18:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2360B82117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtCjqhyU0tGb; Sun,  5 Nov 2023 18:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD2882108;
	Sun,  5 Nov 2023 18:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DD2882108
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 637D31BF870
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20A17418F8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A17418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVWYqhTssQng for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3060941904
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3060941904
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 075A5867F0; Sun,  5 Nov 2023 18:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 18:14:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4954b5140e17f298a32a8537ed2948351dc4f5b1
X-Git-Newrev: 0f04c7ae01e2bbbb88b8e39f786bc91f4a01c07c
X-Patchwork-Hint: ignore
Message-Id: <20231105183144.075A5867F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: fix pb-discover pidfile
 creation
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f04c7ae01e2bbbb88b8e39f786bc91f4a01c07c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pb-discover does not create its own pid file. Handle the creation and
removal of the pid file in the init script.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/S15pb-discover | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 7ecc12e991..9b641298ca 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -16,7 +16,7 @@ fi
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -32,6 +32,7 @@ stop() {
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
