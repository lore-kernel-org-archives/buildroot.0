Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 767596FBCF;
	Tue, 21 Feb 2023 01:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767596FBCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw8UqM0FFhZV; Tue, 21 Feb 2023 01:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD1437003E;
	Tue, 21 Feb 2023 01:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1437003E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFBEE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8946FC0F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D8946FC0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkwJhhn_qoxF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADE66FC11
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADE66FC11
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C90B781979; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:34:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b89eff429d4e8ad447addd53fde629676e19b76c
X-Git-Newrev: 6ddc29708d3c82f2f6055b596e484a6d963a6eae
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.C90B781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netopeer2: fix sysv
 init script, does not start
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ddc29708d3c82f2f6055b596e484a6d963a6eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- The netopeer server forks to background by default, no need for '-b'
 - The path to the daemon is /usr/sbin, not /usr/bin

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netopeer2/S52netopeer2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
index cf53a8f109..cadd6b9feb 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2
@@ -8,7 +8,7 @@ NETOPEER2_SERVER_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 
-	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
