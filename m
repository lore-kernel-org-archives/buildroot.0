Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D96CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F54B4168F;
	Sun,  7 Apr 2024 16:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PS-_iBX4IjY; Sun,  7 Apr 2024 16:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E27DE4177B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27DE4177B;
	Sun,  7 Apr 2024 16:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1504F1BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD3C04148F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYSQPhHMpaRs for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7262414C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7262414C0
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF7ED85730; Sun,  7 Apr 2024 16:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:04:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e3d79f52ef0e1b2b6fe1e660820cabdca6179c2
X-Git-Newrev: ce7363524c172e65571e4b5d76ef65a36f7c3020
X-Patchwork-Hint: ignore
Message-Id: <20240407160511.AF7ED85730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix/improve git
 hash sorting
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce7363524c172e65571e4b5d76ef65a36f7c3020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
