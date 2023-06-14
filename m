Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1B6EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F93611E1;
	Wed, 14 Jun 2023 09:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83F93611E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCCE4JJSIpk3; Wed, 14 Jun 2023 09:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 231326125C;
	Wed, 14 Jun 2023 09:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 231326125C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 845861BF860
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0BE6121E
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C0BE6121E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68cdlBhS06Oa for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 678526117F
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 678526117F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5585783584; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 11:22:17 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 75b55ffc466b0114c5fc0edaa6c2e322baedf64b
X-Git-Newrev: 268152267ee62ffc91e8a4daf1eb03667c1f44ca
X-Patchwork-Hint: ignore
Message-Id: <20230614092354.5585783584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/earlyoom: fix
 daemon executable path in the init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=268152267ee62ffc91e8a4daf1eb03667c1f44ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

earlyoom.mk file explicitly sets 'PREFIX=/usr', and the init script
fails to start earlyoom because of a nonexistent executable path:

  # /etc/init.d/S02earlyoom start
  start-stop-daemon: unable to stat /bin/earlyoom (No such file or directory)
  FAIL

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b2fb3a7e2a06c10092280081e45b2b8841add5d2)
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
