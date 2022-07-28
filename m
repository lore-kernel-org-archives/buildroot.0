Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB98C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C99740136;
	Thu, 28 Jul 2022 07:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C99740136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C53j93E3uFW4; Thu, 28 Jul 2022 07:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B2E240B47;
	Thu, 28 Jul 2022 07:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2E240B47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D11E1BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17B7C60F1B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B7C60F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2yztXkEN4To for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:27:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39794605A4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39794605A4
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5DB4A867A5; Thu, 28 Jul 2022 07:13:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 08:52:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 786f8b45672ebdd432f6af5b7595d3d16013433b
X-Git-Newrev: 76acf02c34560a5b56f2852a94a3d0753bfd9961
X-Patchwork-Hint: ignore
Message-Id: <20220728071344.5DB4A867A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fixed
 sortGrid() performance
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

commit: https://git.buildroot.net/buildroot/commit/?id=76acf02c34560a5b56f2852a94a3d0753bfd9961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sortGrid() has been rewritten to dynamically generate stylesheets with
explicit grid-row properties to re-order the rows, instead of removing
and reinserting the cells.
Performance *should* now be comperable to sorttable.js.

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 116 +++++++++++++++++++++++++---------------------
 1 file changed, 64 insertions(+), 52 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d3ec65edbb..d795131cef 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -744,60 +744,72 @@ html_header = """
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <script>
+const triangleUp = String.fromCodePoint(32, 9652);
+const triangleDown = String.fromCodePoint(32, 9662);
+var lastColumnName = false;
+
 function sortGrid(sortLabel){
+	let i = 0;
 	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
-	let columnValues = Array.from(document.getElementsByClassName(sortLabel));
-
-	columnValues.shift();
-	columnValues.forEach((listing) => {
-		let sortArr = [];
-		sortArr[0] = listing.id.replace(sortLabel+"_", "");
-		if (!listing.innerText){
-			sortArr[1] = -1;
-		} else {
-			sortArr[1] = listing.innerText;
-		};
-		pkgSortArray.push(sortArr);
-	})
-	pkgSortArray.forEach((listing) => {
-		if ( isNaN(parseInt(listing[1], 10)) ){
-			pkgStringSortArray.push(listing);
-		} else {
-			listing[1] = parseFloat(listing[1]);
-			pkgNumSortArray.push(listing);
-		};
-	})
-	sortedStringPkgArray = pkgStringSortArray.sort(function(a, b) {
-		const nameA = a[1].toUpperCase(); // ignore upper and lowercase
-		const nameB = b[1].toUpperCase(); // ignore upper and lowercase
-		if (nameA < nameB) { return -1;	};
-		if (nameA > nameB) { return 1; };
-		return 0;   // names must be equal
-	});
-	sortedNumPkgArray = pkgNumSortArray.sort(function(a, b) {
-		return a[1] - b[1];
-	});
-
-	let triangleUp = String.fromCodePoint(32, 9652);
-	let triangleDown = String.fromCodePoint(32, 9662);
-	let columnName = document.getElementById(sortLabel);
-
-	if (columnName.lastElementChild.innerText == triangleDown) {
-		columnName.lastElementChild.innerText = triangleUp;
-		sortedStringPkgArray.reverse();
-		sortedNumPkgArray.reverse();
-		sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray)
-	} else {
-		columnName.lastElementChild.innerText = triangleDown;
-		sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray)
-	}
-
-	sortedPkgArray.forEach((listing) => {
-		let row = Array.from(document.getElementsByClassName(listing[0]));
-		let packageGrid = document.getElementById("package-grid");
-		row.forEach((element) => { packageGrid.append(element)});
-	})
-}
+	const columnValues = Array.from(document.getElementsByClassName(sortLabel));
+	const columnName = document.getElementById(sortLabel);
+	let lastStyle = document.getElementById("sort-css");
+
+	if (lastStyle){
+		lastStyle.disable = true;
+		lastStyle.remove();
+	};
+	const styleElement = document.createElement('style');
+	styleElement.id = "sort-css";
+	document.head.appendChild(styleElement);
+	const styleSheet = styleElement.sheet;
+
+        columnValues.shift();
+        columnValues.forEach((listing) => {
+                let sortArr = [];
+                sortArr[0] = listing.id.replace(sortLabel+"_", "");
+                if (!listing.innerText){
+                        sortArr[1] = -1;
+                } else {
+                        sortArr[1] = listing.innerText;
+                };
+                pkgSortArray.push(sortArr);
+        });
+        pkgSortArray.forEach((listing) => {
+                if ( isNaN(parseInt(listing[1], 10)) ){
+                        pkgStringSortArray.push(listing);
+                } else {
+                        listing[1] = parseFloat(listing[1]);
+                        pkgNumSortArray.push(listing);
+                };
+        });
+
+        let sortedStringPkgArray = pkgStringSortArray.sort((a, b) => {
+                if (a[1].toUpperCase() < b[1].toUpperCase()) { return -1; };
+                if (a[1].toUpperCase() > b[1].toUpperCase()) { return 1; };
+                return 0;
+        });
+        let sortedNumPkgArray = pkgNumSortArray.sort((a, b) => a[1] - b[1]);
+
+        if (columnName.lastElementChild.innerText == triangleDown) {
+                columnName.lastElementChild.innerText = triangleUp;
+                sortedStringPkgArray.reverse();
+                sortedNumPkgArray.reverse();
+                sortedPkgArray = sortedNumPkgArray.concat(sortedStringPkgArray);
+        } else {
+                columnName.lastElementChild.innerText = triangleDown;
+                sortedPkgArray = sortedStringPkgArray.concat(sortedNumPkgArray);
+        };
+
+	if (lastColumnName && lastColumnName != columnName){lastColumnName.lastElementChild.innerText = ""};
+	lastColumnName = columnName;
+	sortedPkgArray.unshift(["label"]);
+        sortedPkgArray.forEach((listing) => {
+		i++;
+		let rule = "." + listing[0] + " { grid-row: " + i + "; }";
+		styleSheet.insertRule(rule);
+        });
+};
 </script>
 
 <style>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
