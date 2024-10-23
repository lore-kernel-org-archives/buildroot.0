Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8747CD2E03B
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 09:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D0280C05;
	Wed, 23 Oct 2024 09:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOJ3aAAuJ5i1; Wed, 23 Oct 2024 09:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D8C8089C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D8C8089C;
	Wed, 23 Oct 2024 09:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6CE59B4
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 09:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 678C18089C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 09:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWa8hupe7RE8 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 09:53:39 +0000 (UTC)
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B54B580963
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 09:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B54B580963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B54B580963
Received: from shale.. (syn-141-126-093-001.res.spectrum.com [141.126.93.1])
 (authenticated bits=0)
 by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 49N9rZFf026461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Oct 2024 02:53:36 -0700
From: Sen Hastings <sen@hastings.org>
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
Date: Wed, 23 Oct 2024 02:52:52 -0700
Message-Id: <20241023095252.2742168-1-sen@hastings.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Sonic-CAuth: UmFuZG9tSVaxLku1LLIjZEGzCGIotrVfTRbj2FvHbon8dRgc8VR6nVZ/E05C8xxVN+Y1wrThbAjNgGJNa07dx+Wu1NLjP4vY
X-Sonic-ID: C;vGLFqySR7xGmH93BzLJMwQ== M;pMP5qySR7xGmH93BzLJMwQ==
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=hastings.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 spf=fail smtp.mailfrom=hastings.org
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: add unsure_cves
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When I initially made the CVE cells collapsible, I neglected to
count the unsure CVEs. This patch adds unsure CVEs to the cell collapsing
calcualation to ensure that cells with lots of unsure CVEs actually get collapsed.

This patch also removes the "+ 1" from the cve_total calculation,
which fixes the cve_total being off-by-one.
I'm not sure *why* I did that in the first place.

demo:
https://sen-h.codeberg.page/pkg-stats-demos/@pages/add-unsure_cves-to-cve_total-calc.html


Signed-off-by: Sen Hastings <sen@hastings.org>
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
