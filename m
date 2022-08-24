Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF25ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A073840B88;
	Sun, 11 Sep 2022 09:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A073840B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pIOSOpMQVVs; Sun, 11 Sep 2022 09:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E6BE4103A;
	Sun, 11 Sep 2022 09:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E6BE4103A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 105711BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560DE81D0C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 560DE81D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhC1lWmlimA9 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF0C8131D
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF0C8131D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9FE21835E4; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:36:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a3fba9402a84d00762eeeeb7086f855d8a0d0f
X-Git-Newrev: d68628a5382844a40856be486cd41dbfb0c7cabb
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.9FE21835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: remove
 remaining double quote escaping
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

commit: https://git.buildroot.net/buildroot/commit/?id=d68628a5382844a40856be486cd41dbfb0c7cabb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is done either by switching to single quoted f-strings, triple
double quoted f-strings when needed, or simply single-quoted strings.

The renderer HTML is exactly identical before/after this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-By: Sen Hastings <sen@phobosdpl.com>
Acked-By: Sen Hastings <sen@phobosdpl.com>
---
 support/scripts/pkg-stats | 67 ++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 572757b7ea..aa3b49c809 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1010,13 +1010,12 @@ def dump_html_pkg(f, pkg):
         if pkg.latest_version['version'] is None:
             latest_version_text = "<b>Found, but no version</b>"
         else:
-            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
-                (pkg.latest_version['id'], str(pkg.latest_version['version']))
+            latest_version_text = f"""<a href="https://release-monitoring.org/project/{pkg.latest_version['id']}"><b>{str(pkg.latest_version['version'])}</b></a>"""
 
         latest_version_text += "<br/>"
 
         if pkg.latest_version['status'] == RM_API_STATUS_FOUND_BY_DISTRO:
-            latest_version_text += "found by <a href=\"https://release-monitoring.org/distro/Buildroot/\">distro</a>"
+            latest_version_text += f'found by <a href="https://release-monitoring.org/distro/Buildroot/">distro</a>'
         else:
             latest_version_text += "found by guess"
 
@@ -1041,10 +1040,10 @@ def dump_html_pkg(f, pkg):
         div_class.append("missing_url")
     if pkg.status['url'][0] == "error":
         div_class.append("invalid_url")
-        url_str = "<a href=\"%s\">%s</a>" % (pkg.url, pkg.status['url'][1])
+        url_str = f"""<a href="{pkg.url}">{pkg.status['url'][1]}</a>"""
     else:
         div_class.append("good_url")
-        url_str = "<a href=\"%s\">Link</a>" % pkg.url
+        url_str = f'<a href="{pkg.url}">Link</a>'
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">{url_str}</div>\n')
 
     # CVEs
@@ -1068,11 +1067,11 @@ def dump_html_pkg(f, pkg):
         class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
         for cve in pkg.cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (cve, cve))
+            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
         for cve in pkg.unsure_cves:
-            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s <i>(unsure)</i></a><br/>\n" % (cve, cve))
+            f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve} <i>(unsure)</i></a><br/>\n')
     elif pkg.is_status_na("cve"):
-        f.write("    %s" % pkg.status['cve'][1])
+        f.write(f"""    {pkg.status['cve'][1]}""")
     else:
         f.write("    N/A\n")
     f.write("  </div>\n")
@@ -1085,7 +1084,7 @@ def dump_html_pkg(f, pkg):
         div_class.append("cve_ignored")
     f.write(f'  <div id="{data_field_id}" class="{" ".join(div_class)}">\n')
     for ignored_cve in pkg.ignored_cves:
-        f.write("    <a href=\"https://security-tracker.debian.org/tracker/%s\">%s</a><br/>\n" % (ignored_cve, ignored_cve))
+        f.write(f'    <a href="https://security-tracker.debian.org/tracker/{ignored_cve}">{ignored_cve}</a><br/>\n')
     f.write("  </div>\n")
 
     # CPE ID
@@ -1108,11 +1107,9 @@ def dump_html_pkg(f, pkg):
     if not pkg.is_status_ok("cpe"):
         if pkg.is_actual_package and pkg.current_version:
             if pkg.cpeid:
-                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+                f.write(f"""  <br/>{pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={":".join(pkg.cpeid.split(":")[0:5])}">(Search)</a>\n""") # noqa: E501
             else:
-                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                        (pkg.status['cpe'][1], pkg.name))
+                f.write(f"""  {pkg.status['cpe'][1]} <a href="https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword={pkg.name}">(Search)</a>\n""")  # noqa: E501
         else:
             f.write("  %s\n" % pkg.status['cpe'][1])
 
@@ -1155,49 +1152,49 @@ def dump_html_all_pkgs(f, packages):
 
 
 def dump_html_stats(f, stats):
-    f.write("<a id=\"results\"></a>\n")
-    f.write("<div class=\"data\" id=\"results-grid\">\n")
+    f.write('<a id="results"></a>\n')
+    f.write('<div class="data" id="results-grid">\n')
     infras = [infra[6:] for infra in stats.keys() if infra.startswith("infra-")]
     for infra in infras:
-        f.write(" <div class=\"data\">Packages using the <i>%s</i> infrastructure</div><div class=\"data\">%s</div>\n" %
+        f.write(' <div class="data">Packages using the <i>%s</i> infrastructure</div><div class="data">%s</div>\n' %
                 (infra, stats["infra-%s" % infra]))
-    f.write(" <div class=\"data\">Packages having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having license information</div><div class="data">%s</div>\n' %
             stats["license"])
-    f.write(" <div class=\"data\">Packages not having license information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having license information</div><div class="data">%s</div>\n' %
             stats["no-license"])
-    f.write(" <div class=\"data\">Packages having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having license files information</div><div class="data">%s</div>\n' %
             stats["license-files"])
-    f.write(" <div class=\"data\">Packages not having license files information</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having license files information</div><div class="data">%s</div>\n' %
             stats["no-license-files"])
-    f.write(" <div class=\"data\">Packages having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages having a hash file</div><div class="data">%s</div>\n' %
             stats["hash"])
-    f.write(" <div class=\"data\">Packages not having a hash file</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Packages not having a hash file</div><div class="data">%s</div>\n' %
             stats["no-hash"])
-    f.write(" <div class=\"data\">Total number of patches</div><div class=\"data\">%s</div>\n" %
+    f.write(' <div class="data">Total number of patches</div><div class="data">%s</div>\n' %
             stats["patches"])
-    f.write("<div class=\"data\">Packages having a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages having a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
             stats["rmo-mapping"])
-    f.write("<div class=\"data\">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages lacking a mapping on <i>release-monitoring.org</i></div><div class="data">%s</div>\n' %
             stats["rmo-no-mapping"])
-    f.write("<div class=\"data\">Packages that are up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages that are up-to-date</div><div class="data">%s</div>\n' %
             stats["version-uptodate"])
-    f.write("<div class=\"data\">Packages that are not up-to-date</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages that are not up-to-date</div><div class="data">%s</div>\n' %
             stats["version-not-uptodate"])
-    f.write("<div class=\"data\">Packages with no known upstream version</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages with no known upstream version</div><div class="data">%s</div>\n' %
             stats["version-unknown"])
-    f.write("<div class=\"data\">Packages affected by CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages affected by CVEs</div><div class="data">%s</div>\n' %
             stats["pkg-cves"])
-    f.write("<div class=\"data\">Total number of CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Total number of CVEs affecting all packages</div><div class="data">%s</div>\n' %
             stats["total-cves"])
-    f.write("<div class=\"data\">Packages affected by unsure CVEs</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages affected by unsure CVEs</div><div class="data">%s</div>\n' %
             stats["pkg-unsure-cves"])
-    f.write("<div class=\"data\">Total number of unsure CVEs affecting all packages</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Total number of unsure CVEs affecting all packages</div><div class="data">%s</div>\n' %
             stats["total-unsure-cves"])
-    f.write("<div class=\"data\">Packages with CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages with CPE ID</div><div class="data">%s</div>\n' %
             stats["cpe-id"])
-    f.write("<div class=\"data\">Packages without CPE ID</div><div class=\"data\">%s</div>\n" %
+    f.write('<div class="data">Packages without CPE ID</div><div class="data">%s</div>\n' %
             stats["no-cpe-id"])
-    f.write("</div>\n")
+    f.write('</div>\n')
 
 
 def dump_html_gen_info(f, date, commit):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
