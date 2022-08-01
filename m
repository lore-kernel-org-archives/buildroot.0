Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B44C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 16:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99049409F2;
	Mon,  1 Aug 2022 16:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99049409F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hB85eKUq5YYv; Mon,  1 Aug 2022 16:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E95A409EB;
	Mon,  1 Aug 2022 16:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E95A409EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB0DA1BF315
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3AB940529
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3AB940529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m8k4G6nN4xeA for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03B24404F3
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 16:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B24404F3
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E5A886A1F; Mon,  1 Aug 2022 16:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 18:47:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d45b5377c12367941a2cd7502ec773e99bb52f52
X-Git-Newrev: 559648a25774ae2be8668a871b1a8a8ef673b2d2
X-Patchwork-Hint: ignore
Message-Id: <20220801163619.0E5A886A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: re-implement
 the sortable_hint
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=559648a25774ae2be8668a871b1a8a8ef673b2d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This attempts to re-implement the "sortable_hint" feature without
relying on words. The column headers and CVE expand/contract buttons
change color and cursor style on hover.

If Javascript is enabled:

Just like [PATCH 1/3] more rules are applied to the
generated stylesheet before content is loaded.

If Javascript is disabled:

The headers stay pearly white. :-)

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8ce4e3f260..91d42206ca 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -750,11 +750,13 @@ var lastColumnName = false;
 const styleElement = document.createElement('style');
 document.head.insertAdjacentElement("afterend", styleElement);
 const styleSheet = styleElement.sheet;
-const collapseRule = ".collapse{ height: 200px; overflow: hidden scroll;}"
-const buttonRule = ".see-more{ display: block;}"
+addedCSSRules = [
+".collapse{ height: 200px; overflow: hidden scroll;}",
+".see-more{ display: block;}",
+".label:hover,.see-more:hover { cursor: pointer; background: #d2ffc4;}"
+];
 
-styleSheet.insertRule(collapseRule);
-styleSheet.insertRule(buttonRule);
+addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 
 function sortGrid(sortLabel){
 	let i = 0;
@@ -816,8 +818,7 @@ function sortGrid(sortLabel){
 		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
 		styleSheet.insertRule(rule);
         });
-	styleSheet.insertRule(collapseRule);
-	styleSheet.insertRule(buttonRule);
+	addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
 };
 
 function expandField(fieldId){
@@ -887,17 +888,10 @@ function expandField(fieldId){
 
 <a href=\"#results\">Results</a><br/>
 
-<p id=\"sortable_hint\"></p>
 """  # noqa - tabs and spaces
 
 
 html_footer = """
-<script>
-if (typeof sortGrid === "function") {
-  document.getElementById("sortable_hint").innerHTML =
-  "hint: the table can be sorted by clicking the column headers"
-}
-</script>
 </body>
 </html>
 """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
