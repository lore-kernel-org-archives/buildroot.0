Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE3CC7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4563418B2;
	Fri,  2 Jun 2023 19:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4563418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xBknPtU1l98; Fri,  2 Jun 2023 19:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17EC7418A8;
	Fri,  2 Jun 2023 19:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17EC7418A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEE451BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1009616A9
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1009616A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eePcAepjhsUu for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6D07616B6
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6D07616B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFB8B86B7C; Fri,  2 Jun 2023 19:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:23:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1e3d02cd4d9ba04b9aea8bf10a960104d171773
X-Git-Newrev: b2fb3a7e2a06c10092280081e45b2b8841add5d2
X-Patchwork-Hint: ignore
Message-Id: <20230602192548.CFB8B86B7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/earlyoom: fix daemon executable
 path in the init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2fb3a7e2a06c10092280081e45b2b8841add5d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

earlyoom.mk file explicitly sets 'PREFIX=/usr', and the init script
fails to start earlyoom because of a nonexistent executable path:

  # /etc/init.d/S02earlyoom start
  start-stop-daemon: unable to stat /bin/earlyoom (No such file or directory)
  FAIL

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/earlyoom/S02earlyoom | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/S02earlyoom b/package/earlyoom/S02earlyoom
index c02495af90..35624f3c72 100644
--- a/package/earlyoom/S02earlyoom
+++ b/package/earlyoom/S02earlyoom
@@ -9,7 +9,7 @@ EARLYOOM_ARGS=""
 
 start() {
 	printf() 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/bin/$DAEMON" \
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
 	       -- $EARLYOOM_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
