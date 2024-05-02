Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BA5C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 133C9417CC;
	Thu,  2 May 2024 16:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlNHVXrP0p7R; Thu,  2 May 2024 16:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF024186B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF024186B;
	Thu,  2 May 2024 16:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9724E1BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E08141B6C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8XgdGODryeU for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D1C4408DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D1C4408DC
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:33:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44E2E86620; Thu,  2 May 2024 16:33:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 18:30:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 59c153dbcd0b47e35f65dc911ee2bfb1bca0b895
X-Git-Newrev: 7a5eda5009b13bd434521436f9a3fa68d25e29b2
X-Patchwork-Hint: ignore
Message-Id: <20240502163355.44E2E86620@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/scripts/pkg-stats: fix/improve git hash sorting
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a5eda5009b13bd434521436f9a3fa68d25e29b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

sortGrid()'s handling of git hashes and other large hex numbers
has been inconsistent, they can be detected as strings or numbers
depending on what type of character they start with.
This patch fixes the behaviour by using a regex to capture everything
that looks like a big hex number and treat it as a string.
This means when you sort by current version ascending all the version
strings with big hex numbers should show up first, sorted 0-9,a-f.

First we check for a string length >= 39, and then apply a regex
to return an array with every char from that string that matched
the regex. If the length of this array is still >= 39 we can assume
we are looking at something containing a git hash.

The reason why the length is defined as ">= 39" and not "40" or
"39 or 40" is twofold:

Firstly, 39 was chosen as a minimum to match stuff with 39 char git
hashes, like the rockchip-mali package.

Secondly, there is no max because we actually want to catch not
just explicitly git hashes, but any verson string with big gnarly
hex numbers in it.
Stuff like: "1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292"

Why? Well, the idea is less about git hashes and sorting
and more about grouping similarly formatted version strings.

It would be impossble (or at least annoyingly complicated) and of
dubious utility to get a real sequential sort out of the
current version column, so the attempt here is to at the very
least collect all the similarly formatted things together.

This isn't perfect, but it's a (arguably) more useful sorted
output than before.

A demo is available here:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-improve-git-hash-sorting.html

Signed-off-by: Sen Hastings <sen@hastings.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ce7363524c172e65571e4b5d76ef65a36f7c3020)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3295eb7a48..4dc1857a9e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -741,6 +741,7 @@ addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 function sortGrid(sortLabel){
 	let i = 0;
 	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
+	const git_hash_regex = /[a-f,0-9]/gi;
 	const columnValues = Array.from(document.getElementsByClassName(sortLabel));
 	const columnName = document.getElementById(sortLabel);
 	let lastStyle = document.getElementById("sort-css");
@@ -765,7 +766,9 @@ function sortGrid(sortLabel){
                 pkgSortArray.push(sortArr);
         });
         pkgSortArray.forEach((listing) => {
-                if ( isNaN(parseInt(listing[1], 10)) ){
+                if ( listing[1].length >= 39 && listing[1].match(git_hash_regex).length >= 39){
+                        pkgStringSortArray.push(listing);
+		} else if ( isNaN(parseInt(listing[1], 10)) ){
                         pkgStringSortArray.push(listing);
                 } else {
                         listing[1] = parseFloat(listing[1]);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
