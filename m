Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9985AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40B4A40142;
	Mon, 31 Jan 2022 20:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDjw-Gz6oKC7; Mon, 31 Jan 2022 20:38:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F3FD40120;
	Mon, 31 Jan 2022 20:38:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3915F1BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2783B401CB
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FU34n5sea8w2 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:38:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83BCD4016F
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:38:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0291E825D0; Mon, 31 Jan 2022 20:31:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 21:24:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bebeb772eb0b28ab1488ce91bc59a06a573ee6e5
X-Git-Newrev: e9b1dffa5d17c7af5d6171de88348431a6260308
X-Patchwork-Hint: ignore
Message-Id: <20220131203116.0291E825D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/size-stats-compare: clarify meaning
 of variables in print_result
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9b1dffa5d17c7af5d6171de88348431a6260308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

print_result is juggling with entry[x][y] which is not very readable.
While a better solution would be to use a class and reference named
attributes, that would require some bigger changes in the script.

Instead, make a minimal improvement by assigning the entry[x][y] values to
intermediate variables. Store them in a dict for easy usage from a format
string.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/size-stats-compare | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/utils/size-stats-compare b/utils/size-stats-compare
index 422972e488..c679150654 100755
--- a/utils/size-stats-compare
+++ b/utils/size-stats-compare
@@ -77,9 +77,15 @@ def print_results(result, threshold):
     # list_result is a list of tuples: (name, (flag, size difference))
 
     for entry in sorted(list_result, key=lambda entry: entry[1][1]):
-        if threshold is not None and abs(entry[1][1]) <= threshold:
+        data = dict(
+            name=entry[0],
+            action=entry[1][0],
+            size=entry[1][1],
+        )
+
+        if threshold is not None and abs(data['size']) <= threshold:
             continue
-        print('%12s %7s %s' % (entry[1][1], entry[1][0], entry[0]))
+        print('{size:12d} {action:7s} {name}'.format(**data))
 
 
 # main #########################################################################
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
