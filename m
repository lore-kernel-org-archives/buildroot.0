Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E66EC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 19:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C26827BB;
	Wed, 28 Feb 2024 19:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwOiBemQVW3F; Wed, 28 Feb 2024 19:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36FFA82848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36FFA82848;
	Wed, 28 Feb 2024 19:32:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFC7E1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBC0E60ECF
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxTtfJ-ktqKv for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD70960BF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD70960BF2
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4FEF87CD8; Wed, 28 Feb 2024 19:32:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 20:16:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54f8d97c913e3c38073d6a31ed3ff02dd71cf9cb
X-Git-Newrev: 75a3562324bd64d4d02edbcf840809863d4c266f
X-Patchwork-Hint: ignore
Message-Id: <20240228193247.A4FEF87CD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: sort CVEs in
 HTML output
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

commit: https://git.buildroot.net/buildroot/commit/?id=75a3562324bd64d4d02edbcf840809863d4c266f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the old NVD JSON feed provided data files where the CVEs were
sorted by ID, the new feed from FKIE does not have sorted CVEs.

Add a method to sort a list of CVE IDs (i.e. CVE ID strings, not CVE
objects!), and use that when emiting the HTML output.

The JSON output need not be sorted, because it is supposed to be used
for post-processing, and we do not care about the ordering there; a
consumer interested in sorting should sort on their side.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/cve.py    | 7 +++++++
 support/scripts/pkg-stats | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 747ad881c9..1a3c307e12 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -117,6 +117,13 @@ class CVE:
         open(path_metaf, "w").write(page_meta.text)
         return path_jsonf_xz
 
+    @staticmethod
+    def sort_id(cve_ids):
+        def cve_key(cve_id):
+            year, id_ = cve_id.split('-')[1:]
+            return (int(year), int(id_))
+        return sorted(cve_ids, key=cve_key)
+
     @classmethod
     def read_nvd_dir(cls, nvd_dir):
         """
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index afb746704a..9a4a3ccad5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1055,9 +1055,9 @@ def dump_html_pkg(f, pkg):
         f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
         class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
-        for cve in pkg.cves:
+        for cve in cvecheck.CVE.sort_id(pkg.cves):
             f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
-        for cve in pkg.unsure_cves:
+        for cve in cvecheck.CVE.sort_id(pkg.unsure_cves):
             f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve} <i>(unsure)</i></a><br/>\n')
     elif pkg.is_status_na("cve"):
         f.write(f"""    {pkg.status['cve'][1]}""")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
