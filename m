Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A99EC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AFC6400BF;
	Mon,  6 Feb 2023 11:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AFC6400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H91Gj8RD5Pmn; Mon,  6 Feb 2023 11:34:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 433AD40339;
	Mon,  6 Feb 2023 11:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 433AD40339
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BE8B1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4676240339
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4676240339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJbESbxKzRcw for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:34:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D04640328
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D04640328
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65F3283AFC; Mon,  6 Feb 2023 11:34:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:34:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89eff429d4e8ad447addd53fde629676e19b76c
X-Git-Newrev: 6ddc29708d3c82f2f6055b596e484a6d963a6eae
X-Patchwork-Hint: ignore
Message-Id: <20230206113452.65F3283AFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: fix sysv init script,
 does not start
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
