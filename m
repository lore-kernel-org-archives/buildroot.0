Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E027C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 09:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A2641572;
	Tue,  5 Mar 2024 09:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yO3c2_3dYEo; Tue,  5 Mar 2024 09:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F4841574
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F4841574;
	Tue,  5 Mar 2024 09:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2E911BF25F
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D038E41597
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 09:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PceVJsIlCcpT for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 09:33:41 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=64.142.111.80;
 helo=c.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D590041595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D590041595
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D590041595
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (141-126-093-001.res.spectrum.com
 [141.126.93.1]) (authenticated bits=0)
 by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 4259XcxK017847
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 5 Mar 2024 01:33:38 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 01:33:34 -0800
Message-Id: <20240305093334.2233237-1-sen@hastings.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVbnfws2uCjhFfLbS6HhQnoOKyJwQ99qVgW9JbLsEQTslgbX2myH9bEfaGYZESvUbiirS4I/zeyMNNJ0KCts6ooL
X-Sonic-ID: C;ivIDctPa7hGjV9bXR+6Zsg== M;kDA4ctPa7hGjV9bXR+6Zsg==
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH v2 1/1] support/scripts/pkg-stats: fix/improve
 git hash sorting
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
  - more detailed commit log (requested by Yann E. MORIN)
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
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
