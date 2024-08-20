Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1144EC5321D
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C311B40AEE;
	Tue, 20 Aug 2024 17:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLGHrYxWHqCB; Tue, 20 Aug 2024 17:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158D340B13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 158D340B13;
	Tue, 20 Aug 2024 17:21:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 921561BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AC38608F9
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG2V8JjoI1KO for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3614D608FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3614D608FA
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE928614E; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:18:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e61425fd6448b2d46216fabb5936b0383ed1ea96
X-Git-Newrev: 11f75a23099835ac6c59416f6b83e797240e0da7
X-Patchwork-Hint: ignore
Message-Id: <20240820172121.2CE928614E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/scripts/mkusers:
 accept user tables without terminating \n
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

commit: https://git.buildroot.net/buildroot/commit/?id=11f75a23099835ac6c59416f6b83e797240e0da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5d8445138bd466f80dd45dab1b9fb7279f1536eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/mkusers | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index ee09bbd1f2..08f3344518 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -409,9 +409,8 @@ main() {
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
-    while read -r line; do
-        ENTRIES+=( "${line}" )
-    done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
+    # mapfile reads all lines, even the last one if it is missing a \n
+    mapfile -t ENTRIES < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
     # We first create groups whose gid is positive, and then we create groups
     # whose gid is automatic, so that, if a group is defined both with
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
