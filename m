Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5954ED5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612CA42C0F;
	Sat,  9 Nov 2024 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzDKsmRDuHtm; Sat,  9 Nov 2024 17:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBCD54015F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBCD54015F;
	Sat,  9 Nov 2024 17:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39084DAD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EBB74025C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXfqr4oVjDRu for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05302400D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05302400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:12:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1C5685ECD; Sat,  9 Nov 2024 17:12:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 17:27:45 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 56ca98a3b130acf9b04c3ca9dd09d1a01a4eeb80
X-Git-Newrev: 78e5db397e7bbcd7dc2bdca62ed4b7d60634ae75
X-Patchwork-Hint: ignore
Message-Id: <20241109171224.E1C5685ECD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 support/scripts/pkg-stats: add unsure_cves to cve_total calculation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=78e5db397e7bbcd7dc2bdca62ed4b7d60634ae75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

When I initially made the CVE cells collapsible, I neglected to
count the unsure CVEs. This patch adds unsure CVEs to the cell collapsing
calcualation to ensure that cells with lots of unsure CVEs actually get collapsed.

This patch also removes the "+ 1" from the cve_total calculation,
which fixes the cve_total being off-by-one.
I'm not sure *why* I did that in the first place.

demo:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/add-unsure_cves-to-cve_total-calc.html

Signed-off-by: Sen Hastings <sen@hastings.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 87b8428c4017b220afe950aae3a673870698d986)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f143af6446..33c21e77b4 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1043,7 +1043,8 @@ def dump_html_pkg(f, pkg):
     data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
     div_class.append(f'_{pkg_css_class}')
-    if len(pkg.cves) > 10:
+    cve_total = len(pkg.cves) + len(pkg.unsure_cves)
+    if cve_total > 10:
         div_class.append("collapse")
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
@@ -1054,8 +1055,7 @@ def dump_html_pkg(f, pkg):
     else:
         div_class.append("cve-unknown")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
-    if len(pkg.cves) > 10:
-        cve_total = len(pkg.cves) + 1
+    if cve_total > 10:
         f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
         class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
