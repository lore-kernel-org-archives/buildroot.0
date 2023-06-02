Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664CEC7EE29
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 19:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08849418B2;
	Fri,  2 Jun 2023 19:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08849418B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GF-BeNkHxz-5; Fri,  2 Jun 2023 19:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DA9D418AC;
	Fri,  2 Jun 2023 19:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DA9D418AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1081BF255
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7FF540029
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7FF540029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_bpTZAlAyUw for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 19:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFDC5400B4
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 19:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFDC5400B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAD7386B7D; Fri,  2 Jun 2023 19:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 2 Jun 2023 21:24:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2fb3a7e2a06c10092280081e45b2b8841add5d2
X-Git-Newrev: 281a80dc934d3e8d8e780b04276cfe38b4bea9d5
X-Patchwork-Hint: ignore
Message-Id: <20230602192548.DAD7386B7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/earlyoom: restore missing startup
 message in the init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=281a80dc934d3e8d8e780b04276cfe38b4bea9d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'/etc/init.d/S02earlyoom start' simply prints 'OK' instead of
'Starting earlyoom: OK' because of a typo in the printf function call.

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/earlyoom/S02earlyoom | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/earlyoom/S02earlyoom b/package/earlyoom/S02earlyoom
index 35624f3c72..ac1734109e 100644
--- a/package/earlyoom/S02earlyoom
+++ b/package/earlyoom/S02earlyoom
@@ -8,7 +8,7 @@ EARLYOOM_ARGS=""
 [ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
-	printf() 'Starting %s: ' "$DAEMON"
+	printf 'Starting %s: ' "$DAEMON"
 	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
 	       -- $EARLYOOM_ARGS
 	status=$?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
