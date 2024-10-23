Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED73CFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA1381234;
	Wed, 23 Oct 2024 20:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRgzrjJb2B0R; Wed, 23 Oct 2024 20:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8802C81235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8802C81235;
	Wed, 23 Oct 2024 20:12:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 236044960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A2F8125F
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsSfYmrMxX9P for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B1678123F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1678123F
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:12:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 350DD863FB; Wed, 23 Oct 2024 20:12:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:11:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aad67f1575f1d8a9c90ccd70302e9a6823cf794
X-Git-Newrev: 87b8428c4017b220afe950aae3a673870698d986
X-Patchwork-Hint: ignore
Message-Id: <20241023201202.350DD863FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: add unsure_cves
 to cve_total calculation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87b8428c4017b220afe950aae3a673870698d986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
