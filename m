Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B3EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153CD40274;
	Thu,  1 Jan 2026 09:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF_OgAotOzGt; Thu,  1 Jan 2026 09:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE6140240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767259871;
	bh=mLUXvXZ+RHgdIbLd0333LF00Vnjnr7pDlpjzY4jkfN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P0L3w3oSiYF0l6A/fIZp/s4ON/PzE32L0QfpKzF6IUCW4f4ODanXZRJcJoBmLIEPU
	 tJ0T/x1Co4DnylesrplM//FqnEtjz5sJZlqNeLprawkXF1Vc9C6DSu3BWo4CCZVvS9
	 nEdj14UP1ODlB/XWi7Kpx8ZHbB87lbhTjmu94thPQUBkuuZ00+aw8L/1zV0mUlZWr5
	 szy5j/bK85bB+qzUCCy/2J1CvA4gwq8YQqKYRy9J0cwAIrfdQqUQJd0t+26gHr4gyR
	 mFGt/zL4aTS6U6CnjClLmex7fz5/bXoDQ9Fl1jXGNBs9ALCfmQ04H9grjJgxGVn2UG
	 R0XRybH8kInvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE6140240;
	Thu,  1 Jan 2026 09:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE7B351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C89607A3
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBTPBL3Ib3lf for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 633ED607A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633ED607A1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C5B387CE0; Thu,  1 Jan 2026 09:31:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:30:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60e12203b123a63a2c86ced4760d287095b85eae
X-Git-Newrev: b91258e424e68750615b6175f8fb9404522a5bfd
X-Patchwork-Hint: ignore
Message-Id: <20260101093108.3C5B387CE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: tidy up klogd init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=b91258e424e68750615b6175f8fb9404522a5bfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Wait for process to stop before deleting PID file, instead of fixed
  wait during restart

* Use long form options

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/busybox/S02klogd | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/busybox/S02klogd b/package/busybox/S02klogd
index 0677e1e5ca..f76d4e72d4 100644
--- a/package/busybox/S02klogd
+++ b/package/busybox/S02klogd
@@ -13,7 +13,8 @@ KLOGD_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
 		-- -n $KLOGD_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -26,20 +27,24 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" --exec "/sbin/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
 restart() {
 	stop
-	sleep 1
 	start
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
