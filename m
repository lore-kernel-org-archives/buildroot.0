Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DBCC48BF6
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 01:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC37C60A57;
	Tue,  5 Mar 2024 01:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81GGa7oANinc; Tue,  5 Mar 2024 01:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6089E60907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6089E60907;
	Tue,  5 Mar 2024 01:34:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02C3F1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09DC4084A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 01:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cATpiEtFLEZi for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 01:34:15 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=64.142.111.80;
 helo=c.mail.sonic.net; envelope-from=sen@hastings.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F64A40844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F64A40844
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F64A40844
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 01:34:14 +0000 (UTC)
Received: from localhost.localdomain (097-094-157-027.res.spectrum.com
 [97.94.157.27]) (authenticated bits=0)
 by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 4251Y8Vk020862
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 4 Mar 2024 17:34:09 -0800
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 17:33:53 -0800
Message-Id: <20240305013353.1763404-1-sen@hastings.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVbAJtLNAYSHVtQ5mk3Djz3Uu+uPNPO2BNaPTBhH8Ti8sDvHSLzy9rH1aCeLchwVt3+hpKsgbjb/A8FvJtKSfNJ7
X-Sonic-ID: C;lkQIdpDa7hGlONbXR+6Zsg== M;atFHdpDa7hGlONbXR+6Zsg==
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix/improve git
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
Cc: Sen Hastings <sen@hastings.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sortGrid()'s handling of git hashes has been inconsistent, they can
be detected as strings or numbers depending on what type of character
they start with. This patch fixes the behaviour by using a regex to
capture everything that looks like a git hash and treat it as a
string. This means when you sort by current version ascending
all the version strings with git hashes should show up first, sorted
0-9,a-f.

A demo is available here:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-improve-git-hash-sorting.html

Signed-off-by: Sen Hastings <sen@hastings.org>
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
