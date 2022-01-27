Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D584C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5186241BD5;
	Thu, 27 Jan 2022 16:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sWIz2BEwRX0m; Thu, 27 Jan 2022 16:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8731C416EC;
	Thu, 27 Jan 2022 16:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E454F1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39FD8283D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6WNEzxkq34C for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08CEF81D18
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:54:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CEB34821F7; Thu, 27 Jan 2022 16:47:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 17:46:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 947b6bc79924101f2a7956fd291be05d5f512d6b
X-Git-Newrev: 67be1ff4f7c6db8091d1b09daa9e6765e6a6f329
X-Patchwork-Hint: ignore
Message-Id: <20220127164720.CEB34821F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 support/scripts/pkg-stats: account for unsure CVEs
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

commit: https://git.buildroot.net/buildroot/commit/?id=67be1ff4f7c6db8091d1b09daa9e6765e6a6f329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The .affects() method of the CVE class in support/scripts/cve.py can
return 3 values: CVE_AFFECTS, CVE_DOESNT_AFFECT and CVE_UNKNOWN.

We of course properly account for CVEs where .affects() return
CVE_AFFECTS, but the ones for which CVE_UNKNOWN is returned are
currently ignored, and therefore treated as if they did not affect the
package.

However CVE_UNKNOWN in fact indicates that the v_start/v_end fields of
the CPE entry could not be parsed by
distutils.version.LooseVersion(). Instead of ignoring such cases, this
commit adds support for the concept of "unsure CVEs", which will be
listed next to CVEs known to affect the package, so that we are aware
of them and can investigate the version issue.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a206bbc5fe3453f8763268261c4a7aa6ba2c275d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 6e656bfc29..0ac7466776 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -101,6 +101,7 @@ class Package:
         self.cpeid = None
         self.cves = list()
         self.ignored_cves = list()
+        self.unsure_cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
 
@@ -569,8 +570,11 @@ def check_package_cve_affects(cve, cpe_product_pkgs):
         if product not in cpe_product_pkgs:
             continue
         for pkg in cpe_product_pkgs[product]:
-            if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid) == cve.CVE_AFFECTS:
+            cve_status = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves, pkg.cpeid)
+            if cve_status == cve.CVE_AFFECTS:
                 pkg.cves.append(cve.identifier)
+            elif cve_status == cve.CVE_UNKNOWN:
+                pkg.unsure_cves.append(cve.identifier)
 
 
 def check_package_cves(nvd_path, packages):
@@ -596,7 +600,7 @@ def check_package_cves(nvd_path, packages):
 
     for pkg in packages:
         if 'cve' not in pkg.status:
-            if pkg.cves:
+            if pkg.cves or pkg.unsure_cves:
                 pkg.status['cve'] = ("error", "affected by CVEs")
             else:
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
@@ -651,8 +655,11 @@ def calculate_stats(packages):
             stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
         stats["total-cves"] += len(pkg.cves)
+        stats["total-unsure-cves"] += len(pkg.unsure_cves)
         if len(pkg.cves) != 0:
             stats["pkg-cves"] += 1
+        if len(pkg.unsure_cves) != 0:
+            stats["pkg-unsure-cves"] += 1
         if pkg.cpeid:
             stats["cpe-id"] += 1
         else:
@@ -904,6 +911,8 @@ def dump_html_pkg(f, pkg):
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
             f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+        for cve in pkg.unsure_cves:
+            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i><br/>\n" % (cve, cve))
     elif pkg.is_status_na("cve"):
         f.write("    %s" % pkg.status['cve'][1])
     else:
@@ -986,6 +995,10 @@ def dump_html_stats(f, stats):
             stats["pkg-cves"])
     f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
             stats["total-cves"])
+    f.write("<tr><td>Packages affected by unsure CVEs</td><td>%s</td></tr>\n" %
+            stats["pkg-unsure-cves"])
+    f.write("<tr><td>Total number of unsure CVEs affecting all packages</td><td>%s</td></tr>\n" %
+            stats["total-unsure-cves"])
     f.write("<tr><td>Packages with CPE ID</td><td>%s</td></tr>\n" %
             stats["cpe-id"])
     f.write("<tr><td>Packages without CPE ID</td><td>%s</td></tr>\n" %
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
