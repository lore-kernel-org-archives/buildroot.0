Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9212DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 21:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DAA81000;
	Wed, 27 Jul 2022 21:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DAA81000
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxudtxrLovyb; Wed, 27 Jul 2022 21:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E5F80DC0;
	Wed, 27 Jul 2022 21:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E5F80DC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0CEA1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7294940487
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 21:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7294940487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3LFC7wkyplS for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A23E40104
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 21:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A23E40104
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A76D286740; Wed, 27 Jul 2022 21:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 23:12:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af13345d434b20e6ce878e4a034bcd389be8c836
X-Git-Newrev: ff3acfe13adce745b457c6c3c3e6a01ea0a64e52
X-Patchwork-Hint: ignore
Message-Id: <20220727210911.A76D286740@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fixed numeral
 in beginning of CSS class
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff3acfe13adce745b457c6c3c3e6a01ea0a64e52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CSS classes are generated for each package name for sorting purposes,
However some package names start with a number and this is not allowed.
(see https://www.w3.org/TR/CSS2/syndata.html#value-def-identifier)
Fix is to prepend a character to every class name such as "_".
so every ".package" is now "._package".

Signed-off-by: Sen Hastings <sen@phobosdpl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 50 +++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b2a8ddd446..0fba7953c9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -879,12 +879,12 @@ def boolean_str(b):
 
 
 def dump_html_pkg(f, pkg):
-    f.write(f'<div id=\"package_{pkg.name}\" \
-        class=\"package data {pkg.name}\">{pkg.path}</div>\n')
+    f.write(f'<div id=\"package__{pkg.name}\" \
+        class=\"package data _{pkg.name}\">{pkg.path}</div>\n')
     # Patch count
-    data_field_id = f'patch_count_{pkg.name}'
+    data_field_id = f'patch_count__{pkg.name}'
     div_class = ["centered patch_count data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.patch_count == 0:
         div_class.append("nopatches")
     elif pkg.patch_count < 5:
@@ -895,10 +895,10 @@ def dump_html_pkg(f, pkg):
         \">{str(pkg.patch_count)}</div>\n')
 
     # Infrastructure
-    data_field_id = f'infrastructure_{pkg.name}'
+    data_field_id = f'infrastructure__{pkg.name}'
     infra = infra_str(pkg.infras)
     div_class = ["centered infrastructure data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if infra == "Unknown":
         div_class.append("wrong")
     else:
@@ -907,9 +907,9 @@ def dump_html_pkg(f, pkg):
         \">{infra_str(pkg.infras)}</div>\n')
 
     # License
-    data_field_id = f'license_{pkg.name}'
+    data_field_id = f'license__{pkg.name}'
     div_class = ["centered license data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('license'):
         div_class.append("correct")
     else:
@@ -918,9 +918,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license"))}</div>\n')
 
     # License files
-    data_field_id = f'license_files_{pkg.name}'
+    data_field_id = f'license_files__{pkg.name}'
     div_class = ["centered license_files data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('license-files'):
         div_class.append("correct")
     else:
@@ -929,9 +929,9 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("license-files"))}</div>\n')
 
     # Hash
-    data_field_id = f'hash_file_{pkg.name}'
+    data_field_id = f'hash_file__{pkg.name}'
     div_class = ["centered hash_file data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok('hash'):
         div_class.append("correct")
     else:
@@ -940,7 +940,7 @@ def dump_html_pkg(f, pkg):
         \">{boolean_str(pkg.is_status_ok("hash"))}</div>\n')
 
     # Current version
-    data_field_id = f'current_version_{pkg.name}'
+    data_field_id = f'current_version__{pkg.name}'
     if len(pkg.current_version) > 20:
         current_version = pkg.current_version[:20] + "..."
     else:
@@ -949,8 +949,8 @@ def dump_html_pkg(f, pkg):
         class=\"centered current_version data {pkg.name}\">{current_version}</div>\n')
 
     # Latest version
-    data_field_id = f'latest_version_{pkg.name}'
-    div_class.append(pkg.name)
+    data_field_id = f'latest_version__{pkg.name}'
+    div_class.append(f'_{pkg.name}')
     div_class.append("latest_version data")
     if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
         div_class.append("version-error")
@@ -982,9 +982,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{latest_version_text}</div>\n')
 
     # Warnings
-    data_field_id = f'warnings_{pkg.name}'
+    data_field_id = f'warnings__{pkg.name}'
     div_class = ["centered warnings data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.warnings == 0:
         div_class.append("correct")
     else:
@@ -992,9 +992,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{pkg.warnings}</div>\n')
 
     # URL status
-    data_field_id = f'upstream_url_{pkg.name}'
+    data_field_id = f'upstream_url__{pkg.name}'
     div_class = ["centered upstream_url data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     url_str = pkg.status['url'][1]
     if pkg.status['url'][0] in ("error", "warning"):
         div_class.append("missing_url")
@@ -1007,9 +1007,9 @@ def dump_html_pkg(f, pkg):
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">{url_str}</div>\n')
 
     # CVEs
-    data_field_id = f'cves_{pkg.name}'
+    data_field_id = f'cves__{pkg.name}'
     div_class = ["centered cves data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok("cve"):
         div_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
@@ -1031,9 +1031,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CVEs Ignored
-    data_field_id = f'ignored_cves_{pkg.name}'
+    data_field_id = f'ignored_cves__{pkg.name}'
     div_class = ["centered data ignored_cves"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.ignored_cves:
         div_class.append("cve_ignored")
     f.write(f'  <div id=\"{data_field_id}\" class=\"{" ".join(div_class)}\">\n')
@@ -1042,9 +1042,9 @@ def dump_html_pkg(f, pkg):
     f.write("  </div>\n")
 
     # CPE ID
-    data_field_id = f'cpe_id_{pkg.name}'
+    data_field_id = f'cpe_id__{pkg.name}'
     div_class = ["left cpe_id data"]
-    div_class.append(pkg.name)
+    div_class.append(f'_{pkg.name}')
     if pkg.is_status_ok("cpe"):
         div_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
