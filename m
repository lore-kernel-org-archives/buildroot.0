Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECBC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 590F2419D1;
	Thu, 28 Jul 2022 07:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 590F2419D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdpOrN3sQrPU; Thu, 28 Jul 2022 07:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFCB3419D4;
	Thu, 28 Jul 2022 07:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCB3419D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 033781BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF234419D4
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF234419D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPndT5U59vv0 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:27:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33F2B419D1
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F2B419D1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 53916867A4; Thu, 28 Jul 2022 07:13:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 08:52:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95b8fb44cc1a0ba18f2575a5da4faa0b6e27a10
X-Git-Newrev: 786f8b45672ebdd432f6af5b7595d3d16013433b
X-Patchwork-Hint: ignore
Message-Id: <20220728071344.53916867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix duplicate
 package class names across rows
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

commit: https://git.buildroot.net/buildroot/commit/?id=786f8b45672ebdd432f6af5b7595d3d16013433b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like all good problems, disparate pieces work together to create
a "synergistically" hairy mess.

The sortGrid() overhaul highlighted a flaw in pkg-stats allowing
for duplicate package class names across rows.

As an example,

boot/barebox/barebox.mk and boot/barebox/barebox/barebox.mk
both get the classname ._barebox and so sortGrid() sticks them on
the same line giving a table with a vestigal row sticking out
of the right side like some kind of appendage.

Also I neglected to add a "_" to the current version column's cells
pkgname class so instead of "._pkgname" we had ".pkgname" and so
the cells were not collected properly as part of the row.

These issues explain the formatting weirdness.

package classnames are now ".path_to_package_makefile" without suffix
(.mk) (so ._boot_barebox_barebox and ._boot_barebox_barebox_barebox
instead of ._barebox) in order to guarantee uniqueness.

and what was *accidentally*
class="centered current_version data .barebox" is now
class="centered current_version data ._boot_barebox_barebox"
just like *all* the other cells in the row. :p

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 53 ++++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9c37506cd4..d3ec65edbb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -885,12 +885,13 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(f'<div id=\"package__{pkg.name}\" \
-        class=\"package data _{pkg.name}\">{pkg.path}</div>\n')
+    pkg_css_class = pkg.path.replace("/", "_")[:-3]
+    f.write(f'<div id=\"package__{pkg_css_class}\" \
+        class=\"package data _{pkg_css_class}\">{pkg.path}</div>\n')
     # Patch count
-    data_field_id = f'patch_count__{pkg.name}'
+    data_field_id = f'patch_count__{pkg_css_class}'
     div_class = ["centered patch_count data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
@@ -901,10 +902,10 @@ def dump_html_pkg(f, pkg):
         \">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
-    data_field_id = f'infrastructure__{pkg.name}'
+    data_field_id = f'infrastructure__{pkg_css_class}'
     infra = infra_str(pkg.infras)
     div_class = ["centered infrastructure data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if infra == "Unknown":
         div_class.append("wrong")
     else:
@@ -913,9 +914,9 @@ def dump_html_pkg(f, pkg):
         \">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    data_field_id = f'license__{pkg.name}'
+    data_field_id = f'license__{pkg_css_class}'
     div_class = ["centered license data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
@@ -924,9 +925,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    data_field_id = f'license_files__{pkg.name}'
+    data_field_id = f'license_files__{pkg_css_class}'
     div_class = ["centered license_files data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
@@ -935,9 +936,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    data_field_id = f'hash_file__{pkg.name}'
+    data_field_id = f'hash_file__{pkg_css_class}'
     div_class = ["centered hash_file data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
@@ -946,17 +947,17 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
-    data_field_id = f'current_version__{pkg.name}'
+    data_field_id = f'current_version__{pkg_css_class}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
         current_version = pkg.current_version
     f.write(f'  <div id=\"{data_field_id}\" \
-        class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
+        class=\"centered current_version data _{pkg_css_class}\">{current_version}</div>\n')
 
     # Latest version
-    data_field_id = f'latest_version__{pkg.name}'
-    div_class.append(f'_{pkg.name}')
+    data_field_id = f'latest_version__{pkg_css_class}'
+    div_class.append(f'_{pkg_css_class}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
@@ -988,9 +989,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    data_field_id = f'warnings__{pkg.name}'
+    data_field_id = f'warnings__{pkg_css_class}'
     div_class = ["centered warnings data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
@@ -998,9 +999,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    data_field_id = f'upstream_url__{pkg.name}'
+    data_field_id = f'upstream_url__{pkg_css_class}'
     div_class = ["centered upstream_url data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1013,9 +1014,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    data_field_id = f'cves__{pkg.name}'
+    data_field_id = f'cves__{pkg_css_class}'
     div_class = ["centered cves data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1037,9 +1038,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    data_field_id = f'ignored_cves__{pkg.name}'
+    data_field_id = f'ignored_cves__{pkg_css_class}'
     div_class = ["centered data ignored_cves"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
@@ -1048,9 +1049,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CPE ID
-    data_field_id = f'cpe_id__{pkg.name}'
+    data_field_id = f'cpe_id__{pkg_css_class}'
     div_class = ["left cpe_id data"]
-    div_class.append(f'_{pkg.name}')
+    div_class.append(f'_{pkg_css_class}')
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
